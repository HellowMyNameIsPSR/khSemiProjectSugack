package com.kh.semi.admin.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
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
		SearchProduct sp = new SearchProduct();
		String category = request.getParameter("category");
		String productType = request.getParameter("productType");
		String authorName = request.getParameter("authorName");
		String productName = request.getParameter("productName");
		String proStart = request.getParameter("proStart");
		String proLast = request.getParameter("proLast");
		String prov1 = request.getParameter("productValLow");
		String prov2 = request.getParameter("productValHigh");
	
		
		if(prov1.equals("") || prov2.equals("")) {
			prov1 = "0";
			prov2 = "9999999";
		}
		int productValLow = Integer.parseInt(prov1);
		int productValHigh = Integer.parseInt(prov2);
		sp.setProductValLow(productValLow);
		sp.setProductValHigh(productValHigh);
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
		
	
		sp.setAuthorName(authorName);
		sp.setProductName(productName);
		sp.setCategory(category);

		sp.setProStart(proStartday);
		sp.setProLast(proLastday);
		sp.setMaterial(productType);
		
		System.out.println("서블릿에서 sp값 " + sp);
		
		QueryMake qm = new QueryMake();
		qm.ProductQuery(sp);
		
		
		
		ArrayList<SearchProduct> list = new adminService().searchProduct(sp);
		
		JSONArray result = new JSONArray();
		JSONObject SearchProduct = null;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		
		for(SearchProduct sm : list) {
			SearchProduct = new JSONObject();
				
			SearchProduct.put("productName", URLEncoder.encode(sm.getProductName(), "UTF-8"));
			SearchProduct.put("authorName", URLEncoder.encode(sm.getAuthorName(), "UTF-8"));
			SearchProduct.put("material", URLEncoder.encode(sm.getMaterial(), "UTF-8"));
			SearchProduct.put("category", URLEncoder.encode(sm.getCategory(), "UTF-8"));
			SearchProduct.put("price", sm.getProductValue());
			SearchProduct.put("productDate", sf.format(sm.getProDateResult()));
			
			
			
			result.add(SearchProduct);
		}
		System.out.println("JSON에 갈 result"+result);
	
		
		response.setContentType("application/json");
		new Gson().toJson(result, response.getWriter());
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
