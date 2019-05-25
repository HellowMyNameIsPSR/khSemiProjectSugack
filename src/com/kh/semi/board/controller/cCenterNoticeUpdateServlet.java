package com.kh.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.cCenterService;
import com.kh.semi.board.model.vo.Board;

/**
 * Servlet implementation class cCenterNoticeUpdateServlet
 */
@WebServlet("/cCenterNoticeUpdate.bo")
public class cCenterNoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public cCenterNoticeUpdateServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bNo"));
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		System.out.println("받아와버렷지뭐야" + bno + "tt : " + title + "cont" + content);
		
		Board b = new Board();
		b.setBno(bno);
		b.setContent(content);
		b.setTitle(title);
		
		int divison = 10;
		
		
		int result = new cCenterService().updateNotice(b);
		String page = "";
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/ccNoticeBoard.bo?id=" + divison);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 수정 실패 !");
			request.getRequestDispatcher(page).forward(request, response);
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
