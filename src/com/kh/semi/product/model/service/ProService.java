package com.kh.semi.product.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.common.model.vo.Cart;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.dao.ProDao;
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


	//장바구니
	public ArrayList<Cart> insertCart(Member loginUser, int wid) {
		Connection con = getConnection();
		int result = new ProDao().insertCart(loginUser,wid, con);
		ArrayList<Cart> cartList = null;
		
		if(result>0) {
			commit(con);
			
			
		 cartList = new ProDao().selectCart(loginUser,wid,con);
		 System.out.println("Service에서 "+cartList);
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return cartList;
	}

}
