package com.kh.semi.product.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

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

import com.kh.semi.common.model.vo.Cart;
import com.kh.semi.member.model.vo.Member;

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
				
				System.out.println("dao에서 : " + list);
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

	
	public ArrayList<HashMap<String, Object>> selectProductDetailList(Connection con, int workId) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectProDetailList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, workId);
			
			rset = pstmt.executeQuery();
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
				
				System.out.println("Detaildao에서 : " + list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
		
	}

	
	public int insertCart(Member loginUser, int wid, Connection con) {
		PreparedStatement pstmt = null;
		int result=0;
		
		String query = prop.getProperty("insertCart");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginUser.getMemberId());
			pstmt.setInt(2, wid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	//장바구니 조회용 메소드
	public ArrayList<Cart> selectCart(Member loginUser, int wid, Connection con) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cart>  cartList = null;
		
		String query = prop.getProperty("selectCartList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginUser.getMemberId());
			pstmt.setInt(2, wid);
			
			
			rset = pstmt.executeQuery();
			cartList = new ArrayList<Cart>();
			
			while(rset.next()) {
				
				Cart c = new Cart();
				c.setFilePath(rset.getString("FILE_PATH"));
				c.setContent(rset.getString("WORK_CONTENT"));
				c.setPrice(rset.getInt("PRICE"));
				
				cartList.add(c);
				
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		System.out.println("dao에서 "+cartList);
		return cartList;
	}

}
