package com.rainbow.model.user;

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
@Table(name="t_user_suggestion")
public class Suggestion implements Serializable {
    
	private static final long serialVersionUID = -737661988567578057L;

	@GenericGenerator(name = "suggestGenerator", strategy = "increment")
    @Id
    @GeneratedValue(generator = "suggestGenerator")
    @Column(name = "id", unique = true, nullable = false)
    private int id;
    
    @Column(name = "email")
    private String contact;
    
    @Column(name = "suggestion")
    private String suggestion;
    
    @Column(name = "phone")
    private String phone;
    
    @Column(name = "app_ver")
    private String appVersion;
    
    @Column(name = "os")
    private String os;
    
    @Column(name = "status")
    private int status;
    
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="create_time",updatable=false)
    private Date createTime;
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="update_time")
    private Date updateTime;
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getSuggestion() {
		return suggestion;
	}

	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getAppVersion() {
		return appVersion;
	}

	public void setAppVersion(String appVersion) {
		this.appVersion = appVersion;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

    
}
