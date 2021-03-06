package com.kh.semi.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.service.ProService;
import com.kh.semi.product.model.vo.OrderList;
import com.kh.semi.product.model.vo.Payment;

/**
 * Servlet implementation class InsertPaymentServlet
 */
@WebServlet("/insertPayment.pro")
public class InsertPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String pid = request.getParameter("pid");
		String payPrice = request.getParameter("payPrice");
		String payMethod = request.getParameter("payMethod");
		String payStatus = request.getParameter("payStatus");
		String applyNum = request.getParameter("applyNum");
		String bundleCode = request.getParameter("bundleCode");
		String[] bidArr = request.getParameterValues("bidArr");
		String minusPoint = request.getParameter("point");
		int point = (int)(Integer.parseInt(payPrice) * 0.05);
		System.out.println("minusPoint : " + minusPoint);
		if(!minusPoint.equals("") || minusPoint != null) {
			int mPoint = -(Integer.parseInt(minusPoint));
			int result = new ProService().insertMinusPoint(mPoint, loginUser.getMemberId(), pid);
			System.out.println(result);
			if(result > 0) {
				System.out.println("적립금 사용 성공!!!!");
			}
		}
		
		System.out.println(applyNum);
		Payment pay = new Payment();
		pay.setPayId(pid);
		pay.setPayPrice(Integer.parseInt(payPrice));
		pay.setPayMethod(payMethod);
		pay.setPayStatus(payStatus);
		pay.setCardNum(applyNum);
		
		ArrayList<OrderList> oList = new ArrayList<OrderList>();
		for(int i = 0; i < bidArr.length; i++) {
			OrderList list = new OrderList();
			list.setBasketId(Integer.parseInt(bidArr[i]));
			list.setBundleCode(bundleCode);
			list.setPayId(pid);
			oList.add(list);
		}
		
		int result = new ProService().insertPayment(pay, oList);
		
		if(result > 0) {
			int result2 = new ProService().deleteBasket(oList);
			if(result2 > 0) {
				int result3 = new ProService().insertPoint(loginUser.getMemberId(), point, pid);
			}
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
















