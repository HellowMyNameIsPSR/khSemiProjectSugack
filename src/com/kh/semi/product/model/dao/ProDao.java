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
import java.util.Map;
import java.util.Properties;

import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.vo.Basket;

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
            hmap.put("wrDate", rset.getDate("WR_DATE"));
            hmap.put("rsDate", rset.getDate("RS_DATE"));
            hmap.put("maxCount", rset.getInt("MAX_COUNT"));
            hmap.put("csDate", rset.getDate("CS_DATE"));
            hmap.put("workKind", rset.getString("WORK_KIND"));
            hmap.put("memberId", rset.getInt("MEMBER_ID"));
            hmap.put("price", rset.getInt("PRICE"));
            hmap.put("cid", rset.getInt("CID"));
            hmap.put("typeId", rset.getInt("TYPE_ID"));
            hmap.put("originName", rset.getString("ORIGIN_NAME"));
            hmap.put("changeName", rset.getString("CHANGE_NAME"));
            hmap.put("picType", rset.getInt("PIC_TYPE"));
            hmap.put("opId", rset.getInt("OP_ID"));
            
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

   public Address selectUserAddress(Connection con, Member loginUser) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      Address add = null;
      
      String query = prop.getProperty("selectUserInfo");
      
      try {
         pstmt = con.prepareStatement(query);
         pstmt.setInt(1, loginUser.getMemberId());
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            add = new Address();
            add.setAddressId(rset.getInt("ADDRESS_ID"));
            add.setAddressName(rset.getString("ADDRESS_NAME"));
            add.setAddress(rset.getString("ADDRESS"));
            add.setPhone1(rset.getString("PHONE1"));
            add.setPhone2(rset.getString("PHONE2"));
            add.setMemberId(rset.getInt("MEMBER_ID"));
            add.setAddType(rset.getString("ADD_TYPE"));
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
      return add;
   }

   public HashMap<String, Object> selectProductPurchase(String workId, Connection con) {
      PreparedStatement pstmt = null;
      HashMap<String, Object> hmap = null;
      ResultSet rset = null;
      
      String query = prop.getProperty("selectProDetailList");
      
      try {
         pstmt = con.prepareStatement(query);
         pstmt.setInt(1, Integer.parseInt(workId));
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
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
            
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      return hmap;
   }

   public int insertBasket(Connection con, Basket basket) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("insertBasket");
      
      try {
         pstmt = con.prepareStatement(query);
         pstmt.setInt(1, basket.getMemberId());
         pstmt.setInt(2, basket.getWorkId());
         pstmt.setInt(3, basket.getCount());
         pstmt.setInt(4, basket.getOpId());
         
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























