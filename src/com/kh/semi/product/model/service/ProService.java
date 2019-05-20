package com.kh.semi.product.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.dao.ProDao;
import com.kh.semi.product.model.vo.Basket;
public class ProService {

   //상품목록 보기용 메소드
   public ArrayList<HashMap<String, Object>> selectProductList() {
      
      Connection con = getConnection();
      ArrayList<HashMap<String,Object>> list = new ProDao().selectProductList(con);
      close(con);
      
      System.out.println("상품목록 보기용 Service에서 : " + list);
      return list;
   }

   
   //상품 상세보기용 메소드
   public ArrayList<HashMap<String, Object>> selectProductDetailList(int workId) {
      Connection con = getConnection();
      ArrayList<HashMap<String,Object>> list = new ProDao().selectProductDetailList(con,workId);
      close(con);
      
      System.out.println("DetailService에서 : " + list);
      return list;
   }


   public Address selectUserAddress(Member loginUser) {
      Connection con = getConnection();
      
      Address add = new ProDao().selectUserAddress(con, loginUser);
      
      close(con);
      
      return add;
   }


   public HashMap<String, Object> selectProductPurchse(String workId) {
      Connection con = getConnection();
      
      HashMap<String, Object> workInfo = new ProDao().selectProductPurchase(workId, con);
      
      close(con);
      
      return workInfo;
   }


   public int insertBasket(Basket basket) {
      Connection con = getConnection();
      
      int result = new ProDao().insertBasket(con, basket);
      
      if(result > 0) {
         commit(con);
      }else {
         close(con);
      }
      
      return result;
   }

}





















