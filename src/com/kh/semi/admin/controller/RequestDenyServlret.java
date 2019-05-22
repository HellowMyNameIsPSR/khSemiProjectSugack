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


@WebServlet("/reqDeny.ad")
public class RequestDenyServlret extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public RequestDenyServlret() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String apply1Stat = request.getParameter("apply1Stat");
		String apply2Stat = request.getParameter("apply2Stat");
		 String memberId22 = request.getParameter("memberId");
		 int memberId = Integer.parseInt(memberId22);
		 int result = 0;
		 System.out.println("1차버튼 : " + apply1Stat);
		 System.out.println("2차버튼 : " + apply2Stat);


		if(apply1Stat != null) {
			result = new adminService().reqDeny(apply1Stat, memberId);
		}else {
			result = new adminService().reqDeny2(apply2Stat, memberId);
		}
	
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
