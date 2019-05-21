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
		String brandName = request.getParameter("brandName");
		
		System.out.println("apply상태 : " + apply1Stat);
		System.out.println("brandName : " + brandName);
		
		int result = new adminService().reqDeny(apply1Stat, brandName);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
