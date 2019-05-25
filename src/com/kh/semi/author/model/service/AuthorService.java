package com.kh.semi.author.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.author.model.dao.AuthorDao;
import com.kh.semi.author.model.vo.ApplyHistory;
import com.kh.semi.author.model.vo.Author;
import com.kh.semi.author.model.vo.PicFile;
import com.kh.semi.author.model.vo.ProType;
import com.kh.semi.funding.model.vo.AuthorAccount;

public class AuthorService {

	//브랜드 명 검색
	public int selectBrandName(String brandName) { 
		Connection con = getConnection();
		int result = new AuthorDao().selectBrandName(con, brandName);
		close(con);
		return result;
	} //end method

	//작가 공예유형 데이터 가져오기
	public ArrayList<ProType> selectProTypeList() {
		Connection con = getConnection();
		ArrayList<ProType> list = new AuthorDao().selectProTypeList(con);
		close(con);
		return list;
	} //end method

	//1차 입점 신청 하기
	public int insertAuthor(Author author, ArrayList<PicFile> fileList, String selectPType) {
		Connection con = getConnection();
		int resultAuthor = new AuthorDao().insertAuthor(con, author);
		int resultAuthorApply = 0; //입점 내역 저장
		int resultFile = 0; //1차 입점 신청 파일 저장
		int resultAuthorType = 0; //작가 공예 유형 저장
		int resultApplyList = 0;
		
		if(resultAuthor > 0) { //Author 테이블에 정보를 저장 했는 가?
			resultAuthorApply = new AuthorDao().insertAuthorApply(con, author.getMemberId());
		} else {
			close(con);
			System.out.println("작가 정보 저장 실패!");
			return 0;
		}
		if(resultAuthorApply > 0) { //Author_Apply 테이블에 정보를 저장 했는가?
			resultAuthorType = new AuthorDao().insertAuthorType(con, author.getMemberId(), selectPType);
		} else {
			close(con);
			System.out.println("입점 신청 내역 정보 저장 실패!");
			return 0;
		}
		if(resultAuthorType > 0) { //Author_type 테이블에 정보를 저장 했는가?
			resultFile = new AuthorDao().insertApply1File(con, author.getMemberId(), fileList);
		} else {
			close(con);
			System.out.println("작가 공예 유형 정보 저장 실패!");
			return 0;
		}
		if(resultFile > 0) { //Pic_file 테이블에 정보를 저장 했는가?
			int alNum = 1; //차수
			resultApplyList = new AuthorDao().insertApplyList(con, alNum);
		} else {
			System.out.println("1차 입점 서류 저장 실패!");
			
		}
		if(resultApplyList > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return resultApplyList;
	} //end method

	public ArrayList<ApplyHistory> selectOneAuthorApply(int memberId) {
		Connection con = getConnection();
		ArrayList<ApplyHistory> list = new AuthorDao().selectOneAuthorApply(con, memberId);
		close(con);
		return list;
	} //end method

	public int insertApply2(int memberId, ArrayList<PicFile> fileList) {
		Connection con = getConnection();
		int result = new AuthorDao().insertApply2(con, memberId, fileList);
		int resultUpdate = 0;
		int resultApplyList = 0;
		if(result > 0) {
			resultUpdate = new AuthorDao().updateAuthorApplyStat2(con, memberId);
			if(resultUpdate > 0) {
				int alNum = 2;
				resultApplyList = new AuthorDao().insertApplyList(con, alNum);
			} else {
				System.out.println("2차 입점 상태 업데이트 실패!");
			}
		} else {
			System.out.println("2차 입점신청 서류 저장 실패!");
		} //end if
		
		if(resultApplyList > 0) {
			commit(con);
		} else {
			System.out.println("2차 입점 정보 입점 내역에 저장 실패!");
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Integer> selectSalesForMonth(int memberId) {
		Connection con = getConnection();
		
		ArrayList<Integer> list = new AuthorDao().selectSalesForMonth(con, memberId);
		
		close(con);
		
		return list;
	}

	public ArrayList<String> getMonth(int memberId) {
		Connection con = getConnection();
		
		ArrayList<String> month = new AuthorDao().getMonth(con, memberId);
		
		close(con);
		
		return month;
	}

	//계좌 등록
	public int insertAcc(AuthorAccount authorAcc) {
		Connection con = getConnection();
		int result = new AuthorDao().insertAcc(con, authorAcc);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}//end method
	
} //end class
























