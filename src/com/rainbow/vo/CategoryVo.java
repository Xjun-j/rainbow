package com.rainbow.vo;

import java.io.Serializable;

public class CategoryVo implements Serializable{
	
	private static final long serialVersionUID = -6684363965443109058L;
	
	
	private int id;
	private int code;
	private String name;
	private int status;
	private int iosStatus;
	private int parentId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getIosStatus() {
		return iosStatus;
	}
	public void setIosStatus(int iosStatus) {
		this.iosStatus = iosStatus;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
	
}
