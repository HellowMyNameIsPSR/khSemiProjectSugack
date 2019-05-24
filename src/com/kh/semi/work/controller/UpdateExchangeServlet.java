package com.kh.semi.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.work.model.service.WorkService;
import com.kh.semi.work.model.vo.Work;

@WebServlet("/updateExchange.wo")
public class UpdateExchangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateExchangeServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String refundStat = request.getParameter("refundStat");
		String refundId = request.getParameter("refundId");
		
		int result = new WorkService().updateExchage(refundStat, refundId);
	
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectExchangeList.wo");
		}else {
			System.out.println("배송 정보 수정실패!!!!");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}






















