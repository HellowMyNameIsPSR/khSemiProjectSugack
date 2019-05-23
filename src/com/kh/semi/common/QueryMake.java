package com.kh.semi.common;


import java.io.FileWriter;
import java.io.IOException;
import java.util.Properties;

import com.kh.semi.admin.model.dao.adminDao;
import com.kh.semi.admin.model.vo.SearchFunding;
import com.kh.semi.admin.model.vo.SearchMember;
import com.kh.semi.admin.model.vo.SearchProduct;

public class QueryMake {
	
	public QueryMake() {}

	public QueryMake(SearchMember m) {
		
		//프로퍼티스 생성
		Properties prop = new Properties();
		
		String fileName = QueryMake.class
		.getResource("/sql/admin/admin-query.properties")
		.getPath();
		
		
		String query = "SELECT * FROM MEMBER";
		
	
		if(m.getSearchType().equals("email")) {
			query += " WHERE EMAIL LIKE '%'||?||'%'"; 
			if(m.getSearchText().equals("")) {
				query = "SELECT * FROM MEMBER WHERE EMAIL LIKE '%'";
			}
		}else {
			query += " WHERE MEMBER_NAME LIKE '%'||?||'%'";
			if(m.getSearchText().equals("")) {
				query = "SELECT * FROM MEMBER WHERE MEMBER_NAME LIKE '%'";
			}
		}
		
		if(m.getMemberType() != null) {
			query += " AND MEMBER_TYPE= ?";
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
			query += " WHERE EMAIL LIKE '%'||?||'%'";
			if(m.getSearchText().equals("")) {
				query = "SELECT * FROM MEMBER WHERE EMAIL LIKE '%'";
			}
		}else {
			query += " WHERE MEMBER_NAMELIKE '%'||?||'%'";
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
			
			query += " AND STATUS = 'N'";
			
		
		prop.setProperty("withdrawMember", query);
		System.out.println("with생산된 쿼리문" + query);
	

		//C:/Users/kimjinhwan/eclipse-workspace/suGack/src/sql/admin
		
		
		try {
			prop.store(new FileWriter(fileName), "");
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}		

		
		
	}
	
	public void ProductQuery(SearchProduct sp) {
		Properties prop = new Properties();
		
		String fileName = QueryMake.class
		.getResource("/sql/admin/admin-query.properties")
		.getPath();
		
		
		String query = "SELECT A.AUTHOR_NAME, MATERIAL, W.PRICE, W.WORK_NAME, C.CATEGORY, W.WR_DATE FROM WORK W JOIN AUTHOR A ON (W.MEMBER_ID = A.MEMBER_ID) JOIN PROTYPE P ON (P.TYPE_ID = W.TYPE_ID) JOIN CATEGORY C ON (C.CID = W.CID)";
		
		if(sp.getProductName().equals("") && sp.getAuthorName().equals("")) {
			query += " WHERE WORK_NAME LIKE '%'";
		}else if(sp.getProductName().equals("")) {
			query += " WHERE AUTHOR_NAME LIKE '%' AND WORK_NAME LIKE '%'||?||'%'";
		}else if(sp.getAuthorName().equals("")){
			query += " WHERE WORK_NAME LIKE '%'||?||'%' AND AUTHOR_NAME LIKE '%'";
		}else {
			query += " WHERE WORK_NAME LIKE '%'||?||'%' AND AUTHOR_NAME LIKE '%'||?||'%'";
		}
		
		if(sp.getProStart() != null) {
			query += " AND WR_DATE >= ? AND WR_DATE < ?";
		}
		if(sp.getProductValLow() >= 0 && sp.getProductValHigh() > 0) {
			query += " AND PRICE >= ? AND PRICE < ?";
		}
		if(sp.getMaterial() != null) {
			query += " AND MATERIAL = ?";
		}
		if(sp.getCategory() != null) {
			query += " AND CATEGORY = ?";
		}
		prop.setProperty("searchProduct", query);
		System.out.println("searchProduct생산된 쿼리문" + query);
		
		
		try {
			prop.store(new FileWriter(fileName), "");
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}		
		
		
	}

	public void fundingQuery(SearchFunding sf) {
		Properties prop = new Properties();
		
		String fileName = QueryMake.class
		.getResource("/sql/admin/admin-query.properties")
		.getPath();
		
		String query = "SELECT * FROM(SELECT W.WORK_ID, P.MATERIAL, C.CATEGORY, F.FC_FINISH, F.FC_START, A.AUTHOR_NAME, W.WORK_NAME, TRUNC(F.MAX_VOO / FS.FUND_PRICE) TOTAL FROM FUNDING F JOIN WORK W ON(W.WORK_ID = F.WORK_ID) JOIN CATEGORY C ON(C.CID = W.CID) JOIN PROTYPE P ON(P.TYPE_ID = W.TYPE_ID) JOIN AUTHOR A ON(W.MEMBER_ID = A.MEMBER_ID) JOIN FUS FS ON(F.WORK_ID = FS.WORK_ID))";
		query += " WHERE P.MATERIAL = ? AND C.CATEGORY = ?";
		
		
		
		if(sf.getSearchName().equals("")) {
			query += " AND W.WORK_NAME LIKE '%'";
		}else {
			if(sf.getSellKeyword().equals("펀딩명")) {
				query += " AND W.WORK_NAME LIKE '%'||?||'%'";
			}else {
				query += " AND A.AUTHOR_NAME LIKE '%'||?||'%'";
			}
		}
		
		query += " AND FC_START >= ? AND FC_START < ? AND FC_FINISH >=? AND FC_FINISH < ? AND TOTAL >= ? AND TOTAL < ?";
		
		//query += " F.COOPERATION = ?"
		
		
		prop.setProperty("searchFunding", query);
		System.out.println("searchFunding생산된 쿼리문" + query);
		
		
		try {
			prop.store(new FileWriter(fileName), "");
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}		
		
		
	}

	
	
}
