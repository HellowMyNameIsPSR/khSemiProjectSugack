package com.kh.semi.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.*;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.adminService;
import com.kh.semi.author.model.vo.Author;
import com.kh.semi.common.QueryMake;


@WebServlet("/reqMemList.ad")
public class RequestMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public RequestMemberServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//입점신청 관리 서블릿
		//1. 입점신청 리스트를 가져와서 5건을 먼저 출력
		//2. 신청수, 대기, 승인완료, 승인거부에 대한 건수 출력
		

		System.out.println("데이터 오류를 확인해야함 입점신청 서블릿");
		ArrayList<HashMap<String, Object>> list = new adminService().reqMemList();
		ArrayList<HashMap<String, Object>> total = new adminService().totalList();
		
		String page = "";
		
		System.out.println("받아온 입점 신청값" + list);
		if(list != null) {
			page = "views/admin/viewReqMemList.jsp";
			request.setAttribute("reqMemList", list);
			request.setAttribute("reqTotal", total);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "입점신청 불러오기 오류");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
