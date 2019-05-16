package com.kh.semi.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.admin.controller.QueryMake;
import com.kh.semi.admin.model.dao.adminDao;
import com.kh.semi.admin.model.vo.SearchMember;
import com.kh.semi.member.model.vo.Member;
import static com.kh.semi.common.JDBCTemplate.*;

public class adminDao {
	private Properties prop = new Properties();
	
	public adminDao() {
		String fileName =  adminDao.class
				.getResource("/sql/admin/admin-query.properties")
				.getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public adminDao(int num) {
		String fileName =  adminDao.class
				.getResource("/sql/admin/statistics-query.properties")
				.getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public ArrayList<SearchMember> searchMember(SearchMember m, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SearchMember> list = null;
		
		String query = prop.getProperty("selectMember");
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			pstmt.setString(1, m.getNameText());
			pstmt.setString(2, m.getMemberType());
			pstmt.setDate(3, m.getJoinStart());
			pstmt.setDate(4, m.getJoinLast());
			pstmt.setDate(5, m.getBirthDateStart());
			pstmt.setDate(6, m.getBirthDateLast());
			pstmt.setString(7, m.getGender());
			
			rset = pstmt.executeQuery();

			list = new ArrayList<SearchMember>();
			
			
			
			while(rset.next()) {
				System.out.println("와일문 실행");
				SearchMember sm = new SearchMember();
				sm.setEmailText(rset.getString("EMAIL"));
				sm.setNameText(rset.getString("MEMBER_NAME"));
				sm.setMemberType(rset.getString("MEMBER_TYPE"));
				sm.setBirthDay(rset.getDate("BIRTH_DATE"));
				sm.setJoinDay(rset.getDate("ENROLL_DATE"));
				sm.setGender(rset.getString("GENDER"));
				
				
				list.add(sm);
				
			}
			
				
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
			
		}
		System.out.println("최종 list" + list);
		
		return list;
	}
	public HashMap<String, ArrayList> selectMemberForMonth(Connection con, Date sDate, Date eDate, String choice) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, ArrayList> hmap = null;
		
		String query = prop.getProperty("selectMemberForMonth");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return hmap;
	}

	public ArrayList<Integer> selectForMonth(Connection con, Date sDate, Date eDate, String choice) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Integer> list = null;
		String query = "";
		if(choice == "sales") {
			query = prop.getProperty("selectSalesForMonth");			
		}else {
			query = prop.getProperty("selectMemberForMonth");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, sDate);
			pstmt.setDate(2, eDate);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Integer>();
			while(rset.next()) {
				list.add(rset.getInt(2));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<String> getMonth(Connection con, Date sDate, Date eDate, String choice) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list = null;
		String query = "";
		if(choice == "sales") {
			query = prop.getProperty("selectSalesForMonth");			
		}else {
			query = prop.getProperty("selectMemberForMonth");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, sDate);
			pstmt.setDate(2, eDate);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<String>();
			while(rset.next()) {
				list.add(rset.getString(3));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Integer> selectSalesForWeek(Connection con, Date sDate, Date eDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Integer> list = null;
		
		String query = prop.getProperty("selectSalesForWeek");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, sDate);
			pstmt.setDate(2, eDate);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Integer>();
			while(rset.next()) {
				list.add(rset.getInt("SALES"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Integer> selectSalesForDay(Connection con, Date sDate, Date eDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Integer> list = null;
		
		String query = prop.getProperty("selectSalesForDay");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, sDate);
			pstmt.setDate(2, eDate);
			
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Integer>();
			while(rset.next()) {
				list.add(rset.getInt("SALES"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<String> getDay(Connection con, Date sDate, Date eDate, String choice) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list2 = null;
		String query = "";
		
		if(choice == "sales") {
			query = prop.getProperty("selectSalesForDay");
		}else {
			query = prop.getProperty("selectMaleDay");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, sDate);
			pstmt.setDate(2, eDate);
			
			
			rset = pstmt.executeQuery();
			
			list2 = new ArrayList<String>();
			while(rset.next()) {
				list2.add(rset.getString("DAY"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list2;
	}

	public ArrayList<String> getWeek(Connection con, Date sDate, Date eDate, String choice) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list2 = null;
		String query = "";
		
		if(choice == "sales") {
			query = prop.getProperty("selectSalesForWeek");
		}else {
			query = prop.getProperty("selectMaleWeek");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, sDate);
			pstmt.setDate(2, eDate);
			
			
			rset = pstmt.executeQuery();
			
			list2 = new ArrayList<String>();
			while(rset.next()) {
				list2.add(rset.getString("WEEK"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list2;
	}

	public ArrayList<Integer> selectMale(Connection con, Date sDate, Date eDate, String date) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Integer> list = null;
		String query = "";
		
		if(date.equals("month")) {
			query = prop.getProperty("selectMale");
		}else if(date.equals("week")) {
			query = prop.getProperty("selectMaleWeek");
		}else {
			query = prop.getProperty("selectMaleDay");
		}
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, sDate);
			pstmt.setDate(2, eDate);
			
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Integer>();
			while(rset.next()) {
				list.add(rset.getInt("COUNT"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Integer> selectFemale(Connection con, Date sDate, Date eDate, String date) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Integer> list = null;
		String query = "";
		
		if(date.equals("month")) {
			query = prop.getProperty("selectFemale");
		}else if(date.equals("week")) {
			query = prop.getProperty("selectFemaleWeek");
		}else {
			query = prop.getProperty("selectFemaleDay");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, sDate);
			pstmt.setDate(2, eDate);
			
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Integer>();
			while(rset.next()) {
				list.add(rset.getInt("COUNT"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	

}






















