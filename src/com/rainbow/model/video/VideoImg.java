package com.rainbow.model.video;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity(name = "videoImg")
@Table(name = "t_video_img")
public class VideoImg implements Serializable {
	private static final long serialVersionUID = 6723595554531942405L;

	private int id;
	private String url;
	private BigInteger videoId;
//	private int width;
//	private int height;
	//图片格式 jpg png 等
	private int status;
	
	@GenericGenerator(name = "vimgGenerator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "vimgGenerator")
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
	
	
}

