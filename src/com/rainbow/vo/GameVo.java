package com.rainbow.vo;

import java.io.Serializable;
import java.math.BigInteger;

public class GameVo implements Serializable {

	private static final long serialVersionUID = -6691215403892836982L;
	private BigInteger id;
	private String title;
	private String motto;// 一句话介绍，列表显示时使用
	private String introduction;
	private int category;
	private String scategory;
	private String tag;
	private String gameUrl;
	private String plat;
	private String pkgSize;
	private String pkgName;
	private String device;
	private String operate;
	private String feature;
	// 攻略
	private String guide;
	private String author;
	private String version;
	private int downloaders;
	private String updateDate;

	// 缩略图 链接地址
	private String imgAddr;
	// 游戏截图 链接地址
	private String screenshotAddrs[];
	
	private String os;

	public GameVo() {

	}

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

	public String getGameUrl() {
		return gameUrl;
	}

	public void setGameUrl(String gameUrl) {
		this.gameUrl = gameUrl;
	}

	public String getPlat() {
		return plat;
	}

	public void setPlat(String plat) {
		this.plat = plat;
	}

	public String getPkgSize() {
		return pkgSize;
	}

	public void setPkgSize(String pkgSize) {
		this.pkgSize = pkgSize;
	}

	public String getDevice() {
		return device;
	}

	public void setDevice(String device) {
		this.device = device;
	}

	public String getOperate() {
		return operate;
	}

	public void setOperate(String operate) {
		this.operate = operate;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public int getDownloaders() {
		return downloaders;
	}

	public void setDownloaders(int downloaders) {
		this.downloaders = downloaders;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getImgAddr() {
		return imgAddr;
	}

	public void setImgAddr(String imgAddr) {
		this.imgAddr = imgAddr;
	}

	public String[] getScreenshotAddrs() {
		return screenshotAddrs;
	}

	public void setScreenshotAddrs(String[] screenshotAddrs) {
		this.screenshotAddrs = screenshotAddrs;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getPkgName() {
		return pkgName;
	}

	public void setPkgName(String pkgName) {
		this.pkgName = pkgName;
	}

}
