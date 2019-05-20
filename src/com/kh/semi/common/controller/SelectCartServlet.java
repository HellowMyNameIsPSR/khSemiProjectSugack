package com.kh.semi.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.model.vo.Cart;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.service.ProService;

/**
 * Servlet implementation class SelectCartServlet
 */
@WebServlet("/selectCart.basket")
public class SelectCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int wid = Integer.parseInt(request.getParameter("workId"));
		
		ArrayList<Cart> result = new ProService().insertCart(loginUser, wid);
		
		String page = "";
		if(result!=null) {
			
			page = "views/member/cart.jsp";
			request.setAttribute("cartList", result);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "장바구니 담기 실패!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
