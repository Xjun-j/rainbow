package com.rainbow.model.channel;

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

@Entity
@Table(name="t_channel")
public class Channel implements Serializable {
    
	private static final long serialVersionUID = -9186744695821531651L;
	
	private int id;
    private String name; // 渠道全称
    private String alias;// 渠道的简称或别名
    private String zipUrl;//渠道包的存放路径
    private String zipSize;//渠道包大小
    private String phone;//渠道包大小
    private String address;//渠道包大小
    private String categoriesId;//渠道需要显示的分类id,多个用逗号分开
    
    private Date createTime;
    private Date updateTime;
    
    public Channel(){
    	
    }
    
    public Channel(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}


	public Channel(int id, String name, String alias, String zipUrl,
			String zipSize, String phone, String address, String categoriesId,
			Date createTime, Date updateTime) {
		super();
		this.id = id;
		this.name = name;
		this.alias = alias;
		this.zipUrl = zipUrl;
		this.zipSize = zipSize;
		this.phone = phone;
		this.address = address;
		this.categoriesId = categoriesId;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	@GenericGenerator(name = "channelGenerator", strategy = "increment")
    @Id
    @GeneratedValue(generator = "channelGenerator")
    @Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "alias")
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	
	@Column(name = "zip_url")
	public String getZipUrl() {
		return zipUrl;
	}
	public void setZipUrl(String zipUrl) {
		this.zipUrl = zipUrl;
	}
	
	@Column(name = "zip_size")
	public String getZipSize() {
		return zipSize;
	}
	public void setZipSize(String zipSize) {
		this.zipSize = zipSize;
	}
	
	@Column(name="phone")
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Column(name="address")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name="categories_id")
	public String getCategoriesId() {
		return categoriesId;
	}
	public void setCategoriesId(String categoriesId) {
		this.categoriesId = categoriesId;
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
