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
 * Servlet implementation class cCenterNoticeSelectServlet
 */
@WebServlet("/cCenterNoticeSelect.bo")
public class cCenterNoticeSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
    public cCenterNoticeSelectServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bNo"));
		
		System.out.println("받아온 게시판 번호" + bno);
		
		Board b = new cCenterService().selectOne(bno);
		
		String page = "";
		
		System.out.println("받아오는 서블릿에서 출력하는 b" + b);
		
		if(b != null) {
			page = "views/customerCenter/cutomerCenterNoticeUpdate.jsp";
			request.setAttribute("b", b);
			
		
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 상세 조회 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
