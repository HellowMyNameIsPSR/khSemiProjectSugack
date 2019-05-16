package com.kh.semi.board.controller;

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
import com.kh.semi.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class InsertAuthorPageServlet
 */
@WebServlet("/insert.to")
public class InsertAuthorPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAuthorPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿들어옴");
	
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
			 
			 
			 String author_name  = multiRequest.getParameter("author_name");
			 String author_about = multiRequest.getParameter("author_about");
			 String author_Title = multiRequest.getParameter("author_Title");
			 String author_content = multiRequest.getParameter("author_content"); 
			 
			 
			 System.out.println(author_name);
			 System.out.println(author_about);
			 System.out.println(author_Title);
			 System.out.println(author_content);
			 
			 
			 ArrayList<AuthorPageAttachmrnt>fileList = new ArrayList<AuthorPageAttachmrnt>();
			 
			 
			 for(int i=originFiles.size()-1; i>=0; i--) {
				
				 
				 AuthorPageAttachmrnt aat = new AuthorPageAttachmrnt();
				 aat.setFilePath(filePath);
				 aat.setOriginName(originFiles.get(i));
				 aat.setChangeName(saveFiles.get(i));
				 
				 
				 fileList.add(aat);				 
 
			 }
			 
			int result = new AuthorPageSerview().insertAuthorPage(fileList);
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
					 
			
			
			
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
