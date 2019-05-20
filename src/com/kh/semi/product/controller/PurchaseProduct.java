package com.kh.semi.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.service.ProService;
import com.kh.semi.product.model.vo.Basket;

/**
 * Servlet implementation class PurchaseProduct
 */
@WebServlet("/purchase.pro")
public class PurchaseProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseProduct() {
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
		
		System.out.println(ea + " " + workId + " ");
		
		Basket basket = new Basket();
		basket.setCount(Integer.parseInt(ea));
		basket.setWorkId(Integer.parseInt(workId));
		basket.setMemberId(loginUser.getMemberId());
		basket.setOpId(0);
		
		int bid = new ProService().insertBasket(basket);
		
		if(bid > 0 && text.equals("ajax")) {
			response.getWriter().print("ok");
		}else if(bid > 0){
			response.sendRedirect(request.getContextPath() + "/purchasePage.pro?bid=" + bid);
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















