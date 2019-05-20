package com.kh.semi.work.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.work.model.service.WorkService;

@WebServlet("/selectImgList.wo")
public class SelectImageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectImageListServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<HashMap<String, Object>> list = 
				new WorkService().selectImageList();
		
		String page = "";
		if(list != null) {
			page = "views/main/mainPage.jsp";
			request.setAttribute("list", list);
		}else {
			System.out.println("리스트 못뽑았따!!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}















