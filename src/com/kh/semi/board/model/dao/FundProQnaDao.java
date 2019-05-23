package com.kh.semi.board.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.board.model.vo.ProQna;

public class FundProQnaDao {
	
	private Properties prop = new Properties();
	
	public FundProQnaDao() {
	
		String fileName = ProQnaDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}

	public int insertProQna(Connection con, ProQna qna) {
		PreparedStatement pstmt = null;	
		int result = 0;
		
		String query = prop.getProperty("insertFundQna");
		
		try {
			pstmt = con.prepareStatement(query);
		
			
			pstmt.setInt(1, qna.getMid());
			pstmt.setString(2, qna.getcategory());
			pstmt.setString(3, qna.getContent());
			pstmt.setInt(4, qna.getWorkId());
			//pstmt.setInt(3, qna.getBno());  //작품코드
			
			//pstmt.setInt(4, Integer.parseInt(qna.getcategory()));
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

}
