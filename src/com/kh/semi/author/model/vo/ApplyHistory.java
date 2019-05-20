package com.kh.semi.author.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ApplyHistory implements Serializable{
	private int memberId; //아이디
	private String mamberName; //이름
	private String email; //이메일
	private String authorName; //브랜드명
	private String applyContent; //가입내용
	private String applyStat1; //1차 신청 상태
	private String applyStat2; //2차 신청 상태
	private Date applyDate; //입점 신청 일자
	private int craftId; //공예코드
	private String material; //작가 공예유형
	private String originName; //기존 파일명
	private String changeName; //변환된 파일명
	private String filePath; //저장 경로
	private String fileType; //파일 유형
	
	public ApplyHistory() {
		// TODO Auto-generated constructor stub
	}

	public ApplyHistory(int memberId, String mamberName, String email, String authorName, String applyContent,
			String applyStat1, String applyStat2, Date applyDate, int craftId, String material, String originName,
			String changeName, String filePath, String fileType) {
		super();
		this.memberId = memberId;
		this.mamberName = mamberName;
		this.email = email;
		this.authorName = authorName;
		this.applyContent = applyContent;
		this.applyStat1 = applyStat1;
		this.applyStat2 = applyStat2;
		this.applyDate = applyDate;
		this.craftId = craftId;
		this.material = material;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileType = fileType;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMamberName() {
		return mamberName;
	}

	public void setMamberName(String mamberName) {
		this.mamberName = mamberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getApplyContent() {
		return applyContent;
	}

	public void setApplyContent(String applyContent) {
		this.applyContent = applyContent;
	}

	public String getApplyStat1() {
		return applyStat1;
	}

	public void setApplyStat1(String applyStat1) {
		this.applyStat1 = applyStat1;
	}

	public String getApplyStat2() {
		return applyStat2;
	}

	public void setApplyStat2(String applyStat2) {
		this.applyStat2 = applyStat2;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public int getCraftId() {
		return craftId;
	}

	public void setCraftId(int craftId) {
		this.craftId = craftId;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
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

	@Override
	public String toString() {
		return "ApplyHistory [memberId=" + memberId + ", mamberName=" + mamberName + ", email=" + email
				+ ", authorName=" + authorName + ", applyContent=" + applyContent + ", applyStat1=" + applyStat1
				+ ", applyStat2=" + applyStat2 + ", applyDate=" + applyDate + ", craftId=" + craftId + ", material="
				+ material + ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", fileType=" + fileType + "]";
	}
	
	
} //end class
