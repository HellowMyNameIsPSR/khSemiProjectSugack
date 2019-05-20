package com.kh.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.model.service.adminService;
import com.kh.semi.author.model.vo.Author;
import com.kh.semi.common.QueryMake;


@WebServlet("/selectOneReqMem.ad")
public class selectOneReqMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public selectOneReqMemberServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//입점신청 상세 페이지 보내주기
		String authorName = request.getParameter("authorName");
		
		Author a = new adminService().selectReqMemOne(authorName);
		
		String page = "";
		
		QueryMake qm = new QueryMake();
				
		if(a != null) {
			page = "views/admin/viewReqMemListDetail.jsp";
			request.setAttribute("author", a);			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "입점신청멤버 상세보기 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
		

		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
