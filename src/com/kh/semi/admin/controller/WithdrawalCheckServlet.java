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
import com.kh.semi.admin.model.vo.SearchMember;
import com.kh.semi.common.QueryMake;


@WebServlet("/withdrawalCheck.ad")
public class WithdrawalCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public WithdrawalCheckServlet() {
        super();
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
		String searchText = request.getParameter("searchText");
		String memberType = request.getParameter("memberType");
		String withdrawalStart = request.getParameter("withdrawalStart");
		String withdrawalLast = request.getParameter("withdrawalLast");
		String withdrawalType = request.getParameter("withdrawalType");
		
		
		java.sql.Date withdrawalDayStart = null;
		java.sql.Date withdrawalDayLast = null;
		String jsDay = "1951-01-01";
		String jlDay = "2020-01-01";
		
		if(withdrawalStart.equals("")) {
			withdrawalDayStart = java.sql.Date.valueOf(jsDay);
		}else {
			withdrawalDayStart =  java.sql.Date.valueOf(withdrawalStart);
		}
		
		if(withdrawalLast.equals("")) {
			withdrawalDayLast =  java.sql.Date.valueOf(jlDay);
		}else {
			withdrawalDayLast =  java.sql.Date.valueOf(withdrawalLast);
		}
		
		
		
		
		SearchMember m = new SearchMember();
		
		m.setSearchText(searchText);
		m.setMemberType(memberType);
		m.setSearchType(searchType);
		m.setWithdrawalDateStart(withdrawalDayStart);
		m.setWithdrawalDateLast(withdrawalDayLast);
		m.setWithdrawalType(withdrawalType);
		
		
		QueryMake qm = new QueryMake();
		
		qm.WithdrawalQuery(m);
		
		ArrayList<SearchMember> list = new adminService().searchWithdrawal(m);
		

		JSONArray result = new JSONArray();
		JSONObject searchMember = null;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("list값 출력" + list);
		
		for(SearchMember sm : list) {
			searchMember = new JSONObject();
			if(sm.getMemberType().equals("W")) {
				searchMember.put("memberType", URLEncoder.encode("작가", "UTF-8"));
			}else {
				searchMember.put("memberType", URLEncoder.encode("일반회원", "UTF-8"));
			}
			searchMember.put("memberName", URLEncoder.encode(sm.getNameText(), "UTF-8"));
			searchMember.put("memberEmail", sm.getEmailText());
			searchMember.put("memberJoinDay", sf.format(sm.getJoinDay()));
			searchMember.put("withdrawalDay", sf.format(sm.getWithdrawalDay()));
			
			result.add(searchMember);
		}
		response.setContentType("application/json");
		new Gson().toJson(result, response.getWriter());
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
