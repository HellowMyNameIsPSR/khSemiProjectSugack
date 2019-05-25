package com.kh.semi.author.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadApply1FormServlet
 */
@WebServlet("/downApplyForm.at")
public class DownloadApply1FormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadApply1FormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String filePath = request.getSession().getServletContext().getRealPath("/") + "downloadApplyForm\\";
		String fileName = "SuGack_Application_Form.docx";
		String downName = "수작 1차 입점신청 양식.docx";
		//폴더에서 파일을 읽어들일 스트림 생성
		BufferedInputStream buf = null;
		
		//클라이언트로 내보낼 출력스트림 생성
		ServletOutputStream downOut = null;
		
		downOut = response.getOutputStream();
		
		//스트림으로 전송할 파일 객체 생성
		File downFile = new File(filePath + fileName);
		System.out.println("경로 : " + downFile);
		response.setContentType("text/plain; charset = utf-8"); 
		
		//한글파일명에 대한 인코딩처리
		//강제적으로 다운로드 처리
		response.setHeader("Content-Disposition", 
				"attachment; filename=\"" +
							new String(downName.getBytes("UTF-8"), "ISO-8859-1") 
								+ "\"");
		
		response.setContentLength((int)downFile.length());
		
		FileInputStream fin = new FileInputStream(downFile);
		
		buf = new BufferedInputStream(fin);
		
		int readBytes = 0;
		
		while((readBytes = buf.read()) != -1) {
			downOut.write(readBytes);
		}
		
		downOut.close();
		buf.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
