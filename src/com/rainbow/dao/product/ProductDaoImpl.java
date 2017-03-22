package com.rainbow.dao.product;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.model.product.Product;
import com.rainbow.model.product.ProductModel;
import com.rainbow.model.product.SecureNo;
import com.rainbow.model.product.SecureNoFileLog;
import com.rainbow.model.product.SecureNumber;
import com.rainbow.util.PropertiesUtil;
import com.rainbow.vo.ProductVo;
import com.rainbow.vo.QueryVo;
import com.rainbow.vo.SecureNoVo;


@Repository("productDao")
public class ProductDaoImpl implements ProductDao{
	
	private static Logger  log = LoggerFactory.getLogger(ProductDaoImpl.class);
	
	@Autowired
    private SessionFactory sessionFactory;

	@Override
	public List<Product> findAll(QueryVo queryVo) {
		int start = queryVo.getOffset();
    	int pageSize = queryVo.getLimit();
//    	String  search = queryVo.getSearch(); 
    	
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Product.class);
//        if(search !=null  && !("").equals(search.trim()) ){
//        	
//        	criteria.add(Restrictions.or(
//        			Restrictions.like("vcode",search )
//        			,Restrictions.like("upv",search)
//        	));
//        	search = queryVo.getSearch();
//        }
        criteria.addOrder(Order.desc("createTime"));
        criteria.setFirstResult(start);
        criteria.setMaxResults(pageSize); 
        
        //查询总条数
        Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(Product.class);
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        queryVo.setTotal(rowCount);
        
        return criteria.list();
	}
	
	@Override
	public List<SecureNo> findAllSecureNo(QueryVo queryVo) {
		int start = queryVo.getOffset();
    	int pageSize = queryVo.getLimit();
    	String  search = queryVo.getSearch(); 
    	
    	StringBuilder hql = new StringBuilder();
    	//int id, int productId, String productName, int modelId, String modelName, String code, Date createTime
    	hql.append("select new SecureNumber(sn.id,sn.uidcode,sn.createTime,sn.status,sn.activeTime,sn.activeArea,sn.imei) ");
    	hql.append("From SecureNumber as sn ");
    	hql.append("where 1=1 ");
    	if(search !=null && !search.trim().equals("")){
    		hql.append("and sn.uidcode=? ");
    	}
    	hql.append("order by sn.createTime desc ");
    	
    	
        Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
        if(search !=null && !search.trim().equals("")){
        	query.setParameter(0,search);
        }
        query.setFirstResult(start);
        query.setMaxResults(pageSize);
        
        //查询总条数
        Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(SecureNumber.class);
        if(search !=null && !search.trim().equals("")){
        	criteria2.add(Restrictions.eq("uidcode", search));
    	}
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        queryVo.setTotal(rowCount);
        
        return query.list();
	}

	//@Override
	public List<SecureNo> findAllSecureNo_(QueryVo queryVo) {
		int start = queryVo.getOffset();
    	int pageSize = queryVo.getLimit();
    	String  search = queryVo.getSearch(); 
    	
    	StringBuilder hql = new StringBuilder();
    	//int id, int productId, String productName, int modelId, String modelName, String code, Date createTime
    	hql.append("select new SecureNo(sn.id,sn.productId,p.name as productName,sn.modelId,pm.name as modelName,sn.code,sn.createTime,sn.status,sn.activeTime,sn.activeArea,sn.imei ) ");
    	hql.append("From SecureNo as sn, Product as p, ProductModel as pm ");
    	hql.append("where sn.productId = p.id and sn.modelId = pm.id ");
    	if(search !=null && !search.trim().equals("")){
    		hql.append("and sn.code=? ");
    	}
    	hql.append("order by sn.createTime desc ");
    	
    	
        Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
        if(search !=null && !search.trim().equals("")){
        	query.setParameter(0,search);
        }
        query.setFirstResult(start);
        query.setMaxResults(pageSize);
        
        //查询总条数
        Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(SecureNo.class);
        if(search !=null && !search.trim().equals("")){
        	criteria2.add(Restrictions.eq("code", search));
    	}
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        queryVo.setTotal(rowCount);
        
        return query.list();
	}

	@Override
	public List<Product> findAllForSelect() {
		StringBuilder hql = new StringBuilder();
		hql.append("select new Product(id,name ) ");
    	hql.append("From Product ");
    	hql.append("order by createTime desc ");
    	
    	Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		return query.list();
	}

	@Override
	public List<Product> findAllModelByProId(int productId) {
		StringBuilder hql = new StringBuilder();
		hql.append("select new ProductModel(id,name ) ");
    	hql.append("From ProductModel ");
    	hql.append("order by createTime desc ");
    	
    	Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		return query.list();
	}

	@Override
	public String generateSecureNo(SecureNoVo secureNoVo) {
		long start = System.currentTimeMillis();
		Session session = sessionFactory.getCurrentSession();
		String lineSeparator = System.getProperty("line.separator");
		
		int productId = secureNoVo.getProductId();
		int modelId = secureNoVo.getModelId();
		int channelId = secureNoVo.getChannelId();
		int quantity = secureNoVo.getQuantity();
		int serialNo = getMaxSerialNo(productId,modelId);
		
		Properties prop = PropertiesUtil.getProperty("rainbow.properties");
		String savePath = prop.getProperty("secure_no_path");
		String fileName = productId+"_"+modelId+"_"+serialNo+".csv";
		File file = new File(savePath+fileName);
		FileWriter writer = null;
		try {
			file.createNewFile();
			writer = new FileWriter(file);
			writer.write("产品ID,型号ID,渠道ID,防伪码,创建时间"+lineSeparator);
		
			SecureNo temp = new SecureNo();
			Date createTime = new Date();
			String code = "";
			int randomNo = 0;
			for(int i=0;i<quantity ; i++){
				randomNo = getRandomNo();
				code += productId;
				code += modelId;
				code += serialNo+i;
				code += randomNo;
				temp = new SecureNo( productId,  modelId,channelId, serialNo+i, randomNo, code,createTime ); 
				session.save(temp);
				writer.write(productId+","+modelId+","+channelId+","+ code+","+createTime.toString()+lineSeparator);
//				if ( i % 1000 == 0 ) {
//			        session.flush();
//			        session.clear();
//					writer.flush();
//			    }
				code="";
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
			log.debug("generateSecureNo: 写入文件失败！");
		}finally{
			try {
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		log.debug("生成成功,耗时:"+(System.currentTimeMillis()-start));
		String fileUrl = prop.getProperty("file_url")+fileName;
		saveToFileList(productId,modelId,channelId,fileUrl);
		return fileUrl;
	}

	private void saveToFileList(int productId,int modelId,int channelId,String fileUrl) {
		SecureNoFileLog fileLog = new SecureNoFileLog();
		fileLog.setProductId(productId);
		fileLog.setModelId(modelId);
		fileLog.setChannleId(channelId);
		fileLog.setFileUrl(fileUrl);
		fileLog.setCreateTime(new Date());
		sessionFactory.getCurrentSession().save(fileLog);
		log.debug("saveToFileList: sucess ...");
	}

	private int getRandomNo() {
		return (int) (Math.random()*900000 + 100000 );
		
	}

	private int getMaxSerialNo(int productId, int modelId) {
		StringBuilder hql = new StringBuilder();
		hql.append("select max(serialNo) ");
    	hql.append("From SecureNo ");
    	hql.append("where productId=").append(productId).append(" ");
    	hql.append("and modelId=").append(modelId).append(" ");
    	Integer max = (Integer) sessionFactory.getCurrentSession().createQuery(hql.toString()).uniqueResult();
		return max==null? 100000 : max+1;
	}

	@Override
	public boolean checkExist(ProductVo productVo) {
		
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Product.class);
		criteria.add(Restrictions.like("name", productVo.getName()));
		List list = criteria.list();
		return list.size()>0?  true : false;
	}

	@Override
	public String save(ProductVo productVo) {
		Session session = sessionFactory.getCurrentSession();
		int id = productVo.getId();
		Product org = null;
		if(id !=0 && id > 0){
			org = (Product)session.get( Product.class,Integer.valueOf(id) );
		}else{
			org = new Product();
			org.setCreateTime(new Date());
		}
		BeanUtils.copyProperties(productVo, org);
		
		Serializable result = session.save(org);
		log.debug("save :" + result.toString());
		return "success";
	}

	@Override
	public String delete(int id, String type) {
		Session session = sessionFactory.getCurrentSession();
		if(type.equals("product")){
			Product product = (Product)session.get( Product.class,Integer.valueOf(id) );
			session.delete(product);
		}else{
			ProductModel model = (ProductModel)session.get( ProductModel.class,Integer.valueOf(id) );
			session.delete(model);
		}
		
		return "success";
	}

	@Override
	public boolean checkModelExist(ProductVo productVo) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(ProductModel.class);
		criteria.add(Restrictions.like("name", productVo.getName()));
		criteria.add(Restrictions.eq("productId", productVo.getProductId()));
		List list = criteria.list();
		return list.size()>0?  true : false;
	}

	@Override
	public String saveModel(ProductVo productVo) {
		Session session = sessionFactory.getCurrentSession();
		int id = productVo.getId();
		ProductModel org = null;
		if(id !=0 && id > 0){
			org = (ProductModel)session.get( ProductModel.class,Integer.valueOf(id) );
		}else{
			org = new ProductModel();
			org.setCreateTime(new Date());
		}
		BeanUtils.copyProperties(productVo, org);
		
		Serializable result = session.save(org);
		log.debug("save :" + result.toString());
		return "success";
	}

	@Override
	public List<ProductModel> findAllModel(QueryVo queryVo) {
		int start = queryVo.getOffset();
    	int pageSize = queryVo.getLimit();
//    	String  search = queryVo.getSearch(); 
    	
    	StringBuilder hql = new StringBuilder();
    	//int id, int productId, String productName, int modelId, String modelName, String code, Date createTime
    	hql.append("select new ProductModel(pm.id,pm.productId,p.name as productName,pm.name,pm.description,pm.createTime ) ");
    	hql.append("From ProductModel as pm , Product as p  ");
    	hql.append("where pm.productId = p.id ");
    	hql.append("order by pm.createTime desc ");
    	
    	
        Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
        query.setFirstResult(start);
        query.setMaxResults(pageSize);
        
        //查询总条数
        Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(ProductModel.class);
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        queryVo.setTotal(rowCount);
        
        return query.list();
	}

	@Override
	public List<SecureNoFileLog> findSecureNoFiles(QueryVo queryVo) {
		int start = queryVo.getOffset();
    	int pageSize = queryVo.getLimit();
    	
    	StringBuilder hql = new StringBuilder();
    	//int id, int productId, String productName, int modelId, String modelName, String fileUrl,Date createTime
    	hql.append("select new SecureNoFileLog(sf.id,sf.productId,p.name as productName,")
    	.append("sf.modelId,pm.name as modelName,sf.fileUrl,sf.createTime ) ")
    	.append("From SecureNoFileLog as sf , Product as p ,ProductModel as pm ")
    	.append("where sf.productId = p.id ")
    	.append("and sf.modelId = pm.id ")
    	.append("order by sf.createTime desc ");
    	
    	
        Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
        query.setFirstResult(start);
        query.setMaxResults(pageSize);
        
        //查询总条数
        Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(SecureNoFileLog.class);
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        queryVo.setTotal(rowCount);
        
        return query.list();
	}
	
	@Override
	public String importFWM(String filePath) {
		
		//LOAD DATA LOCAL INFILE 'D:/testimportFangweima/code01.TXT' INTO TABLE t_testimport (uidcode);
		String loadSql = "LOAD DATA LOCAL INFILE '"+ filePath +"' INTO TABLE t_secure_number (uidcode);" ; 
		
		SQLQuery sqlQuery = sessionFactory.getCurrentSession().createSQLQuery(loadSql) ; 
		sqlQuery.executeUpdate() ; 
		
		String queryStr = sqlQuery.getQueryString() ; 
		return "success";
	}
	
	
}
