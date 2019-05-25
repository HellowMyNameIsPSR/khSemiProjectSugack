package com.kh.semi.board.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.board.model.vo.Review;
public class ReviewDao {
	
	private Properties prop = new Properties();
	public ReviewDao() {
		String fileName = ReviewDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}

	public int insertReview(Connection con, Review rv) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReview");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rv.getContent());
			pstmt.setInt(2, rv.getWriterId());
			pstmt.setString(3, rv.getStarPoint());
			pstmt.setInt(4, rv.getWorkId());
			
			result = pstmt.executeUpdate();
	
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		System.out.println("ReviewDao에서 : " +result);
		return result;
	}


	
	public ArrayList<Review> selectReviewList(Connection con, int workId) {
		
		ArrayList<Review> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectReviewList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, workId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Review>();
			
			while(rset.next()) {
				
				System.out.println("반복문 실행");
				
				Review r = new Review();
				r.setContent(rset.getString("CONTENT"));
				r.setStarPoint(rset.getString("STAR_POINT"));
				r.setWriter(rset.getString("MEMBER_NAME"));
				r.setWriteDate(rset.getDate("WRITE_DATE"));
				r.setWriterId(rset.getInt("WRITER_ID"));
				r.setWorkId(rset.getInt("WORK_ID"));
				
				System.out.println("r : " +  r);
				list.add(r);
				
			
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("reviewDao에서: " + list);
		return list;
	}

	public ArrayList<Review> selectMyReviewList(Connection con, int memberId) {
	
		ArrayList<Review> list = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		
		String query = prop.getProperty("selectMyReview");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Review>();
			
			while(rset.next()) {
				
				//rset에는 내가 select한 컬럼들을 적는다.
				System.out.println("반복문 실행");
				
				Review r = new Review();
				r.setContent(rset.getString("CONTENT"));
				r.setStarPoint(rset.getString("STAR_POINT"));
				r.setWriteDate(rset.getDate("WRITE_DATE"));
				r.setWorkId(rset.getInt("WORK_ID"));
				r.setWorkName(rset.getString("WORK_NAME"));
				r.setWorkKind(rset.getString("WORK_KIND"));
				System.out.println("r2 : " +  r);
				list.add(r);
				
			
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return list;
	}

	public int deleteReview(Connection con, int memberId, int workId) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteReview");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			pstmt.setInt(2, workId);
			
			result = pstmt.executeUpdate();
			System.out.println("ReviewDao에서 result: "+result);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return result;
	}

	
	public ArrayList<Review> selectAllReview(Connection con, int workId) {
		PreparedStatement pstmt = null;
		ArrayList<Review> list = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAllReview");
		
		System.out.println("Dao에서 입력받은 값" + workId);
		System.out.println("Dao에서 쿼리문" + query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, workId);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Review>();
			
			while(rset.next()) {
				Review r = new Review();
				
				r.setWriteDate(rset.getDate("WRITE_DATE"));
				r.setContent(rset.getString("CONTENT"));
				r.setWriter(rset.getString("MEMBER_NAME"));
				r.setStarPoint(rset.getString("STAR_POINT"));
				
				System.out.println("rset이도는가?" + r);
				list.add(r);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
	}

	

	
}
