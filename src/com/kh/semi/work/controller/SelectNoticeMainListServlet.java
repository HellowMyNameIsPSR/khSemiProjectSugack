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
import com.kh.semi.board.model.service.cCenterService;
import com.kh.semi.board.model.vo.Board;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.work.model.service.WorkService;
import com.kh.semi.work.model.vo.PageInfo;

@WebServlet("/selectNoticeMainList.wo")
public class SelectNoticeMainListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectNoticeMainListServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int divison = 10;
		
		ArrayList<Board> list = new cCenterService().noticeList(divison);
		int limit;
		
		limit = 6; 
		
		PageInfo pi = new PageInfo(limit, limit, limit, limit, limit);
		System.out.println("공지사항 : " + list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
