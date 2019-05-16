package com.kh.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class LoginMemberServlet
 */
@WebServlet("/login.me")
public class LoginMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(password);
		Member loginUser = null;
		
		int result = new MemberService().idCheck(email);
		int result2 = new MemberService().passwordCheck(email, password);
		
		String page = "";
		String msg = "";
		if(result <= 0) {
			System.out.println("아이디 없음");
			msg = "1";
		}else if(result2 <= 0) {
			System.out.println("비밀번호 틀림");
			msg = "-1";		
		}else {
			loginUser = new MemberService().loginMember(email, password);	
		}
		

		if(loginUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			if(loginUser.getEmail().equals("admin@sg.com")) {
				page = "views/admin/adminHome.jsp";
			} else {
				page = "index.jsp";
			}			
			response.sendRedirect(page);
		}else {
			System.out.println("실패 원인을 찾아라");
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("views/member/memberLoginForm.jsp").forward(request, response);
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
















