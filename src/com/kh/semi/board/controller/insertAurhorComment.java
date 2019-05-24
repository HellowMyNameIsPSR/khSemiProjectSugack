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
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class insertAurhorComment
 */
@WebServlet("/insertComment.as")
public class insertAurhorComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertAurhorComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		int wrirerId = ((Member)(request.getSession().getAttribute("loginUser"))).getMemberId();
		int  bno = Integer.parseInt(request.getParameter("bno"));
		String Cntent = request.getParameter("content");
		 
		System.out.println(wrirerId);
	    authorComent ac = new authorComent();
	    ac.setWriterId(wrirerId);
	    ac.setBno(bno);
	    ac.setCntent(Cntent);
	    
	    
	    System.out.println(bno);
	    System.out.println("insert 서블릿1" + ac);
	    
	    int result = new AuthorPageSerview().insertauthorComent(ac);
	     
	    
	    String page = "";
	    
	    if(result > 0) {
	         System.out.println("댓글 작성 성공:"+result);
	         response.sendRedirect("comMent.as");
	         
	    } else {
	    	System.out.println("실패:"+result);
	    	request.setAttribute("msg","작성실패");
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
