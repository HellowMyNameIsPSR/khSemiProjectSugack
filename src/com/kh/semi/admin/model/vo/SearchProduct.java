package com.kh.semi.admin.model.vo;

import java.sql.Date;

public class SearchProduct implements java.io.Serializable{
	private String category;
	private String productType;
	private String authorName;
	private String productName;
	private Date proStart;
	private Date proLast;
	private int productValLow;
	private int productValHigh;
	private int valResult;
	private Date proDateResult;
	private String material;
	private String craft;
	private int productValue;
	
	public int getProductValue() {
		return productValue;
	}

	public void setProductValue(int productValue) {
		this.productValue = productValue;
	}

	public SearchProduct() {}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Date getProStart() {
		return proStart;
	}

	public void setProStart(Date proStart) {
		this.proStart = proStart;
	}

	public Date getProLast() {
		return proLast;
	}

	public void setProLast(Date proLast) {
		this.proLast = proLast;
	}

	public int getProductValLow() {
		return productValLow;
	}

	public void setProductValLow(int productValLow) {
		this.productValLow = productValLow;
	}

	public int getProductValHigh() {
		return productValHigh;
	}

	public void setProductValHigh(int productValHigh) {
		this.productValHigh = productValHigh;
	}

	public int getValResult() {
		return valResult;
	}

	public void setValResult(int valResult) {
		this.valResult = valResult;
	}

	public Date getProDateResult() {
		return proDateResult;
	}

	public void setProDateResult(Date proDateResult) {
		this.proDateResult = proDateResult;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getCraft() {
		return craft;
	}

	public void setCraft(String craft) {
		this.craft = craft;
	}

	public SearchProduct(String category, String productType, String authorName, String productName, Date proStart,
			Date proLast, int productValLow, int productValHigh, int valResult, Date proDateResult, String material,
			String craft, int productValue) {
		super();
		this.category = category;
		this.productType = productType;
		this.authorName = authorName;
		this.productName = productName;
		this.proStart = proStart;
		this.proLast = proLast;
		this.productValLow = productValLow;
		this.productValHigh = productValHigh;
		this.productValue = productValue;
		this.valResult = valResult;
		this.proDateResult = proDateResult;
		this.material = material;
		this.craft = craft;
	}

	@Override
	public String toString() {
		return "SearchProduct [category=" + category + ", productType=" + productType + ", authorName=" + authorName
				+ ", productName=" + productName + ", proStart=" + proStart + ", proLast=" + proLast
				+ ", productValLow=" + productValLow + ", productValHigh=" + productValHigh + ", valResult=" + valResult
				+ ", proDateResult=" + proDateResult + ", material=" + material + ", craft=" + craft + "]";
	}

	
	
	
	
	
	
}
