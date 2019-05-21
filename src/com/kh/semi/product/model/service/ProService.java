package com.kh.semi.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.dao.ProDao;
import com.kh.semi.product.model.vo.Basket;
import com.kh.semi.product.model.vo.OrderList;
import com.kh.semi.product.model.vo.Payment;
import com.kh.semi.work.model.vo.WorkOption;

import static com.kh.semi.common.JDBCTemplate.*;
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
		int bid = 0;
		int result = new ProDao().insertBasket(con, basket);
		
		if(result > 0) {
			commit(con);
			bid = new ProDao().selectOnePurchase(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return bid;
	}


	public HashMap<String, Object> selectBuyInfo(int bid, int memberId) {
		Connection con = getConnection();
		
		ArrayList<Address> addList = new MemberDao().addressList(con, memberId);
		ArrayList<HashMap<String, Object>> list = new ProDao().selectBuyInfo(bid, con);
		
		HashMap<String, Object> buyInfo = new HashMap<String, Object>();
		buyInfo.put("addList", addList);
		buyInfo.put("list", list);
		
		close(con);
		
		return buyInfo;
	}


	public int insertPayment(Payment pay, ArrayList<OrderList> oList) {
		Connection con = getConnection();
		
		int result = new ProDao().insertPayment(con, pay);
		int result2 = 0;
		
		if(result > 0) {
			result2 = new ProDao().insertOrderList(con, oList);
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result2;
	}


	public int deleteBasket(ArrayList<OrderList> oList) {
		Connection con = getConnection();
		
		int result = new ProDao().deleteBasket(con, oList);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	public HashMap<String, Object> selectCartBuyInfo(String[] bidArr, int memberId) {
		Connection con = getConnection();
		
		ArrayList<Address> addList = new MemberDao().addressList(con, memberId);
		ArrayList<HashMap<String, Object>> list = new ProDao().selectCartBuyInfo(bidArr, con);
		
		HashMap<String, Object> buyInfo = new HashMap<String, Object>();
		buyInfo.put("addList", addList);
		buyInfo.put("list", list);
		
		close(con);
		
		return buyInfo;
	}


	public ArrayList<WorkOption> selectOption(int workId) {
		Connection con = getConnection();
		
		ArrayList<WorkOption> olist = new ProDao().selectOption(con, workId);
		
		close(con);
		
		return olist;
	}

}






















