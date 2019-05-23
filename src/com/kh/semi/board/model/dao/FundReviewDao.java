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

public class FundReviewDao {
	
	private Properties prop = new Properties();
	public FundReviewDao() {
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
		
		String query = prop.getProperty("insertFundReview");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rv.getContent());
			//pstmt.setInt(2, rv.getBno());
			pstmt.setInt(2, rv.getWriterId());
			//pstmt.setInt(4, rv.getWriteLevel());
			pstmt.setString(3, rv.getStarPoint());
			pstmt.setInt(4, rv.getWorkId());
			
			result = pstmt.executeUpdate();
	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		System.out.println("ReviewDao에서 : " +result);
		return result;
	}

	public ArrayList<Review> selectAllReview(Connection con, int workId) {
		PreparedStatement pstmt = null;
		ArrayList<Review> list = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAllFundReview");
		
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
			// TODO Auto-generated catch block!
			e.printStackTrace();
		}
		return list;
	}

}
