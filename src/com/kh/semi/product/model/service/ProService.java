package com.kh.semi.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.semi.funding.model.dao.FundingDao;
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
		ArrayList<HashMap<String,Object>> list = null;
		
		int result = new ProDao().updateCount(con,workId);
		
		if(result>0) {
			list = new ProDao().selectProductDetailList(con,workId);
		}
		
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


	public int insertBasket(Basket basket, int i) {
		Connection con = getConnection();
		int bid = 0;
		int result = new ProDao().insertBasket(con, basket);
		
		if(result > 0) {
			commit(con);
			bid = new ProDao().selectOnePurchase(con);
			int result2 = new ProDao().insertBasketOption(con, bid, i);
		
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return bid;
	}
	
	public int insertBasket(Basket basket, String[] opId) {
		Connection con = getConnection();
		int bid = 0;
		int result = new ProDao().insertBasket(con, basket);
		
		if(result > 0) {
			commit(con);
			bid = new ProDao().selectOnePurchase(con);
			int result2 = new ProDao().insertBasketOption(con, bid, opId);
			commit(con);
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
		ArrayList<WorkOption> olist = new MemberDao().selectOptionList(memberId, con);
		int point = new MemberDao().selectTotalPoint(con, memberId);
		HashMap<String, Object> buyInfo = new HashMap<String, Object>();
		buyInfo.put("addList", addList);
		buyInfo.put("list", list);
		buyInfo.put("olist", olist);
		buyInfo.put("point", point);
		
		close(con);
		
		return buyInfo;
	}


	public int insertPayment(Payment pay, ArrayList<OrderList> oList) {
		Connection con = getConnection();
		
		int result = new ProDao().insertPayment(con, pay);
		int result2 = 0;
		
		if(result > 0) {
			result2 = new ProDao().insertOrderList(con, oList);
			ArrayList<OrderList> list = new ProDao().selectOrderId(con, oList);
			ArrayList<HashMap<String, Object>> fus = new ProDao().selectWid(con, oList);
			if(fus.size() > 0) {
				int result4 = new FundingDao().insertFUS(fus, con);
			}
			
			if(list.size() > 0) {
				int result3 = new ProDao().insertDelivery(list, con);
				commit(con);
			}else {
				rollback(con);
			}
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

//
	public HashMap<String, Object> selectCartBuyInfo(String[] bidArr, int memberId) {
		Connection con = getConnection();
		
		ArrayList<Address> addList = new MemberDao().addressList(con, memberId);
		ArrayList<HashMap<String, Object>> list = new ProDao().selectCartBuyInfo(bidArr, con);
		ArrayList<WorkOption> olist = new MemberDao().selectOptionList(memberId, con);
		int point = new MemberDao().selectTotalPoint(con, memberId);
		HashMap<String, Object> buyInfo = new HashMap<String, Object>();
		
		buyInfo.put("addList", addList);
		buyInfo.put("list", list);
		buyInfo.put("olist", olist);
		buyInfo.put("point", point);
		
		close(con);
		
		return buyInfo;
	}


	public ArrayList<WorkOption> selectOption(int workId) {
		Connection con = getConnection();
		
		ArrayList<WorkOption> olist = new ProDao().selectOption(con, workId);
		
		close(con);
		
		return olist;
	}


	public int insertPoint(int memberId, int point, String pid) {
		Connection con = getConnection();
		
		int result = new ProDao().insertPoint(con, memberId, point, pid);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	public int insertMinusPoint(int mPoint, int memberId, String pid) {
		Connection con = getConnection();
		
		int result = new ProDao().insertMinusPoint(con, mPoint, memberId, pid);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}


	
	//인기순 정렬
	public ArrayList<HashMap<String, Object>> selectProductListPop() {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new ProDao().selectProductListPop(con);
		close(con);
		
		System.out.println("인기순 정렬 Service : " + list);
		return list;
	}

	//낮은가격순 정렬
	public ArrayList<HashMap<String, Object>> selectProductListLow() {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new ProDao().selectProductListLow(con);
		close(con);
		
		System.out.println("낮은가격순 정렬 Service : " + list);
		return list;
		
	}


	//최신순 정렬
	public ArrayList<HashMap<String, Object>> selectProductListNew() {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new ProDao().selectProductListNew(con);
		close(con);
		
		System.out.println("최신순 정렬 Service : " + list);
		return list;
	}


	//높은 가격순 정렬
	public ArrayList<HashMap<String, Object>> selectProductListHigh() {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new ProDao().selectProductListHigh(con);
		close(con);
		
		System.out.println("높은가격순  정렬 Service : " + list);
		return list;
	}


	public ArrayList<HashMap<String, Object>> selectCategoryList(int cid) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String,Object>> list = new ProDao().selectCategoryList(con, cid);
		
		close(con);
		
		return list;
	}


	public ArrayList<HashMap<String, Object>> selectProductListPop(String cid) {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new ProDao().selectProductListPop(con, cid);
		
		close(con);
		
		System.out.println("인기순 정렬 Service : " + list);
		return list;
	}


	public ArrayList<HashMap<String, Object>> selectProductListNew(String cid) {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new ProDao().selectProductListNew(con, cid);
		close(con);

		return list;
	}


	public ArrayList<HashMap<String, Object>> selectProductListLow(String cid) {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new ProDao().selectProductListLow(con, cid);
		close(con);

		return list;
	}


	public ArrayList<HashMap<String, Object>> selectProductListHigh(String cid) {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new ProDao().selectProductListHigh(con, cid);
		close(con);
		
		return list;
	}


	public ArrayList<HashMap<String, Object>> selectPic(int workId) {
		Connection con = getConnection();
		 
		ArrayList<HashMap<String, Object>> wpList = new ProDao().selectPic(con, workId);
		
		close(con);
		
		
		return wpList;
	}


	

}






















