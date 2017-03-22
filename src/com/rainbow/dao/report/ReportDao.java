package com.rainbow.dao.report;

import java.util.List;

import com.rainbow.model.channel.Channel;
import com.rainbow.vo.QueryVo;

public interface ReportDao {

	List userData(QueryVo queryVo);

	List userRetention(QueryVo queryVo);

}
