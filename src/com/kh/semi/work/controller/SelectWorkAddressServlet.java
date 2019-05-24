package com.kh.semi.work.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.work.model.service.WorkService;

@WebServlet("/selectWorkAddress.wo")
public class SelectWorkAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectWorkAddressServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMemberId());
		
		Address address = new WorkService().selectWorkAddress(memberId);
		System.out.println("address : " + address);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(address, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}









