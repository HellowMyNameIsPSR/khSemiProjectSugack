package com.kh.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.semi.board.model.service.ProQnaService;
import com.kh.semi.board.model.vo.ProQna;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class SelectProQnaServlet
 */
@WebServlet("/selectProQna.bo")
public class SelectProQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member user = (Member)request.getSession().getAttribute("loginUser");
		
		int memberId = user.getMemberId();
		ArrayList<ProQna> list = new ProQnaService().selectList(memberId);
		//System.out.println(list);
		
		String page = "";
		if(list !=null) {
			page ="views/board/boardQna.jsp";
			request.setAttribute("list", list);
			request.getRequestDispatcher(page).forward(request, response);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "문의내역 조회 실패!");
		} 
//		RequestDispatcher view = request.getRequestDispatcher(page);
//		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO A!uto-generated method stub
		doGet(request, response);
	}

}
