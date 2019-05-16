package com.kh.semi.member.model.service;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;
import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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


}






























