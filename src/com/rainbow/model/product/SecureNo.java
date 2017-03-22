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
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="t_secure_number_bak")
public class SecureNo implements Serializable {
	
	private static final long serialVersionUID = 6210842239092410458L;
	
	private int id;
	private int productId;
	private String productName;
	private int modelId;
	private String modelName;
	private int serialNo;
	private int randomNo;
	private String code;//给厂商打印用的编号
    private Date createTime;
    private int channleId;
    private int status;
    private BigInteger activeTime;
    private String activeArea;
    private String imei;
    
    
    public SecureNo(){
    	
    }
    
    
	public SecureNo(int productId, int modelId, int channleId, int serialNo, int randomNo,
			String code, Date createTime) {
		super();
		this.productId = productId;
		this.modelId = modelId;
		this.channleId = channleId;
		this.serialNo = serialNo;
		this.randomNo = randomNo;
		this.code = code;
		this.createTime = createTime;
	}




	public SecureNo(int id, int productId, String productName, int modelId,
			String modelName, String code, Date createTime,int status,BigInteger activeTime,String activeArea ,String imei) {
		super();
		this.id = id;
		this.productId = productId;
		this.productName = productName;
		this.modelId = modelId;
		this.modelName = modelName;
		this.code = code;
		this.createTime = createTime;
		this.status = status;
		this.activeTime = activeTime;
		this.activeArea = activeArea;
		this.imei = imei;
	}


	public SecureNo(int id, int productId, String productName, int modelId,
			String modelName, int serialNo, int randomNo, String code,
			Date createTime) {
		super();
		this.id = id;
		this.productId = productId;
		this.productName = productName;
		this.modelId = modelId;
		this.modelName = modelName;
		this.serialNo = serialNo;
		this.randomNo = randomNo;
		this.code = code;
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
	
	@Column(name="product_id")
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	@Column(name="model_id")
	public int getModelId() {
		return modelId;
	}
	public void setModelId(int modelId) {
		this.modelId = modelId;
	}
	
	@Column(name="serial_number")
	public int getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}
	
	@Column(name="random_number")
	public int getRandomNo() {
		return randomNo;
	}
	public void setRandomNo(int randomNo) {
		this.randomNo = randomNo;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
    @Column(name="create_time",updatable=false)
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Transient
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	@Transient
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}


	@Column(name="code")
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	@Column(name="channel_id")
	public int getChannleId() {
		return channleId;
	}
	public void setChannleId(int channleId) {
		this.channleId = channleId;
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
