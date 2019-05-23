package com.kh.semi.board.model.service;

import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.semi.board.model.dao.FundProQnaDao;
import com.kh.semi.board.model.vo.ProQna;

public class FundProQnaService {

	
	//펀딩상품 문의글 작성
	public int insertProQna(ProQna qna) {
		Connection con = getConnection();
		int result = new FundProQnaDao().insertProQna(con,qna);
		
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

}
