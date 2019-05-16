package com.kh.semi.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.AuthorPageSerview;
import com.kh.semi.board.model.vo.Board;;

/**
 * Servlet implementation class InsertAuthorPageBoardServlet
 */
@WebServlet("/insert.tbo")
public class InsertAuthorPageProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAuthorPageProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String authorTitle =  request.getParameter("author_Title");
		String authorcontent = request.getParameter("author_content");
		
		Board b  = new Board();
		
		b.setTitle(authorTitle);
		b.setContent(authorcontent); 
		
		
		
	 	 int result = new AuthorPageSerview().InsertAuthorPage(b);
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
