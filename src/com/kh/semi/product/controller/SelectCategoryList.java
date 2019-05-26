package com.kh.semi.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.product.model.service.ProService;

/**
 * Servlet implementation class SelectCategoryList
 */
@WebServlet("/selectCategoryList.pro")
public class SelectCategoryList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCategoryList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		ArrayList<HashMap<String,Object>> list = new ProService().selectCategoryList(cid);
		
		String page ="";
		
		if(list!=null) {
			page = "views/product/categoryProduct.jsp";
			request.setAttribute("list", list);
			request.setAttribute("cid", cid);
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
