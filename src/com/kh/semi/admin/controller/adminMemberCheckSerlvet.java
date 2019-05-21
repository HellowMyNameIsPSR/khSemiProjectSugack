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
import com.kh.semi.work.model.service.WorkService;
import com.kh.semi.work.model.vo.PageInfo;



@WebServlet("/memberCheck.ad")
public class adminMemberCheckSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public adminMemberCheckSerlvet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*int currentPage;		//현재페이지를 표시할 변수
		int limit;				//현 페이지에 게시글이 몇개 보여질건지
		int maxPage;			//전체 페이지에서 가장 마지막 페이지
		int startPage;			//한번에 표시될 페이지가 시작할 페이지
		int endPage;			//한번에 표시될 페이지가 끝나는 페이지
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new adminService().getListCount(memberId);
		
		maxPage = (int)((double)listCount/limit + 0.9);
		
		startPage = (((int)((double)currentPage / limit + 0.9)) -1) * 10 + 1;
		
		endPage = startPage + 10 -1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}*/
		
		/*PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);*/
		
		String searchType = request.getParameter("searchType");
		String searchText = request.getParameter("searchText");
		String memberType = request.getParameter("memberType");
		String joinStart = request.getParameter("joinStart");
		String joinLast = request.getParameter("joinLast");
		String birthDateStart = request.getParameter("birthDateStart");
		String birthDateLast = request.getParameter("birthDateLast");
		String gender = request.getParameter("gender");
	
		
		java.sql.Date joinStartday = null;
		java.sql.Date joinLastday = null;
		java.sql.Date birthDayStart = null;
		java.sql.Date birthDayLast = null;
		String jsDay = "1951-01-01";
		String jlDay = "2020-01-01";
		
		if(joinStart.equals("")) {
			joinStartday = java.sql.Date.valueOf(jsDay);
		}else {
			joinStartday =  java.sql.Date.valueOf(joinStart);
		}
		
		if(joinLast.equals("")) {
			joinLastday =  java.sql.Date.valueOf(jlDay);
		}else {
			joinLastday =  java.sql.Date.valueOf(joinLast);
		}
		if(birthDateStart.equals("")) {
			birthDayStart = java.sql.Date.valueOf(jsDay);
		}else {
			birthDayStart = java.sql.Date.valueOf(birthDateStart);
		}
		if(birthDateLast.equals("")) {
			birthDayLast = java.sql.Date.valueOf(jlDay);
		}else {
			birthDayLast = java.sql.Date.valueOf(birthDateLast);
		}

		
		
		SearchMember m = new SearchMember();
		
		
		m.setSearchText(searchText);
		m.setMemberType(memberType);
		m.setSearchType(searchType);
		m.setJoinStart(joinStartday);
		m.setJoinLast(joinLastday);
		m.setBirthDateStart(birthDayStart);
		m.setBirthDateLast(birthDayLast);
		m.setGender(gender);
		
		
		QueryMake qm = new QueryMake(m);
		
		
		ArrayList<SearchMember> list = new adminService().searchMember(m);
		
		JSONArray result = new JSONArray();
		JSONObject searchMember = null;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		for(SearchMember sm : list) {
			searchMember = new JSONObject();
			
			if(sm.getMemberType().equals("W")) {
				searchMember.put("memberType", URLEncoder.encode("작가", "UTF-8"));
			}else {
				searchMember.put("memberType", URLEncoder.encode("일반회원", "UTF-8"));
			}
			if(sm.getGender().equals("M")) {
				searchMember.put("memberGender", URLEncoder.encode("남자", "UTF-8"));
			}else {
				searchMember.put("memberGender", URLEncoder.encode("여자", "UTF-8"));
			}
			
			searchMember.put("memberName", URLEncoder.encode(sm.getNameText(), "UTF-8"));
			searchMember.put("memberEmail", sm.getEmailText());
			searchMember.put("memberJoinDay", sf.format(sm.getJoinDay()));
			searchMember.put("memberBirthDay", sf.format(sm.getBirthDay()));
			
			
			
			result.add(searchMember);
		}
	
		
		response.setContentType("application/json");
		new Gson().toJson(result, response.getWriter());
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
