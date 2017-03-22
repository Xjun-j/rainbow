package com.rainbow.vo;

import java.io.Serializable;
import java.math.BigInteger;

public class VideoVo implements Serializable {
	
	private static final long serialVersionUID = -7887397775426665050L;
	
	public VideoVo(){
		
	}
	
	public VideoVo(BigInteger id, String title, String scategory, String tag,
			String radio, String releaseDate, int duration, String area,
			String director, String starring, String motto,
			String introduction, String score, BigInteger viewers) {
		super();
		this.id = id;
		this.title = title;
		this.scategory = scategory;
		this.tag = tag;
		this.radio = radio;
		this.releaseDate = releaseDate;
		this.duration = duration;
		this.area = area;
		this.director = director;
		this.starring = starring;
		this.motto = motto;
		this.introduction = introduction;
		this.score = score;
		this.viewers = viewers;
	}
	
	private BigInteger id;
	private String title;
	private int category;
	private String scategory;
	private String tag;
	private String radio;
	private String releaseDate;
	private int duration;
	private String area;
	private String director;
	private String starring;
	private String motto;// 一句话介绍，列表显示时使用
	private String introduction;
	private String score;
	private BigInteger viewers;
	
	private String posterUrl;
	private String videoUrl;
	
	
	public BigInteger getId() {
		return id;
	}
	public void setId(BigInteger id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getScategory() {
		return scategory;
	}
	public void setScategory(String scategory) {
		this.scategory = scategory;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getRadio() {
		return radio;
	}
	public void setRadio(String radio) {
		this.radio = radio;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getStarring() {
		return starring;
	}
	public void setStarring(String starring) {
		this.starring = starring;
	}
	public String getMotto() {
		return motto;
	}
	public void setMotto(String motto) {
		this.motto = motto;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public BigInteger getViewers() {
		return viewers;
	}
	public void setViewers(BigInteger viewers) {
		this.viewers = viewers;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getPosterUrl() {
		return posterUrl;
	}

	public void setPosterUrl(String posterUrl) {
		this.posterUrl = posterUrl;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	
	
}
