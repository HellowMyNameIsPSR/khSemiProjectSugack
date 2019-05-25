package com.kh.semi.funding.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.funding.model.service.FundingService;
import com.kh.semi.funding.model.vo.AuthorAccount;
import com.kh.semi.funding.model.vo.Funding;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class InsertEnroll2FundServlet
 */
@WebServlet("/insertEnroll2.fund")
public class InsertEnroll2FundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertEnroll2FundServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Funding funding = new Funding();
		funding.setWorkId(Integer.parseInt(request.getParameter("workId")));
		funding.setDeliDate(Date.valueOf(request.getParameter("deliDate")));
		funding.setStartDate(Date.valueOf(request.getParameter("fcStart")));
		funding.setFinishDate(Date.valueOf(request.getParameter("fcFinish")));
		funding.setCooperation("N");
		
		//현재 날짜 구하기
		Calendar cal = new GregorianCalendar();
		Date nowDate = new Date(cal.getTimeInMillis());
		
		if(nowDate.compareTo(funding.getStartDate()) == -1) {
			funding.setFundStatus("출시예정");
		} else {
			funding.setFundStatus("진행중");
		}
		System.out.println(funding);
		
		int result = new FundingService().updateFunding(funding);
		if(result > 0) {
			System.out.println("성공!");
			response.sendRedirect("views/author/manageFundGoodsHistory.jsp");
		} else {
			System.out.println("실패!");
			request.setAttribute("msg", "펀딩 작품 추가정보 등록에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} //end method
		
	} //end method

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
