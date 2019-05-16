package com.kh.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Address;

/**
 * Servlet implementation class UpdateAddressServlet
 */
@WebServlet("/updateAddress.me")
public class UpdateAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int addressId = Integer.parseInt(request.getParameter("addressId"));
		String addressName = request.getParameter("addressName");
		String postCode = request.getParameter("postCode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		
		String addressAll = postCode + "#" + address + "#" + detailAddress + "#" + extraAddress;
		
		Address add = new Address();
		add.setAddressId(addressId);
		add.setAddressName(addressName);
		add.setAddress(addressAll);
		add.setPhone1(phone1);
		add.setPhone2(phone2);
		
		int result = new MemberService().updateAddress(add);
		
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
