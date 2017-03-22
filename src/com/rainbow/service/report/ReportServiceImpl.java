package com.rainbow.service.report;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.dao.report.ReportDao;
import com.rainbow.vo.QueryVo;


@Service("reportService")
@Transactional
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportDao reportDao;

	@Override
	public List userData(QueryVo queryVo) {
		
		return reportDao.userData(queryVo);
	}

	@Override
	public List userRetention(QueryVo queryVo) {
		
		return reportDao.userRetention(queryVo);
	}

}
