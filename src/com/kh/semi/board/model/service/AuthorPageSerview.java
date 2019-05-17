package com.kh.semi.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.board.model.dao.AuthorPageDao;
import com.kh.semi.board.model.vo.AuthorPageAttachmrnt;
import com.kh.semi.board.model.vo.Board;

public class AuthorPageSerview {


	public int insertAuthorPagePro(Board b, ArrayList<AuthorPageAttachmrnt> fileList) {
		Connection con = getConnection();
		int result;

		int result1 = new AuthorPageDao().insertAuthorPageProContent(con, b);

		if (result1 > 0) {
			int bid = new AuthorPageDao().selectAuthorPageProCurrval(con);

			for (int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setBno(bid);
			}

		}

		int result2 = new AuthorPageDao().insertAuthorPageAttachment(con, fileList);

		if (result1 > 0 && result2 == fileList.size()) {

			commit(con);
			result = 1;
		} else {
			rollback(con);
			result = 0;
		}

		close(con);
		return result;
	}

	public int insertAuthorProPage(ArrayList<AuthorPageAttachmrnt> fileList) {
	
		return 0;
	}

	public ArrayList<HashMap<String, Object>> selectAuthorPage() {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new AuthorPageDao().selectAuthorPage(con);
		close(con);
		
		
		
		return list;
	}

}
