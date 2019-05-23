package com.kh.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.semi.board.model.service.FundReviewService;
import com.kh.semi.board.model.service.ReviewService;
import com.kh.semi.board.model.vo.Review;

/**
 * Servlet implementation class SelectAllFundReviewListServlet
 */
@WebServlet("/selectAllFundReview.bo")
public class SelectAllFundReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllFundReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		int workId = Integer.parseInt(request.getParameter("workId"));
		ArrayList<Review> list = new FundReviewService().selectAllReview(workId);
		
		response.setContentType("application/json");
		Gson gson= new GsonBuilder().setDateFormat("yyyy년-MM월-dd일").create();
		gson.toJson(list, response.getWriter());
		System.out.println("서블릿에서 보내주는가" + list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
