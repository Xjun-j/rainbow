package com.rainbow.model.video;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_video")
public class Video implements Serializable {
	private static final long serialVersionUID = 172643386440351811L;

	private BigInteger id;
	private String title;
	private int category;
	private String scategory;
	private int type;
	private String stype;
	private String tag;
	// private int imgId;
//	private String imgUrl;
//	private String videoUrl;
//	private String radio;
	private String releaseDate;
	private int duration;
	private String area;
	private String director;
	private String starring;
	private String motto;// 一句话介绍，列表显示时使用
	private String introduction;
	private String score;
	private BigInteger viewers;
	private Date createTime;
	private Date updateTime;
	private List<VideoImg> imgs;
	private List<VideoUrl> urls;
	private String idStr;
	private int status;
	private int banner;

	@GenericGenerator(name = "videoGenerator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "videoGenerator")
	@Column(name = "id", unique = true, nullable = false)
	public BigInteger getId() {
		return id;
	}

	public void setId(BigInteger id) {
		this.id = id;
	}

	@Transient
	public String getIdStr() {
		return id.toString();
	}

	public void setIdStr(String idStr) {
		this.idStr = idStr;
	}

	@Column(name = "title")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "category")
	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	@Column(name = "scategory")
	public String getScategory() {
		return scategory;
	}

	public void setScategory(String scategory) {
		this.scategory = scategory;
	}

	@Column(name = "type")
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Column(name = "stype")
	public String getStype() {
		return stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
	}

	@Column(name = "tag")
	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

//	@Column(name = "img_url")
//	public String getImgUrl() {
//		return imgUrl;
//	}

//	public void setImgUrl(String imgUrl) {
//		this.imgUrl = imgUrl;
//	}

//	@Column(name = "video_url")
//	public String getVideoUrl() {
//		return videoUrl;
//	}
//
//	public void setVideoUrl(String videoUrl) {
//		this.videoUrl = videoUrl;
//	}

//	@Column(name = "radio")
//	public String getRadio() {
//		return radio;
//	}
//
//	public void setRadio(String radio) {
//		this.radio = radio;
//	}

	@Column(name = "release_date")
	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	@Column(name = "duration")
	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	@Column(name = "area")
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Column(name = "director")
	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	@Column(name = "starring")
	public String getStarring() {
		return starring;
	}

	public void setStarring(String starring) {
		this.starring = starring;
	}

	@Column(name = "introduction")
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Column(name = "score")
	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	@Column(name = "viewers")
	public BigInteger getViewers() {
		return viewers;
	}

	public void setViewers(BigInteger viewers) {
		this.viewers = viewers;
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

	@Column(name = "motto")
	public String getMotto() {
		return motto;
	}

	public void setMotto(String motto) {
		this.motto = motto;
	}

	@OneToMany
	@JoinColumn(name="video_id")
	public List<VideoImg> getImgs() {
		return imgs;
	}
	public void setImgs(List<VideoImg> imgs) {
		this.imgs = imgs;
	}
	
	@OneToMany
	@JoinColumn(name="video_id")
	public List<VideoUrl> getUrls() {
		return urls;
	}
	public void setUrls(List<VideoUrl> urls) {
		this.urls = urls;
	}

	@Column(name = "status")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	@Column(name = "banner")
	public int getBanner() {
		return banner;
	}
	public void setBanner(int banner) {
		this.banner = banner;
	}



}
