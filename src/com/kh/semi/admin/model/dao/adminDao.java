package com.kh.semi.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


import com.kh.semi.admin.model.dao.adminDao;
import com.kh.semi.admin.model.vo.SearchMember;
import com.kh.semi.member.model.vo.Member;
import static com.kh.semi.common.JDBCTemplate.*;

public class adminDao {
	 
	
	public adminDao() {}

	public ArrayList<SearchMember> searchMember(SearchMember m, Connection con) {
		Properties prop = new Properties();
		String fileName =  adminDao.class
				.getResource("/sql/admin/admin-query.properties")
				.getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SearchMember> list = null;
		int i = 0;
		
		String query = prop.getProperty("selectMember");
		System.out.println("최종쿼리문 " + query);
		
		try {
			pstmt = con.prepareStatement(query);
			
			if(m.getSearchText().equals("")) {
				pstmt.setString(1, m.getMemberType());
				pstmt.setDate(2, m.getJoinStart());
				pstmt.setDate(3, m.getJoinLast());
				pstmt.setDate(4, m.getBirthDateStart());
				pstmt.setDate(5, m.getBirthDateLast());
				pstmt.setString(6, m.getGender());	
			}else {
				pstmt.setString(1, m.getSearchText());
				pstmt.setString(2, m.getMemberType());
				pstmt.setDate(3, m.getJoinStart());
				pstmt.setDate(4, m.getJoinLast());
				pstmt.setDate(5, m.getBirthDateStart());
				pstmt.setDate(6, m.getBirthDateLast());
				pstmt.setString(7, m.getGender());
				
			}
			
			
			
			rset = pstmt.executeQuery();

			list = new ArrayList<SearchMember>();
			
			
			
			while(rset.next()) {
				i++;
				SearchMember sm = new SearchMember();
				sm.setEmailText(rset.getString("EMAIL"));
				sm.setNameText(rset.getString("MEMBER_NAME"));
				sm.setMemberType(rset.getString("MEMBER_TYPE"));
				sm.setBirthDay(rset.getDate("BIRTH_DATE"));
				sm.setJoinDay(rset.getDate("ENROLL_DATE"));
				sm.setGender(rset.getString("GENDER"));
				
				
				list.add(sm);
				
			}
			System.out.println("총조회할 회원" + i + "명");
				
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
			
		}
		
		return list;
	}


	public ArrayList<SearchMember> searchWithdrawal(SearchMember m, Connection con) {
		Properties prop = new Properties();
		String fileName =  adminDao.class
				.getResource("/sql/admin/admin-query.properties")
				.getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SearchMember> list = null;
		int i = 0;
		String query = prop.getProperty("withdrawMember");
		System.out.println("최종쿼리문 " + query);
		
		try {
			pstmt = con.prepareStatement(query);
			
			if(m.getSearchText().equals("")) {
				pstmt.setString(1, m.getMemberType());
				pstmt.setDate(2, m.getWithdrawalDateStart());
				pstmt.setDate(3, m.getWithdrawalDateLast());
				pstmt.setString(4, m.getSearchType());
				pstmt.setString(5, m.getWithdrawalType());
			}else {
				pstmt.setString(1, m.getSearchText());
				pstmt.setString(2, m.getMemberType());
				pstmt.setDate(3, m.getWithdrawalDateStart());
				pstmt.setDate(4, m.getWithdrawalDateLast());
				pstmt.setString(5, m.getSearchType());
				pstmt.setString(6, m.getWithdrawalType());
				
			}
			
			rset = pstmt.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
			
		}

		
		
		
		

		return list;
	}

}






















