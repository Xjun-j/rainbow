package com.rainbow.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.rainbow.upload.ProgressEntity;
import com.rainbow.util.OSSTool;
import com.rainbow.util.PropertiesUtil;

@Controller
@RequestMapping("/upload")
public class UploadController {
	private Logger log = LoggerFactory.getLogger(UploadController.class);
	
	@ResponseBody
	@RequestMapping("/img")
	public Map<String,String> uploadImg(@RequestBody MultipartFile img, HttpServletRequest request){
		log.debug(img.getName()+":"+img.getSize()+":"+img.getOriginalFilename()+":"+img.getContentType());
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
	@RequestMapping("/file")
	public Map<String,String> uploadFile(@RequestBody MultipartFile file, HttpServletRequest request){
		log.debug("uploadFile:"+file.getName()+":"+file.getSize()+":"+file.getOriginalFilename()+":"+file.getContentType());
	    // 上传位置  
		Properties prop = PropertiesUtil.getProperty("rainbow.properties");
		String visitPath = prop.getProperty("file_url");
		String path = prop.getProperty("file_path");
	    File f = new File(path);  
	    if (!f.exists()){
	    	f.mkdirs(); 
	    }
	    String orgName = file.getOriginalFilename();
	    String fileName = UUID.randomUUID()+ orgName.substring(orgName.lastIndexOf("."),orgName.length()); 
	    File localFile = new File(path+"/"+fileName);
	    try {
	    	file.transferTo(localFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Map<String,String> json = new HashMap<String,String>();
		json.put("url", visitPath+fileName);
		json.put("size",new DecimalFormat("###.##").format(((double)file.getSize())/1024/1024 )+"M");//转换成M
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/screenshot")
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
	
	@RequestMapping("/progress")
	@ResponseBody
	public Map<String,Object> progress(HttpServletRequest request){
		ProgressEntity status = (ProgressEntity) request.getSession().getAttribute("upload_ps");
		log.debug("progress:"+status.toString());
		Map<String,Object> json = new HashMap<String,Object>();
		json.put("result", status);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/oss/file")
	public Map<String,String> uploadFileToOss(@RequestBody MultipartFile file, HttpServletRequest request) {
		log.debug("uploadFileToOss: "+file.getName()+":"+file.getSize()+":"+file.getOriginalFilename()+":"+file.getContentType());
		Map<String,String> json = new HashMap<String,String>();
		String url = "";
		try {
			url = OSSTool.saveFile(file.getInputStream(), file.getOriginalFilename());
			json.put("url", url);
			String size = new DecimalFormat("###.##").format(((double)file.getSize())/1024/1024 );
			json.put("size",size+"M");//转换成M
		} catch (IOException e) {
			e.printStackTrace();
			log.debug("uploadFileToOss:","上传到OSS失败.",e.toString());
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/oss/img")
	public Map<String,String> uploadImgToOss(@RequestBody MultipartFile file, HttpServletRequest request) {
		log.debug("uploadImgToOss: name:"+file.getName()+",size:"+file.getSize()+",orginName:"+file.getOriginalFilename()+",contentType:"+file.getContentType());
		Map<String,String> json = new HashMap<String,String>();
		String url = "";
		try {
			url = OSSTool.saveImg(file.getInputStream(), file.getOriginalFilename());
			json.put("url", url);
			String size = new DecimalFormat("###.##").format(((double)file.getSize())/1024/1024 );
			json.put("size",size+"M");//转换成M
		} catch (IOException e) {
			e.printStackTrace();
			log.debug("uploadImgToOss:","上传到OSS失败.",e.toString());
		}
		return json;
	}
	
	
}
