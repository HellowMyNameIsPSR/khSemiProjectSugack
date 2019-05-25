package com.kh.semi.funding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.board.model.service.BoardService;
import com.kh.semi.author.model.vo.PageInfo;
import com.kh.semi.board.model.vo.Board;
import com.kh.semi.funding.model.service.FundingService;

/**
 * Servlet implementation class ManageFundListPageServlet
 */
@WebServlet("/fundPage.fund")
public class ManageFundListPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageFundListPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String status = request.getParameter("status");
				int memberId = Integer.parseInt(request.getParameter("memberId"));
				//페이징 추가
				int currentPage;		//현재 페이지
				int limit;				//한 페이지 게시글이 몇개 보여질것인지
				int maxPage;			//전체 페이지에서 마지막 페이지
				int startPage;			//한번에 표시할 페이지가 시작할 페이지
				int endPage;			//한번에 표시할 페이지가 끝나는 페이지
				
				//페이지 수 처리용 변수
				currentPage = 1;
				
				if (request.getParameter("currentPage")!= null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				//한페이지에 보여질 목록 갯수
				limit = 10;
				
				//전체 목록 갯수 리턴
				int listCount = new FundingService().getListCount(memberId, status);
				
				System.out.println("listCount :"+listCount);
				
				//총 페이지수 계산
				maxPage = (int)((double)listCount / limit + 0.9);
				
				//현재 페이지에 보여줄 시작 페이지 수 
				//10개씩 보여주게 할 경우
				//1,11,21,31,....
				startPage = (((int)((double) currentPage /limit + 0.9 )) -1 ) * 10 +1;
				
				//목록 아래쪽에 보여질 마지막 페이지 수 
				//10,20,30 , ...
				endPage = startPage + 10 -1;
				
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				//페이지 정보를 공유할 vo 객체 생성
				PageInfo pi = new PageInfo(currentPage, limit , maxPage , startPage, endPage);
				
				//-------여기까지가 페이징 처리 계산 ---------------//
				
				//페이징 없이 할때
				//ArrayList<Board> list = new BoardService().selectList();
				
				//페이징 처리 후 
				ArrayList<Board> list = new BoardService().selectList(pi);
				
				System.out.println("list : " + list);
				
				String page = "";
				if (list != null ) {
					page = "views/board/boarList.jsp";
					request.setAttribute("list", list);
					request.setAttribute("pi", pi);
				}else {
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "게시판 조회 실패");
				}
				
				request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
