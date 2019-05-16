package com.kh.semi.work.model.vo;

public class WorkPic implements java.io.Serializable{
	private String wpid;
	private String originName;
	private String changeName;
	private String filePath;
	private String picType;
	private int workId;
	
	public WorkPic() {}

	public WorkPic(String wpid, String originName, String changeName, String filePath, String picType, int workId) {
		super();
		this.wpid = wpid;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.picType = picType;
		this.workId = workId;
	}

	public String getWpid() {
		return wpid;
	}

	public String getoriginName() {
		return originName;
	}

	public String getchangeName() {
		return changeName;
	}

	public String getfilePath() {
		return filePath;
	}

	public String getpicType() {
		return picType;
	}

	public int getWorkId() {
		return workId;
	}

	public void setWpid(String wpid) {
		this.wpid = wpid;
	}

	public void setoriginName(String originName) {
		this.originName = originName;
	}

	public void setchangeName(String changeName) {
		this.changeName = changeName;
	}

	public void setfilePath(String filePath) {
		this.filePath = filePath;
	}

	public void setpicType(String picType) {
		this.picType = picType;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	@Override
	public String toString() {
		return "WorkPic [wpid=" + wpid + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", picType=" + picType + ", workId=" + workId + "]";
	}
	
	
}
