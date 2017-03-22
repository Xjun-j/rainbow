package com.rainbow.upload;

public class ProgressEntity {
	private long uploaded = 0L;
	private long total = 0L;
	private int items;


	public long getUploaded() {
		return uploaded;
	}


	public void setUploaded(long uploaded) {
		this.uploaded = uploaded;
	}


	public long getTotal() {
		return total;
	}


	public void setTotal(long total) {
		this.total = total;
	}


	public int getItems() {
		return items;
	}


	public void setItems(int items) {
		this.items = items;
	}


	@Override
	public String toString() {
		return "{upaloded:"+uploaded+",total:"+total+",items:"+items+"}";
	}
}
