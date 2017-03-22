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
import com.rainbow.service.channel.ChannelService;
import com.rainbow.util.OSSTool;
import com.rainbow.vo.ChannelVo;
import com.rainbow.vo.QueryVo;

@Controller
@RequestMapping("/channel")
public class ChannelController {
	private static Logger log = LoggerFactory.getLogger(ChannelController.class);
	
	@Autowired
	private ChannelService channelService;
	
	@RequestMapping("/list")
	public String channelList(){
		return "channel/list";
	}
	
	@ResponseBody
	@RequestMapping("/findAll")
	public Map<String,Object> findAll(@RequestBody QueryVo queryVo) {
		List<Channel> list = channelService.findAll(queryVo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal() );
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/findAllForSelect")
	public Map<String,Object> findAllForSelect() {
		List<Channel> list = channelService.findAllForSelect();
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
//		result.put("total",queryVo.getTotal() );
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("/save")
	public Map<String,String> save(ChannelVo channelVo) {
//		System.out.println("------------------"+version.getId());
		String result =  channelService.save(channelVo);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Map<String,String> delete(ChannelVo channelVo) {
//		System.out.println("------------------"+version.getId());
		String result =  channelService.delete(channelVo);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/upload/zip")
	public Map<String,String> uploadZip(@RequestBody MultipartFile zip, HttpServletRequest request) {
		log.debug("------------------"+zip.getName()+":"+zip.getSize()+":"+zip.getOriginalFilename()+":"+zip.getContentType());
		Map<String,String> json = new HashMap<String,String>();
		String url = "";
		try {
			url = OSSTool.saveFile(zip.getInputStream(), zip.getOriginalFilename());
			json.put("url", url);
			String size = new DecimalFormat("###.##").format(((double)zip.getSize())/1024/1024 );
			json.put("size",size+"M");//转换成M
		} catch (IOException e) {
			e.printStackTrace();
		}
		return json;
	}
	

}
