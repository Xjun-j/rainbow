package com.rainbow.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rainbow.model.product.Product;
import com.rainbow.model.product.ProductModel;
import com.rainbow.model.product.SecureNo;
import com.rainbow.model.product.SecureNoFileLog;
import com.rainbow.service.product.ProductService;
import com.rainbow.util.PropertiesUtil;
import com.rainbow.vo.ProductVo;
import com.rainbow.vo.QueryVo;
import com.rainbow.vo.SecureNoVo;

@Controller
@RequestMapping("/product")
public class ProductController {
	private static Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/list")
	public String productList(){
		return "product/list";
	}
	
	@RequestMapping("/securenumber")
	public String secureNumber(){
		return "product/secure_number";
	}
	
	@RequestMapping("/securenumber/download")
	public String secureNumberFiles(){
		return "product/secure_number_files";
	}
	
	@ResponseBody
	@RequestMapping("/findAll")
	public Map<String,Object> findAll(@RequestBody QueryVo queryVo) {
		List<Product> list = productService.findAll(queryVo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal() );
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/findAllModel")
	public Map<String,Object> findAllModel(@RequestBody QueryVo queryVo) {
		List<ProductModel> list = productService.findAllModel(queryVo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal() );
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/findAllForSelect")
	public Map<String,Object> findAllForSelect() {
		List<Product> list = productService.findAllForSelect();
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
//		result.put("total",queryVo.getTotal() );
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/findAllModelByProId")
	public Map<String,Object> findAllModelByProId(int productId) {
		List<Product> list = productService.findAllModelByProId(productId);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
//		result.put("total",queryVo.getTotal() );
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/findAllSecureNo")
	public Map<String,Object> findAllSecureNo(@RequestBody QueryVo queryVo) {
		List<SecureNo> list = productService.findAllSecureNo(queryVo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal() );
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/findSecureNoFiles")
	public Map<String,Object> findSecureNoFiles(@RequestBody QueryVo queryVo) {
		List<SecureNoFileLog> list = productService.findSecureNoFiles(queryVo);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("rows",list);
		result.put("total",queryVo.getTotal() );
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/generateSecureNo")
	public Map<String,String> generateSecureNo(SecureNoVo secureNoVo) {
//		System.out.println("------------------"+version.getId());
		String result =  productService.generateSecureNo(secureNoVo);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public Map<String,Object>  save(ProductVo productVo) {
		log.debug("用户 :"+SecurityContextHolder.getContext().getAuthentication().getName()+" saveProduct ");
		Map<String,Object> result = new HashMap<String, Object>();
		
		boolean hasExist = productService.checkExist(productVo);
		boolean isEdit = productVo.getId()==0? false:true;
		if(hasExist && !isEdit){
			result.put("error", "产品名称已存在!");
		}else{
			String msg = productService.save(productVo);
			result.put("success", msg);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/saveModel")
	public Map<String,Object>  saveModel(ProductVo productVo) {
		log.debug("用户 :"+SecurityContextHolder.getContext().getAuthentication().getName()+" saveModel ");
		Map<String,Object> result = new HashMap<String, Object>();
		
		boolean hasExist = productService.checkModelExist(productVo);
		boolean isEdit = productVo.getId()==0? false:true;
		if(hasExist && !isEdit){
			result.put("error", "型号名称已存在!");
		}else{
			String msg = productService.saveModel(productVo);
			result.put("success", msg);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Map<String,String> delete(int id,String type) {
//		System.out.println("------------------"+version.getId());
		String result =  productService.delete(id,type);
		Map<String,String> json = new HashMap<String,String>();
		json.put("success", result);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("/importFWM")
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
	    
	    //把数据load入数据库
	    String returnStr = productService.importFWM(path+"/"+fileName) ; 
	    
		Map<String,String> json = new HashMap<String,String>();
		json.put("url", returnStr);
		json.put("size","100M") ; 
		//json.put("url", visitPath+fileName);
		//json.put("size",new DecimalFormat("###.##").format(((double)file.getSize())/1024/1024 )+"M");//转换成M
		return json;
	}

}
