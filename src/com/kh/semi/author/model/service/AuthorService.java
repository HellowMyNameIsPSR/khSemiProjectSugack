package com.kh.semi.author.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.author.model.dao.AuthorDao;
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

} //end class
