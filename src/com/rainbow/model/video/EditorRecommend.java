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
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_editor_recommend")
public class EditorRecommend implements Serializable{
	
	private static final long serialVersionUID = -326753549532876966L;
	
	private int id;
	private BigInteger videoId;
	private int status;
	private String recommendDate;
	private Date createTime;
	private Date updateTime;
	
	private String title;
	private String url;
	private String scategory;
	private String tag;
	
	public EditorRecommend() {
	}
	
	public EditorRecommend(int id, BigInteger videoId, String recommendDate, Date createTime, String title, String url,
			String scategory, String tag) {
		super();
		this.id = id;
		this.videoId = videoId;
		this.recommendDate = recommendDate;
		this.createTime = createTime;
		this.title = title;
		this.url = url;
		this.scategory = scategory;
		this.tag = tag;
	}
	
	@GenericGenerator(name = "editorRecommGenerator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "editorRecommGenerator")
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	@Column(name = "video_id")
	public BigInteger getVideoId() {
		return videoId;
	}
	public void setVideoId(BigInteger videoId) {
		this.videoId = videoId;
	}
	
	@Column(name = "status")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Column(name = "recommend_date")
	public String getRecommendDate() {
		return recommendDate;
	}
	public void setRecommendDate(String recommendDate) {
		this.recommendDate = recommendDate;
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
	
	@Transient
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Transient
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Transient
	public String getScategory() {
		return scategory;
	}
	public void setScategory(String scategory) {
		this.scategory = scategory;
	}
	
	@Transient
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	

}
