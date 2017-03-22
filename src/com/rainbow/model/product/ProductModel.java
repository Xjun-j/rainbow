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
@Table(name="t_product_model")
public class ProductModel implements Serializable {
	
	private static final long serialVersionUID = 1710357696467547750L;
	private int id;
	private int productId;
	private String productName;
    private String name; 
    private String description;// 描述
    private Date createTime;
    
    public ProductModel() {
		super();
	}
    
	public ProductModel(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public ProductModel(int id, int productId, String name, String description,
			Date createTime) {
		super();
		this.id = id;
		this.productId = productId;
		this.name = name;
		this.description = description;
		this.createTime = createTime;
	}


	public ProductModel(int id, int productId, String productName, String name, String description, Date createTime) {
		super();
		this.id = id;
		this.productId = productId;
		this.productName = productName;
		this.name = name;
		this.description = description;
		this.createTime = createTime;
	}

	@GenericGenerator(name = "pmodelGenerator", strategy = "increment")
    @Id
    @GeneratedValue(generator = "pmodelGenerator")
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
	
	@Column(name = "product_id")
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	@Transient	
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Column(name = "description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
    @Column(name="create_time",updatable=false)
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
    
    

}
