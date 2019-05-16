package com.kh.semi.author.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.author.model.service.AuthorService;
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
		int resultAuthor = new AuthorService().insertAuthor(author);
		if(resultAuthor > 0) { //저장에 성공 했을 때
			//작가 유형 저장하기
			System.out.println("작가 정보 저장 성공!");
			int resultAuthorType = new AuthorService().insertAuthorType(memberId, selectPType);
			if(resultAuthorType > 0) {
				response.sendRedirect("views/application/application2.jsp");
			} else {
				request.setAttribute("msg", "작가 유형 정보 저장 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		} else {
			//에러 페이지로 보내기
			request.setAttribute("msg", "작가 정보 저장 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			//System.out.println("작가 정보 저장 실패!");
		}
		
		
		
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
