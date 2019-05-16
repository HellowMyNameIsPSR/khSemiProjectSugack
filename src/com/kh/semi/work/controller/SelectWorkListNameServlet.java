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

@WebServlet("/selectName.wo")
public class SelectWorkListNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectWorkListNameServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String workName = request.getParameter("workName");
	
		ArrayList<Work> list = new WorkService().selectWorkName(workName);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}




























