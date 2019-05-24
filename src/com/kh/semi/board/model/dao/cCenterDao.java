package com.kh.semi.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.semi.common.JDBCTemplate.*;


import com.kh.semi.board.model.vo.Board;

public class cCenterDao {
	
	private Properties prop = new Properties();
	public cCenterDao() {
		String fileName = cCenterDao.class.getResource("/sql/admin/admin-normalquery.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	public ArrayList<Board> noticeList(Connection con, int divison) {
		ArrayList<Board> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		System.out.println("Dao들s어옴");

		
		
		String query = prop.getProperty("noticeList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, divison);
			
			rset = pstmt.executeQuery();
					
			list = new ArrayList<>();
			
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setBno(rset.getInt("BNO"));
				b.setTitle(rset.getString("TITLE"));
				b.setContent(rset.getString("CONTENT"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setWriteDate(rset.getDate("WRITE_DATE"));
				
				
				
				list.add(b);
				
				
				
			}
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		System.out.println("Dao에서 보드리스트 " + list);
		
		return list;
	}
	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setDate(3, b.getWriteDate());
			pstmt.setInt(4, b.getDivision());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		
		
		return result;
	}
	public ArrayList<Board> FaqOrderList(Connection con) {
		ArrayList<Board> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("FaqOrderList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setBno(rset.getInt("BNO"));
				b.setTitle(rset.getString("TITLE"));
				b.setContent(rset.getString("CONTENT"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setWriteDate(rset.getDate("WRITE_DATE"));
				
				list.add(b);
				
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
	public Board selectOne(int num, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		Board b = null;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				b = new Board();
				b.setTitle(rset.getString("TITLE"));
				b.setContent(rset.getString("CONTENT"));
				b.setDivision(rset.getInt("DIVISON"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setWriteDate(rset.getDate("WRITE_DATE"));
				b.setBno(rset.getInt("BNO"));
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("다오에서 출력하는 b" + b);
		
		return b;
	}

}
