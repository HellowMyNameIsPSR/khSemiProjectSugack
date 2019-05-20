package com.kh.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.semi.board.model.service.ReviewService;
import com.kh.semi.board.model.vo.Review;

/**
 * Servlet implementation class InsertReviewServlet
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
		String content = request.getParameter("content");
		String star = request.getParameter("star");
		int workId = Integer.parseInt(request.getParameter("workId"));
		String writer = request.getParameter("writer");
		
		
		Review rv = new Review();
		rv.setContent(content);
		rv.setStarPoint(star);
		rv.setWorkId(workId);
		rv.setWriter(writer);
		
		
		System.out.println("InsertReviewServlet에서 rv " + rv);
		
		int result = new ReviewService().insertReview(rv);	
		
		String page="";
		if(result>0) {
			System.out.println("리뷰 작성 성공: "+result);
			response.sendRedirect(request.getServletContext() + "/selectReview.co?workId=" + workId);
			
			//response.sendRedirect("selectProDetail.pro");
			
			/*response.setContentType("application/json");
			
			new Gson().toJson(rv,response.getWriter());*/
		}else {
			System.out.println("리뷰 작성 실패: "+result);
			request.setAttribute("msg", "리뷰 작성 실패!");
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
