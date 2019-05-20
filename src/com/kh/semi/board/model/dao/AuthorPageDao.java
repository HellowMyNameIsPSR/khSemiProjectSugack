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
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.board.model.vo.AuthorPageAttachmrnt;
import com.kh.semi.board.model.vo.Board;
import static com.kh.semi.common.JDBCTemplate.*;

public class AuthorPageDao {
	private Properties prop = new Properties();

	public AuthorPageDao() {
		
		String fileName = ProQnaDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}	
	
	
	


	




// 프로필 작성 텍스트 등록메소드
	public int insertAuthorPageProContent(Connection con, Board b) {
		
		
		PreparedStatement pstmt = null; 
		int result = 0; 
		
		
		String query = prop.getProperty("insertAuthorPageProContent");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getMemberId());
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getContent());
			
			result = pstmt.executeUpdate();
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		
		}finally {
			close(pstmt);
		}
		
		
				
	
		
		
		return result;
	}









 //게시판 확인 메소드
	public int selectAuthorPageProCurrval(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null; 
		int bid = 0;
		
		
		
		String query = prop.getProperty("selectAuthorPageProCurrval");
		
		try {
			stmt =con.createStatement();
			rset =stmt.executeQuery(query);
			
			if(rset.next()) {
				bid = rset.getInt("currval");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		
		
		
		
		
		
		return bid;
	}









   //첨부 파일 등록용 메소드
	public int insertAuthorPageAttachment(Connection con, ArrayList<AuthorPageAttachmrnt> fileList) {
		
		PreparedStatement pstmt = null; 
		int result = 0;
		
		
		String query =prop.getProperty("insertAuthorPageAttachment");
		
		try {
			for(int i=0; i<fileList.size(); i++) {
				pstmt =con.prepareStatement(query);
				pstmt.setString(1,fileList.get(i).getOriginName()); 
				pstmt.setString(2,fileList.get(i).getChangeName());
				pstmt.setString(3,fileList.get(i).getFilePath());
				
				
				int level = 0;
				if(i==0) level = 0;
				else level =1; 
				pstmt.setInt(4, level);
				pstmt.setInt(5,fileList.get(i).getBno());
				
				result += pstmt.executeUpdate();
				
				
				
				
				
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		
		
		return result;
	}










	public ArrayList<HashMap<String, Object>> selectAuthorPage(Connection con) {
		
		Statement stmt = null; 
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null; 
		
		String query = prop.getProperty("selectAuthorList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
			   
				hmap.put("BNO",rset.getInt("BNO"));
				hmap.put("MEMBER_ID",rset.getInt("MEMBER_ID"));
				hmap.put("TITLE", );
				
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		return null;
	}

}
