package com.kh.semi.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cCutomerCenterNoticeUpdateServlet
 */
@WebServlet("/cCutomerCenterNoticeUpdate.bo")
public class cCutomerCenterNoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public cCutomerCenterNoticeUpdateServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
				
		
		System.out.println("업데이트 서블릿에서 받았다 bno :" + bno);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
