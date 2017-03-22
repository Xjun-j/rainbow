package com.rainbow.dao.game;

import java.math.BigInteger;
import java.util.Date;
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
import com.rainbow.model.game.Img;
import com.rainbow.model.game.Screenshot;
import com.rainbow.vo.GameVo;
import com.rainbow.vo.QueryVo;

@Repository("gameDao")
public class GameDaoImpl implements GameDao {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @SuppressWarnings("unchecked")
	@Override
    public List<Game> findAll(QueryVo queryVo) {
    	int start = queryVo.getOffset();
    	int pageSize = queryVo.getLimit();
    	String  search = queryVo.getSearch(); 
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Game.class);
        if(search !=null  && !("").equals(search.trim()) ){
        	search = "%"+search+"%"; 
        	System.out.println("search :"+search);
        	criteria.add(Restrictions.or(
        			Restrictions.like("title",search )
        			,Restrictions.like("scategory",search)
        			,Restrictions.like("tag",search)
        	));
        	search = queryVo.getSearch();
        }
        criteria.addOrder(Order.desc("updateTime"));
        criteria.setFirstResult(start);
        criteria.setMaxResults(pageSize); 
        
        //查询总条数
        Criteria criteria2 = sessionFactory.getCurrentSession().createCriteria(Game.class);
        if(search !=null &&  !("").equals(search.trim()) ){
        	criteria2.add(Restrictions.or(Restrictions.like("title",search ), Restrictions.like("scategory",search ),Restrictions.like("tag",search)));
        }
        
        int rowCount = Integer.parseInt(criteria2.setProjection(Projections.rowCount()).uniqueResult().toString() );  
        criteria2.setProjection(null);
        queryVo.setTotal(rowCount);
        
        return criteria.list();
    }

	@Override
	public String update(GameVo game) {
		Session session = sessionFactory.getCurrentSession();
		Game orgGame = (Game)session.get( Game.class,game.getId() );
		BeanUtils.copyProperties(game, orgGame);
		orgGame.setUpdateTime(new Date());
//		session.beginTransaction();
		session.update(orgGame);
//		session.getTransaction().commit();
//		session.close();
		return "success";
	}

	@Override
	public String add(GameVo game) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Img img = new Img();
		img.setUrl(game.getImgAddr());
		img.setHeight(320);
		img.setWidth(480);
		img.setFmt(game.getImgAddr().substring(game.getImgAddr().lastIndexOf("."),game.getImgAddr().length()));
		Integer id  =  (Integer)session.save(img);
		img = (Img) session.get(Img.class, id);
		
		Game newGame = new Game();
		BeanUtils.copyProperties(game, newGame);
		newGame.setImg(img);
		newGame.setCreateTime(new Date());
		newGame.setUpdateTime(new Date());
		BigInteger gameId = (BigInteger) session.save(newGame);
		
		Screenshot ss = null;
		for(String temp : game.getScreenshotAddrs()){
			ss = new Screenshot();
			ss.setUrl(temp);
			ss.setGameId(gameId);
			ss.setHeight(320);
			ss.setWidth(480);
			ss.setFmt(temp.substring(temp.lastIndexOf("."),temp.length()));
			session.save(ss);
		}
		
		return "success";
	}

	@Override
	public String delete(GameVo game) {
		Session session = sessionFactory.getCurrentSession();
		BigInteger id = game.getId();
		Game orgGame = (Game)session.get( Game.class,id );
		session.delete(orgGame);
		return "success";
	}


}