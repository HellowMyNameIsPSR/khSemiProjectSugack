package com.kh.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.cCenterService;
import com.kh.semi.board.model.vo.Board;


@WebServlet("/cCenterNoticeWrite.bo")
public class cCenterNoticeWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public cCenterNoticeWriteServlet() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String writeDate = request.getParameter("date");
		String btype = request.getParameter("bType");
		int divison = Integer.parseInt(btype);
		
		Board b = new Board();
		
		java.sql.Date writeDay = null;
		writeDay = java.sql.Date.valueOf(writeDate);
		
		b.setTitle(title);
		b.setContent(content);
		b.setDivision(divison);
		b.setWriteDate(writeDay);
		
		int result = new cCenterService().insertBoard(b);
		
		String view = "";
		
		if(result > 0) {
			System.out.println("공지사항 성공!!!!");
			
			response.sendRedirect("ccNoticeBoard.bo?id=" + divison);
					
		}else {
			request.setAttribute("msg", "게시글 작성 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
