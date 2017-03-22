package com.rainbow.vo;

import java.io.Serializable;

public class SecureNoVo implements Serializable{
	
	private static final long serialVersionUID = -4708525392946330741L;
	
	private int productId;
	private int modelId;
	private int channelId;
	private int quantity=1000;
	
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getModelId() {
		return modelId;
	}
	public void setModelId(int modelId) {
		this.modelId = modelId;
	}
	public int getChannelId() {
		return channelId;
	}
	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
}
