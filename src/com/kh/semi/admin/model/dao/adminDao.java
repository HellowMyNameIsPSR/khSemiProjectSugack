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


import com.kh.semi.admin.model.dao.adminDao;
import com.kh.semi.admin.model.vo.SearchMember;
import com.kh.semi.admin.model.vo.SearchProduct;
import com.kh.semi.author.model.vo.Author;
import com.kh.semi.member.model.vo.Member;
import static com.kh.semi.common.JDBCTemplate.*;

public class adminDao {
	 private Properties prop = new Properties();
	public adminDao() {}
	
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
		System.out.println("with최종쿼리문 " + query);
		
		try {
			pstmt = con.prepareStatement(query);
			
			if(m.getSearchText().equals("")) {
				pstmt.setString(1, m.getMemberType());
				pstmt.setDate(2, m.getWithdrawalDateStart());
				pstmt.setDate(3, m.getWithdrawalDateLast());
			}else {
				pstmt.setString(1, m.getSearchText());
				pstmt.setString(2, m.getMemberType());
				pstmt.setDate(3, m.getWithdrawalDateStart());
				pstmt.setDate(4, m.getWithdrawalDateLast());
				
			}
			
			rset = pstmt.executeQuery();

			list = new ArrayList<SearchMember>();
			
			
			while(rset.next()) {
				i++;
				SearchMember sm = new SearchMember();
				sm.setEmailText(rset.getString("EMAIL"));
				sm.setNameText(rset.getString("MEMBER_NAME"));
				sm.setMemberType(rset.getString("MEMBER_TYPE"));
				sm.setWithdrawalDay(rset.getDate("OUT_DATE"));
				sm.setJoinDay(rset.getDate("ENROLL_DATE"));
				
				
				list.add(sm);
			}
			System.out.println("총조회할 회원" + i + "명");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
			
		}

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

	public ArrayList<HashMap<String, Object>> reqMemList(Connection con) {
		Properties prop = new Properties();
		String fileName =  adminDao.class
				.getResource("/sql/admin/admin-normalquery.properties")
				.getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("reqMemList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("email", rset.getString("EMAIL"));
				hmap.put("memberId", rset.getInt("MEMBER_ID"));
				hmap.put("authorName", rset.getString("AUTHOR_NAME"));
				hmap.put("authorContent", rset.getString("APPLY_CONTENT"));
				hmap.put("authorStatus", rset.getString("AUTHOR_STATUS"));
				hmap.put("applyDate", rset.getDate("APPLY_DATE"));
				
				list.add(hmap);
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

	public Author selectReqMemOne(String authorName, Connection con) {
		
		Properties prop = new Properties();
		String fileName =  adminDao.class
				.getResource("/sql/admin/admin-normalquery.properties")
				.getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Author a = null;
		String query = prop.getProperty("reqMemDetailList");
		

		System.out.println("Dao에서 출력하는 쿼리 " + query);
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, authorName);
			
			rset= pstmt.executeQuery();
			a = new Author();
			
			
			while(rset.next()) {
				a.setBrandName(rset.getString("AUTHOR_NAME"));
				a.setApplyContent(rset.getString("APPLY_CONTENT"));
				a.setApplyDate(rset.getDate("APPLY_DATE"));
				a.setStaus(rset.getString("AUTHOR_STATUS"));
				
				
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return a;
	}

	public int reqDeny(Connection con, String apply1Stat) {
		Properties prop = new Properties();
		String fileName =  adminDao.class
				.getResource("/sql/admin/admin-normalquery.properties")
				.getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("reqDeny");
		
		try {
			pstmt = con.prepareStatement(query);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> searchPro(Connection con, SearchProduct sp) {
		
		Properties prop = new Properties();
		String fileName =  adminDao.class
				.getResource("/sql/admin/admin-query.properties")
				.getPath();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SearchMember> list = null;
		int i = 0;
		
		String query = prop.getProperty("searchProduct");
		System.out.println("최종쿼리문 " + query);
		
		try {
			pstmt = con.prepareStatement(query);
			
			if(sp.getProductName().equals("") && sp.getAuthorName().equals("")) {
				pstmt.setString(1, sp.getAuthorName());
				
			}else if(sp.getProductName().equals("")) {
				
			}else if(sp.getAuthorName().equals("")) {
				
			}else {
				
			}
			
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}



}






















