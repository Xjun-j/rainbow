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

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="t_product")
public class Product implements Serializable {
	
	private static final long serialVersionUID = 2973505682924448822L;
	
	private int id;
    private String name; 
    private String description;// 描述
    private Date createTime;
    
    public Product() {
		super();
	}

	public Product(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Product(int id, String name, String description, Date createTime) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.createTime = createTime;
	}
    
	@GenericGenerator(name = "productGenerator", strategy = "increment")
    @Id
    @GeneratedValue(generator = "productGenerator")
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
