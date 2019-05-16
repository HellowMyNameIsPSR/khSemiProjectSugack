package com.kh.semi.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.vo.Member;

public class LoginCheck { //로그인 상태 확인!
	public static final int LOGIN_NO = -1;
	
	public static boolean isLogin(HttpServletRequest request, HttpServletResponse response) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		if(loginUser != null) { //만약 Login된 상태라면?
			return true;
		} else { //만약 Logout 된 상태라면?
			return false;
		} //end if		
	} //end method
	
} //end class
