package com.rainbow.model.game;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity(name = "img")
@Table(name = "t_img")
public class Img implements Serializable {
	private static final long serialVersionUID = 6723595554531942405L;

	private int id;
	private String url;
	private int width;
	private int height;
	//图片格式 jpg png 等
	private String fmt;
	
	@GenericGenerator(name = "imgGenerator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "imgGenerator")
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "url")
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Column(name = "width")
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	
	@Column(name = "height")
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	
	@Column(name = "fmt")
	public String getFmt() {
		return fmt;
	}
	public void setFmt(String fmt) {
		this.fmt = fmt;
	}

}

