package com.kh.semi.work.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.vo.Member;
import com.kh.semi.work.model.service.WorkService;

@WebServlet("/updateDeli.wo")
public class UpdateDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateDeliveryServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMemberId());
		String deliCompany = request.getParameter("deliCompany");
		String invNum = request.getParameter("invNum");
		String deliStatus = request.getParameter("deliStatus");
		String odId = request.getParameter("odId");
		System.out.println(memberId);
		System.out.println(deliCompany);
		System.out.println(invNum);
		System.out.println(deliStatus);
		System.out.println(odId);
				
		int result = new WorkService().updateDeli(memberId, deliCompany, invNum, deliStatus, odId);
		
		String page = "";
		if(result > 0) {
			page = "views/author/manageSale.jsp";
			
			response.sendRedirect(page);
		}else {
			System.out.println("배송 정보 수정실패!!!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
