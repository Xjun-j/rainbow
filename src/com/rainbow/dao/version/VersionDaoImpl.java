package com.rainbow.dao.version;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.model.version.Version;
import com.rainbow.util.OSSTool;
import com.rainbow.vo.QueryVo;
import com.rainbow.vo.VersionVo;

@Repository("versionDao")
public class VersionDaoImpl implements VersionDao {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @SuppressWarnings("unchecked")
	@Override
    public List<Version> findAll(QueryVo queryVo) {
    	int start = queryVo.getOffset();
    	int pageSize = queryVo.getLimit();
    	String  search = queryVo.getSearch(); 
    	
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Version.class);
        if(search !=null  && !("").equals(search.trim()) ){
        	
        	criteria.add(Restrictions.or(
        			Restrictions.like("vcode",search )
        			,Restrictions.like("upv",search)
//        			,Restrictions.like("tag",search)
        	));
        	search = queryVo.getSearch();
        }
        criteria.addOrder(Order.desc("createTime"));
        criteria.setFirstResult(start);
        criteria.setMaxResults(pageSize); 
        
        //查询总条数
        Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(Version.class);
        if(search !=null &&  !("").equals(search.trim()) ){
        	criteria2.add( Restrictions.or( Restrictions.like("vcode",search ) ,Restrictions.like("upv",search) ) );
        }
        
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        queryVo.setTotal(rowCount);
        
        return criteria.list();
    }


	@Override
	public String add(VersionVo versionVo) {
		Session session = sessionFactory.getCurrentSession();
		String id = versionVo.getId();
		Version orgVer = null;
		if(StringUtils.isNotEmpty(id.trim())){
			orgVer = (Version)session.get( Version.class,Integer.valueOf(id) );
			if(StringUtils.isNotEmpty(versionVo.getUrl())){
				deleteApkFile(orgVer);
			}
			orgVer.setUpdateTime(new Date());
		}else{
			orgVer = new Version();
			orgVer.setCreateTime(new Date());
			orgVer.setUpdateTime(new Date());
		}
		BeanUtils.copyProperties(versionVo, orgVer);
		session.save(orgVer);

		return "success";
	}
	
	private void deleteApkFile(Version orgVer){
		String url = orgVer.getUrl();
		String key = url.substring(url.lastIndexOf("/")+1);
		OSSTool.deleteFile(key);
	}
	
	@Override
	public String delete(VersionVo versionVo) {
		Session session = sessionFactory.getCurrentSession();
		String id = versionVo.getId();
		Version version = (Version)session.get( Version.class,Integer.valueOf(id) );
		if(StringUtils.isNotEmpty(version.getUrl()) ){
			deleteApkFile(version);
		}
		session.delete(version);
		return "success";
	}


}