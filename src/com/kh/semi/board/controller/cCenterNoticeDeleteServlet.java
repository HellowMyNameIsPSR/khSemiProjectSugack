package com.kh.semi.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.cCenterService;


@WebServlet("/cCenterNoticeDelete.bo")
public class cCenterNoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public cCenterNoticeDeleteServlet() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bNo"));
		String id = "10";
		int result = new cCenterService().deleteOne(bno);
		String page = "";
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/ccNoticeBoard.bo?id=" + id);
			

		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "삭제 대 실패!");
			request.getRequestDispatcher(page).forward(request, response);
			
		}
		
		System.out.println("bno를 받아옴" + bno);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
