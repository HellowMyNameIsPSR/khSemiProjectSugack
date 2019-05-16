package com.kh.semi.admin.model.vo;

import java.sql.Date;

public class SearchMember implements java.io.Serializable{
	
	private String searchType;
	private String emailText;
	private String nameText;
	private String memberType;
	private Date joinStart;
	private Date joinLast;
	private Date joinDay;
	private Date birthDateStart;
	private Date birthDateLast;
	private Date birthDay;
	private String gender;
	
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public SearchMember(String searchType, String emailText, String nameText, String memberType, Date joinStart,
			Date joinLast, Date joinDay, Date birthDateStart, Date birthDateLast, Date birthDay, String gender) {
		super();
		this.searchType = searchType;
		this.emailText = emailText;
		this.nameText = nameText;
		this.memberType = memberType;
		this.joinStart = joinStart;
		this.joinLast = joinLast;
		this.joinDay = joinDay;
		this.birthDateStart = birthDateStart;
		this.birthDateLast = birthDateLast;
		this.birthDay = birthDay;
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "SearchMember [searchType=" + searchType + ", emailText=" + emailText + ", nameText=" + nameText
				+ ", memberType=" + memberType + ", joinStart=" + joinStart + ", joinLast=" + joinLast + ", joinDay="
				+ joinDay + ", birthDateStart=" + birthDateStart + ", birthDateLast=" + birthDateLast + ", birthDay="
				+ birthDay + ", gender=" + gender + "]";
	}

	



	
}
