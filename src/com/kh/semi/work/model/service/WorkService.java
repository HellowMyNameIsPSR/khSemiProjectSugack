package com.kh.semi.work.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.work.model.dao.WorkDao;
import com.kh.semi.work.model.vo.PageInfo;
import com.kh.semi.work.model.vo.PicFile;
import com.kh.semi.work.model.vo.Work;
import com.kh.semi.work.model.vo.WorkOption;
import com.kh.semi.work.model.vo.WorkPic;

public class WorkService {
	
	//작품 판매 등록 메소드
	public int insertSale(Work work) {
		Connection con = getConnection();
		
		int result = new WorkDao().insertSale(con, work);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	//작품 판매 메소드
	public int insertSales(Work work, ArrayList<WorkPic> workPic, ArrayList<WorkOption> workOption) {
		Connection con = getConnection();
		int result = 0;
		
		
		int result1 = new WorkDao().insertSale(con, work);
		
		if(result1 > 0) {
			int workId = new WorkDao().selectCurrval(con);
			
			for(int i = 0; i < workPic.size(); i++) {
				workPic.get(i).setWorkId(workId);
			}
			
			for(int i = 0; i < workOption.size(); i++) {
				workOption.get(i).setwId(workId);
			}
			
		}
		
		int result2 = new WorkDao().insertPicFile(con, workPic);
		
		int result3 = new WorkDao().insertOption(con, workOption);
		
		if(result1 > 0 && result2 == workPic.size() && result3 == workOption.size()) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
			result = 0;
		}
		
		close(con);
		
		return result;
	}
	//옵션 등록용 메소드
	/*public int insertOption(ArrayList<WorkOption> workOption) {
		Connection con = getConnection();
		
		int result3 = new WorkDao().insertOption(con, workOption);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}*/
	//판매작품관리 리스트 보기용 메소드
	public ArrayList<HashMap<String, Object>> selectSalesList(PageInfo pi, String memberId) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new WorkDao().selectSalesList(con, pi, memberId);
		
		close(con);
		
		return list;
	}
	
	
	
	public int insertContentsImage(ArrayList<PicFile> picFile) {
		Connection con = getConnection();
		
		int result = new WorkDao().insertContentsImage(con, picFile);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
	public Work selectOne(int workId) {
		Connection con = getConnection();
		
		Work work = new WorkDao().selectOne(con, workId);
		
		//System.out.println("서비스 work : " + work);
		
		/*if(work != null) {
			int result = new WorkDao().updateCount(con, work.getWorkId());
			
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}*/
		
		close(con);
		
		return work;
	}
	public ArrayList<WorkPic> selectImg(int workId) {
		Connection con = getConnection();
		
		ArrayList<WorkPic> fileList = new WorkDao().selectImg(con, workId);
		
		close(con);
		
		return fileList;
	}
	public ArrayList<HashMap<String, Object>> selectOption(int workId) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> workOpt = new WorkDao().selectOption(con, workId);
		
		close(con);
		
		return workOpt;
	}
	public int updateSales(Work work, ArrayList<WorkPic> workPic, ArrayList<String> wpId) {
		Connection con = getConnection();
		int result = 0;
		
		
		int result1 = new WorkDao().updateSale(con, work);
		if(result1 > 0) {
			int result2 = new WorkDao().updatePicFile(con, workPic, work, wpId);
			if(result1 > 0 && result2 > 0) {
				commit(con);
				result = 1;
			}else {
				rollback(con);
				result = 0;
			}
		}
		
		
		
		close(con);
		
		return result;
	}
	//메인페이지 인기상품 리스트
	public ArrayList<HashMap<String, Object>> selectImageList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = 
				new WorkDao().selectImageList(con);
		close(con);
		
		
		return list;
	}
	public ArrayList<HashMap<String, Object>> selectOrderList(PageInfo pi, String memberId) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectOrderList(con, pi, memberId);
		
		close(con);
		
		return list;
	}
	public int orderListCount(String memberId) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().orderListCount(con, memberId);
		
		close(con);
		
		return listCount;
	}
	public ArrayList<HashMap<String, Object>> selectExchangeList(PageInfo pi, String memberId) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectExchangeList(con, pi, memberId);
		
		close(con);
		
		return list;
	}
	public int exchangeListCount(String memberId) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().exchangeListCount(con, memberId);
		
		close(con);
		
		return listCount;
	}
	public ArrayList<HashMap<String, Object>> selectQnaList(PageInfo pi, String memberId) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectQnaList(con, pi, memberId);
		
		close(con);
		
		return list;
	}
	public int qnaListCount(String memberId) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().qnaListCount(con, memberId);
		
		close(con);
		
		return listCount;
	}
	public ArrayList<HashMap<String, Object>> selectReviewList(PageInfo pi, String memberId) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectReviewList(con, pi, memberId);
		
		close(con);
		
		return list;
	}
	public int reviewListCount(String memberId) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().reviewListCount(con, memberId);
		
		close(con);
		
		return listCount;
	}
	public ArrayList<HashMap<String, Object>> selectExchangeDate(PageInfo pi, String memberId, String wrDate1, String wrDate2) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectExchangeDate(con, pi, memberId, wrDate1, wrDate2);
		
		close(con);
		
		return list;
	}
	public int exchangeDateCount(String memberId, String wrDate1, String wrDate2) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().exchangeDateCount(con, memberId, wrDate1, wrDate2);
		
		close(con);
		
		return listCount;
	}
	public Member deleteAuthor(Member m) {
		Connection con = getConnection();
		Member loginUser = null;
		
		int result = new WorkDao().deleteAuthor(con, m);
		
		if(result > 0) {
			commit(con);
			loginUser = new MemberDao().loginMember(con, m.getEmail(), m.getPassword());
		}else {
			rollback(con);
		}
		
		close(con);
		
		return loginUser;
	}
	public ArrayList<HashMap<String, Object>> selectExchangeName(PageInfo pi, String memberId, String workName) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectExchangeName(con, pi, memberId, workName);
		
		close(con);
		
		return list;
	}
	public int exchangeNameCount(String memberId, String workName) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().exchangeNameCount(con, memberId, workName);
		
		close(con);
		
		return listCount;
	}
	public ArrayList<HashMap<String, Object>> selectOrderDate(PageInfo pi, String memberId, String wrDate1, String wrDate2) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectOrderDate(con, pi, memberId, wrDate1, wrDate2);
		
		close(con);
		
		return list;
	}
	public int orderDateCount(String memberId, String wrDate1, String wrDate2) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().orderDateCount(con, memberId, wrDate1, wrDate2);
		
		close(con);
		
		return listCount;
	}
	public ArrayList<HashMap<String, Object>> selectOrderName(PageInfo pi, String memberId, String workName) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectOrderName(con, pi, memberId, workName);
		
		close(con);
		
		return list;
		
		
	}
	public int orderNameCount(String memberId, String workName) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().orderNameCount(con, memberId, workName);
		
		close(con);
		
		return listCount;
	}
	public ArrayList<HashMap<String, Object>> selectSalesDate(PageInfo pi, String memberId, String wrDate1, String wrDate2) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectSalesDate(con, pi, memberId, wrDate1, wrDate2);
		
		close(con);
		
		return list;
	}
	
	//페이징 메소드
	public int getListCount(String memberId) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().getListCount(con, memberId);
		
		close(con);
		
		return listCount;
	}
		
	//페이징 메소드
	public int getDateCount(String memberId, String wrDate1, String wrDate2) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().getDateCount(con, memberId, wrDate1, wrDate2);
		
		close(con);
		
		return listCount;
	}
	public ArrayList<HashMap<String, Object>> selectWorkName(PageInfo pi, String memberId, String workName) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectWorkName(con, pi, memberId, workName);
		
		close(con);
		
		return list;
		
	}
	public int WorkNameCount(String memberId, String workName) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().WorkNameCount(con, memberId, workName);
		
		close(con);
		
		return listCount;
	}
	public ArrayList<HashMap<String, Object>> selectQnaDate(PageInfo pi, String memberId, String wrDate1, String wrDate2) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectQnaDate(con, pi, memberId, wrDate1, wrDate2);
		
		close(con);
		
		return list;
	}
	public int qnaDateCount(String memberId, String wrDate1, String wrDate2) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().qnaDateCount(con, memberId, wrDate1, wrDate2);
		
		close(con);
		
		return listCount;
	}
	public ArrayList<HashMap<String, Object>> selectQnaName(PageInfo pi, String memberId, String workName) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectQnaName(con, pi, memberId, workName);
		
		close(con);
		
		return list;
	}
	public int qnaNameCount(String memberId, String workName) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().qnaNameCount(con, memberId, workName);
		
		close(con);
		
		return listCount;
	}
	public ArrayList<HashMap<String, Object>> selectReviewDate(PageInfo pi, String memberId, String wrDate1, String wrDate2) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectReviewDate(con, pi, memberId, wrDate1, wrDate2);
		
		close(con);
		
		return list;
	}
	public int reviewDateCount(String memberId, String wrDate1, String wrDate2) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().reviewDateCount(con, memberId, wrDate1, wrDate2);
		
		close(con);
		
		return listCount;
	}
	public ArrayList<HashMap<String, Object>> selectReveiwName(PageInfo pi, String memberId, String workName) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list  = new WorkDao().selectReveiwName(con, pi, memberId, workName);
		
		close(con);
		
		return list;
	}
	public int reviewNameCount(String memberId, String workName) {
		Connection con = getConnection();
		
		int listCount = new WorkDao().reviewNameCount(con, memberId, workName);
		
		close(con);
		
		return listCount;
	}

	public int updateDeli(String memberId, String deliCompany, int invNum, String deliStatus, String odId) {
		Connection con = getConnection();
		
		int result = new WorkDao().updateDeli(con, memberId, deliCompany, invNum, deliStatus, odId);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
	public int updateExchage(String refundStat, String refundId) {
		Connection con = getConnection();
		
		int result = new WorkDao().updateExchage(con, refundStat, refundId);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
	public ArrayList<Integer> orderCount(String memberId) {
		Connection con = getConnection();
		
		int before = new WorkDao().orderCountBefore(con, memberId);
		int ing = new WorkDao().orderCountIng(con, memberId);
		int after = new WorkDao().orderCountAfter(con, memberId);
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		list.add(before);
		list.add(ing);
		list.add(after);
		
		close(con);
		
		return list;
	}
	public ArrayList<Integer> exchangeCount(String memberId) {
		Connection con = getConnection();
		
		int before = new WorkDao().exchangeCountBefore(con, memberId);
		int ing = new WorkDao().exchangeCountIng(con, memberId);
		int after = new WorkDao().exchangeCountAfter(con, memberId);
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(before);
		list.add(ing);
		list.add(after);
		
		close(con);
		
		return list;
	}
	public int insertAddress(Address add) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 =new WorkDao().deleteAdress(con, add);
		
		int result2 = new WorkDao().insertAddress(con, add);
		if(result2 > 0 ) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
			result = 0;
		}
		close(con);
		
		return result;
	}
	public Address selectWorkAddress(String memberId) {
		Connection con = getConnection();
		
		Address address = new WorkDao().selectWorkAddress(con, memberId);
		
		close(con);
		
		return address;
	}
	public ArrayList<WorkOption> selectOptionName(int workId) {
		Connection con = getConnection();
		
		ArrayList<WorkOption> woList = new WorkDao().selectOptionName(con, workId);
		
		close(con);
		
		return woList;
	}
	public ArrayList<HashMap<String, Object>> selectImageList2() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list2 = 
				new WorkDao().selectImageList2(con);
		close(con);
		
		
		return list2;
	}
	
	
}






















