package com.kh.semi.work.model.vo;

public class WorkOption implements java.io.Serializable{
	private int opId;
	private String oName;
	private int oPrice;
	private int wId;
	private String oValue;
	
	public WorkOption() {}

	public WorkOption(int opId, String oName, int oPrice, int wId, String oValue) {
		super();
		this.opId = opId;
		this.oName = oName;
		this.oPrice = oPrice;
		this.wId = wId;
		this.oValue = oValue;
	}

	public int getOpId() {
		return opId;
	}

	public String getoName() {
		return oName;
	}

	public int getoPrice() {
		return oPrice;
	}

	public int getwId() {
		return wId;
	}

	public String getoValue() {
		return oValue;
	}

	public void setOpId(int opId) {
		this.opId = opId;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}

	public void setwId(int wId) {
		this.wId = wId;
	}

	public void setoValue(String oValue) {
		this.oValue = oValue;
	}

	@Override
	public String toString() {
		return "workOption [opId=" + opId + ", oName=" + oName + ", oPrice=" + oPrice + ", wId=" + wId + ", oValue="
				+ oValue + "]";
	}
	
	
}
