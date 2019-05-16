package com.kh.semi.member.controller;

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

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberId = Integer.parseInt(request.getParameter("memberId"));
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String phone = request.getParameter("phone");
		String nickName = request.getParameter("nickName");
		String gender = request.getParameter("gender");
		String birthDate = request.getParameter("birthDate");
		Date birth = null;
		
		if(!birthDate.equals("1999-01-01")) {
			birth = Date.valueOf(birthDate);
		}
		
		if(password != password2) {
			request.setAttribute("msg", "비밀번호와 확인이 일치 하지 않습니다");
			request.getRequestDispatcher("views/member/memberUpdateForm.jsp").forward(request, response);;
		}
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setPassword(password);
		m.setPhone(phone);
		m.setGender(gender);
		m.setBirthDate(birth);
		
		Member loginUser = new MemberService().updateMember(m);
		
		if(loginUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect("views/member/memberUpdateForm.jsp");
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


















