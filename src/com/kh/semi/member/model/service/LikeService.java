package com.kh.semi.member.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.member.model.dao.LikeDao;
public class LikeService {

	public int insertLike(int memberId, int workId) {
	
		Connection con = getConnection();
		
		int result = new LikeDao().insertLike(con,memberId,workId);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectLikeList(int memberId) {
		
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new LikeDao().selectLikeList(con,memberId);
		close(con);
		return list;
	}

	public int deleteLike(int memberId, int workId) {
		Connection con = getConnection();
		int result = new LikeDao().deleteLike(con,memberId, workId);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

}
