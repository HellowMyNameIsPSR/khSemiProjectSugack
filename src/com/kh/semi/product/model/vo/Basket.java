package com.kh.semi.product.model.vo;

import java.sql.Date;

public class Basket implements java.io.Serializable{
	private int bId;
	private int memberId;
	private int workId;
	private Date bDate;
	private int count;
	private int opId;
	
	public Basket() {}

	public Basket(int bId, int memberId, int workId, Date bDate, int count, int opId) {
		super();
		this.bId = bId;
		this.memberId = memberId;
		this.workId = workId;
		this.bDate = bDate;
		this.count = count;
		this.opId = opId;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getOpId() {
		return opId;
	}

	public void setOpId(int opId) {
		this.opId = opId;
	}

	@Override
	public String toString() {
		return "Basket [bId=" + bId + ", memberId=" + memberId + ", workId=" + workId + ", bDate=" + bDate + ", count="
				+ count + ", opId=" + opId + "]";
	}
	
	
}
=======
public class Basket {
   private int bId;
   private int memberId;
   private int workId;
   private Date bDate;
   private int count;
   private int opId;
   
   public Basket() {}

   public Basket(int bId, int memberId, int workId, Date bDate, int count, int opId) {
      super();
      this.bId = bId;
      this.memberId = memberId;
      this.workId = workId;
      this.bDate = bDate;
      this.count = count;
      this.opId = opId;
   }

   public int getbId() {
      return bId;
   }

   public void setbId(int bId) {
      this.bId = bId;
   }

   public int getMemberId() {
      return memberId;
   }

   public void setMemberId(int memberId) {
      this.memberId = memberId;
   }

   public int getWorkId() {
      return workId;
   }

   public void setWorkId(int workId) {
      this.workId = workId;
   }

   public Date getbDate() {
      return bDate;
   }

   public void setbDate(Date bDate) {
      this.bDate = bDate;
   }

   public int getCount() {
      return count;
   }

   public void setCount(int count) {
      this.count = count;
   }

   public int getOpId() {
      return opId;
   }

   public void setOpId(int opId) {
      this.opId = opId;
   }

   @Override
   public String toString() {
      return "Basket [bId=" + bId + ", memberId=" + memberId + ", workId=" + workId + ", bDate=" + bDate + ", count="
            + count + ", opId=" + opId + "]";
   }
   
   
}
