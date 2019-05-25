package com.kh.semi.board.model.vo;

public class AuthorWorkPic {

	private int wpid; // 작품사진 코드 
	private String originName; // 원본파일명 
	private String change_Name; // 변환파일명
	private String filePath; // 파일일로
	private String pictype; // 사진유형 
	private int workId; //작품코드
	


public AuthorWorkPic() {}



public AuthorWorkPic(int wpid, String originName, String change_Name, String filePath, String pictype, int workId) {
	super();
	this.wpid = wpid;
	this.originName = originName;
	this.change_Name = change_Name;
	this.filePath = filePath;
	this.pictype = pictype;
	this.workId = workId;
}



public int getWpid() {
	return wpid;
}



public void setWpid(int wpid) {
	this.wpid = wpid;
}



public String getOriginName() {
	return originName;
}



public void setOriginName(String originName) {
	this.originName = originName;
}



public String getChange_Name() {
	return change_Name;
}



public void setChange_Name(String change_Name) {
	this.change_Name = change_Name;
}



public String getFilePath() {
	return filePath;
}



public void setFilePath(String filePath) {
	this.filePath = filePath;
}



public String getPictype() {
	return pictype;
}



public void setPictype(String pictype) {
	this.pictype = pictype;
}



public int getWorkId() {
	return workId;
}



public void setWorkId(int workId) {
	this.workId = workId;
}



@Override
public String toString() {
	return "AuthorWorkPic [wpid=" + wpid + ", originName=" + originName + ", change_Name=" + change_Name + ", filePath="
			+ filePath + ", pictype=" + pictype + ", workId=" + workId + "]";
} 





}

