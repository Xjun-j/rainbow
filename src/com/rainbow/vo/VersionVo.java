package com.rainbow.vo;

import java.io.Serializable;

public class VersionVo implements Serializable {
	
	private static final long serialVersionUID = -436403420891885200L;
	
	
	private String id;
	private String vcode;
	private String upv;
	private String os;
	private String url;
	//安卓时上传安装包
//	private File apkFile;
	private String desc;
	private int force=0;
	private String size;
	private String md5;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getVcode() {
		return vcode;
	}
	public void setVcode(String vcode) {
		this.vcode = vcode;
	}
	public String getUpv() {
		return upv;
	}
	public void setUpv(String upv) {
		this.upv = upv;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
//	public File getApkFile() {
//		return apkFile;
//	}
//	public void setApkFile(File apkFile) {
//		this.apkFile = apkFile;
//	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getForce() {
		return force;
	}
	public void setForce(int force) {
		this.force = force;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getMd5() {
		return md5;
	}
	public void setMd5(String md5) {
		this.md5 = md5;
	}
	
	
}
