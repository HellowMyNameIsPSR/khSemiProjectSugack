package com.kh.semi.funding.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.semi.author.model.vo.PageInfo;
import com.kh.semi.funding.model.service.FundingService;
import com.kh.semi.funding.model.vo.SortFunding;

/**
 * Servlet implementation class SelectFundingGoodsSortServlet
 */
@WebServlet("/selectSortFund.fund")
public class SelectFundingGoodsSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFundingGoodsSortServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = request.getParameter("status");
		int memberId = Integer.parseInt(request.getParameter("memberId"));
		
		SortFunding sortFunding = new SortFunding();
		sortFunding.setFunStatus(status);
		
		
		ArrayList<SortFunding> list = new FundingService().selectSortFunding(memberId, sortFunding);
		
		JSONObject fundInfo = null;
		JSONArray fundArray = new JSONArray();
		
		if(list != null) {
			System.out.println("list : " + list.size());
			for(SortFunding userFund : list) {
				fundInfo = new JSONObject();
				fundInfo.put("workId", userFund.getWorkId());
				fundInfo.put("workName", URLEncoder.encode(userFund.getWorkName(), "UTF-8"));
				fundInfo.put("wrDate", URLEncoder.encode(userFund.getWrDate(), "UTF-8"));
				fundInfo.put("fcStart", URLEncoder.encode(userFund.getFcStart(), "UTF-8"));
				fundInfo.put("fcFinish", URLEncoder.encode(userFund.getFcFinish(), "UTF-8"));
				fundInfo.put("funStatus", URLEncoder.encode(userFund.getFunStatus(), "UTF-8"));
				fundArray.add(fundInfo);
				System.out.println("fundArray : " + fundArray.size());
			}
		}
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(fundArray.toJSONString());
		out.flush();
		out.close();
	} //end method

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
