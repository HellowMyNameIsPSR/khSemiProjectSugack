package com.kh.semi.funding.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.funding.model.vo.Category;
import com.kh.semi.funding.model.vo.Funding;
import com.kh.semi.funding.model.vo.Work;
import com.kh.semi.funding.model.vo.WorkPic;

public class FundingDao {
	
	private Properties prop = new Properties();
	
	public FundingDao() {
		String fileName = FundingDao.class
				.getResource("/sql/funding/funding-query.properties")
				.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //end try
	} //end constr

	//카테고리 검색
	public ArrayList<Category> selectCategoryAll(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = null;
		String query = prop.getProperty("selectCategoryAll");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Category>();
			while(rset.next()) {
				Category category = new Category();
				category.setCid(rset.getInt("CID"));
				category.setCategory(rset.getString("CATEGORY"));
				list.add(category);
			} //end while
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}
	
	//작가 유형 검색
	public ArrayList<String> selectAuthorType(Connection con, int memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list = null;
		String query = prop.getProperty("selectAuthorType");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			rset = pstmt.executeQuery();
			list = new ArrayList<String>();
			while(rset.next()) {
				list.add(rset.getString("MATERIAL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	//펀딩 작품 등록
	public int insertFundingWork(Connection con, Work fundWork) {
		PreparedStatement pstmt = null;
		int result = 0; 
		String query = prop.getProperty("insertFundingWork");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fundWork.getWorkName());
			pstmt.setString(2, fundWork.getWorkContent());
			pstmt.setInt(3, fundWork.getDeliPrice());
			pstmt.setString(4, fundWork.getWorkKind());
			pstmt.setInt(5, fundWork.getMemberId());
			pstmt.setInt(6, fundWork.getPrice());
			pstmt.setString(7, fundWork.getCategory());
			pstmt.setString(8, fundWork.getAuthorType());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	} //end method

	//펀딩 작품 사진 등록
	public int insertFundingFile(Connection con, ArrayList<WorkPic> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertFundFile");
		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setString(4, fileList.get(i).getPicType());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertFund(Connection con, Funding fund) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertFund");
		int result = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fund.getMinVoo());
			pstmt.setInt(2, fund.getMaxVoo());
			pstmt.setString(3, "N");
			pstmt.setInt(4, fund.getFunDate());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
