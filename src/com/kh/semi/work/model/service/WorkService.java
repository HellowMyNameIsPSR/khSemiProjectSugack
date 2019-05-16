package com.kh.semi.work.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.work.model.dao.WorkDao;
import com.kh.semi.work.model.vo.PageInfo;
import com.kh.semi.work.model.vo.PicFile;
import com.kh.semi.work.model.vo.Work;
import static com.kh.semi.common.JDBCTemplate.*;

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
	//사진 등록 메소드
	public int insertSales(Work work, ArrayList<PicFile> picFile) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new WorkDao().insertSale(con, work);
		
		if(result1 > 0) {
			int result2 = new WorkDao().insertPicFile(con, picFile);
		}
		
		if(result1 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
			result = 0;
		}
		
		close(con);
		return result;
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
		System.out.println("이미지 서비스 : " +result);
		return result;
	}
	
}




















