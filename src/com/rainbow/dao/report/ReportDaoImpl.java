package com.rainbow.dao.report;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.model.channel.Channel;
import com.rainbow.vo.QueryVo;

@Repository("reportDao")
public class ReportDaoImpl implements ReportDao{

	private static Logger  log = LoggerFactory.getLogger(ReportDaoImpl.class);
	
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public List userData(QueryVo queryVo) {
    	String  startDate = queryVo.getStartDate(); 
    	String  endDate = queryVo.getEndDate();
    	String os = queryVo.getOs();
    	
    	if(startDate==null || startDate.equals("")){
    		startDate = new SimpleDateFormat("YYYY-MM-dd").format(new Date(System.currentTimeMillis()-3600*24*7*1000));
    	}
    	if(endDate==null || endDate.equals("")){
    		endDate = new SimpleDateFormat("YYYY-MM-dd").format(new Date());
    	}
    	
    	StringBuilder sql = new StringBuilder();
    	sql.append("select create_time, ")
    	.append("sum(if(type='dau',num,0)) dau, ")
    	.append("sum(if(type='new',num,0)) newUser,")
    	.append("sum(if(type='acc',num,0)) acc ")
    	.append("from report.t_user_stat ")
    	.append("where create_time>=? and create_time<=? ");
    	if(os!=null && !"".equals(os)){
    		sql.append("and os=? ");
    	}
    	sql.append("group by create_time ")
    	.append("order by create_time ");
    	SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql.toString());
    	query.setParameter(0, startDate);
    	query.setParameter(1, endDate);
    	if(os!=null && !"".equals(os)){
    		query.setParameter(2, os);
    	}
//    	System.out.println(sql + startDate+endDate);
        return query.list();
	}

	@Override
	public List userRetention(QueryVo queryVo) {
		String  startDate = queryVo.getStartDate(); 
    	String  endDate = queryVo.getEndDate();
    	String os = queryVo.getOs();
    	
    	if(startDate==null || startDate.equals("")){
    		startDate = new SimpleDateFormat("YYYY-MM-dd").format(new Date(System.currentTimeMillis()-3600*24*7*1000));
    	}
    	if(endDate==null || endDate.equals("")){
    		endDate = new SimpleDateFormat("YYYY-MM-dd").format(new Date());
    	}
    	
    	StringBuilder sql = new StringBuilder();
    	sql.append("select t.retention_date,tn.num, ")
    	.append("t.r1,t.r2,t.r3,t.r4,t.r5,t.r6,t.r7,t.r10,t.r15,t.r30 ")
    	.append("from (")
    	.append("select retention_date, ")
    	.append("sum(if(day_num=1,num,0)) r1,sum(if(day_num=2,num,0)) r2, ")
    	.append("sum(if(day_num=3,num,0)) r3,sum(if(day_num=4,num,0)) r4, ")
    	.append("sum(if(day_num=5,num,0)) r5,sum(if(day_num=6,num,0)) r6, ")
    	.append("sum(if(day_num=7,num,0)) r7,sum(if(day_num=10,num,0)) r10,")
    	.append("sum(if(day_num=15,num,0)) r15,sum(if(day_num=30,num,0)) r30 ")
    	.append("from ")
    	.append("(select sum(num) num,day_num,retention_date from report.t_user_retention ")
    	.append("where retention_date>=? and retention_date<=? ");
    	if(os!=null && !"".equals(os)){
    		sql.append("and os=? ");
    	}
    	sql.append("group by create_time,retention_date,day_num ) a ")
    	.append("group by a.retention_date ")
    	.append(") t ")
    	.append("left join ")
    	.append("(select create_time,sum(num) num  ")
    	.append("from report.t_user_stat where type='new'  ")
    	.append("and create_time>=? and create_time<=? ");
    	if(os!=null && !"".equals(os)){
    		sql.append("and os=? ");
    	}
    	sql.append("group by create_time ) tn ")
    	.append("on t.retention_date=tn.create_time ");
    	
    	SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql.toString());
    	query.setParameter(0, startDate);
    	query.setParameter(1, endDate);
    	if(os!=null && !"".equals(os)){
    		query.setParameter(2, os);
    		query.setParameter(3, startDate);
    		query.setParameter(4, endDate);
    		query.setParameter(5, os);
    	}else{
    		query.setParameter(2, startDate);
    		query.setParameter(3, endDate);
    	}
//    	System.out.println(sql + startDate+endDate);
        return query.list();
	}

}
