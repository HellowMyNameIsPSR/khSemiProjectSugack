package com.kh.semi.funding.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

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
	
	//등록된 펀딩 작품 내역의 상태가 '대기' 상태 인 것을 최신 순으로 정렬합니다.
	public ArrayList<SortFunding> selectSortFunding(int memberId, SortFunding sortFunding) {
		Connection con = getConnection();
		ArrayList<SortFunding> list = new FundingDao().selectSortFunding(con, memberId, sortFunding);
		close(con);
		return list;
	}
	
	//펀딩 작품 정보를 조회합니다.
	public ArrayList<HashMap<String, String>> selectFundContents(int memberId, int workId) {
		Connection con = getConnection();
		ArrayList<HashMap<String, String>> list = new FundingDao().selectFundContents(con, memberId, workId);
		
		close(con);
		return list;
	} 

} //end class
