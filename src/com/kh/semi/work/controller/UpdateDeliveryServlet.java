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
		int invNum = Integer.parseInt(request.getParameter("invNum"));
		String deliStatus = request.getParameter("deliStatus");
		String odId = request.getParameter("odId");
		
				
		int result = new WorkService().updateDeli(memberId, deliCompany, invNum, deliStatus, odId);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectOrderList.wo");
		}else {
			System.out.println("배송 정보 수정실패!!!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
