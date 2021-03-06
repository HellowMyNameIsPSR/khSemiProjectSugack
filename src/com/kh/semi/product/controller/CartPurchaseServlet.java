package com.kh.semi.product.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.service.ProService;

/**
 * Servlet implementation class CartPurchaseServlet
 */
@WebServlet("/cartPurchaseServlet.pro")
public class CartPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartPurchaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String [] bidArr = request.getParameterValues("select");
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		HashMap<String, Object> hmap = new ProService().selectCartBuyInfo(bidArr, loginUser.getMemberId());

		if(hmap.size() != 0) {
			request.setAttribute("hmap", hmap);
			request.getRequestDispatcher("views/common/purchase.jsp").forward(request, response);;
		}else {
			request.setAttribute("msg", "로그인 하셔야 이용 가능합니다");
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
