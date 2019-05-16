package com.kh.semi.author.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.author.model.dao.AuthorDao;
import com.kh.semi.author.model.vo.Author;
import com.kh.semi.author.model.vo.ProType;

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

	//작가 정보 저장
	public int insertAuthor(Author author) {
		Connection con = getConnection();
		int resultAuthor = new AuthorDao().insertAuthor(con, author);
		if(resultAuthor > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return resultAuthor;
	} //end method

	public int insertAuthorType(int memberId, String selectPType) {
		Connection con = getConnection();
		int resultAuthorType = new AuthorDao().insertAuthorType(con, memberId, selectPType);
		if(resultAuthorType > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return resultAuthorType;
	} //end method

} //end class
