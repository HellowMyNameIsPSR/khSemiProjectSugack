package com.kh.semi.funding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.funding.model.service.FundingService;
import com.kh.semi.funding.model.vo.Category;

/**
 * Servlet implementation class SelectWorkCategoryServlet
 */
@WebServlet("/selectCategory.fund")
public class SelectWorkCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectWorkCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Category> list = new FundingService().selectCategoryAll();
		String page = "";
		if(list != null) {
			request.setAttribute("categoryList", list);
			page = "views/author/enrollFundingGoods.jsp";
		} else {
			System.out.println("카테고리 검색 실패!");
			request.setAttribute("msg", "카테고리 조회 실패!");
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);;
	} //end method

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
