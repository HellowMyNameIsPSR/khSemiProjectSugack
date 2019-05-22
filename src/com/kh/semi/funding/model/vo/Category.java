package com.kh.semi.funding.model.vo;

import java.io.Serializable;

public class Category implements Serializable{
	private int cid; //카테고리 코드!
	private String category; //카테고리!

	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(int cid, String category) {
		super();
		this.cid = cid;
		this.category = category;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Category [cid=" + cid + ", category=" + category + "]";
	}
	
} //end class
