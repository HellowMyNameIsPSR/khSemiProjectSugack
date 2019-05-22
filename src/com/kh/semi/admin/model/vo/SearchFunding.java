package com.kh.semi.admin.model.vo;

import java.sql.Date;

public class SearchFunding {
	private String category;
	private String material;
	private String sellKeyword;
	private String searchName;
	private Date fundSetDateStart;
	private Date fundSetDateLast;
	private Date fundLastDateStart;
	private Date fundLastDateLast;
	private Date resultFundDate;
	private Date resultFundLastDate;
	private int resultNum;
	private int minNum;
	private int maxNum;
	private Date proDateResult;
	private String authorName;
	public String getCategory() {
		return category;
	}
	public SearchFunding() {}
	
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getSellKeyword() {
		return sellKeyword;
	}
	public void setSellKeyword(String sellKeyword) {
		this.sellKeyword = sellKeyword;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public Date getFundSetDateStart() {
		return fundSetDateStart;
	}
	public void setFundSetDateStart(Date fundSetDateStart) {
		this.fundSetDateStart = fundSetDateStart;
	}
	public Date getFundSetDateLast() {
		return fundSetDateLast;
	}
	public void setFundSetDateLast(Date fundSetDateLast) {
		this.fundSetDateLast = fundSetDateLast;
	}
	public Date getFundLastDateStart() {
		return fundLastDateStart;
	}
	public void setFundLastDateStart(Date fundLastDateStart) {
		this.fundLastDateStart = fundLastDateStart;
	}
	public Date getFundLastDateLast() {
		return fundLastDateLast;
	}
	public void setFundLastDateLast(Date fundLastDateLast) {
		this.fundLastDateLast = fundLastDateLast;
	}
	public Date getResultFundDate() {
		return resultFundDate;
	}
	public void setResultFundDate(Date resultFundDate) {
		this.resultFundDate = resultFundDate;
	}
	public Date getResultFundLastDate() {
		return resultFundLastDate;
	}
	public void setResultFundLastDate(Date resultFundLastDate) {
		this.resultFundLastDate = resultFundLastDate;
	}
	public int getResultNum() {
		return resultNum;
	}
	public void setResultNum(int resultNum) {
		this.resultNum = resultNum;
	}
	public int getMinNum() {
		return minNum;
	}
	public void setMinNum(int minNum) {
		this.minNum = minNum;
	}
	public int getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	public Date getProDateResult() {
		return proDateResult;
	}
	public void setProDateResult(Date proDateResult) {
		this.proDateResult = proDateResult;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public SearchFunding(String category, String material, String sellKeyword, String searchName, Date fundSetDateStart,
			Date fundSetDateLast, Date fundLastDateStart, Date fundLastDateLast, Date resultFundDate,
			Date resultFundLastDate, int resultNum, int minNum, int maxNum, Date proDateResult, String authorName) {
		super();
		this.category = category;
		this.material = material;
		this.sellKeyword = sellKeyword;
		this.searchName = searchName;
		this.fundSetDateStart = fundSetDateStart;
		this.fundSetDateLast = fundSetDateLast;
		this.fundLastDateStart = fundLastDateStart;
		this.fundLastDateLast = fundLastDateLast;
		this.resultFundDate = resultFundDate;
		this.resultFundLastDate = resultFundLastDate;
		this.resultNum = resultNum;
		this.minNum = minNum;
		this.maxNum = maxNum;
		this.proDateResult = proDateResult;
		this.authorName = authorName;
	}
	@Override
	public String toString() {
		return "SearchFunding [category=" + category + ", material=" + material + ", sellKeyword=" + sellKeyword
				+ ", searchName=" + searchName + ", fundSetDateStart=" + fundSetDateStart + ", fundSetDateLast="
				+ fundSetDateLast + ", fundLastDateStart=" + fundLastDateStart + ", fundLastDateLast="
				+ fundLastDateLast + ", resultFundDate=" + resultFundDate + ", resultFundLastDate=" + resultFundLastDate
				+ ", resultNum=" + resultNum + ", minNum=" + minNum + ", maxNum=" + maxNum + ", proDateResult="
				+ proDateResult + ", authorName=" + authorName + "]";
	}
	
	
}
