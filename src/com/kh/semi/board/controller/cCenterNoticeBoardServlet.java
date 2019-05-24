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
public class cCenterNoticeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public cCenterNoticeBoardServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int divison = Integer.parseInt(request.getParameter("id"));
		
		ArrayList<Board> list = new cCenterService().noticeList(divison);
		
		
		
		String page = "";
		
		
		System.out.println("서블릿들어옴");
		
		if(list != null  && divison == 10) {
			page = "views/customerCenter/customerCenterNotice.jsp";
			request.setAttribute("list", list);
			
		}else if(list != null  && divison == 11){
			page = "views/customerCenter/customerCenterFaqGoods.jsp";
			request.setAttribute("list", list);
			
		}else if(list != null  && divison == 12){
			page = "views/customerCenter/customerCenterFaqOrder.jsp";
			request.setAttribute("list", list);
			
		}else if(list != null  && divison == 13){
			page = "views/customerCenter/customerCenterFaqDeliv.jsp";
			request.setAttribute("list", list);
			
		}else if(list != null  && divison == 14){
			page = "views/customerCenter/customerCenterEvent.jsp";
			request.setAttribute("list", list);
			
		}else if(list != null  && divison == 15){
			page = "views/customerCenter/customerCenterFaqCancel.jsp";
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
