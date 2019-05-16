package com.kh.semi.author.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.author.model.vo.Author;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class InsertAuthorServlet
 */
@WebServlet("/insertAuthor.at")
public class InsertAuthorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAuthorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터 값 가져오기
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int memberId = loginUser.getMemberId();
		//String memberName = loginUser.getMemberName(); //작가 테이블 저장시 이름 필요 없음
		//String email = loginUser.getEmail(); 작가 테이블 저장시 이메일 필요 없음
		String brandName = request.getParameter("brandName");
		String comments = request.getParameter("comments");
		String selectPType = request.getParameter("selectPType");
		System.out.println(memberId);
		System.out.println(brandName);
		System.out.println(comments);
		System.out.println(selectPType);
		
		//작가 테이블에 저장
		Author author = new Author();
		author.setMemberId(memberId);
		author.setBrandName(brandName);
		author.setApplyContent(comments);
		
		
		
		//int resultAuthor = new AuthorService();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
