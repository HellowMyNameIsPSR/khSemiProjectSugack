package com.kh.semi.admin.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

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

import com.kh.semi.admin.model.vo.RequestMember;
import com.kh.semi.admin.model.vo.SearchFunding;
import com.kh.semi.admin.model.vo.SearchMember;
import com.kh.semi.admin.model.vo.SearchProduct;
import com.kh.semi.author.model.vo.Author;
import com.kh.semi.work.model.vo.PageInfo;

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
			
			System.out.println(m.getSearchText());
			System.out.println(m.getMemberType());
			System.out.println(m.getJoinStart());
			System.out.println(m.getJoinLast());
			System.out.println(m.getBirthDateStart());
			System.out.println(m.getBirthDateLast());
			System.out.println(m.getGender());
				
			
			
			
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
				hmap.put("remainDate", rset.getInt("TOTAL_DATE"));
				
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

	public RequestMember selectReqMemOne(String authorName, Connection con) {
		
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
		RequestMember rm = null;
		String query = prop.getProperty("reqMemDetailList");
		

		System.out.println("Dao에서 출력하는 쿼리 " + query);
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, authorName);
			
			rset= pstmt.executeQuery();
			rm = new RequestMember();

			while(rset.next()) {
				rm.setBrandName(rset.getString("AUTHOR_NAME"));
				rm.setApplyContent(rset.getString("APPLY_CONTENT"));
				rm.setApplyDate(rset.getDate("APPLY_DATE"));
				rm.setMemberId(rset.getInt("MEMBER_ID"));
				rm.setEmail(rset.getString("EMAIL"));
				rm.setMaterial(rset.getString("MATERIAL"));
				rm.setApply1(rset.getString("APPLY_STAT1"));
				rm.setApply2(rset.getString("APPLY_STAT2"));
				rm.setName(rset.getString("MEMBER_NAME"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("Dao에서의 rm" + rm);
		return rm;
	}

	public int reqDeny(Connection con, String apply1Stat, int memberId) {
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
		System.out.println("승인/거부 query" + query);
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, apply1Stat);
			pstmt.setInt(2, memberId);
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	

	public int reqDate(Connection con, int memberId) {
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
		
		String query = prop.getProperty("reqDate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, memberId);
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
		
		
	}

	public int reqDeny2(Connection con, String apply2Stat, int memberId) {
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
		
		String query = prop.getProperty("reqDeny2");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, apply2Stat);
			pstmt.setInt(2, memberId);
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
		
	}

	public String selectReqMemOnePicPath(String authorName, Connection con) {
		
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
		String picPath = null;
		String query = prop.getProperty("reqPic1");
		

		System.out.println("Dao에서 출력하는 쿼리 " + query);
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "브랜드로고");
			pstmt.setString(2, authorName);
			
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				picPath = rset.getString("CHANGE_NAME");
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("Dao에서의 picPath" + picPath);
		return picPath;

	}

	public ArrayList<String> selectReqMemSecondPic(String authorName, Connection con) {
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
		ArrayList<String> selectReqMemSecondPic = new ArrayList<String>();
		String query = prop.getProperty("reqPic2");
		

		System.out.println("Dao에서 출력하는 쿼리 " + query);
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "브랜드로고");
			pstmt.setString(2, "1차입점서류");
			pstmt.setString(3, authorName);
			
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				String s = rset.getString("CHANGE_NAME");
				
				selectReqMemSecondPic.add(s);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("selectReqMemSecondPic" + selectReqMemSecondPic);
		return selectReqMemSecondPic;
		

	}

	public ArrayList<HashMap<String, Object>> totalReqList(Connection con) {
		
		ArrayList<HashMap<String, Object>> total = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		
		try {
			stmt = con.createStatement();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return null;
	}

	public int reqStatus(Connection con, String apply2Stat, int memberId) {
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

		
		String query = prop.getProperty("reqStatus");
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, apply2Stat);
			pstmt.setInt(2, memberId);
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return 0;
	}

	public ArrayList<SearchFunding> searchFund(Connection con, SearchFunding sf) {
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
		ArrayList<SearchFunding> list = null;
		int i = 0;
		
		String query = prop.getProperty("searchFunding");
		
		try {
			pstmt = con.prepareStatement(query);
			
			if(sf.getSearchName().equals("")) {
				pstmt.setString(1, sf.getMaterial());
				pstmt.setString(2, sf.getCategory());
				pstmt.setDate(3, sf.getFundSetDateStart());
				pstmt.setDate(4, sf.getFundSetDateLast());
				pstmt.setDate(5, sf.getFundLastDateStart());
				pstmt.setDate(6, sf.getFundSetDateLast());
				pstmt.setInt(7, sf.getMinNum());
				pstmt.setInt(8, sf.getMaxNum());
				
			}else {
				pstmt.setString(1, sf.getMaterial());
				pstmt.setString(2, sf.getCategory());
				pstmt.setString(3, sf.getSearchName());
				pstmt.setDate(4, sf.getFundSetDateStart());
				pstmt.setDate(5, sf.getFundSetDateLast());
				pstmt.setDate(6, sf.getFundLastDateStart());
				pstmt.setDate(7, sf.getFundSetDateLast());
				pstmt.setInt(8, sf.getMinNum());
				pstmt.setInt(9, sf.getMaxNum());
				
				
			}
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<SearchFunding>();
			
			while(rset.next()) {
				SearchFunding sfu = new SearchFunding();
				sfu.setMaterial(rset.getString("MATERIAL"));
				sfu.setCategory(rset.getString("CATEGORY"));
				sfu.setAuthorName(rset.getString("AUTHOR_NAME"));
				sfu.setSearchName(rset.getString("WORK_NAME"));
				sfu.setResultFundDate(rset.getDate("FC_START"));
				sfu.setResultFundLastDate(rset.getDate("FC_FINISH"));
				sfu.setResultNum(rset.getInt("TOTAL"));
				
				list.add(sfu);
				i++;
			}
			System.out.println("총 조회된 펀딩 수는" + i + "개 입니다.");
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<SearchProduct> searchPro(Connection con, SearchProduct sp) {
		
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
		ArrayList<SearchProduct> list = null;
		int i = 0;
		
		String query = prop.getProperty("searchProduct");

		
		try {
			pstmt = con.prepareStatement(query);
			
			if(sp.getProductName().equals("") && sp.getAuthorName().equals("")) {
				pstmt.setDate(1, sp.getProStart());
				pstmt.setDate(2, sp.getProLast());
				pstmt.setInt(3, sp.getProductValLow());
				pstmt.setInt(4, sp.getProductValHigh());
				pstmt.setString(5, sp.getMaterial());
				pstmt.setString(6, sp.getCategory());

			}else if(sp.getProductName().equals("")) {
				pstmt.setString(1, sp.getAuthorName());
				pstmt.setDate(2, sp.getProStart());
				pstmt.setDate(3, sp.getProLast());
				pstmt.setInt(4, sp.getProductValLow());
				pstmt.setInt(5, sp.getProductValHigh());
				pstmt.setString(6, sp.getMaterial());
				pstmt.setString(7, sp.getCategory());
				
			}else if(sp.getAuthorName().equals("")) {
				pstmt.setString(1, sp.getProductName());
				pstmt.setDate(2, sp.getProStart());
				pstmt.setDate(3, sp.getProLast());
				pstmt.setInt(4, sp.getProductValLow());
				pstmt.setInt(5, sp.getProductValHigh());
				pstmt.setString(6, sp.getMaterial());
				pstmt.setString(7, sp.getCategory());
			}else {
				pstmt.setString(1, sp.getProductName());
				pstmt.setString(2, sp.getAuthorName());
				pstmt.setDate(3, sp.getProStart());
				pstmt.setDate(4, sp.getProLast());
				pstmt.setInt(5, sp.getProductValLow());
				pstmt.setInt(6, sp.getProductValHigh());
				pstmt.setString(7, sp.getMaterial());
				pstmt.setString(8, sp.getCategory());
			}
			
			System.out.println("상품명 " + sp.getProductName());
			System.out.println("작가명 " + sp.getAuthorName());
			System.out.println("등록일 " + sp.getProStart());
			System.out.println("등록일마감 " +sp.getProLast());
			System.out.println("최소값 " + sp.getProductValLow());
			System.out.println("최대값 " +sp.getProductValHigh()); 
			System.out.println("카테고리 " +sp.getCategory()); 
			System.out.println("작가유형 " +sp.getMaterial()); 
			
			rset = pstmt.executeQuery();
			
			
			
			
			list = new ArrayList<SearchProduct>();
			
			while(rset.next()) {
				System.out.println("돈다요 돈다요 리절트셑이 돈다요");
				SearchProduct sm = new SearchProduct();
				sm.setAuthorName(rset.getString("AUTHOR_NAME"));
				sm.setMaterial(rset.getString("MATERIAL"));
				sm.setProductValue(rset.getInt("PRICE"));
				sm.setProductName(rset.getString("WORK_NAME"));
				sm.setCategory(rset.getString("CATEGORY"));
				sm.setProDateResult(rset.getDate("WR_DATE"));
			
				
				list.add(sm);
				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
				
			
		}
		System.out.println("Dao에서 result" + list);
		return list;
	

	}

	public ArrayList<HashMap<String, Object>> selectAuthorSales(Date sDate, Date eDate, Connection con, int person) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectAuthorSales");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setDate(1, eDate);
			pstmt.setDate(2, sDate);
			pstmt.setInt(3, person);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("sales", rset.getInt("SALES"));
				hmap.put("author", rset.getString("AUTHOR"));
				list.add(hmap);
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

	public String fileName(Connection con, String aName) {
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
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("1applyFileName");
		String firstapply = "1차입점서류";
		String changeName = "";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, firstapply);
			pstmt.setString(2, aName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				changeName = rset.getString("CHANGE_NAME");
				System.out.println("while에서의 값" + changeName);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		System.out.println("dao에서 받아올 파일 이름 : " + fileName);
		
		return changeName;
	}

	public String originName(Connection con, String aName) {
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
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("1applyFileName");
		String firstapply = "1차입점서류";
		String originName = "";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, firstapply);
			pstmt.setString(2, aName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				originName = rset.getString("ORIGIN_NAME");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		System.out.println("dao에서 받아올 파일 이름 : " + originName);
		
		return originName;
	}

	public int exchangeListCount(Connection con, String memberId) {
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
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("exchangeListCount");
		
		try {
			stmt = con.createStatement();
	
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectExchangeList(Connection con, PageInfo pi, String memberId) {
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
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectExchangeList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "환불 승인 요청");
			pstmt.setString(2, "환불 거절");
			pstmt.setString(3, "환불 완료");
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("refundId", rset.getInt("REFUND_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("count", rset.getInt("COUNT"));
				hmap.put("refundPrice", rset.getInt("REFUND_PRICE"));
				hmap.put("refundDate", rset.getDate("REFUND_DATE"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("refundStat", rset.getString("REFUND_STAT"));
				hmap.put("refundReason", rset.getString("REFUND_REASON"));
				hmap.put("odId", rset.getInt("OD_ID"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("검색하는 memberId : " + memberId);
		System.out.println("adminDAo에서 쿼리 : " + query);
		System.out.println("adminDao에서 담는값 : " + list);
		return list;
	}

	public int updateExchage(Connection con, String refundStat, String refundId) {
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
		
		String query = prop.getProperty("updateExchage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, refundStat);
			pstmt.setString(2, refundId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}






















