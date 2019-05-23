package com.kh.semi.funding.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.funding.model.dao.FundingDao;
import com.kh.semi.funding.model.vo.Category;
import com.kh.semi.funding.model.vo.Funding;
import com.kh.semi.funding.model.vo.SortFunding;
import com.kh.semi.funding.model.vo.Work;
import com.kh.semi.funding.model.vo.WorkPic;

public class FundingService {
	//카테고리 조회
	public ArrayList<Category> selectCategoryAll() {
		Connection con = getConnection();
		ArrayList<Category> list = new FundingDao().selectCategoryAll(con);
		close(con);
		return list;
	}
	//작가 유형 조회
	public ArrayList<String> selectAuthortype(int memberId) {
		Connection con = getConnection();
		ArrayList<String> list = new FundingDao().selectAuthorType(con, memberId);
		close(con);
		return list;
	}
	//펀딩 작품 등록
	public int insertFundingWork(Work fundWork, ArrayList<WorkPic> fileList, Funding fund) {
		Connection con = getConnection();
		int resultFunding = new FundingDao().insertFundingWork(con, fundWork);
		int resultFundFile = 0;
		int test = 0;
		if(resultFunding > 0) {
			int resultFund = new FundingDao().insertFund(con, fund);
			if(resultFund > 0) {				
				resultFundFile = new FundingDao().insertFundingFile(con, fileList);
				if(resultFundFile > 0) {
					commit(con);
					test = 1;
				} else {
					rollback(con);
				} //end if
			} //end if
		} //end if
		close(con);
		return resultFundFile;
		//return test;
	}
	

	//펀딩상품 전체 리스트 조회
	public ArrayList<HashMap<String, Object>> selectFundingProList() {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new FundingDao().selectFunctionProList(con);
		System.out.println("FundingService: " + list);
		close(con);
		
		return list;
	}
	
	//펀딩상품 자세히보기!
	public ArrayList<HashMap<String, Object>> selectFundingProDetailList(int workId) {
		
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> list = new FundingDao().selectFundingProDetailList(con,workId);
		close(con);
		return list;
	}
	
	//등록된 펀딩 작품 내역의 상태가 '대기' 상태 인 것을 최신 순으로 정렬합니다.
	public ArrayList<SortFunding> selectSortFunding(int memberId, SortFunding sortFunding) {
		Connection con = getConnection();
		ArrayList<SortFunding> list = new FundingDao().selectSortFunding(con, memberId, sortFunding);
		close(con);
		return list;
	}
	
	//펀딩 작품 정보를 조회합니다.
	public ArrayList<HashMap<String, Object>> selectFundContents(int memberId, int workId) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new FundingDao().selectFundContents(con, memberId, workId);		
		close(con);
		return list;
	}
	//펀딩 작품의 사진을 조회합니다.
	public ArrayList<WorkPic> selectWorkPicFile(int memberId, int workId) {
		Connection con = getConnection();
		ArrayList<WorkPic> fileList = new FundingDao().selectWorkPicFile(con, memberId, workId);
		close(con);
		return fileList;
	}
	
	//펀딩 상세보기용 사진 리스트
	public ArrayList<WorkPic> selectList(int workId) {
		Connection con = getConnection();
		ArrayList<WorkPic> fileList = new FundingDao().selectList(con,workId);
		
		System.out.println("사진상세보기 Sevice: " + fileList);
		close(con);
		return fileList;
	} 

} //end class
