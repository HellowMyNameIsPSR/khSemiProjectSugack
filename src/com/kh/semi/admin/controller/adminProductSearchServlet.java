package com.kh.semi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.adminService;
import com.kh.semi.admin.model.vo.SearchProduct;
import com.kh.semi.common.QueryMake;


@WebServlet("/productSearch.ad")
public class adminProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public adminProductSearchServlet() {
        super();
        }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		String productType = request.getParameter("productType");
		String authorName = request.getParameter("authorName");
		String productName = request.getParameter("productName");
		String proStart = request.getParameter("proStart");
		String proLast = request.getParameter("proLast");
		String prov1 = request.getParameter("productValLow");
		String prov2 = request.getParameter("productValHigh");
		if(prov1 != null) {
			prov1 = "0";
			prov2 = "9999999";
		}
		int productValLow = Integer.parseInt(prov1);
		int productValHigh = Integer.parseInt(prov2);
		String jsDay = "1951-01-01";
		String jlDay = "2020-01-01";
		
		java.sql.Date proStartday = null;
		java.sql.Date proLastday = null;
		
		if(proStart.equals("")) {
			proStartday = java.sql.Date.valueOf(jsDay);
		}else {
			proStartday =  java.sql.Date.valueOf(proStart);
		}
		
		if(proLast.equals("")) {
			proLastday =  java.sql.Date.valueOf(jlDay);
		}else {
			proLastday =  java.sql.Date.valueOf(proLast);
		}
		
		SearchProduct sp = new SearchProduct();
		sp.setAuthorName(authorName);
		sp.setProductName(productName);
		sp.setCategory(category);
		sp.setProductValLow(productValLow);
		sp.setProductValHigh(productValHigh);
		sp.setProStart(proStartday);
		sp.setProLast(proLastday);
		sp.setProductType(productType);
		
		System.out.println("서블릿에서 sp값 " + sp);
		
		QueryMake qm = new QueryMake();
		qm.ProductQuery(sp);
		
		
		
		ArrayList<HashMap<String, Object>> list = new adminService().searchProduct(sp);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
