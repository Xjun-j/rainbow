package com.rainbow.controller;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainbow.model.video.BiliUrl;
import com.rainbow.model.video.Category;
import com.rainbow.model.video.EditorRecommend;
import com.rainbow.model.video.Video;
import com.rainbow.service.video.VideoService;
import com.rainbow.vo.CategoryVo;
import com.rainbow.vo.QueryVo;
import com.rainbow.vo.VideoVo;

@Controller
@RequestMapping("/video")
public class VideoController {
	private static Logger log = LoggerFactory.getLogger(VideoController.class);
	
	@Autowired
	private VideoService videoService;
	
	@RequestMapping("/list")
	public String videoList() {
		return "video/list";
	}
	
	@RequestMapping("/category/list")
	public String categoryList() {
		return "video/category";
	}
	
	@RequestMapping("/editorRecommend")
	public String editorRecommend() {
		return "video/editor_recommend";
	}
	
	@RequestMapping("/biliurl")
	public String biliUrl() {
		return "video/biliurl";
	}
	
	@ResponseBody
	@RequestMapping("/findAll")
	public Map<String,Object> findAll(@RequestBody QueryVo videoVo) {
		List<Video> list = videoService.findAll(videoVo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
		result.put("total",videoVo.getTotal());
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public Map<String,String> save(VideoVo video) {
		String result =  videoService.save(video);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public Map<String,String> update(VideoVo video) {
		String result =  videoService.update(video);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/changeStatus")
	public Map<String,Object> changeStatus(BigInteger videoId) {
		log.debug("video/changeStatus  videoId:"+videoId);
		String msg =  videoService.changeStatus(videoId);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("success", msg);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/updateBanner")
	public Map<String,Object> updateBanner(BigInteger videoId,Integer banner,String recommendDate) {
		log.debug("video/updateBanner  videoId:"+videoId);
//		boolean hasExist = videoService.checkBannerNumber();
		Map<String,Object> result = new HashMap<String, Object>();
//		if(hasExist){
//			result.put("msg", "已设置5个banner,请取消后再设置!");
//		}else{
			String msg =  videoService.updateBanner(videoId,banner==null? 0 : banner.intValue(),recommendDate);
			result.put("success", msg);
//		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/category/findCategoryList")
	public Map<String,Object> findCategoryList(@RequestBody QueryVo queryVo) {
		List<Category> list =  videoService.findCategoryList(queryVo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal());
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/category/changeStatus")
	public Map<String,Object>  changeCategoryStatus(int id,int status,String os) {
		log.debug("用户 :"+SecurityContextHolder.getContext().getAuthentication().getName()+" changeCategoryStatus 修改 id :"+id +",状态:"+status +",OS:"+os);
		String msg = videoService.changeCategoryStatus(id,status,os);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("success", msg);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/category/save")
	public Map<String,Object>  saveCategory(CategoryVo categoryVo) {
		log.debug("用户 :"+SecurityContextHolder.getContext().getAuthentication().getName()+" saveCategory ");
		Map<String,Object> result = new HashMap<String, Object>();
		
		boolean hasExist = false;
		if( categoryVo.getId()==0){//新增时才会检查
			hasExist = videoService.checkExist(categoryVo);
		}
		if(hasExist ){
//			result.put("error", "分类编码或名称已存在!");
			result.put("error", "分类名称已存在!");
		}else{
			String msg = videoService.saveCategory(categoryVo);
			result.put("success", msg);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/editorRecomm/save")
	public Map<String,String> saveToEditorRecomm(BigInteger videoId,String recommDate) {
		String result =  videoService.saveToEditorRecomm(videoId,recommDate);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/editorRecomm/list")
	public Map<String,Object> findAllEditorRecomm(@RequestBody QueryVo queryVo) {
		List<EditorRecommend> list =  videoService.findAllEditorRecomm(queryVo);
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal());
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/editorRecomm/delete")
	public Map<String,String> deleteEditorRecomm(int id) {
		String result =  videoService.deleteEditorRecomm(id);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/bili/findAll")
	public Map<String,Object> findAllBiliUrl(@RequestBody QueryVo queryVo) {
		List<BiliUrl> list =  videoService.findAllBiliUrl(queryVo);
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal());
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/bili/saveUrl")
	public Map<String,Object> saveBiliUrl(String url) {
		String id =  videoService.saveBiliUrl(url);
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("success",id);
		return result;
	}
	
}
