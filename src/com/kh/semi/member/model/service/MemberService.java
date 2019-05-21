package com.kh.semi.member.model.service;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.vo.Basket;
import com.kh.semi.work.model.vo.WorkOption;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

public class MemberService {

	public int insertMember(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con, m);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public Member loginMember(String email, String password) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginMember(con, email, password);
		
		close(con);
		
		return loginUser;
	}

	public Member updateMember(Member m) {
		Connection con = getConnection();
		Member loginUser = null;
		
		int result = new MemberDao().updateMember(con, m);
		
		if(result > 0) {
			commit(con);
			loginUser = new MemberDao().loginMember(con, m.getEmail(), m.getPassword());
		}else {
			rollback(con);
		}
		close(con);
		
		return loginUser;
	}

	public int idCheck(String email) {
		Connection con = getConnection();
		
		int result = new MemberDao().idCheck(con, email);
		
		close(con);
		
		return result;
	}

	public int passwordCheck(String email, String password) {
		Connection con = getConnection();
		
		int result = new MemberDao().passwordCheck(con, email, password);
		
		return result;
	}
	
	public int insertAddress(Address add) {
		Connection con = getConnection();
		int result = 0;
		ArrayList<Address> list = new MemberDao().addressList(con, add.getMemberId());
		
		
		if(list.size() < 3) {
			result = new MemberDao().insertAddress(con, add);
		}else {
			result = -1;
		}
		
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public ArrayList<Address> addressList(int memberId) {
		Connection con = getConnection();
		
		ArrayList<Address> list = new MemberDao().addressList(con, memberId);
		
		close(con);
		
		return list;
	}

	public int deleteAddress(int addressId) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteAddress(con, addressId);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Address selectAddress(int addressId) {
		Connection con = getConnection();
		
		Address add = new MemberDao().selectAddress(con, addressId);
		
		close(con);
		
		
		return add;
	}

	public int updateAddress(Address add) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateAddress(con, add);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectCartList(int memberId) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new MemberDao().selectCartList(con, memberId);
		
		close(con);
		
		return list;
	}

	public int deleteCart(String[] bidArr) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteCart(con, bidArr);
		
		if(result == bidArr.length) {
			commit(con);
			int result2 = new MemberDao().deleteBasketOption(con, bidArr);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int countUpdate(int bid, int count) {
		Connection con = getConnection();
		
		int result = new MemberDao().countUpdate(con, bid, count);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<WorkOption> selectOptionList(int memberId) {
		Connection con = getConnection();
		
		ArrayList<WorkOption> olist = new MemberDao().selectOptionList(memberId, con);
		
		close(con);
		
		return olist;
	}

	public HashMap<String, Object> selectOrderList(int memberId) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		ArrayList<String> bundleList = new MemberDao().selectBundleCode(con, memberId);
		ArrayList<HashMap<String, Object>> orderList = new MemberDao().selectOrderList(con, memberId);
		ArrayList<WorkOption> olist = new MemberDao().selectOptionList(memberId, con);
		
		hmap.put("blist", bundleList);
		hmap.put("orderList", orderList);
		hmap.put("olist", olist);
		
		close(con);
		
		return hmap;
	}


}






























