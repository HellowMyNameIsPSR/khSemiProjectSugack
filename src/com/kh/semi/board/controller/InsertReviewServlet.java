package com.kh.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		Review rv = new Review();
		rv.setContent(content);
		rv.setStarPoint(star);
		
		System.out.println("InsertReviewServlet에서 rv " + rv);
		
		int result = new ReviewService().insertReview(rv);
		
		
		String page="";
		if(result>0) {
			System.out.println("리뷰 작성 성공: "+result);
			response.sendRedirect("views/product/productDetail.jsp");
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
