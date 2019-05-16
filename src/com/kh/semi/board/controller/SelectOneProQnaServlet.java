package com.kh.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.ProQnaService;
import com.kh.semi.board.model.vo.ProQna;

/**
 * Servlet implementation class SelectOneProQnaServlet
 */
@WebServlet("/selectOne.bo")
public class SelectOneProQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneProQnaServlet() {
        super();
        // TODO Auto-genewratewd constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		ProQna qna = new ProQnaService().selectOne(num);
		
		String page = "";
		if(qna !=null) {
			page = "views/board/proQnaDetail.jsp";
			System.out.println("서블릿에서");
			System.out.println(qna);
			request.setAttribute("qna", qna);
			request.getRequestDispatcher(page).forward(request, response);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "문의내역 자세히보기 실패!");
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
