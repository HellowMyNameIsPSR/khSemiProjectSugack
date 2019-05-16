package com.kh.semi.product.model.vo;

public class ProImageFile implements java.io.Serializable{
	
	private int fileCode;
	private String originName;
	private String changeName;
	private String filePath;
	private int applyCode;
	private int bno;
	
	public ProImageFile() {}

	public ProImageFile(int fileCode, String originName, String changeName, String filePath, int applyCode, int bno) {
		super();
		this.fileCode = fileCode;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.applyCode = applyCode;
		this.bno = bno;
	}

	public int getFileCode() {
		return fileCode;
	}

	public void setFileCode(int fileCode) {
		this.fileCode = fileCode;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getApplyCode() {
		return applyCode;
	}

	public void setApplyCode(int applyCode) {
		this.applyCode = applyCode;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	@Override
	public String toString() {
		return "ProImageFile [fileCode=" + fileCode + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", applyCode=" + applyCode + ", bno=" + bno + "]";
	}
	
	

}
