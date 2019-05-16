package com.kh.semi.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File oldFile) {
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		int randomNumber = (int)(Math.random() * 100000);
		
		String name = oldFile.getName();		//flower1.PNG
		String body = null;	//파일명
		String ext = null;	//확장자
		int dot = name.lastIndexOf(".");
		if(dot != -1) {
			//확장자가 있는 경우
			body = name.substring(0, dot);	//flower1
			ext = name.substring(dot);		//.PNG
		} else {
			//확장자가 없는 경우
			body = name;
			ext = "";
		}
		
		String fileName = ft.format(new Date(currentTime)) + randomNumber + ext;
		
		File newFile = new File(oldFile.getParent(), fileName);
		
		
		
		
		
		
		
		return newFile;
	}

}


















