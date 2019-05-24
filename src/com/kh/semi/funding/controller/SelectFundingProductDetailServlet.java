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
 * Servlet implementation class SelectFundingProductDetailServlet
 */
@WebServlet("/selectManyInfo.fund")
public class SelectFundingProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFundingProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int workId = Integer.parseInt(request.getParameter("workId"));
		int memberId = ((Member) request.getSession().getAttribute("loginUser")).getMemberId();
		String status = request.getParameter("status");
		ArrayList<HashMap<String, Object>> list = new FundingService().selectUserFundingProDetail(workId, memberId, status);
		ArrayList<WorkPic> workPic = null;
		String page = "";
		if(list != null) {
			workPic = new FundingService().selectWorkPicFile(memberId, workId);
			if(workPic != null) {
				request.setAttribute("status", status);
				request.setAttribute("fundInfoList", list);
				request.setAttribute("workPic", workPic);
				page = "views/author/fundingInfoDetail.jsp";
			}
		} else {
			request.setAttribute("msg", "작품 정보를 가져오지 못했습니다!");
			page = "views/common/errorPage.jsp";
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
