package com.kh.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.adminService;
import com.kh.semi.work.model.service.WorkService;


@WebServlet("/adminUpdateExchange.ad")
public class AdminUpdateExchangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminUpdateExchangeServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String refundStat = request.getParameter("refundStat");
		String refundId = request.getParameter("refundId");
		
		int result = new adminService().updateExchage(refundStat, refundId);
	
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/adminRefund.ad");
		}else {
			System.out.println("배송 정보 수정실패!!!!");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
