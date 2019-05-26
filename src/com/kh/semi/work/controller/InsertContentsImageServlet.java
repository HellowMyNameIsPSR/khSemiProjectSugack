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
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/InsertContentsImageServlet.wo")
public class InsertContentsImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertContentsImageServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("여긴 접근 성공??");
			//전송 파일 용량 제한 : 10Mbyte로 제한
			int maxSize = 1024 * 1024 * 100;
			
			//웹 서버 컨테이너 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");
			
			
			//파일 저장 경로 설정 
			String filePath = root + "uploadContentsImage/";
			
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
			
			ArrayList<PicFile> picFile = new ArrayList<PicFile>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				PicFile pic = new PicFile();
				pic.setFilePath(filePath);
				pic.setOriginName(originFiles.get(i));
				pic.setChangeName(saveFiles.get(i));
				
				picFile.add(pic);
			}
			
			int result2 = new WorkService().insertContentsImage(picFile);
			
			
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


























