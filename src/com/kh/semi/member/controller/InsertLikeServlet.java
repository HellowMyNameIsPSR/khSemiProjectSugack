package com.kh.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.vo.Review;
import com.kh.semi.member.model.service.LikeService;

/**
 * Servlet implementation class InsertLikeServlet
 */
@WebServlet("/insertLike.me")
public class InsertLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberId = Integer.parseInt(request.getParameter("memberId"));
		int workId = Integer.parseInt(request.getParameter("workId"));
		/*int price = Integer.parseInt(request.getParameter("price"));
		int deliPrice = Integer.parseInt(request.getParameter("deliPrice"));*/
		
		int result = new LikeService().insertLike(memberId, workId);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
