package com.kh.semi.board.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.board.model.dao.ReviewDao;
import com.kh.semi.board.model.vo.Review;
public class ReviewService {

	//리뷰 작성용 메소드
	public int insertReview(Review rv) {
		
		Connection con = getConnection();
		int result = new ReviewDao().insertReview(con,rv);
		
		if(result>0) {
			
			commit(con);
		}else {
			System.out.println("Service: " + result);
			rollback(con);
		}
		return result;
	}

	//리뷰 조회용메소드!
	public ArrayList<Review> selectList(int memberId) {
		Connection con = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectList(con, memberId);
		
		close(con);
		return list;
	}

}
