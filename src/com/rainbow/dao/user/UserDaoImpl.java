package com.rainbow.dao.user;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.model.game.Game;
import com.rainbow.model.user.Suggestion;
import com.rainbow.model.user.User;
import com.rainbow.vo.QueryVo;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    public List<User> findAll() {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
        return criteria.list();
    }

	@Override
	public int save(User u) {
		int result = (Integer) sessionFactory.getCurrentSession().save(u);
		return result;
       
	}

	@Override
	public void update(User u) {
		Session session = sessionFactory.getCurrentSession();
		User user = (User)session.get( User.class,u.getId() );
		BeanUtils.copyProperties(u, user);
		sessionFactory.getCurrentSession().update(user);
	}

	@Override
	public List<Suggestion> findAllSuggest(QueryVo queryVo) {
		int start = queryVo.getOffset();
    	int pageSize = queryVo.getLimit();
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Suggestion.class);
		criteria.addOrder(Order.desc("createTime"));
		criteria.setFirstResult(start);
		criteria.setMaxResults(pageSize);
		
		Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(Suggestion.class);
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        queryVo.setTotal(rowCount);
        return criteria.list();
	}

	@Override
	public String changeSuggestionStatus(int id) {
		Session session = sessionFactory.getCurrentSession();
		Suggestion suggestion = (Suggestion)session.get( Suggestion.class,id );
		suggestion.setStatus(1);
		session.update(suggestion);
		return "success";
	}

}