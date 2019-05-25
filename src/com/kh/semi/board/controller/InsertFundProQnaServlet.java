package com.kh.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.FundProQnaService;
import com.kh.semi.board.model.vo.ProQna;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class InsertFundProQnaServlet
 */
@WebServlet("/insertFundProQna.bo")
public class InsertFundProQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFundProQnaServlet() {
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int workId = Integer.parseInt(request.getParameter("workId"));
		
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		int writer = ((Member)(request.getSession().getAttribute("loginUser"))).getMemberId();
	
		
		ProQna qna  = new ProQna();
		qna.setcategory(category);
		qna.setContent(content);
		qna.setMid(writer);
		qna.setWorkId(workId);

		
		int result = new FundProQnaService().insertProQna(qna);
		
		String page = "";
		
		if(result>0) {
			
			System.out.println("Q&A작성 성공!!!!: "+result);
			
			response.sendRedirect("selectProQna.bo");
			
		}else {
			System.out.println("실패: "+result);
			request.setAttribute("msg", "문의 작성 실패!");
			   
		
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
