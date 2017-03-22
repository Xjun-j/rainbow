package com.rainbow.model.product;

import java.io.Serializable;
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
@Table(name = "t_secure_number_file_log")
public class SecureNoFileLog implements Serializable {

	private static final long serialVersionUID = 6210842239092410458L;

	private int id;
	private int productId;
	private String productName;
	private int modelId;
	private String modelName;
	private Date createTime;
	private int channleId;
	private String channelName;
	private String fileUrl;

	public SecureNoFileLog() {

	}

	public SecureNoFileLog(int id, int productId, String productName, int modelId, String modelName, String fileUrl,
			Date createTime) {
		super();
		this.id = id;
		this.productId = productId;
		this.productName = productName;
		this.modelId = modelId;
		this.modelName = modelName;
		this.fileUrl = fileUrl;
		this.createTime = createTime;
	}

	public SecureNoFileLog(int id, int productId, String productName, int modelId, String modelName, String fileUrl,
			int channelId,String channelName,Date createTime) {
		super();
		this.id = id;
		this.productId = productId;
		this.productName = productName;
		this.modelId = modelId;
		this.modelName = modelName;
		this.fileUrl = fileUrl;
		this.channleId = channelId;
		this.channelName = channelName;
		this.createTime = createTime;
	}
	
	@GenericGenerator(name = "secureNoFileLogGenerator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "secureNoFileLogGenerator")
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "product_id")
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	@Column(name = "model_id")
	public int getModelId() {
		return modelId;
	}

	public void setModelId(int modelId) {
		this.modelId = modelId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", updatable = false)
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
	
	@Column(name = "file_url")
	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	@Column(name = "channel_id")
	public int getChannleId() {
		return channleId;
	}

	public void setChannleId(int channleId) {
		this.channleId = channleId;
	}

	@Transient
	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

}
