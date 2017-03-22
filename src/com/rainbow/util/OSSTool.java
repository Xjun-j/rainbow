package com.rainbow.util;

import java.io.InputStream;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import org.apache.log4j.Logger;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.OSSObjectSummary;
import com.aliyun.oss.model.ObjectListing;

public class OSSTool {
	private static Logger logger = Logger.getLogger(OSSTool.class); 
	
	private static OSSClient ossClient;
	private static String accessId;
	private static String accessSecret;
	private static String endpoint;
	private static String imgBucket;
	private static String fileBucket;
	private static String imgDomain;
	private static String fileDomain;
	
	static{
		Properties prop = PropertiesUtil.getProperty("rainbow.properties");
		accessId = prop.getProperty("access_id");
		accessSecret = prop.getProperty("access_secret");
		endpoint = prop.getProperty("endpoint");
		imgBucket = prop.getProperty("image_bucket_name");
		fileBucket = prop.getProperty("file_bucket_name");
		imgDomain = prop.getProperty("image_domain");
		fileDomain = prop.getProperty("file_domain");
	}
	
	public static OSSClient getOssClient(){
		if(ossClient == null){
			ossClient = new OSSClient(endpoint, accessId, accessSecret);
		}
		return ossClient;
	}
	
	public static String saveFile(String buketName,InputStream inputStream,String filename){
		String saveName ="";
		if(filename.lastIndexOf(".") != -1){
			saveName = UUID.randomUUID()+ filename.substring(filename.lastIndexOf("."),filename.length()); 
		}else{
			saveName =  UUID.randomUUID().toString();
		}
		getOssClient().putObject(buketName, saveName, inputStream);
		logger.debug( "保存的文件名："+saveName );
		return saveName; 
	}
	
	
	public static String saveFile(InputStream inputStream,String filename){
		return fileDomain + saveFile(fileBucket,inputStream,filename);
	}
	
	public static String saveImg(InputStream inputStream,String filename){
		return imgDomain + saveFile(imgBucket,inputStream,filename);
	}
	
	public static void deleteFile(String buketName,String key){
		logger.debug( "删除文件key："+key +",length:"+key.length());
		if(key.isEmpty()){
			return;
		}
		getOssClient().deleteObject(buketName, key );
	}
	
	public static void deleteFile(String key){
		deleteFile(fileBucket, key );
	}
	
	public static void deleteImg(String key){
		deleteFile(imgBucket, key );
	}
	
	public  static void shutdown(){
		getOssClient().shutdown();
	}
	
	 
//	public static void main(String[] args) {
//		System.out.println(fileBucket);
//		deleteFile(fileBucket,"a6c14a8f-f4f7-4b2c-b0d9-9eaa6bcfaa6c.apk");
//	}
//	
	
}
