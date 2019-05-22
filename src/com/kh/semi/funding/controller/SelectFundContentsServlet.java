package com.kh.semi.funding.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.funding.model.service.FundingService;
import com.kh.semi.funding.model.vo.WorkPic;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class SelectFundContentsServlet
 */
@WebServlet("/selectFundCon.fund")
public class SelectFundContentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFundContentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workId = Integer.parseInt(request.getParameter("workId"));
		int memberId = ((Member) request.getSession().getAttribute("loginUser")).getMemberId();
		
		ArrayList<HashMap<String, Object>> list = new FundingService()
													.selectFundContents(memberId, workId);
		if(list != null) {
			System.out.println("정보를 성공적으로 가지고 왔습니다.");
			ArrayList<WorkPic> fileList = new FundingService().selectWorkPicFile(memberId, workId);
			if(fileList != null) {
				request.setAttribute("fileList", fileList);
				request.setAttribute("fundInfoList", list);
				request.getRequestDispatcher("views/author/enrollFundingGoods2.jsp").forward(request, response);
			} //end if
		} else {
			request.setAttribute("msg", "펀딩 작품 정보를 가져오지 못했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} //end if
		
	} //end method

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
