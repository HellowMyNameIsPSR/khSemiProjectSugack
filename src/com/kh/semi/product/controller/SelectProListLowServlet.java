package com.kh.semi.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.product.model.service.ProService;

/**
 * Servlet implementation class SelectProListLowServlet
 */
@WebServlet("/selectProListLow.pro")
public class SelectProListLowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProListLowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		ArrayList<HashMap<String,Object>> list = null;
		
		if(cid == null) {
			list = new ProService().selectProductListLow();
		}else {
			list = new ProService().selectProductListLow(cid);
		}
		
		
		System.out.println("listServlet : "+ list);
		
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/product/products.jsp").forward(request, response);
		}else if (list != null && cid != null){
			request.setAttribute("list", list);
			request.setAttribute("cid", Integer.parseInt(cid));
			request.getRequestDispatcher("views/product/categoryProduct.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "알수없는 오류");
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
