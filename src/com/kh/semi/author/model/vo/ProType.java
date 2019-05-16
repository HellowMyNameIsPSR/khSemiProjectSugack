package com.kh.semi.author.model.vo;

import java.io.Serializable;

public class ProType implements Serializable{
	private int typeId;
	private String material;
	
	public ProType() {
		// TODO Auto-generated constructor stub
	}

	public ProType(int typeId, String material) {
		super();
		this.typeId = typeId;
		this.material = material;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	@Override
	public String toString() {
		return "ProType [typeId=" + typeId + ", material=" + material + "]";
	}
	
}
