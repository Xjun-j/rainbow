package com.rainbow.model.product;

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
@Table(name="t_secure_number")
public class SecureNumber implements Serializable{
	
private static final long serialVersionUID = 6210842239092410458L;
	
	private int id;
	private String uidcode;//防伪码
    private Date createTime;
    private int status;
    private BigInteger activeTime;
    private String activeArea;
    private String imei;
    
    public SecureNumber(){
    	
    }
    
    public SecureNumber(int id ,String uidcode, Date createTime,int status,BigInteger activeTime,String activeArea,String imei) {
		super();
		this.id = id ; 
		this.uidcode = uidcode;
		this.status = status;
		this.activeTime = activeTime;
		this.activeArea = activeArea;
		this.imei = imei;
		this.createTime = createTime;
	}

    @GenericGenerator(name = "secureNoGenerator", strategy = "increment")
    @Id
    @GeneratedValue(generator = "secureNoGenerator")
    @Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="uidcode")
	public String getUidcode() {
		return uidcode;
	}

	public void setUidcode(String uidcode) {
		this.uidcode = uidcode;
	}

	@Temporal(TemporalType.TIMESTAMP)
    @Column(name="create_time",updatable=false)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name="status")
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Column(name="active_time")
	public BigInteger getActiveTime() {
		return activeTime;
	}

	public void setActiveTime(BigInteger activeTime) {
		this.activeTime = activeTime;
	}

	@Column(name="active_area")
	public String getActiveArea() {
		return activeArea;
	}

	public void setActiveArea(String activeArea) {
		this.activeArea = activeArea;
	}

	@Column(name="imei")
	public String getImei() {
		return imei;
	}

	public void setImei(String imei) {
		this.imei = imei;
	}
    
    

}
