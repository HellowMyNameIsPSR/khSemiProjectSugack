package com.kh.semi.author.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.author.model.vo.ProType;

public class AuthorDao {
	
	private Properties prop = new Properties();
	
	public AuthorDao() {
		String fileName = AuthorDao.class
				.getResource("/sql/author/author-query.properties")
				.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //end try
	} //end constr

	//브랜드명이 존재하는 지 검색
	public int selectBrandName(Connection con, String brandName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectBrandName");
		int cnt = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, brandName);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				cnt++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return cnt;
	} //end method

	//작가 공예유형 데이터 가져오기
	public ArrayList<ProType> selectProTypeList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectProTypeAll");
		ArrayList<ProType> list = null;
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<ProType>();
			while(rset.next()) {
				ProType pType = new ProType();
				pType.setTypeId(rset.getInt("TYPE_ID"));
				pType.setMaterial(rset.getString("MATERIAL"));
				list.add(pType);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

} //end class
