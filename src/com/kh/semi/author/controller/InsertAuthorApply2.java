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
import com.kh.semi.author.model.vo.PicFile;
import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertAuthorApply2
 */
@WebServlet("/insertApply2.at")
public class InsertAuthorApply2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAuthorApply2() {
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
			String filePath = root + "uploadApply2/";
			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			ArrayList<String> changeName = new ArrayList<String>();
			ArrayList<String> originName = new ArrayList<String>();
			ArrayList<String> names = new ArrayList<String>();
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				names.add(name);
				changeName.add(multiRequest.getFilesystemName(name));
				originName.add(multiRequest.getOriginalFileName(name));
			} //end while
			
			int memberId = ((Member) request.getSession().getAttribute("loginUser")).getMemberId();
			ArrayList<PicFile> fileList = new ArrayList<PicFile>();
			for(int i = originName.size() - 1; i >= 0; i--) {
				PicFile picFile = new PicFile();
				picFile.setFilePath(filePath);
				picFile.setOriginName(originName.get(i));
				picFile.setChangeName(changeName.get(i));
				picFile.setFileType(names.get(i));
				fileList.add(picFile);
			} //end for
			
			int result = new AuthorService().insertApply2(memberId, fileList);
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/checkApply.at");
			} else {
				System.out.println("2차 입점신청 실패!");
				for(int i = 0; i < changeName.size(); i++) {
					File failedFile = new File(filePath + changeName.get(i));
					System.out.println(failedFile.delete());
				} //end for
				request.setAttribute("msg", "2차 입점신청 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			} //end if
			
		} //end if
		
	} //end method

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
