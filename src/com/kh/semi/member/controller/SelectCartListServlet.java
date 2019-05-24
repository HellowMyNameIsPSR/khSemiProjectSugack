package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.vo.Basket;
import com.kh.semi.work.model.vo.WorkOption;

/**
 * Servlet implementation class SelectCartListServlet
 */
@WebServlet("/selectCartList.me")
public class SelectCartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCartListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		ArrayList<HashMap<String, Object>> list = null;
		ArrayList<WorkOption> olist = null;
		
		if(loginUser == null) {
			request.setAttribute("msg", "로그인이 필요합니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}else {
			list = new MemberService().selectCartList(loginUser.getMemberId());			
			olist = new MemberService().selectOptionList(loginUser.getMemberId());
		}
		
		
		if(list != null) {
			request.setAttribute("list", list);
			request.setAttribute("olist", olist);
			request.getRequestDispatcher("views/member/cart.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "장바구니가 비어있습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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















