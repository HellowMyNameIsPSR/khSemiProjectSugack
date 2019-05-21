package com.kh.semi.funding.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.funding.model.service.FundingService;
import com.kh.semi.funding.model.vo.Funding;
import com.kh.semi.funding.model.vo.Work;
import com.kh.semi.funding.model.vo.WorkPic;
import com.kh.semi.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertFundingWorkServlet
 */
@WebServlet("/insertFund.fund")
public class InsertFundingWorkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFundingWorkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String filePath = root + "uploadFundingGoodsImg/";
			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			ArrayList<String> names = new ArrayList<String>();
			ArrayList<String> changeNames = new ArrayList<String>();
			ArrayList<String> originNames = new ArrayList<String>();
			Enumeration<String> files = multiRequest.getFileNames();

			while(files.hasMoreElements()) {
				String name = files.nextElement();
				names.add(name);
				changeNames.add(multiRequest.getFilesystemName(name));
				originNames.add(multiRequest.getOriginalFileName(name));
			} //end while
			
			String category = multiRequest.getParameter("category");
			String fundingGoodsName = multiRequest.getParameter("fundingGoodsName");
			String authorType = multiRequest.getParameter("authorType");
			String fundComments = multiRequest.getParameter("fundComments");
			int targetMinAmount = Integer.parseInt(multiRequest.getParameter("targetMinAmount"));
			int targetMaxAmount = Integer.parseInt(multiRequest.getParameter("targetMaxAmount"));
			int fundingTerm = Integer.parseInt(multiRequest.getParameter("fundingTerm"));
			int fundingPrice = Integer.parseInt(multiRequest.getParameter("fundingPrice"));
			int deliPrice = Integer.parseInt(multiRequest.getParameter("deliPrice"));
			int memberId = ((Member) request.getSession().getAttribute("loginUser")).getMemberId();
			
			Funding fund = new Funding();
			fund.setMaxVoo(targetMaxAmount);
			fund.setMinVoo(targetMinAmount);
			fund.setFunDate(fundingTerm);
			
			Work fundWork = new Work();
			fundWork.setWorkName(fundingGoodsName);
			fundWork.setWorkContent(fundComments);
			fundWork.setPrice(fundingPrice);
			fundWork.setDeliPrice(deliPrice);
			fundWork.setWorkKind("funding");
			fundWork.setMemberId(memberId);
			fundWork.setAuthorType(authorType);
			fundWork.setCategory(category);
			
			ArrayList<WorkPic> fileList = new ArrayList<WorkPic>();
			for(int i = 0; i < originNames.size(); i++) {
				WorkPic workPic = new WorkPic();
				workPic.setFilePath(filePath);
				workPic.setOriginName(originNames.get(i));
				workPic.setChangeName(changeNames.get(i));
				String picType = "";
				if(names.get(i).equals("")) {
					picType = "fundingRep";
				} else {
					picType = "funding";
				}
				workPic.setPicType(picType);
				fileList.add(workPic);
			} //end for
			
			int result = new FundingService().insertFundingWork(fundWork, fileList, fund);
			if(result > 0) {
				System.out.println("작품 등록 완료!");
				response.sendRedirect("views/author/manageFundGoodsHistory.jsp");
			} else {
				for(int i = 0; i < changeNames.size(); i++) {
					File failedFile = new File(filePath + changeNames.get(i));
					System.out.println(failedFile.delete());
				} //end for
			} //end if
			
		} //end if ServletFileUpload.isMultipartContent(request)
	} //end method

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
