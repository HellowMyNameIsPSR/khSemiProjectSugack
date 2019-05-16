package com.kh.semi.work.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.work.model.dao.WorkDao;
import com.kh.semi.work.model.vo.PageInfo;
import com.kh.semi.work.model.vo.PicFile;
import com.kh.semi.work.model.vo.Work;
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
	public int insertSales(Work work, ArrayList<WorkPic> workPic) {
		Connection con = getConnection();
		int result = 0;
		
		
		int result1 = new WorkDao().insertSale(con, work);
		
		if(result1 > 0) {
			int workId = new WorkDao().selectCurrval(con);
			
			for(int i = 0; i < workPic.size(); i++) {
				workPic.get(i).setWorkId(workId);
			}
		}
		
		int result2 = new WorkDao().insertPicFile(con, workPic);
		
		if(result1 > 0 && result2 == workPic.size()) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
			result = 0;
		}
		
		close(con);
		
		return result;
	}
	//판매작품관리 리스트 보기용 메소드
	public ArrayList<Work> selectSalesList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectSalesList(con, pi);
		
		close(con);
		
		return list;
	}
	//페이징 메소드
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new WorkDao().getListCount(con);
		
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
	public ArrayList<Work> selectSalesDate(String wrDate1, String wrDate2) {
		Connection con = getConnection();
		
		ArrayList<Work> list = new WorkDao().selectSalesDate(con, wrDate1, wrDate2);
		
		close(con);
		
		
		return list;
	}
	public ArrayList<Work> selectWorkName(String workName) {
		Connection con = getConnection();
		
		
		ArrayList<Work> list = new WorkDao().selectWorkName(con, workName);
		
		close(con);
		
		
		return list;
	}

}




















