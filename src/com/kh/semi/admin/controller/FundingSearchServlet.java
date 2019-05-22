package com.kh.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.vo.SearchFunding;
import com.kh.semi.admin.model.vo.SearchProduct;

@WebServlet("/fundingSearch.ad")
public class FundingSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public FundingSearchServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SearchFunding sf = new SearchFunding();
		String category = request.getParameter("category");
		String material = request.getParameter("material");
		String sellKeyword = request.getParameter("sellKeyword");
		String searchName = request.getParameter("searchName");
		String minNum = request.getParameter("minNum");
		String maxNum = request.getParameter("maxNum");
		String fundSetDateStart = request.getParameter("fundSetDateStart");
		String fundSetDateLast = request.getParameter("fundSetDateLast");
		String fundLastDateStart = request.getParameter("fundLastDateStart");
		String fundLastDateLast = request.getParameter("fundLastDateLast");
		
		if(minNum.equals("") || maxNum.equals("")) {
			minNum = "0";
			maxNum = "9999999";
		}
		int iMinNum = Integer.parseInt(minNum);
		int iMaxNum = Integer.parseInt(maxNum);
		
		String minDay = "1951-01-01";
		String maxDay = "2020-01-01";
		
		java.sql.Date fundSetDayStart = null;
		java.sql.Date fundSetDayLast = null;
		
		if(fundSetDateStart.equals("")) {
			fundSetDayStart = java.sql.Date.valueOf(minDay);
		}else {
			fundSetDayStart =  java.sql.Date.valueOf(fundSetDateStart);
		}
		
		if(fundSetDateStart.equals("")) {
			fundSetDayStart = java.sql.Date.valueOf(minDay);
		}else {
			fundSetDayStart =  java.sql.Date.valueOf(fundSetDateStart);
		}
		
		
		
		
		sf.setCategory(category);
		sf.setMaterial(material);
		sf.setSellKeyword(sellKeyword);
		sf.setSearchName(searchName);
		sf.setMinNum(iMinNum);
		sf.setMaxNum(iMaxNum);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
