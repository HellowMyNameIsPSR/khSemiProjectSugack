package com.kh.semi.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.AuthorPageSerview;
import com.kh.semi.board.model.vo.AuthorPageAttachmrnt;
import com.kh.semi.board.model.vo.AuthorWorkList;
import com.kh.semi.board.model.vo.AuthorWorkPic;

/**
 * Servlet implementation class SelectAuthorpdListServlet
 */
@WebServlet("/selectAuthorPDLIst.au")
public class SelectAuthorpdListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAuthorpdListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int memberId  =Integer.parseInt(request.getParameter("memberId")); 
		
		
		ArrayList<HashMap<String, Object>>list = new AuthorPageSerview().selectAuthorPdList(memberId);
		
		/*AuthorWorkList w = (AuthorWorkList) hmap.get("AuthorWorkList");
		
		ArrayList<AuthorWorkPic> fileList = (ArrayList<AuthorWorkPic>) hmap.get("AuthorWorkPic");
	*/	
	/*	System.out.println("작품리스트 사진" +fileList );
		
		System.out.println("작품리스트 리스트" + w);
	*/	
		
		
		
		String view =""; 
		
		if(list != null) {
			view = "views/tour/proDuct.jsp";
			request.setAttribute("list", list);
		
		}else {
			
		}
		
		request.getRequestDispatcher(view).forward(request, response);
		
		System.out.println("view값:" +view);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
