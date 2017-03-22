package com.rainbow.model.game;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity(name="screenshot")
@Table(name="t_screenshot")
public class Screenshot implements Serializable{

	private static final long serialVersionUID = 2701609687204702441L;
	
    private int id;
    private BigInteger gameId;
	private String url;
	private int width;
	private int height;
	private String fmt;
	
	@GenericGenerator(name = "ssGenerator", strategy = "increment")
    @Id
    @GeneratedValue(generator = "ssGenerator")
    @Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "game_id")
	public BigInteger getGameId() {
		return gameId;
	}
	public void setGameId(BigInteger gameId) {
		this.gameId = gameId;
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
