package com.kh.semi.work.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.vo.Member;
import com.kh.semi.work.model.service.WorkService;
import com.kh.semi.work.model.vo.PageInfo;

@WebServlet("/selectExchangeList.wo")
public class SelectExchangeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectExchangeListServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;		//현재페이지를 표시할 변수
		int limit;				//현 페이지에 게시글이 몇개 보여질건지
		int maxPage;			//전체 페이지에서 가장 마지막 페이지
		int startPage;			//한번에 표시될 페이지가 시작할 페이지
		int endPage;			//한번에 표시될 페이지가 끝나는 페이지
		
		String memberId = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMemberId());
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new WorkService().exchangeListCount(memberId);
		
		maxPage = (int)((double)listCount/limit + 0.9);
		
		startPage = (((int)((double)currentPage / limit + 0.9)) -1) * 10 + 1;
		
		endPage = startPage + 10 -1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		ArrayList<HashMap<String, Object>> list = new WorkService().selectExchangeList(pi, memberId);
		
		String page = "";
		if(list != null) {
			page="views/author/manageSaleExchange.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			System.out.println("오류 찾자");
		}
		request.getRequestDispatcher(page).forward(request, response);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
















