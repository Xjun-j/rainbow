package com.rainbow.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rainbow.model.channel.Channel;
import com.rainbow.service.report.ReportService;
import com.rainbow.service.channel.ChannelService;
import com.rainbow.util.OSSTool;
import com.rainbow.vo.ChannelVo;
import com.rainbow.vo.QueryVo;

@Controller
@RequestMapping("/report")
public class ReportController {
	private static Logger log = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping("/user")
	public String userReport(){
		return "report/user";
	}
	
	@RequestMapping("/user/retention")
	public String channelList(){
		return "report/user_retention";
	}
	
	@ResponseBody
	@RequestMapping("/userData")
	public Map<String,Object> userData(@RequestBody QueryVo queryVo) {
		List list = reportService.userData(queryVo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal() );
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/userRetention")
	public Map<String,Object> userRetention(@RequestBody QueryVo queryVo) {
		List list = reportService.userRetention(queryVo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal() );
		return result;
	}
	
	

}
