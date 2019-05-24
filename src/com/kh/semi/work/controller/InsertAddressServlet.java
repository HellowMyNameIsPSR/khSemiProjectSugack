package com.kh.semi.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.work.model.service.WorkService;

@WebServlet("/insertAddress.wo")
public class InsertAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertAddressServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postCode = request.getParameter("postCode");
		String addressName = request.getParameter("addressName");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
	
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		if(detailAddress == null) {
			detailAddress = "";
		}
	
		System.out.println(address + detailAddress);
	
		Address add = new Address();
		add.setAddressName(addressName);
		add.setAddress(postCode + "#" + address + "#" + detailAddress);
		add.setPhone1(phone1);
		add.setPhone2(phone2);
		add.setMemberId(m.getMemberId());
		
		int result = new WorkService().insertAddress(add);
		
		if(result > 0) {
			response.getWriter().print("ok");
		}else if(result < 0){
			response.getWriter().print("manyAddress");
		}else {
			response.getWriter().print("fail");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
