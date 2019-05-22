package com.kh.semi.work.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.work.model.service.WorkService;

@WebServlet("/deleteAuthor.wo")
public class DeleteAutherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteAutherServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMemberId());
		String email = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getEmail());
		String password = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getPassword());
		
		Member m = new Member();
		m.setEmail(email);
		m.setPassword(password);
		m.setMemberId(Integer.parseInt(memberId));
		
		Member loginUser = new WorkService().deleteAuthor(m);
		
		System.out.println("loginUser : " + loginUser);
		if(loginUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect("index.jsp");
		}else {
			System.out.println("오류 찾자FDSAFDS");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}





























