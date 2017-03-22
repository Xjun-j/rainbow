package com.rainbow.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainbow.model.user.Suggestion;
import com.rainbow.service.user.UserService;
import com.rainbow.vo.QueryVo;

@Controller
@RequestMapping("/user")
public class UserController {
	private static Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/list")
	public String channelList(){
		return "user/list";
	}
	
	@RequestMapping("/suggestion")
	public String suggestionList(){
		return "user/suggestion";
	}
	
	@ResponseBody
	@RequestMapping("/suggestion/findAll")
	public Map<String,Object> findAll(@RequestBody QueryVo queryVo) {
		List<Suggestion> list = userService.findAllSuggest(queryVo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal() );
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/suggestion/changeStatus")
	public Map<String,Object> changeSuggestionStatus(int id) {
		String status = userService.changeSuggestionStatus(id);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("success",status);
		return result;
	}
	
	
	

}
