package com.kh.semi.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.board.model.dao.AuthorPageDao;
import com.kh.semi.board.model.vo.AuthorPageAttachmrnt;

public class AuthorPageSerview {

	public int insertAuthorPage(ArrayList<AuthorPageAttachmrnt> fileList) {
		
		Connection con = getConnection();

		
		
		
		int result = new AuthorPageDao().insertAuthorPageContent(con,fileList);      
		
		
		
		
		
		
		return 0;
	}

}
