package com.rainbow.model.game;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;


@Entity(name="game")
@Table(name="t_game")
public class Game implements Serializable {
    private static final long serialVersionUID = 172643386440351811L;
    
    private BigInteger id;
    private String idStr;
    private String title;
    private String motto;// 一句话介绍，列表显示时使用
    private String introduction;
    private int category;
    private String scategory;
    private String tag;
//    @Column(name = "img_id")
//    private int imgId;
    private String gameUrl;
    private String plat;
    private String pkgSize;
    private String pkgName;
    private String device;
    private String operate;
    private String feature;
    //攻略
    private String guide;
    private String author;
    private String version;
    private int downloaders;
    private String updateDate;
    
    private Date createTime;
    private Date updateTime;
    private Img img;
    private List<Screenshot> screenshots;
    private String os;
    
    @GenericGenerator(name = "gameGenerator", strategy = "increment")
    @Id
    @GeneratedValue(generator = "gameGenerator")
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
	
	@Column(name = "motto")
	public String getMotto() {
		return motto;
	}
	public void setMotto(String motto) {
		this.motto = motto;
	}

	@Column(name = "introduction")
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
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

	@Column(name = "tag")
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}

	@Column(name = "game_url")
	public String getGameUrl() {
		return gameUrl;
	}
	public void setGameUrl(String gameUrl) {
		this.gameUrl = gameUrl;
	}
	
	@Column(name = "plat")
	public String getPlat() {
		return plat;
	}
	public void setPlat(String plat) {
		this.plat = plat;
	}

	@Column(name = "pkg_size")
	public String getPkgSize() {
		return pkgSize;
	}
	public void setPkgSize(String pkgSize) {
		this.pkgSize = pkgSize;
	}

	@Column(name = "device")
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}

	@Column(name = "operate")
	public String getOperate() {
		return operate;
	}
	public void setOperate(String operate) {
		this.operate = operate;
	}

	@Column(name = "feature")
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}

	@Column(name = "guide")
	public String getGuide() {
		return guide;
	}
	public void setGuide(String guide) {
		this.guide = guide;
	}

	@Column(name = "author")
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	@Column(name = "version")
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}

	@Column(name = "downloaders")
	public int getDownloaders() {
		return downloaders;
	}
	public void setDownloaders(int downloaders) {
		this.downloaders = downloaders;
	}

	@Column(name = "update_date")
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
    @Column(name="create_time",updatable=false)
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
    @Column(name="update_time")
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@OneToOne(cascade=CascadeType.REMOVE,fetch=FetchType.EAGER)
	@JoinColumn(name="img_id")
	public Img getImg() {
		return img;
	}
	public void setImg(Img img) {
		this.img = img;
	}
	
	@OneToMany(cascade=CascadeType.REMOVE)
	@JoinColumn(name="game_id")
	public List<Screenshot> getScreenshots() {
		return screenshots;
	}
	public void setScreenshots(List<Screenshot> screenshots) {
		this.screenshots = screenshots;
	}
	
	@Column(name="os")
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	
	@Column(name="pkg_name")
	public String getPkgName() {
		return pkgName;
	}
	public void setPkgName(String pkgName) {
		this.pkgName = pkgName;
	}
    
}
