package com.rainbow.service.report;

import java.util.List;

import com.rainbow.vo.QueryVo;

public interface ReportService {

	public List userData(QueryVo queryVo);

	public List userRetention(QueryVo queryVo);
}
