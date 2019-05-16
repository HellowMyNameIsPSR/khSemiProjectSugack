package com.kh.semi.author.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.author.model.service.AuthorService;
import com.kh.semi.author.model.vo.ProType;

/**
 * Servlet implementation class SelectAuthorTypeListServlet
 */
@WebServlet("/selectproptype.at")
public class SelectAuthorTypeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAuthorTypeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ProType> list = new AuthorService().selectProTypeList();
		String page = "";
		if(list != null) {
			page = "views/application/appIntroduce.jsp";
			request.setAttribute("pTypeList", list);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "작가유형 가져오기 오류");
		}
		request.getRequestDispatcher(page).forward(request, response);
	} //end method

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
