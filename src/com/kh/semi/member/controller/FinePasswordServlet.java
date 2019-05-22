package com.kh.semi.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.wrapper.LoginWrapper;

/**
 * Servlet implementation class FinePasswordServlet
 */
@WebServlet("/passwordFind.me")
public class FinePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String date = request.getParameter("birth");
		Date birth = Date.valueOf(date);
		
		String random = "1234567890abcdefghijklmnopqrstuvwxyz";
		
		
		String randomCode = "";
		for(int i = 0; i <= 10; i++) {
			int num = (int)(Math.random() * random.length()) + 1;
			randomCode += random.substring((num-1), num);
		}
		
		String password = LoginWrapper.getSha512(randomCode);
		Member m = new Member();
		m.setMemberName(name);
		m.setEmail(email);
		m.setBirthDate(birth);
		m.setPassword(password);
		
		int result = new MemberService().findPassword(m, randomCode);
		
		if(result > 0) {
			response.getWriter().print("ok");
		}else {
			response.getWriter().print("fail");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}















