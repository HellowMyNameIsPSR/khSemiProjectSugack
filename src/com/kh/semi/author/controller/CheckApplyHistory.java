package com.kh.semi.author.controller;

import static com.kh.semi.common.LoginCheck.isLogin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.author.model.service.AuthorService;
import com.kh.semi.author.model.vo.ApplyHistory;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class CheckApplyHistory
 */
@WebServlet("/checkApply.at")
public class CheckApplyHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckApplyHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isLogin = isLogin(request, response);
		String page = "";
		if(isLogin) {
			ArrayList<ApplyHistory> list = 
					new AuthorService()
					.selectOneAuthorApply(((Member) request.getSession().getAttribute("loginUser")).getMemberId());
			System.out.println(list.isEmpty());
			if(!list.isEmpty()) {
				if(!list.get(0).getApplyStat2().equals("승인")) {
					int index = 0;
					for(int i = 0; i < list.size(); i++){
						if(list.get(i).getFileType().equals("브랜드로고")){
							index = i;
						} //end if
					} //end for
					request.setAttribute("index", index);
					request.setAttribute("applyHistory", list);
					page = "views/application/application2.jsp";
					request.getRequestDispatcher(page).forward(request, response);
				} else {
					response.sendRedirect("views/author/authorHome.jsp");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/selectproptype.at");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/selectproptype.at");
		}
	} //end method

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
