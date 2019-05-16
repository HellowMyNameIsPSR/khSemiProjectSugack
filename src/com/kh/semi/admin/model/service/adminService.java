package com.kh.semi.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.admin.model.dao.adminDao;
import com.kh.semi.admin.model.vo.SearchMember;
import com.kh.semi.member.model.vo.Member;
import static com.kh.semi.common.JDBCTemplate.*;

public class adminService {

	public ArrayList<SearchMember> searchMember(SearchMember m) {
		Connection con = getConnection();
		
		ArrayList<SearchMember> list = new adminDao().searchMember(m, con);
		
		close(con);
		
		
		return list;
	}

	public ArrayList<Integer> selectMemberForMonth() {
		Connection con = getConnection();
		
		ArrayList<Integer> list = new adminDao().selectMemberForMonth(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<Integer> selectSalesForMonth() {
		Connection con = getConnection();
		
		ArrayList<Integer> list = new adminDao().selectSalesForMonth(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<Integer> selectSalesForWeek() {
		Connection con = getConnection();
		
		ArrayList<Integer> list = new adminDao().selectSalesForWeek(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<Integer> selectSalesForDay() {
		Connection con = getConnection();
		
		ArrayList<Integer> list = new adminDao().selectSalesForDay(con);
		
		close(con);
		
		return list;
	}
		

	
	
}
