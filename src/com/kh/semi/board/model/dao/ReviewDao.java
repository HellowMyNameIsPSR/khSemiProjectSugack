package com.kh.semi.board.model.dao;

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
import static com.kh.semi.common.JDBCTemplate.*;
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
			pstmt.setInt(2, rv.getBno());
			pstmt.setInt(3, rv.getWriterId());
			/*pstmt.setInt(4, rv.getWriteLevel());*/
			pstmt.setString(4, rv.getStarPoint());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("ReviewDao에서 : " +result);
		return result;
	}

	//리뷰 조회용 메소드
	public ArrayList<Review> selectList(Connection con, int memberId, int workId) {
		
		ArrayList<Review> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectReview");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Review>();
			
			while(rset.next()) {
				Review review = new Review();
				review.setWriteDate(rset.getDate("WRITE_DATE"));
				review.setContent(rset.getString("CONTENT"));
				review.setBno(rset.getInt("BNO"));
				review.setWriterId(rset.getInt("WRITER_ID"));
				review.setWriteLevel(rset.getInt("WRITE_LEVEL"));
				review.setStarPoint(rset.getString("STAR_POINT"));
				
				list.add(review);
			}
		} catch (SQLException e) {
			// TODO dAuto-generated cdatch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
