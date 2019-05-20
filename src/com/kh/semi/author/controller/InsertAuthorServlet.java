package com.kh.semi.author.controller;

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

import com.kh.semi.author.model.service.AuthorService;
import com.kh.semi.author.model.vo.Author;
import com.kh.semi.author.model.vo.PicFile;
import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertAuthorServlet
 */
@WebServlet("/insertAuthor.at")
public class InsertAuthorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAuthorServlet() {
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
			String filePath = root + "uploadApply/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			ArrayList<String> changeName = new ArrayList<String>(); //변환명
			ArrayList<String> originName = new ArrayList<String>(); //기존 파일명
			
			Enumeration<String> files = multiRequest.getFileNames();
			while(files.hasMoreElements()) {
				//input file의 name값이 들어온다.
				String name = files.nextElement();
				System.out.println("name :" + name);
				changeName.add(multiRequest.getFilesystemName(name));
				originName.add(multiRequest.getOriginalFileName(name));
				System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile : " + multiRequest.getOriginalFileName(name));
			} //end while
			
			Member loginUser = (Member) request.getSession().getAttribute("loginUser");
			int memberId = loginUser.getMemberId();
			String brandName = multiRequest.getParameter("brandName");
			String comments = multiRequest.getParameter("comments");
			String selectPType = multiRequest.getParameter("selectPType");
			
			System.out.println(memberId);
			System.out.println(brandName);
			System.out.println(comments);
			System.out.println(selectPType);
			
			Author author = new Author();
			author.setMemberId(memberId);
			author.setBrandName(brandName);
			author.setApplyContent(comments);
			
			ArrayList<PicFile> fileList = new ArrayList<PicFile>();
			for(int i = originName.size() - 1; i >= 0; i--) {
				PicFile picFile = new PicFile();
				picFile.setFilePath(filePath);
				picFile.setOriginName(originName.get(i));
				picFile.setChangeName(changeName.get(i));
				fileList.add(picFile);
			} //end for
			int result = new AuthorService().insertAuthor(author, fileList, selectPType);
			if(result > 0) {
				System.out.println("파일 삽입 성공!");
				response.sendRedirect("views/application/application2.jsp");
			} else {
				System.out.println("파일 삽입 실패!");
				for(int i = 0; i < changeName.size(); i++) {
					File failedFile = new File(filePath + changeName.get(i));
					System.out.println(failedFile.delete());
				} //end for
				request.setAttribute("msg", "작가 정보 저장에 실패 했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			} //end if
		} // end if
	} //end method

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
