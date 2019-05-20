package com.kh.semi.author.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.AuthorPageSerview;
import com.kh.semi.board.model.vo.AuthorPageAttachmrnt;
import com.kh.semi.board.model.vo.Board;

/**
 * Servlet implementation class SelectAuthorStoryServlet
 */
@WebServlet("/selectAuthorStory.au")
public class SelectAuthorStoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SelectAuthorStoryServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 작가 스토리 페이지로 연결 
		int memberId = Integer.parseInt(request.getParameter("memberId"));
		
		
		
		System.out.println("서블릿 memberId:"+memberId);
		
		HashMap<String,Object> hmap =new AuthorPageSerview().selectAuthorStory(memberId);
		
		Board b = (Board) hmap.get("board");
		
		System.out.println("hmap:"+hmap);
		ArrayList<AuthorPageAttachmrnt> fileList = (ArrayList<AuthorPageAttachmrnt>) hmap.get("AuthorPageAttachmrnt");
		
		System.out.println("fileList:" +fileList);
		
		
		/*Board b = new AuthorPageSerview().authorStory(memberId);*/
		System.out.println("board"+ b);
		
		String view = "";
		
		if(b != null) {
			view = "views/tour/artistStorey.jsp";
			request.setAttribute("board", b);
			request.setAttribute("fileList",fileList);
		}else {
			
		}
	
		
		request.getRequestDispatcher(view).forward(request, response);
		System.out.println("view값:"+view);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
