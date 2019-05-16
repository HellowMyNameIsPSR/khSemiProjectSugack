package com.kh.semi.member.model.vo;

public class Address implements java.io.Serializable{
	private int addressId;
	private String addressName;
	private String address;
	private String phone1;
	private String phone2;
	private int memberId;
	private String addType;
	
	public Address() {}

	public Address(int addressId, String addressName, String address, String phone1, String phone2, int memberId,
			String addType) {
		super();
		this.addressId = addressId;
		this.addressName = addressName;
		this.address = address;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.memberId = memberId;
		this.addType = addType;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getAddType() {
		return addType;
	}

	public void setAddType(String addType) {
		this.addType = addType;
	}

	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", adderssName=" + addressName + ", address=" + address + ", phone1="
				+ phone1 + ", phone2=" + phone2 + ", memberId=" + memberId + ", addType=" + addType + "]";
	}
	
	
	
}
