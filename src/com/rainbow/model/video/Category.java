package com.rainbow.model.video;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

@Entity(name = "category")
@Table(name = "t_category")
public class Category implements Serializable{
	
	private static final long serialVersionUID = 3311296081793974323L;

	private int id;
	private int code;
	private String name;
	private int status;
	private int iosStatus;
//	private int level;
	private int parentId;
	private Date createTime;
	private Date updateTime;
	
	
	@GenericGenerator(name = "videoGenerator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "videoGenerator")
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "code")
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "status")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Column(name = "ios_status")
	public int getIosStatus() {
		return iosStatus;
	}
	public void setIosStatus(int iosStatus) {
		this.iosStatus = iosStatus;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", updatable = false)
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_time")
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
//	@Column(name = "level")
//	public int getLevel() {
//		return level;
//	}
//	public void setLevel(int level) {
//		this.level = level;
//	}
	
	@Column(name="parent_id")
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
	
}
