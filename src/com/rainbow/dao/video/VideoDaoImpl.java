package com.rainbow.dao.video;

import java.io.Serializable;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
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

import com.rainbow.model.video.BiliUrl;
import com.rainbow.model.video.Category;
import com.rainbow.model.video.EditorRecommend;
import com.rainbow.model.video.Video;
import com.rainbow.model.video.VideoImg;
import com.rainbow.model.video.VideoUrl;
import com.rainbow.vo.CategoryVo;
import com.rainbow.vo.QueryVo;
import com.rainbow.vo.VideoVo;

@Repository("videoDao")
public class VideoDaoImpl implements VideoDao {
    private static Logger log = LoggerFactory.getLogger(VideoDaoImpl.class);
	
    @Autowired
    private SessionFactory sessionFactory;
    
    @SuppressWarnings("unchecked")
	@Override
    public List<Video> findAll(QueryVo videoVo) {
    	int start = videoVo.getOffset();
    	int pageSize = videoVo.getLimit();
    	String  search = videoVo.getSearch(); 
    	String category = videoVo.getCategory();
    	int categoryCode =0;
    	
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Video.class);
        if(category != null && StringUtils.isNotEmpty(category)){
    		categoryCode = Integer.valueOf(category);
    		criteria.add(Restrictions.eqOrIsNull("category", categoryCode));
        }
        if(search !=null && StringUtils.isNotEmpty(search.trim()) ){
        	search = "%"+search+"%";
        	log.debug("search :"+search);
        	criteria.add(Restrictions.or(
        			Restrictions.like("title",search )
        			,Restrictions.like("scategory",search)
        			,Restrictions.like("tag",search)
        	));
        	search = videoVo.getSearch();
        }
        String sort = videoVo.getSort();
        if(StringUtils.isNotEmpty(sort)){
        	String order = videoVo.getOrder();
        	if(StringUtils.isNotEmpty(order) && order.equalsIgnoreCase("asc")){
        		criteria.addOrder(Order.asc(sort));
        	}else{
        		criteria.addOrder(Order.desc(sort));
        	}
        }
//        else{
//        	criteria.addOrder(Order.desc("createTime"));
//        }
        criteria.setFirstResult(start);
        criteria.setMaxResults(pageSize); 
        
        //查询总条数
        Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(Video.class);
        if(category != null && StringUtils.isNotEmpty(category)){
    		categoryCode = Integer.valueOf(category);
    		criteria2.add(Restrictions.eqOrIsNull("category", categoryCode));
        }
        if(search !=null && StringUtils.isNotEmpty(search.trim()) ){
        	criteria2.add(Restrictions.or(Restrictions.like("title",search ), Restrictions.like("scategory",search ),Restrictions.like("tag",search)));
        }
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        videoVo.setTotal(rowCount);
        
        return criteria.list();
    }
    

	@Override
	public String save(VideoVo video) {
		Session session = sessionFactory.getCurrentSession();
		Video newVideo = new Video();
		
		BeanUtils.copyProperties(video, newVideo);
		Date now = new Date();
		newVideo.setCreateTime(now);
		newVideo.setUpdateTime(now);
		newVideo.setStatus(4);//手工上传设置为4
		BigInteger id = (BigInteger)session.save(newVideo);
		
		String posterUrl = video.getPosterUrl();
		if(StringUtils.isNotEmpty(posterUrl)){
			VideoImg poster = new VideoImg();
			poster.setVideoId(id);
			poster.setUrl(posterUrl);
			poster.setStatus(4);//手工上传设置为4
			session.save(poster);
		}
		
		String videoUrl = video.getVideoUrl();
		if(StringUtils.isNotEmpty(videoUrl)){
			VideoUrl url = new VideoUrl();
			url.setVideoId(id);
			url.setUrl(posterUrl);
			url.setStatus(4);//手工上传设置为4
			session.save(url);
		}
		
		return id.toString();
	}

	@Override
	public String update(VideoVo video) {
		Session session = sessionFactory.getCurrentSession();
		Video orgVideo = (Video)session.get( Video.class,video.getId() );
		BeanUtils.copyProperties(video, orgVideo);
		orgVideo.setUpdateTime(new Date());
		session.update(orgVideo);
		
		return "success";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> findCategoryList(QueryVo queryVo) {
		int start = queryVo.getOffset();
    	int pageSize = queryVo.getLimit();
    	int parentId = queryVo.getParentId();
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Category.class);
        if(parentId != 0){
        	criteria.add(Restrictions.eq("parentId", parentId));
        }
//        criteria.addOrder(Order.desc("updateTime"));
        criteria.setFirstResult(start);
        criteria.setMaxResults(pageSize); 
        
        //查询总条数
        Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(Category.class);
        if(parentId != 0){
        	criteria2.add(Restrictions.eq("parentId", parentId));
        }
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        queryVo.setTotal(rowCount);
        
        return criteria.list();
	}

	@Override
	public String changeStatus(BigInteger videoId) {
		Session session = sessionFactory.getCurrentSession();
		Video video = (Video)session.get(Video.class,videoId );
		// 2-下线           1-上线
		int status = video.getStatus() == 1? 2:1;
		video.setStatus(status);
		session.update(video);
		return "success";
	}

	@Override
	public String changeCategoryStatus(int id, int status, String os) {
		Session session = sessionFactory.getCurrentSession();
		Category category = (Category)session.get(Category.class,id );
		if(os.equals("android")){
			category.setStatus(status==1? 0:1);
		}else{
			category.setIosStatus(status==1? 0:1);
		}
		category.setUpdateTime(new Date());
		session.update(category);
		return "success";
	}

	@Override
	public String saveCategory(CategoryVo categoryVo) {
		Session session = sessionFactory.getCurrentSession();
		int id = categoryVo.getId();
		Category org = null;
		if(id !=0 && id > 0){
			int parentId = categoryVo.getParentId();
			if(parentId == 0){
				categoryVo.setParentId(1);
			}
			org = (Category)session.get( Category.class,Integer.valueOf(id) );
			
			org.setUpdateTime(new Date());
		}else{
			org = new Category();
			int parentId = categoryVo.getParentId();
			if(parentId == 0){
				categoryVo.setParentId(1);
			}
			org.setCreateTime(new Date());
			org.setUpdateTime(new Date());
		}
		BeanUtils.copyProperties(categoryVo, org);
		
		Serializable result = session.save(org);
		log.debug("saveCategory :" + result.toString());
		return "success";
	}


	@Override
	public boolean checkExist(CategoryVo categoryVo) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Category.class);
		criteria.add(
				Restrictions.or( 
//						Restrictions.eq("code", categoryVo.getCode()),
						Restrictions.eq("name", categoryVo.getName())
				));
		List list = criteria.list();
		
		return list.size()>0?  true : false;
		
	}


	@Override
	public String updateBanner(BigInteger videoId, int banner ,String recommendDate) {
		Session session = sessionFactory.getCurrentSession();
		Video orgVideo = (Video)session.get( Video.class,videoId );
		orgVideo.setBanner(banner);
		Date now = new Date();
		orgVideo.setUpdateTime(now);
		session.update(orgVideo);
		if(banner==1){
			//保存到推荐列表 2016-11-08
			if(StringUtils.isEmpty(recommendDate)){
				recommendDate = new SimpleDateFormat("yyyy-MM-dd").format(now);
			}
			saveToEditorRecomm(videoId,recommendDate);
		}
		log.debug("updateBanner -videoId:" + videoId +":banner:"+banner);
		return "success";
	}

	// 最初设计只设置5个banner，已废弃
	@Override
	public boolean checkBannerNumber() {
		Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(Video.class);
       
    	criteria2.add(Restrictions.gt("banner",0 ));
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        
        return rowCount>=5? true:false;
	}

	@Override
	public String saveToEditorRecomm(BigInteger videoId, String recommDate) {
		Session session = sessionFactory.getCurrentSession();
		
		EditorRecommend temp = new EditorRecommend();
		temp.setVideoId(videoId);
		temp.setRecommendDate(recommDate);
		temp.setCreateTime(new Date());
		temp.setUpdateTime(new Date());
		
		Serializable result = session.save(temp);
		log.debug("saveToEditorRecomm :" + result.toString());
		return "success";
	}

	@Override
	public String deleteEditorRecomm(int id) {
		Session session = sessionFactory.getCurrentSession();
		EditorRecommend temp = (EditorRecommend) session.get(EditorRecommend.class,id);
		//更新video里的banner为0
		updateBanner(temp.getVideoId(),0,"");
		session.delete(temp);
		log.debug("deleteEditorRecomm :" + id);
		return "success";
	}


	@Override
	public List<EditorRecommend> findAllEditorRecomm(QueryVo queryVo) {
		int start = queryVo.getOffset();
    	int pageSize = queryVo.getLimit();
//    	String  search = queryVo.getSearch(); 
    	
    	StringBuilder hql = new StringBuilder();
    	hql.append("select new EditorRecommend(er.id,er.videoId,er.recommendDate,")
    	   .append("er.createTime,v.title,u.url,v.scategory,v.tag) ")
    	   .append("From EditorRecommend as er, Video as v, VideoUrl as u ")
    	   .append("where er.videoId = v.id and er.videoId = u.videoId ");
//    	if(search !=null && !search.trim().equals("")){
//    		hql.append("and v.title like '%?%' ");
//    	}
    	hql.append("order by er.recommendDate desc ");
    	
    	
        Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
//        if(search !=null && !search.trim().equals("")){
//        	query.setParameter(0,search);
//        }
        query.setFirstResult(start);
        query.setMaxResults(pageSize);
        
        //查询总条数
        Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(EditorRecommend.class);
//        if(search !=null && !search.trim().equals("")){
//        	criteria2.add(Restrictions.like("title", search));
//    	}
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        queryVo.setTotal(rowCount);
        
        return query.list();
	}


	@Override
	public List<BiliUrl> findAllBiliUrl(QueryVo queryVo) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(BiliUrl.class);
		criteria.addOrder(Order.desc("createTime"));
		
		Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(BiliUrl.class);
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        queryVo.setTotal(rowCount);
        return criteria.list();
	}


	@Override
	public String saveBiliUrl(String url) {
		Session session = sessionFactory.getCurrentSession();
		BiliUrl biliUrl = new BiliUrl();
		Date now = new Date();
		biliUrl.setCreateTime(now);
		biliUrl.setUpdateTime(now);
		biliUrl.setUrl(url);
		biliUrl.setVideoId(BigInteger.ZERO);
		int id = (int)session.save(biliUrl);
		
		return id+"";
	}


}