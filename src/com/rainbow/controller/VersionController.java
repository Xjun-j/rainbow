package com.rainbow.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rainbow.model.version.Version;
import com.rainbow.service.version.VersionService;
import com.rainbow.util.OSSTool;
import com.rainbow.vo.QueryVo;
import com.rainbow.vo.VersionVo;

@Controller
@RequestMapping("/version")
public class VersionController {
	
	@Autowired
	private VersionService versionService;
	
	@RequestMapping("/list")
	public String videoList(){
		return "version/list";
	}
	
	
	@ResponseBody
	@RequestMapping("/findAll")
	public Map<String,Object> findAll(@RequestBody QueryVo queryVo) {
		List<Version> list = versionService.findAll(queryVo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal());
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public Map<String,String> add(VersionVo version) {
//		System.out.println("------------------"+version.getId());
		String result =  versionService.add(version);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	@ResponseBody
	@RequestMapping("/delete")
	public Map<String,String> delete(VersionVo version) {
//		System.out.println("------------------"+version.getId());
		String result =  versionService.delete(version);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/upload/app")
	public Map<String,String> uploadApp(@RequestBody MultipartFile app, HttpServletRequest request) {
		System.out.println("------------------"+app.getName()+":"+app.getSize()+":"+app.getOriginalFilename()+":"+app.getContentType());
		Map<String,String> json = new HashMap<String,String>();
		String url = "";
		try {
			url = OSSTool.saveFile(app.getInputStream(), app.getOriginalFilename());
			json.put("url", url);
			String size = new DecimalFormat("###.##").format(((double)app.getSize())/1024/1024 );
			json.put("size",size+"M");//转换成M
		} catch (IOException e) {
			e.printStackTrace();
		}
		return json;
	}
	

	
	
}
