package com.kh.semi.work.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

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
		
		System.out.println("옵션 서비스 값 : " + result3);
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
	public ArrayList<Work> selectSalesList(PageInfo pi, String memberId) {
		Connection con = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectSalesList(con, pi, memberId);
		
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
	public ArrayList<Work> selectSalesDate(PageInfo pi, String wrDate1, String wrDate2) {
		Connection con = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectSalesDate(con, pi, wrDate1, wrDate2);
		
		close(con);
		
		
		return list;
	}
	public ArrayList<Work> selectWorkName(String workName) {
		Connection con = getConnection();
		
		
		ArrayList<Work> list = new WorkDao().selectWorkName(con, workName);
		
		close(con);
		
		
		return list;
	}
	public Work selectOne(int num) {
		Connection con = getConnection();
		
		Work work = new WorkDao().selectOne(con, num);
		
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
	public ArrayList<WorkPic> selectImg(int num) {
		Connection con = getConnection();
		
		ArrayList<WorkPic> fileList = new WorkDao().selectImg(con, num);
		
		close(con);
		
		return fileList;
	}
	public int updateSales(Work work, ArrayList<WorkPic> workPic, ArrayList<String> wpId) {
		Connection con = getConnection();
		int result = 0;
		
		
		int result1 = new WorkDao().updateSale(con, work);
		if(result1 > 0) {
			int result2 = new WorkDao().updatePicFile(con, workPic, work, wpId);
			if(result1 > 0 && result2 == workPic.size()) {
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
		System.out.println("service : " + list.size());
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
	

	
	
	
	
	
}






















