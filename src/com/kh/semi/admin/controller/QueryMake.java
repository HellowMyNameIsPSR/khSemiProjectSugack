package com.kh.semi.admin.controller;

import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Properties;

import com.kh.semi.admin.controller.QueryMake;
import com.kh.semi.admin.model.vo.SearchMember;

public class QueryMake {

	public QueryMake(SearchMember m) {
		
		System.out.println(m);
		Properties prop = new Properties();
		
		
		String query = "SELECT * FROM MEMBER";
		
	/*	if(m.getNameText().equals("")) {
			query += " MEMBER_NAME LIKE ?";
		}else if(m.getEmailText().equals("")) {
			query += " EMAIL LIKE ?";
		}
	*/
		if(m.getSearchType().equals("email")) {
			query += " WHERE EMAIL = ?";
		}else {
			query += " WHERE MEMBER_NAME = ?";
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
				
		prop.put("selectMember", query);
		
		try {
			prop.store(new FileWriter("/C:/Users/kimjinhwan/git/KhSemiSuGack/suGack/web/WEB-INF/classes/sql/admin/admin-query.properties"), "");
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}		
		
		
		
		
	}

	
	
}
