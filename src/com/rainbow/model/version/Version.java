package com.rainbow.model.version;

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

@Entity(name="version")
@Table(name="t_version")
public class Version implements Serializable {
    
	private static final long serialVersionUID = -7769851006945952684L;
	
	private int id;
    private String vcode;
    private String upv;// 一句话介绍，列表显示时使用
    private String desc;
    private String url;
    private String md5;
    private String size;
    private int force;
    private String os;
    
    private Date createTime;
    private Date updateTime;
    
    @GenericGenerator(name = "versionGenerator", strategy = "increment")
    @Id
    @GeneratedValue(generator = "versionGenerator")
    @Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	//新版本apk文件读取的versioncode
	@Column(name = "vcode")
	public String getVcode() {
		return vcode;
	}
	public void setVcode(String vcode) {
		this.vcode = vcode;
	}
	
	//更新后的版本号
	@Column(name = "upv")
	public String getUpv() {
		return upv;
	}
	public void setUpv(String upv) {
		this.upv = upv;
	}
	
	@Column(name = "detail")
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	@Column(name = "url")
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Column(name = "md5")
	public String getMd5() {
		return md5;
	}
	public void setMd5(String md5) {
		this.md5 = md5;
	}
	
	@Column(name = "size")
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
	@Column(name = "forced")
	public int getForce() {
		return force;
	}
	public void setForce(int force) {
		this.force = force;
	}
	
	@Column(name = "os")
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
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

    
}
