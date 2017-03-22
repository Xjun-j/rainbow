package com.rainbow.dao.channel;

import java.io.Serializable;
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

import com.rainbow.model.channel.Channel;
import com.rainbow.model.version.Version;
import com.rainbow.util.OSSTool;
import com.rainbow.vo.ChannelVo;
import com.rainbow.vo.QueryVo;

@Repository("channelDao")
public class ChannelDaoImpl implements ChannelDao {
    private static Logger  log = LoggerFactory.getLogger(ChannelDaoImpl.class);
    @Autowired
    private SessionFactory sessionFactory;
    
    @SuppressWarnings("unchecked")
	@Override
    public List<Channel> findAll(QueryVo queryVo) {
    	int start = queryVo.getOffset();
    	int pageSize = queryVo.getLimit();
    	String  search = queryVo.getSearch(); 
    	
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Channel.class);
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
        Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(Channel.class);
        if(search !=null &&  !("").equals(search.trim()) ){
        	criteria2.add( Restrictions.or( Restrictions.like("vcode",search ) ,Restrictions.like("upv",search) ) );
        }
        
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        queryVo.setTotal(rowCount);
        
        return criteria.list();
    }


	@Override
	public String save(ChannelVo channelVo) {
		Session session = sessionFactory.getCurrentSession();
		String id = channelVo.getId();
		Channel org = null;
		if(StringUtils.isNotEmpty(id.trim())){
			org = (Channel)session.get( Channel.class,Integer.valueOf(id) );
			org.setUpdateTime(new Date());
			if(StringUtils.isNotEmpty(channelVo.getZipUrl())){
				deleteApkFile(org);
			}
		}else{
			org = new Channel();
			org.setCreateTime(new Date());
		}
		BeanUtils.copyProperties(channelVo, org);
		
		//categoriesId 前台是以数组形式传递,需特殊处理一下
		org.setCategoriesId( StringUtils.join(channelVo.getCategoriesId(),",") );
		Serializable result = session.save(org);
		log.debug("save :" + result.toString());
		return "success";
	}
	
	private void deleteApkFile(Channel org){
		String url = org.getZipUrl(); 
		String key = url.substring(url.lastIndexOf("/")+1);
		OSSTool.deleteFile(key);
	}

	@Override
	public String delete(ChannelVo channelVo) {
		Session session = sessionFactory.getCurrentSession();
		String id = channelVo.getId();
		Channel channel = (Channel)session.get( Channel.class,Integer.valueOf(id) );
		if(StringUtils.isNotEmpty(channel.getZipUrl()) ){
			deleteApkFile(channel);
		}
		session.delete(channel);
		return "success";
	}


	@Override
	public List<Channel> findAllForSelect() {
		StringBuilder hql = new StringBuilder();
		hql.append("select new Channel(id,name ) ");
    	hql.append("From Channel ");
    	hql.append("order by createTime desc ");
    	
    	Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		return query.list();
	}

}