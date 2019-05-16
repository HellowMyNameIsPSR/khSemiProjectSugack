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
import com.kh.semi.work.model.vo.PicFile;
import com.kh.semi.work.model.vo.Work;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/insertSale.wo")
public class InsertWorkSalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertWorkSalesServlet() {}

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
				
				System.out.println("name : " + name);
				if(multiRequest.getFilesystemName(name) != null) {
					
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
					
					System.out.println("fileSystem name : " 
							+ multiRequest.getFilesystemName(name));
					System.out.println("originFile : " 
							+ multiRequest.getOriginalFileName(name));
					
				}
			}
			
			//int workId = Integer.parseInt(request.getParameter("workId"));	//작품코드
			String workName = multiRequest.getParameter("workName");				//작품명
			String workContent = multiRequest.getParameter("workContent");		//작품설명
			int deliPrice = Integer.parseInt(multiRequest.getParameter("deliPrice"));	//배송비
			//String wrDate = request.getParameter("wrDate");					//작품등록일
			//String workKind = request.getParameter("workKind");				//작품종류
			//String memberId = request.getParameter("memberId");				//작가코드
			int price = Integer.parseInt(multiRequest.getParameter("price"));	//가격
			int cid = Integer.parseInt(multiRequest.getParameter("cid"));		//카테고리코드
			//int typeId = Integer.parseInt(request.getParameter("typeId"));	//유형코드
			
			//String author = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getMemberId());
		
			Work work = new Work();
			work.setworkName(workName);
			work.setWorkContent(workContent);
			work.setDeliPrice(deliPrice);
			work.setPrice(price);
			work.setCid(cid);
			
			ArrayList<PicFile> picFile = new ArrayList<PicFile>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				PicFile pic = new PicFile();
				pic.setFilePath(filePath);
				pic.setOriginName(originFiles.get(i));
				pic.setChangeName(saveFiles.get(i));
				
				picFile.add(pic);
			}
			
			int result2 = new WorkService().insertSales(work, picFile);
			
			
			String page = "";
			if(result2 > 0) {
				//response.sendRedirect(request.getContextPath() + "/selectList.tn");
				
				page = "views/author/authorHome.jsp";
				
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





























