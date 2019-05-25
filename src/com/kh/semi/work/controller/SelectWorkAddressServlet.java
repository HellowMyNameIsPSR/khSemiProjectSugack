package com.kh.semi.work.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
		
		JSONObject add = new JSONObject();
		
		String add0 = address.getAddress();
		String add1 = add0.split("#")[0];
		String add2 = add0.split("#")[1];
		String add3 = add0.split("#")[2];
		String add4 = add0.split("#")[3];
		
		add.put("add1", add1);
		add.put("add2", add2);
		add.put("add3", add3);
		add.put("add4", add4);
		add.put("phone1", address.getPhone1());
		add.put("phone2", address.getPhone2());
		add.put("addressName", address.getAddressName());
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(add, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}









