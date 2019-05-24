package com.kh.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.AuthorPageSerview;
import com.kh.semi.board.model.vo.authorComent;

/**
 * Servlet implementation class comMentServlet
 */
@WebServlet("/comMent.as")
public class SelectCommtntListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCommtntListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int  bno = Integer.parseInt(request.getParameter("bno"));
		int num = 0 ;
		ArrayList<authorComent> list = new AuthorPageSerview().SelectAuthorComent(bno);
		
		
		System.out.println("작가댓글 서블릿:" +bno); 
		
		
		System.out.println("댓글 서블릿 list" + list);
		
		
		
		/*String Page= "views/tour/comMent.jsp";
		
		 request.setAttribute("bno", bno);
		 request.getRequestDispatcher(Page).forward(request, response);*/
		
		if(list != null) {
			request.setAttribute("list",list );
			
			request.getRequestDispatcher("views/tour/comMent.jsp").forward(request, response);;	
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
