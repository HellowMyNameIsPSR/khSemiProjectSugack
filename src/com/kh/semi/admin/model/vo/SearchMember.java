package com.kh.semi.admin.model.vo;

import java.sql.Date;

public class SearchMember implements java.io.Serializable{
	
	private String searchType;
	private String emailText;
	private String nameText;
	private String memberType;
	private String searchText;
	private Date joinStart;
	private Date joinLast;
	private Date joinDay;
	private Date birthDateStart;
	private Date birthDateLast;
	private Date birthDay;
	private Date withdrawalDay;
	private Date withdrawalDateStart;
	private Date withdrawalDateLast;
	private String gender;
	private String withdrawalType;
	//기본생성자
	public SearchMember() {}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getEmailText() {
		return emailText;
	}

	public void setEmailText(String emailText) {
		this.emailText = emailText;
	}

	public String getNameText() {
		return nameText;
	}

	public void setNameText(String nameText) {
		this.nameText = nameText;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public Date getJoinStart() {
		return joinStart;
	}

	public void setJoinStart(Date joinStart) {
		this.joinStart = joinStart;
	}

	public Date getJoinLast() {
		return joinLast;
	}
	

	public void setJoinLast(Date joinLast) {
		this.joinLast = joinLast;
	}

	public Date getJoinDay() {
		return joinDay;
	}

	public void setJoinDay(Date joinDay) {
		this.joinDay = joinDay;
	}

	public Date getBirthDateStart() {
		return birthDateStart;
	}

	public void setBirthDateStart(Date birthDateStart) {
		this.birthDateStart = birthDateStart;
	}

	public Date getBirthDateLast() {
		return birthDateLast;
	}

	public void setBirthDateLast(Date birthDateLast) {
		this.birthDateLast = birthDateLast;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public Date getWithdrawalDay() {
		return withdrawalDay;
	}

	public void setWithdrawalDay(Date withdrawalDay) {
		this.withdrawalDay = withdrawalDay;
	}

	public Date getWithdrawalDateStart() {
		return withdrawalDateStart;
	}

	public void setWithdrawalDateStart(Date withdrawalDateStart) {
		this.withdrawalDateStart = withdrawalDateStart;
	}

	public Date getWithdrawalDateLast() {
		return withdrawalDateLast;
	}

	public void setWithdrawalDateLast(Date withdrawalDateLast) {
		this.withdrawalDateLast = withdrawalDateLast;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getWithdrawalType() {
		return withdrawalType;
	}

	public void setWithdrawalType(String withdrawalType) {
		this.withdrawalType = withdrawalType;
	}

	public SearchMember(String searchType, String emailText, String nameText, String memberType, String searchText,
			Date joinStart, Date joinLast, Date joinDay, Date birthDateStart, Date birthDateLast, Date birthDay,
			Date withdrawalDay, Date withdrawalDateStart, Date withdrawalDateLast, String gender,
			String withdrawalType) {
		super();
		this.searchType = searchType;
		this.emailText = emailText;
		this.nameText = nameText;
		this.memberType = memberType;
		this.searchText = searchText;
		this.joinStart = joinStart;
		this.joinLast = joinLast;
		this.joinDay = joinDay;
		this.birthDateStart = birthDateStart;
		this.birthDateLast = birthDateLast;
		this.birthDay = birthDay;
		this.withdrawalDay = withdrawalDay;
		this.withdrawalDateStart = withdrawalDateStart;
		this.withdrawalDateLast = withdrawalDateLast;
		this.gender = gender;
		this.withdrawalType = withdrawalType;
	}

	@Override
	public String toString() {
		return "SearchMember [searchType=" + searchType + ", emailText=" + emailText + ", nameText=" + nameText
				+ ", memberType=" + memberType + ", searchText=" + searchText + ", joinStart=" + joinStart
				+ ", joinLast=" + joinLast + ", joinDay=" + joinDay + ", birthDateStart=" + birthDateStart
				+ ", birthDateLast=" + birthDateLast + ", birthDay=" + birthDay + ", withdrawalDay=" + withdrawalDay
				+ ", withdrawalDateStart=" + withdrawalDateStart + ", withdrawalDateLast=" + withdrawalDateLast
				+ ", gender=" + gender + ", withdrawalType=" + withdrawalType + "]";
	}
	
	

	
	
}
