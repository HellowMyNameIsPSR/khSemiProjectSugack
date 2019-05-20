package com.kh.semi.author.model.vo;

import java.io.Serializable;

public class PicFile implements Serializable{
	private int fileId; //파일 코드
	private String originName; //기존 파일명
	private String changeName;//변환 파일명
	private String filePath; //저장경로
	private String fileType; //파일 유형
	private int applyId; //신청 코드
	
	public PicFile() {
		// TODO Auto-generated constructor stub
	}

	public PicFile(int fileId, String originName, String changeName, String filePath, String fileType, int applyId) {
		super();
		this.fileId = fileId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileType = fileType;
		this.applyId = applyId;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
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

	public int getApplyId() {
		return applyId;
	}

	public void setApplyId(int applyId) {
		this.applyId = applyId;
	}

	@Override
	public String toString() {
		return "PicFile [fileId=" + fileId + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", fileType=" + fileType + ", applyId=" + applyId + "]";
	}
	
	
} //end class
