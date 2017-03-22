package com.rainbow.model.video;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_scrapy_url")
public class BiliUrl implements Serializable{
	
	private static final long serialVersionUID = 6459302087784982746L;
	
	private int id;
	private String url;
	private int finish;
	private BigInteger videoId;
	private Date createTime;
	private Date updateTime;
	
	
	@GenericGenerator(name = "biliUrlGenerator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "biliUrlGenerator")
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "url")
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Column(name = "finish")
	public int getFinish() {
		return finish;
	}
	public void setFinish(int finish) {
		this.finish = finish;
	}
	
	@Column(name = "video_id")
	public BigInteger getVideoId() {
		return videoId;
	}
	public void setVideoId(BigInteger videoId) {
		this.videoId = videoId;
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
	
	
}
