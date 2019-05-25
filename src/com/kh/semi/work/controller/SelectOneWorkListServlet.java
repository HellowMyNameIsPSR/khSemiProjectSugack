package com.kh.semi.work.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.work.model.service.WorkService;
import com.kh.semi.work.model.vo.Work;
import com.kh.semi.work.model.vo.WorkOption;
import com.kh.semi.work.model.vo.WorkPic;

@WebServlet("/selectListOne.wo")
public class SelectOneWorkListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneWorkListServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workId = Integer.parseInt(request.getParameter("num"));
		
		ArrayList<WorkPic> fileList = new ArrayList<WorkPic>();
		ArrayList<HashMap<String, Object>> workOpt = new ArrayList<HashMap<String, Object>>();
		ArrayList<WorkOption> woList = null;
				
		
		Work work = new WorkService().selectOne(workId);
		
		if(work != null) {
			fileList = new WorkService().selectImg(workId);
			workOpt = new WorkService().selectOption(workId);
			woList = new WorkService().selectOptionName(workId);
		}
		
		String page="";
		if(work != null) {
			page = "views/author/enrollSaleGoodsUpdate.jsp";
			request.setAttribute("work", work);
			request.setAttribute("fileList", fileList);
			request.setAttribute("workOpt", workOpt);
			request.setAttribute("woList", woList);
		}else {
			System.out.println("오류찾자");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}






























