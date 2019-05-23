package com.kh.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.cCenterService;
import com.kh.semi.board.model.vo.Board;


@WebServlet("/ccNoticeBoard.bo")
public class CcenterNoticeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CcenterNoticeBoardServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Board> list = new cCenterService().noticeList();
		
		String page = "";
		
		System.out.println("서블릿들어옴");
		
		if(list != null) {
			page = "views/customerCenter/customerCenterNotice.jsp";
			request.setAttribute("list", list);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회 실패!");
			
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		
		view.forward(request, response);
		
		System.out.println(list);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
