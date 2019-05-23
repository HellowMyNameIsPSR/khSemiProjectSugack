package com.kh.semi.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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
	public ArrayList<Board> noticeList(Connection con) {
		ArrayList<Board> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		System.out.println("Dao들어옴");

		
		
		String query = prop.getProperty("noticeList");
		
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
		
		
		
		System.out.println("Dao에서 보드리스트 " + list);
		
		return list;
	}

}
