package com.kh.semi.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.board.model.vo.AuthorPageAttachmrnt;

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
	
	
	
	public int insertAuthorPageContent(Connection con, ArrayList<AuthorPageAttachmrnt> fileList) {
		
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String query = prop.getProperty("");
		
		try {
			
			for(int i=0; i<fileList.size();i++) {
			
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fileList.get(i).getFileCode());
				pstmt.setString(2,fileList.get(i).getOriginName());
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		return 0 ;
	}

}
