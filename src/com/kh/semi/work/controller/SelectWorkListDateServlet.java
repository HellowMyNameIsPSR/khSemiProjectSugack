package com.kh.semi.work.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.work.model.service.WorkService;
import com.kh.semi.work.model.vo.Work;

@WebServlet("/selectDate.wo")
public class SelectWorkListDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectWorkListDateServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wrDate1 = request.getParameter("startDate");
		String wrDate2 = request.getParameter("endDate");
		
		
		ArrayList<Work> list = new WorkService().selectSalesDate(wrDate1, wrDate2);
		
		System.out.println("list : " + list.size());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}































