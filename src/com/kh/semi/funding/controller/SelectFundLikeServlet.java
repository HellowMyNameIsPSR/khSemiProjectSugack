package com.kh.semi.funding.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.funding.model.service.FundingService;

/**
 * Servlet implementation class SelectFundLikeServlet
 */
@WebServlet("/selectFundLike.fund")
public class SelectFundLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFundLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  int memberId = Integer.parseInt(request.getParameter("mid"));
	      ArrayList<HashMap<String,Object>> list = new FundingService().selectLikeList(memberId);
	      System.out.println("펀딩 좋아요 리스트: "+list);
	      String page="";
	      
	      if(list.size() > 0) {
	         page = "views/board/likeFundingPro.jsp";
	         request.setAttribute("list", list);
	         request.getRequestDispatcher(page).forward(request, response);
	         
	      }else {
	      
	         request.setAttribute("msg", "등록된 관심상품이 없습니다!");
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
