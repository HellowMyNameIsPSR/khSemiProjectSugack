package com.kh.semi.funding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.semi.funding.model.service.FundingService;
import com.kh.semi.funding.model.vo.WorkPic;

/**
 * Servlet implementation class SelectDetailInfoServlet
 */
@WebServlet("/selectDetailServlet.fund")
public class SelectDetailInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDetailInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workId = Integer.parseInt(request.getParameter("workId"));
		ArrayList<WorkPic> list = new FundingService().selectList(workId);
		System.out.println("서블릿 파일리스트" + list);
		String page = "";

			/*request.setAttribute("imglist", list);
	
			page = "views/fundingProduct/fundingProductDetail.jsp";
			System.out.println("서블릿까지 사진 가져오기 ");*/
			
			
			   JSONArray result = new JSONArray();
			
			   JSONObject WorkPic = null;

			   for(WorkPic sff : list) {
				   
				   WorkPic = new JSONObject();
				   WorkPic.put("workId", sff.getWorkId());
				   WorkPic.put("changeName", sff.getChangeName());
				   WorkPic.put("filePath", sff.getFilePath());
			
				   result.add(WorkPic);
			   }
			response.setContentType("application/json");
		    new Gson().toJson(result, response.getWriter());


		/*} else {
			System.out.println("펀딩상품 이미지 상세보기 실패!");
			request.setAttribute("msg", "펀딩상품 이미지 상세보기 실패!");
			page = "views/common/errorPage.jsp";
		}*/
		   /* request.getRequestDispatcher(page).forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
