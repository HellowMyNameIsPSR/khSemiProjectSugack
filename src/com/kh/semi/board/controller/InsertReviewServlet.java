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
import com.kh.semi.board.model.service.ReviewService;
import com.kh.semi.board.model.vo.Review;

/**
 * Servlet implementation class InsertReviewServlet!
 */
@WebServlet("/insertReview.bo")




public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
        super();
        // TODO Autow-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		String content = request.getParameter("content");
		String star = request.getParameter("star");
		int workId = Integer.parseInt(request.getParameter("workId"));
		int writer = Integer.parseInt(request.getParameter("writer"));
		//String writer = request.getParameter("writer");
		//System.out.println("writer: "+writer);
		//String name = request.getParameter("name");
		
		Review rv = new Review();
		rv.setContent(content);
		rv.setStarPoint(star);
		rv.setWorkId(workId);
		rv.setWriterId(writer);
		
		//rv.setName(name);
		
		System.out.println("InsertReviewServlet에서 rv " + rv);
		
		ArrayList<Review> reviewList = new ReviewService().insertReviewList(rv);
		
		//request.setAttribute("reviewList", reviewList);
		//int result = new ReviewService().insertReview(rv);	
		
		/*String page="";
		if(result>0) {
			System.out.println("리뷰 작성 성공: "+result);
			//page=""
			//request.setAttribute("rv", rv);
			//response.sendRedirect(request.getServletContext() + "/selectReview.co?workId=" + workId);
			
			//response.sendRedirect("selectProDetail.pro");
			
			response.setContentType("application/json");
			
			new Gson().toJson(rv,response.getWriter());
		}else {
			System.out.println("리뷰 작성 실패: "+result);
			request.setAttribute("msg", "리뷰 작성 실패!");
		}*/
		response.setContentType("application/json");
		System.out.println("ajax로 보내주나요 : "+reviewList);
		/*Gson gson=  new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ssZ").create();
		new Gson().toJson(reviewList,response.getWriter()); */
		
		Gson gson=  new GsonBuilder().setDateFormat("yyyy년-MM월-dd일").create();
		gson.toJson(reviewList,response.getWriter());
		//new Gson().toJson(reviewList,response.getWriter()); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
