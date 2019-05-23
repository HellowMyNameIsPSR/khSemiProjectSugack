package com.kh.semi.admin.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.semi.admin.model.service.adminService;
import com.kh.semi.admin.model.vo.SearchFunding;
import com.kh.semi.common.QueryMake;

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
		int fundMinNum = Integer.parseInt(minNum);
		int fundMaxNum = Integer.parseInt(maxNum);
		
		String minDay = "1951-01-01";
		String maxDay = "2020-01-01";
		
		java.sql.Date fundSetDayStart = null;
		java.sql.Date fundSetDayLast = null;
		java.sql.Date fundLastDayStart = null;
		java.sql.Date fundLastDayLast = null;
		
		if(fundSetDateStart.equals("")) {
			fundSetDayStart = java.sql.Date.valueOf(minDay);
		}else {
			fundSetDayStart =  java.sql.Date.valueOf(fundSetDateStart);
		}
		
		if(fundSetDateLast.equals("")) {
			fundSetDayLast = java.sql.Date.valueOf(maxDay);
		}else {
			fundSetDayLast =  java.sql.Date.valueOf(fundSetDateLast);
		}
		
		if(fundLastDateStart.equals("")) {
			fundLastDayStart = java.sql.Date.valueOf(minDay);
		}else {
			fundLastDayStart =  java.sql.Date.valueOf(fundLastDateStart);
		}
		
		if(fundLastDateLast.equals("")) {
			fundLastDayLast = java.sql.Date.valueOf(maxDay);
		}else {
			fundLastDayLast =  java.sql.Date.valueOf(fundLastDateLast);
		}
		
		
		
		sf.setCategory(category);
		sf.setMaterial(material);
		sf.setSellKeyword(sellKeyword);
		sf.setSearchName(searchName);
		sf.setFundSetDateStart(fundSetDayStart);
		sf.setFundSetDateLast(fundSetDayLast);
		sf.setFundLastDateStart(fundLastDayStart);
		sf.setFundLastDateLast(fundLastDayLast);
		sf.setMinNum(fundMinNum);
		sf.setMaxNum(fundMaxNum);
		
		QueryMake qm = new QueryMake();
		qm.fundingQuery(sf);
		
		ArrayList<SearchFunding> list = new adminService().searchFunding(sf);
		
		JSONArray result = new JSONArray();
		JSONObject SearchFunding = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		for(SearchFunding sff : list) {
			SearchFunding = new JSONObject();
				
			SearchFunding.put("searchName", URLEncoder.encode(sff.getSearchName(), "UTF-8"));
			SearchFunding.put("authorName", URLEncoder.encode(sff.getAuthorName(), "UTF-8"));
			SearchFunding.put("material", URLEncoder.encode(sff.getMaterial(), "UTF-8"));
			SearchFunding.put("category", URLEncoder.encode(sff.getCategory(), "UTF-8"));
			SearchFunding.put("workName", URLEncoder.encode(sff.getSearchName(), "UTF-8"));
			SearchFunding.put("fundStarDay", sdf.format(sff.getResultFundDate()));
			SearchFunding.put("fundLastDay", sdf.format(sff.getResultFundLastDate()));
			SearchFunding.put("process", sff.getResultNum());
			
			
			result.add(SearchFunding);
		
			}
			response.setContentType("application/json");
			new Gson().toJson(result, response.getWriter());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
