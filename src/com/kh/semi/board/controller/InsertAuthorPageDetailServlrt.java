package com.kh.semi.board.controller;

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

import com.kh.semi.board.model.service.AuthorPageSerview;
import com.kh.semi.board.model.vo.AuthorPageAttachmrnt;
import com.kh.semi.board.model.vo.Board;
import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertAuthorPageDetailServlrt
 */
@WebServlet("/insertDet.tn")
public class InsertAuthorPageDetailServlrt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAuthorPageDetailServlrt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			Member m = (Member)request.getSession().getAttribute("loginUser");
		
		    if(ServletFileUpload.isMultipartContent(request)) {

			
			
			
			int maxSize = 1024 * 1024 * 10; 
			
			
			
			 String root = request.getSession().getServletContext().getRealPath("/");
            
			 System.out.println("root:" +root); 
			 
			 String filePath = root + "uploadSalesImage/"; 
			 
			 
			 MultipartRequest multiRequest = new MultipartRequest(request,filePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			 
			 ArrayList<String> saveFiles = new ArrayList<String>();
			 ArrayList<String> originFiles = new ArrayList<String>(); 
			 
			 
			 Enumeration<String> files = multiRequest.getFileNames(); 
			 
			 
			 while(files.hasMoreElements()) {
				 
				String name = files.nextElement();
				
				System.out.println("name :" +name);
				
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				
				System.out.println("fileSystem name : " +multiRequest.getFilesystemName(name));
				System.out.println("originFile :" +multiRequest.getOriginalFileName(name));
				
				
				
				 
			 }
			 
			 
			 String authorTitle  = multiRequest.getParameter("author_Title");
			 String authorcontent = multiRequest.getParameter("author_content");
			  
			 
			 
			 System.out.println(authorTitle);
			 System.out.println(authorcontent);
			 
			 
			 Board b = new Board();
			 b.setTitle(authorTitle);
			 b.setContent(authorcontent);
			 b.setMemberId(m.getMemberId());
				
			 
			 
			 ArrayList<AuthorPageAttachmrnt>fileList = new ArrayList<AuthorPageAttachmrnt>();
			 
			 
			 for(int i=originFiles.size()-1; i>=0; i--) {
				
				 
				 AuthorPageAttachmrnt aat = new AuthorPageAttachmrnt();
				 aat.setFilePath(filePath);
				 aat.setOriginName(originFiles.get(i));
				 aat.setChangeName(saveFiles.get(i));
				 
				 
				 fileList.add(aat);				 
 
			 }
			 
			int result = new AuthorPageSerview().insertAuthorPageDetail(b,fileList);
			 
			 
	if(result>0) {
				
				//재요청이 안되게 sendRedirect를 하고  List를 보여준다.
				response.sendRedirect(request.getContextPath() + "/selectAuthorPage.tn");
				
			}else {
				
				//파일은 미리 저장되고 작동하는것이기 때문에!!
				//실패했을때는 이클립스 사진폴더에 등록된 사진을 지워야한다! 왜그런지는 서블릿쪽에 설명 적어놓음
				for(int i=0; i<saveFiles.size(); i++) {
					
					//경로와 파일이름을 가지고 객체를 만들었다
					File failedFile = new File(filePath + saveFiles.get(i));
					
					System.out.println(failedFile.delete()); //사진을 지워주고, 지워지면 true가 나오고 지워지지않으면 false리턴
					
				}
				
				
			}
			 
			 
			 
			 
			 
			 
			 
			 
					 
			
			
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
