package com.rainbow.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.rainbow.model.game.Game;
import com.rainbow.service.game.GameService;
import com.rainbow.util.PropertiesUtil;
import com.rainbow.vo.GameVo;
import com.rainbow.vo.QueryVo;

@Controller
@RequestMapping("/game")
public class GameController {
	
	@Autowired
	private GameService gameService;
	
	@RequestMapping("/list")
	public String videoList(){
		return "game/list";
	}
	
	@ResponseBody
	@RequestMapping("/findAll")
	public Map<String,Object> findAll(@RequestBody QueryVo queryVo) {
		List<Game> list = gameService.findAll(queryVo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal());
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("/update")
	public Map<String,String> update(GameVo game) {
		System.out.println("------------------"+game.getId());
		String result =  gameService.update(game);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public Map<String,String> add(GameVo game) {
		System.out.println("------------------"+game.getId());
		String result =  gameService.add(game);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Map<String,String> delete(GameVo game) {
//		System.out.println("------------------"+game.getId());
		String result =  gameService.delete(game);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/upload/img")
	public Map<String,String> uploadImg(@RequestBody MultipartFile img, HttpServletRequest request) {
//		System.out.println("------------------"+img.getName()+":"+img.getSize()+":"+img.getOriginalFilename()+":"+img.getContentType());
		Properties prop = PropertiesUtil.getProperty("rainbow.properties");
		String visitPath = prop.getProperty("img_url");
		String path = prop.getProperty("img_path");
	    File f = new File(path);  
	    if (!f.exists()){
	    	f.mkdirs();  
	    }
	    String orgName = img.getOriginalFilename();
	    String fileName = UUID.randomUUID()+ orgName.substring(orgName.lastIndexOf("."),orgName.length()); 
	    File localFile = new File(path+"/"+fileName);
	    try {
			img.transferTo(localFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Map<String,String> json = new HashMap<String,String>();
		json.put("imgUrl", visitPath+fileName);
		return json;
	}
	
	
	@ResponseBody
	@RequestMapping("/upload/app")
	public Map<String,String> uploadApp(@RequestBody MultipartFile app, HttpServletRequest request) {
		System.out.println("------------------"+app.getName()+":"+app.getSize()+":"+app.getOriginalFilename()+":"+app.getContentType());
		// 获得项目的路径  
//	    ServletContext sc = request.getSession().getServletContext();  
	    // 上传位置  
//	    String path = sc.getRealPath("/img") + "/"; // 设定文件保存的目录  
		Properties prop = PropertiesUtil.getProperty("rainbow.properties");
		String visitPath = prop.getProperty("app_url");
		String path = prop.getProperty("app_path");
	    File f = new File(path);  
	    if (!f.exists()){
	    	f.mkdirs();  
	    }
	    String orgName = app.getOriginalFilename();
	    String fileName = UUID.randomUUID()+ orgName.substring(orgName.lastIndexOf("."),orgName.length()); 
	    File localFile = new File(path+"/"+fileName);
	    try {
	    	app.transferTo(localFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Map<String,String> json = new HashMap<String,String>();
		json.put("appUrl", visitPath+fileName);
		json.put("appSize",app.getSize()/1024/1024+"");//转换成M
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/upload/screenshot")
	public Map<String,List<String>> uploadScreenshot(@RequestParam("screenshots") CommonsMultipartFile  screenshots[]) {
		Properties prop = PropertiesUtil.getProperty("rainbow.properties");
		String visitPath = prop.getProperty("img_url");
		String path = prop.getProperty("img_path");
	    File f = new File(path);  
	    if (!f.exists()){
	    	f.mkdirs();  
	    }
	    List<String> imgUrls = new ArrayList<String>();
	    String orgName = "";
	    String fileName = "";
	    File localFile = null;
	    for(MultipartFile img : screenshots){
	    	orgName = img.getOriginalFilename();
	    	fileName = UUID.randomUUID()+ orgName.substring(orgName.lastIndexOf("."),orgName.length()); 
	    	localFile = new File(path+fileName);
	    	try {
	    		img.transferTo(localFile);
	    	} catch (IllegalStateException e) {
	    		e.printStackTrace();
	    	} catch (IOException e) {
	    		e.printStackTrace();
	    	}
	    	imgUrls.add(visitPath+fileName);
	    }
		Map<String,List<String>> json = new HashMap<String,List<String>>();
		json.put("imgUrl", imgUrls);
		return json;
	}
}
