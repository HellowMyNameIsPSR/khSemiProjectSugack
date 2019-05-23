package com.kh.semi.work.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.work.model.service.WorkService;
import com.kh.semi.work.model.vo.PageInfo;
import com.kh.semi.work.model.vo.Work;

@WebServlet("/selectDate.wo")
public class SelectWorkListDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectWorkListDateServlet() {}
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int currentPage;		//현재페이지를 표시할 변수
		int limit;				//현 페이지에 게시글이 몇개 보여질건지
		int maxPage;			//전체 페이지에서 가장 마지막 페이지
		int startPage;			//한번에 표시될 페이지가 시작할 페이지
		int endPage;			//한번에 표시될 페이지가 끝나는 페이지
		
		String memberId = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMemberId());
		String wrDate1 = request.getParameter("startDate");
		String wrDate2 = request.getParameter("endDate");
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new WorkService().getDateCount(memberId, wrDate1, wrDate2);
		
		maxPage = (int)((double)listCount/limit + 0.9);
		
		startPage = (((int)((double)currentPage / limit + 0.9)) -1) * 10 + 1;
		
		endPage = startPage + 10 -1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		ArrayList<HashMap<String, Object>> list = new WorkService().selectSalesDate(pi, memberId, wrDate1, wrDate2);
		
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("list", list);
	    hmap.put("pi", pi);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(hmap, response.getWriter());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}































