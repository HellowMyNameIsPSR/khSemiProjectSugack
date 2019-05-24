package com.kh.semi.funding.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AuthorAccount implements Serializable{
	private int accountId;
	private String backName;
	private String accountNumber;
	private String verifyAccount;
	private String authorName;
	private String authorbirth;
	private String type;
	private Date verifyDate;
	private int memberId;
	
	public AuthorAccount() {
		// TODO Auto-generated constructor stub
	}

	public AuthorAccount(int accountId, String backName, String accountNumber, String verifyAccount, String authorName,
			String authorbirth, String type, Date verifyDate, int memberId) {
		super();
		this.accountId = accountId;
		this.backName = backName;
		this.accountNumber = accountNumber;
		this.verifyAccount = verifyAccount;
		this.authorName = authorName;
		this.authorbirth = authorbirth;
		this.type = type;
		this.verifyDate = verifyDate;
		this.memberId = memberId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getBackName() {
		return backName;
	}

	public void setBackName(String backName) {
		this.backName = backName;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getVerifyAccount() {
		return verifyAccount;
	}

	public void setVerifyAccount(String verifyAccount) {
		this.verifyAccount = verifyAccount;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getAuthorbirth() {
		return authorbirth;
	}

	public void setAuthorbirth(String authorbirth) {
		this.authorbirth = authorbirth;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getVerifyDate() {
		return verifyDate;
	}

	public void setVerifyDate(Date verifyDate) {
		this.verifyDate = verifyDate;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "AuthorAccount [accountId=" + accountId + ", backName=" + backName + ", accountNumber=" + accountNumber
				+ ", verifyAccount=" + verifyAccount + ", authorName=" + authorName + ", authorbirth=" + authorbirth
				+ ", type=" + type + ", verifyDate=" + verifyDate + ", memberId=" + memberId + "]";
	}
	
	
} //end class
