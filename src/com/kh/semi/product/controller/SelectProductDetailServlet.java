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
import com.kh.semi.work.model.vo.WorkOption;

/**
 * Servlet implementation class SelectProductDetailServlet
 */
@WebServlet("/selectProDetail.pro")
public class SelectProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int workId = Integer.parseInt(request.getParameter("workId"));
		
		ArrayList<HashMap<String,Object>> list = new ProService().selectProductDetailList(workId);
		ArrayList<WorkOption> olist = new ProService().selectOption(workId);
		ArrayList<HashMap<String, Object>> wpList = new ProService().selectPic(workId);
		
		System.out.println("DetailSelectServlet에선 wpList : "+ wpList);
		
		String page ="";
		
		if(list!=null) {
			page = "views/product/productDetail.jsp";
			request.setAttribute("list", list);
			request.setAttribute("olist", olist);
			request.setAttribute("wpList", wpList);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 자세히보기 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub!
		doGet(request, response);
	}

}
