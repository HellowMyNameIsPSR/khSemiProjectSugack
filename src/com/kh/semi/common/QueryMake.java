package com.kh.semi.common;


import java.io.FileWriter;
import java.io.IOException;
import java.util.Properties;

import com.kh.semi.admin.model.dao.adminDao;
import com.kh.semi.admin.model.vo.SearchMember;

public class QueryMake {
	
	public QueryMake() {}

	public QueryMake(SearchMember m) {
		
		
		Properties prop = new Properties();
		
		String fileName = QueryMake.class
		.getResource("/sql/admin/admin-query.properties")
		.getPath();
		
		
		String query = "SELECT * FROM MEMBER";
		
	
		if(m.getSearchType().equals("email")) {
			query += " WHERE EMAIL = ?";
			if(m.getSearchText().equals("")) {
				query = "SELECT * FROM MEMBER WHERE EMAIL LIKE '%'";
			}
		}else {
			query += " WHERE MEMBER_NAME = ?";
			if(m.getSearchText().equals("")) {
				query = "SELECT * FROM MEMBER WHERE MEMBER_NAME LIKE '%'";
			}
		}
		
		if(m.getMemberType() != null) {
			query += " AND MEMBER_TYPE = ?";
		}
		if(m.getJoinStart() != null) {
			query += " AND ENROLL_DATE >= ? AND ENROLL_DATE < ?";
		}
		if(m.getBirthDateStart() != null) {
			query += " AND BIRTH_DATE >= ? AND BIRTH_DATE < ?";
		}
		if(m.getGender() != null) {
			query += " AND GENDER = ?";
		}
		
		
		
		query += " AND STATUS ='Y'";
				
		
		prop.setProperty("selectMember", query);
		System.out.println("생선된 쿼리문" + query);
	

		//C:/Users/kimjinhwan/eclipse-workspace/suGack/src/sql/admin
		
		
		try {
			prop.store(new FileWriter(fileName), "");
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}		
		
		
		
	}
	
	public void WithdrawalQuery(SearchMember m) {
		Properties prop = new Properties();
		
		String fileName = QueryMake.class
		.getResource("/sql/admin/admin-query.properties")
		.getPath();
		
		String query = "SELECT * FROM MEMBER";
		
		if(m.getSearchType().equals("email")) {
			query += " WHERE EMAIL = ?";
			if(m.getSearchText().equals("")) {
				query = "SELECT * FROM MEMBER WHERE EMAIL LIKE '%'";
			}
		}else {
			query += " WHERE MEMBER_NAME = ?";
			if(m.getSearchText().equals("")) {
				query = "SELECT * FROM MEMBER WHERE MEMBER_NAME LIKE '%'";
			}
		}
		if(m.getMemberType() != null) {
			query += " AND MEMBER_TYPE = ?";
		}
		if(m.getWithdrawalDateStart() != null) {
			query += " AND OUT_DATE >= ? AND OUT_DATE < ?";
		}
		
		if(m.getSearchType() != null) {
			query += " AND STATUS = ?";
			
		}
		prop.setProperty("withdrawMember", query);
		System.out.println("생산된 쿼리문" + query);
	

		//C:/Users/kimjinhwan/eclipse-workspace/suGack/src/sql/admin
		
		
		try {
			prop.store(new FileWriter(fileName), "");
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}		

		
		
	}

	
	
}
