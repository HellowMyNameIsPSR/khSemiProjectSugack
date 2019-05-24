package com.kh.semi.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.board.model.dao.AuthorPageDao;
import com.kh.semi.board.model.dao.ProQnaDao;
import com.kh.semi.board.model.vo.AuthorPageAttachmrnt;
import com.kh.semi.board.model.vo.Board;
import com.kh.semi.board.model.vo.authorComent;

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
	
		System.out.println("작가목록 보기용 Service에서:" +list);
		
		return list;
	}

	public int insertAuthorPageDetail(Board b, ArrayList<AuthorPageAttachmrnt> fileList) {
		
		Connection con = getConnection();
		int result;
		
		
		
		int result1 = new AuthorPageDao().insertAuthorPageDetailContent(con,b);
		
		if (result1>0) {
			
			int bid = new AuthorPageDao().selectAuthorPageProCurrval(con);
			for(int i=0; i<fileList.size(); i++) {
				fileList.get(i).setBno(bid);
			}
			
		}
		
		int result2 = new AuthorPageDao().insertAuthorPageDetailAttachment(con,fileList);
		
		if(result1 >0 && result2 == fileList.size()) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
			result = 0;
		}
		
		close(con);
		
		return result;
	}

	/*public Board authorStory(int memberId) {
		Connection con = getConnection();
		Board b =  new AuthorPageDao().selectAuthorStory(con, memberId);
		
		System.out.println("b 를출력:" +b);
		
		
		       
		return b;
	}*/

	public HashMap<String, Object> selectAuthorStory(int memberId, int bno) {
		
		Connection con = getConnection();
		HashMap<String,Object> hmap = new AuthorPageDao().selectAuthorStory(con, memberId,bno);
		
		System.out.println("memberId:(서비스)"+memberId);
		System.out.println("hmap: 서비스:"+hmap);
		
		
		
		close(con);
		
		
		
		
		
		
		
		
		return hmap;

	}

	
	//작가페이지 응원하기 댓글 생성 메소드 
	public int insertauthorComent(authorComent ac) {
		
		Connection con = getConnection();
		
		int result = new AuthorPageDao().insertauthorComent(con,ac);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<authorComent> SelectAuthorComent(int bno, int memberId) {
	
		Connection con = getConnection();
		
		ArrayList<authorComent> list = new AuthorPageDao().SelectComent(bno ,con ,memberId);
			
		System.out.println("댓글서비스 list" +list);
		
		close(con);
		
		
		return list;
	}

	

	

}
