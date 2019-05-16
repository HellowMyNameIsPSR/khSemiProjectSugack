package com.kh.semi.board.model.vo;

public class AuthorPageAttachmrnt implements java.io.Serializable{

	 
	private int fileCode;
	private String originName;
	private String changeName;
	private String filePath;
	private String fileType; 
	private int  applyCode; 
	private int  bno;
	
	
	
	public AuthorPageAttachmrnt () {}



	public AuthorPageAttachmrnt(int fileCode, String originName, String changeName, String filePath, String fileType,
			int apply_Code, int bno) {
		super();
		this.fileCode = fileCode;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileType = fileType;
		this.applyCode = apply_Code;
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



	public String getFileType() {
		return fileType;
	}



	public void setFileType(String fileType) {
		this.fileType = fileType;
	}



	public int getApply_Code() {
		return applyCode;
	}



	public void setApply_Code(int apply_Code) {
		this.applyCode = apply_Code;
	}



	public int getBno() {
		return bno;
	}



	public void setBno(int bno) {
		this.bno = bno;
	}



	@Override
	public String toString() {
		return "AuthorAttachmrnt [fileCode=" + fileCode + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", fileType=" + fileType + ", apply_Code=" + applyCode + ", bno=" + bno
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
