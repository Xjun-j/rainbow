package com.rainbow.vo;

import java.io.Serializable;

public class ChannelVo implements Serializable{
	
	private static final long serialVersionUID = 8247161136600435092L;
	
	private String id;
	private String name;
	private String alias;
	private String phone;
	private String address;
	private String zipUrl;
	private String[] categoriesId;
	private String zipSize;
	private String md5;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipUrl() {
		return zipUrl;
	}
	public void setZipUrl(String zipUrl) {
		this.zipUrl = zipUrl;
	}
	
	public String[] getCategoriesId() {
		return categoriesId;
	}
	public void setCategoriesId(String[] categoriesId) {
		this.categoriesId = categoriesId;
	}
	public String getZipSize() {
		return zipSize;
	}
	public void setZipSize(String zipSize) {
		this.zipSize = zipSize;
	}
	public String getMd5() {
		return md5;
	}
	public void setMd5(String md5) {
		this.md5 = md5;
	}
	
	
	
	
}
