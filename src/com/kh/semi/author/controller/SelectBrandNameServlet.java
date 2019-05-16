package com.kh.semi.author.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.author.model.service.AuthorService;
import static com.kh.semi.common.LoginCheck.*;
/**
 * Servlet implementation class SelectBrandNameServlet
 */
@WebServlet("/selectBName.at")
public class SelectBrandNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectBrandNameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//입력한 브랜드명 가져오기brandNameCheckResult
		String brandName = request.getParameter("brandName");
		
		//비즈니스 로직 작성
		boolean isLogin = isLogin(request, response);
		int result = 0;
		if(isLogin) {
			result = new AuthorService().selectBrandName(brandName);
		} else {
			result = LOGIN_NO;
		}
		response.getWriter().print(result);
	} // method

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
