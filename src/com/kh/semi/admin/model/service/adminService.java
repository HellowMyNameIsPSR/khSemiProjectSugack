package com.kh.semi.admin.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

	public HashMap<String, ArrayList> selectMemberForMonth(Date sDate, Date eDate, String date) {
		Connection con = getConnection();
		HashMap<String, ArrayList> hmap = null;
		ArrayList<Integer> maleList = null;
		ArrayList<Integer> femaleList = null;
		
		
		hmap = new HashMap<String, ArrayList>();
		maleList = new adminDao(1).selectMale(con, sDate, eDate, date);		
		femaleList = new adminDao(1).selectFemale(con, sDate, eDate, date);
		hmap.put("maleList", maleList);
		hmap.put("femaleList", femaleList);
		
		close(con);
		
		return hmap;
	}

	public ArrayList<Integer> selectForMonth(Date sDate, Date eDate, String choice) {
		Connection con = getConnection();
		
		ArrayList<Integer> list = new adminDao(1).selectForMonth(con, sDate, eDate, choice);
		
		close(con);
		
		return list;
	}

	public ArrayList<Integer> selectSalesForWeek(Date sDate, Date eDate) {
		Connection con = getConnection();
		
		ArrayList<Integer> list = new adminDao(1).selectSalesForWeek(con, sDate, eDate);
		
		close(con);
		
		return list;
	}

	public ArrayList<Integer> selectSalesForDay(Date sDate, Date eDate) {
		Connection con = getConnection();
		
		ArrayList<Integer> list = new adminDao(1).selectSalesForDay(con, sDate, eDate);
		
		close(con);
		
		return list;
	}

	public ArrayList<String> getMonth(Date sDate, Date eDate, String choice) {
		Connection con = getConnection();
		
		ArrayList<String> list2 = new adminDao(1).getMonth(con, sDate, eDate, choice);;
		
		close(con);
		
		return list2;
	}

	public ArrayList<String> getDay(Date sDate, Date eDate, String choice) {
		Connection con = getConnection();
		
		ArrayList<String> list2 = new adminDao(1).getDay(con, sDate, eDate, choice);;
		
		close(con);
		
		return list2;
	}

	public ArrayList<String> getWeek(Date sDate, Date eDate, String choice) {
		Connection con = getConnection();
		
		ArrayList<String> list2 = new adminDao(1).getWeek(con, sDate, eDate, choice);;
		
		close(con);
		
		return list2;
	}

	public Map<String, ArrayList> selectMemberForWeek(Date sDate, Date eDate, String date) {
		Connection con = getConnection();
		HashMap<String, ArrayList> hmap = null;
		ArrayList<Integer> maleList = null;
		ArrayList<Integer> femaleList = null;
		
		
		hmap = new HashMap<String, ArrayList>();
		maleList = new adminDao(1).selectMale(con, sDate, eDate, date);		
		femaleList = new adminDao(1).selectFemale(con, sDate, eDate, date);
		hmap.put("maleList", maleList);
		hmap.put("femaleList", femaleList);
		
		close(con);
		
		return hmap;
	}

	public Map<String, ArrayList> selectMemberForDay(Date sDate, Date eDate, String date) {
		Connection con = getConnection();
		HashMap<String, ArrayList> hmap = null;
		ArrayList<Integer> maleList = null;
		ArrayList<Integer> femaleList = null;
		
		
		hmap = new HashMap<String, ArrayList>();
		maleList = new adminDao(1).selectMale(con, sDate, eDate, date);		
		femaleList = new adminDao(1).selectFemale(con, sDate, eDate, date);
		hmap.put("maleList", maleList);
		hmap.put("femaleList", femaleList);
		
		close(con);
		
		return hmap;
	}
		

	
	
}