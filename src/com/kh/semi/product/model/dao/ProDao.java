package com.kh.semi.product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import static com.kh.semi.common.JDBCTemplate.*;

public class ProDao {
	private Properties prop = new Properties();
	
	public ProDao() {
		String fileName = ProDao.class.getResource("/sql/product/product-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	public ArrayList<HashMap<String, Object>> selectProductList(Connection con) {
		
		Statement stmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectProList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<HashMap<String, Object>>();
			
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("workContent", rset.getString("WORK_CONTENT"));
				hmap.put("deliPrice", rset.getInt("DELI_PRICE"));
				hmap.put("wrDate", rset.getDate("RS_DATE"));
				hmap.put("rsDate", rset.getDate("RS_DATE"));
				hmap.put("maxCount", rset.getInt("MAX_COUNT"));
				hmap.put("csDate", rset.getDate("RS_DATE"));
				hmap.put("workKind", rset.getString("WORK_KIND"));
				hmap.put("memberId", rset.getInt("MEMBER_ID"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("cid", rset.getInt("CID"));
				hmap.put("typeId", rset.getInt("TYPE_ID"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				list.add(hmap);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		System.out.println("dao에서: " + list);
		return list;
	}

}
