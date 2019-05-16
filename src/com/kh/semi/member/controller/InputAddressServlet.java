package com.kh.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class InputAddressServlet
 */
@WebServlet("/inputAddress.me")
public class InputAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InputAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postCode = request.getParameter("postCode");
		String addressName = request.getParameter("addressName");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String addressType = "";
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
//		if(m.getMemberType().equals("N")) {
//			
//		}else if(m.getMemberType().equals("S")) {
//			
//		}
		
		
		if(detailAddress == null) {
			detailAddress = "";
		}
		
		System.out.println(address + detailAddress + extraAddress);
		
		Address add = new Address();
		add.setAddressName(addressName);
		add.setAddress(postCode + "#" + address + "#" + detailAddress + "#" + extraAddress);
		add.setPhone1(phone1);
		add.setPhone2(phone2);
		add.setMemberId(m.getMemberId());
		
		int result = new MemberService().insertAddress(add);
		
		if(result > 0) {
			response.getWriter().print("ok");
		}else if(result < 0){
			response.getWriter().print("manyAddress");
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
