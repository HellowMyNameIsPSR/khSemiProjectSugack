package com.kh.semi.work.controller;

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

import com.kh.semi.work.model.service.WorkService;
import com.kh.semi.work.model.vo.Work;
import com.kh.semi.work.model.vo.WorkPic;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/updateSale.wo")
public class UpdateWorkSalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateWorkSalesServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//전송 파일 용량 제한 : 10Mbyte로 제한
			int maxSize = 1024 * 1024 * 10;
			
			//웹 서버 컨테이너 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");
			
			
			//파일 저장 경로 설정 
			String filePath = root + "uploadSalesImage/";
			
			MultipartRequest multiRequest 
			= new MultipartRequest(request, filePath, maxSize,
						"UTF-8", new MyFileRenamePolicy());
			
			//저정한 파일(변경된)의 이름을 저장할 arrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			//원본 파일 이름을 저장할 arrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
					

					
				}
			}
			int workId	= Integer.parseInt(multiRequest.getParameter("workId"));	
			String workName = multiRequest.getParameter("workName");				//작품명
			String workContent = multiRequest.getParameter("workContent");		//작품설명
			int deliPrice = Integer.parseInt(multiRequest.getParameter("deliPrice"));	//배송비
			//WR_DATE			//작품등록일은 SYSDATE로 해결
			//RS_DATE	//출시예정일		//NULL
			//MAX_COUNT	//최대구매수량		//NULL
			//CS_DATE	//판매마감일		//NULL
			//WORK_KIND	//작품종류			//MEMBER 판매, 펀딩 쿼리문 자체로 해결
			//MEMBER_ID	//작가코드			//MEMBER 테이블 ID
			int price = Integer.parseInt(multiRequest.getParameter("price"));	//가격
			int cid = Integer.parseInt(multiRequest.getParameter("cid"));		//카테고리코드
			String wpId0 = multiRequest.getParameter("wpId0");
			String wpId1 = multiRequest.getParameter("wpId1");
			String wpId2 = multiRequest.getParameter("wpId2");
			String wpId3 = multiRequest.getParameter("wpId3");
			String wpId4 = multiRequest.getParameter("wpId4");
			
			ArrayList<String> wpId = new ArrayList<String>();
			wpId.add(wpId0);
			wpId.add(wpId1);
			wpId.add(wpId2);
			wpId.add(wpId3);
			wpId.add(wpId4);
			

			//TYPE_ID	//유형코드 공예유형	//MEMBER 테이블 
			
			//String memberId = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMemberId());

			Work work = new Work();
			//work.setWorkId();
			work.setWorkId(workId);
			work.setworkName(workName);
			work.setWorkContent(workContent);
			work.setDeliPrice(deliPrice);
			work.setPrice(price);
			work.setCid(cid);
			
			ArrayList<WorkPic> workPic = new ArrayList<WorkPic>();
			
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				WorkPic pic = new WorkPic();
				pic.setfilePath(filePath);
				pic.setoriginName(originFiles.get(i));
				pic.setchangeName(saveFiles.get(i));
				
				workPic.add(pic);
			}
			
			int result2 = new WorkService().updateSales(work, workPic, wpId);
			
			String page = "";
			if(result2 > 0) {
				//response.sendRedirect(request.getContextPath() + "/selectList.tn");
				page = "/sg/selectSale.wo";
				
				response.sendRedirect(page);
			}else {
				System.out.println("사진 등록 실패!!!!");
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(filePath + saveFiles.get(i));
					
					//true false 리턴됨
					
					System.out.println(failedFile.delete());
					
				}
			}
			
		}
		
		
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}





















