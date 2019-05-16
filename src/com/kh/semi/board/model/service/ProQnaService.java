package com.kh.semi.board.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.board.model.dao.ProQnaDao;
import com.kh.semi.board.model.vo.ProQna;
import com.kh.semi.board.model.vo.ProQnaComment;
public class ProQnaService {

	//Q&A문의글 작성용 메소드
	public int insertProQna(ProQna qna) {
		Connection con = getConnection();
		int result = new ProQnaDao().insertProQna(con,qna);
		
		if(result>0) {
			/*int bno = new ProQnaDao().selectCurrval(con);
			
			for(int i=0; i<fileList.size(); i++) {
				fileList.get(i).setBno(bno);
			}*/
			commit(con);
			result = 1;
		}else {
			rollback(con);
			result = 0;
		}
		return result;
		
	}

	public ArrayList<ProQna> selectList(int memberId) {
		Connection con = getConnection();
		ArrayList<ProQna> list =  new ProQnaDao().selectList(con, memberId);
		
		close(con);
		return list;
	}


	//게시물의 갯수 조회용 메소드!
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new ProQnaDao().getListCount(con);
		close(con);
		return listCount;
	}
	
	//문의내역 자세히보기
	public ProQna selectOne(int num) {
		
		Connection con = getConnection();
		
		
		ProQna qna = new ProQnaDao().selectOne(con,num);
		
		if(qna !=null) {
			commit(con);
			
		}else {
			rollback(con);
		}
		close(con);
		
		return qna;
	}
	
	//문의글 답변 작성용 메소드
	public int insertComment(ProQnaComment comment/*ProQna qna*/) {
		Connection con = getConnection();
		
		int result = new ProQnaDao().insertComment(con, comment);
		
		if(result>0) {
			commit(con);
			
			
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	

	//문의글 답변 조회용 메소드
	public ArrayList<ProQnaComment> selectCommentList(ProQnaComment comment) {
		
		Connection con = getConnection();
		
		
		ArrayList<ProQnaComment> list = new ProQnaDao().selectCommentList(con,comment);
		System.out.println("Service에서: "+list);
		if(list!=null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return list;
	}
	

}
