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
 * Servlet implementation class SelectDetailFundingProServlet
 */
@WebServlet("/selectFundingProDetail.pro")
public class SelectDetailFundingProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDetailFundingProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int workId = Integer.parseInt(request.getParameter("workId"));
		
		ArrayList<HashMap<String,Object>> list = new FundingService().selectFundingProDetailList(workId);
		
		
String page ="";
		
		if(list!=null) {
			page = "views/fundingProduct/fundingProductDetail.jsp";
			request.setAttribute("list", list);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "펀딩상품 자세히보기 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)!
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
