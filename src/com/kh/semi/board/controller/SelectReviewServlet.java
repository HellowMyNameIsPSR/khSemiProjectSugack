package com.kh.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.board.model.dao.ReviewDao;
import com.kh.semi.board.model.service.ReviewService;
import com.kh.semi.board.model.vo.Review;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class SelectReviewServlet
 */
@WebServlet("/selectReview.co")
public class SelectReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member user = (Member)request.getSession().getAttribute("loginUser");
		
		int memberId = user.getMemberId();
		//int workId = Integer.parseInt(request.getParameter("workId"));
		
		ArrayList<Review> reviewList = new ReviewService().selectMyReviewList(memberId);
		
		System.out.println("dao에서 가져왔니?" + reviewList);
		String page="";
		if(reviewList !=null) {
			page ="views/board/boardReview.jsp";
			request.setAttribute("list", reviewList);
			request.getRequestDispatcher(page).forward(request, response);
			
			System.out.println("SelectServlet : "+reviewList);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "리뷰 조회 실패!");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-genedratwed method stub
		doGet(request, response);
	}

}
