package com.kh.semi.funding.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.funding.model.service.FundingService;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.service.ProService;
import com.kh.semi.product.model.vo.Basket;

/**
 * Servlet implementation class FundingPurchaseServlet
 */
@WebServlet("/fundingPurchase.fund")
public class FundingPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FundingPurchaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String workId = request.getParameter("workId");
		String ea = request.getParameter("ea");
		String text = request.getParameter("text");
		
		if(text == null) {
			text = "";
		}
		
		Basket b = new Basket();
		b.setMemberId(loginUser.getMemberId());
		b.setWorkId(Integer.parseInt(workId));
		b.setCount(Integer.parseInt(ea));
		
		int bid = new ProService().insertBasket(b, 0);
		
		if(bid > 0 && text.equals("ajax")) {
			response.getWriter().print("ok");
		}else if(bid > 0){
			response.sendRedirect(request.getContextPath() + "/purchasePage.pro?bid=" + bid);
		}else {
			response.getWriter().print("fail");
		}
		
		System.out.println(workId + ", " + ea);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
