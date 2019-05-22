package com.kh.semi.funding.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.funding.model.service.FundingService;

/**
 * Servlet implementation class SelectFundingProServlet
 */
@WebServlet("/selectProFunding.pro")
public class SelectFundingProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFundingProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("펀딩서블릿 진입!");
		ArrayList<HashMap<String,Object>> list = new FundingService().selectFundingProList();
		System.out.println("SelectFunding서블릿: "+list);
		String page ="";
		
		
		
		
		
		
		
	
		if(list!=null) {
			page = "views/fundingProduct/fundingProducts.jsp";
			request.setAttribute("list", list);
		
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품게시판 조회 실패!");
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
