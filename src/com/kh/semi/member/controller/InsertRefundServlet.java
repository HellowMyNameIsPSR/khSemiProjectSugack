package com.kh.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Refund;

/**
 * Servlet implementation class InsertRefundServlet
 */
@WebServlet("/inserRefund.me")
public class InsertRefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRefundServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oid = request.getParameter("oid");
		String text = request.getParameter("text");
		
		Refund ref = new Refund();
		ref.setOdId(Integer.parseInt(oid));
		ref.setReason(text);
		
		int result = new MemberService().insertRefund(ref);
		
		if(result > 0) {
			response.getWriter().print("ok");			
		}else {
			response.getWriter().print("fail");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
