package com.kh.semi.member.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

public class LikeDao {
	
	private Properties prop = new Properties();
	
	public LikeDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertLike(Connection con, int memberId, int workId) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertLike");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			pstmt.setInt(2, workId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectLikeList(Connection con, int memberId) {
	
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectLikeList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("type", rset.getString("TYPE"));
				//hmap.put("memberId", rset.getInt(memberId));
				
				list.add(hmap);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return list;
	}

	public int deleteLike(Connection con, int memberId, int workId) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteLike");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			pstmt.setInt(2, workId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

}
