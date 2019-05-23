package com.kh.semi.admin.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.semi.admin.model.dao.adminDao;
import com.kh.semi.admin.model.vo.RequestMember;
import com.kh.semi.admin.model.vo.SearchFunding;
import com.kh.semi.admin.model.vo.SearchMember;
import com.kh.semi.admin.model.vo.SearchProduct;
import com.kh.semi.author.model.vo.Author;

import static com.kh.semi.common.JDBCTemplate.*;

public class adminService {

	public ArrayList<SearchMember> searchMember(SearchMember m) {
		Connection con = getConnection();
		
		ArrayList<SearchMember> list = new adminDao().searchMember(m, con);
		
		close(con);
		
		
		return list;
	}

	

	public ArrayList<SearchMember> searchWithdrawal(SearchMember m) {
		Connection con = getConnection();
		
		ArrayList<SearchMember> list = new adminDao().searchWithdrawal(m, con);
		
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



	public ArrayList<HashMap<String, Object>> reqMemList() {
		
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new adminDao().reqMemList(con);
		
		close(con);
		System.out.println("서비스 에서 list" + list);
		
		return list;
	}



	public RequestMember selectReqMemOne(String authorName) {
		Connection con = getConnection();
		
		RequestMember rm = new adminDao().selectReqMemOne(authorName, con);
		
		close(con);
		
		
		return rm;
	}




	public ArrayList<SearchProduct> searchProduct(SearchProduct sp) {
		Connection con = getConnection();
		
		ArrayList<SearchProduct> list = new adminDao().searchPro(con, sp);
		System.out.println("Dao에서 result" + list);

		
		close(con);
		
		return list;
	}
	
	public int reqDeny(String apply1Stat, int memberId) {
		Connection con = getConnection();
		
		int result1 = new adminDao().reqDeny(con, apply1Stat, memberId);
		int result2 = 0;
		int result = 0;
		
		if(result1 > 0) {
			result2 = new adminDao().reqDate(con, memberId);
			if(result2 > 0) {
				apply1Stat = "1차" + apply1Stat;
				result = new adminDao().reqStatus(con, apply1Stat, memberId);
			}
			commit(con);
		}else {
			rollback(con);
		}
				
				
		close(con);
				
		return result;
	}



	public int reqDeny2(String apply2Stat, int memberId) {
		Connection con = getConnection();
		
		int result1 = new adminDao().reqDeny2(con, apply2Stat, memberId);
		int result2 = 0;
		int result = 0;
		
		if(result1 > 0) {
			result2 = new adminDao().reqDate(con, memberId);
			if(result2 > 0) {
				apply2Stat = "2차" + apply2Stat;
				result = new adminDao().reqStatus(con, apply2Stat, memberId);
			}
			commit(con);
		}else {
			rollback(con);
		}
				
				
		close(con);
				
		return result;
	}



	public String selectReqMemOnePic(String authorName) {
		
		Connection con = getConnection();
		
		String picPath = new adminDao().selectReqMemOnePicPath(authorName, con);
		
		close(con);
		
		
		return picPath;
		

	}



	public ArrayList<String> selectReqMemSecondPic(String authorName) {
		
		Connection con = getConnection();

		
		 ArrayList<String> selectReqMemSecondPic = new adminDao().selectReqMemSecondPic (authorName, con);
		 
			close(con);
		
		return selectReqMemSecondPic;
	}



	public ArrayList<HashMap<String, Object>> totalList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> total = new adminDao().totalReqList(con);
		
		
		
		close(con);
		
		return total;
	}



	public ArrayList<SearchFunding> searchFunding(SearchFunding sf) {
		Connection con = getConnection();
		
		ArrayList<SearchFunding> list = new adminDao().searchFund(con, sf);
		System.out.println("Dao에서 result" + list);

		
		close(con);
		
		return list;
		
		
		
		
	}

		

	
	
}
