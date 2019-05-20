package com.kh.semi.board.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.board.model.dao.ReviewDao;
import com.kh.semi.board.model.vo.Review;
public class ReviewService {

	//리뷰 작성용 메소드
	/*public int insertReview(Review rv) {
		
		Connection con = getConnection();
		int result = new ReviewDao().insertReview(con,rv);
		
		if(result>0) {
			
			commit(con);
		}else {
			System.out.println("Service: " + result);
			rollback(con);
		}
		return result;
	}*/

	/*//리뷰 조회용메소드!
	public ArrayList<Review> selectList(int memberId, int workId) {
		Connection con = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectList(con, memberId, workId);
		
		close(con);
		return list;
	}*/

	public ArrayList<Review> insertReviewList(Review rv) {
		
		Connection con = getConnection();
		ArrayList<Review> reviewList = null;
		System.out.println("서블릿에서 받아온 ID" + rv.getWorkId());
		
		int result = new ReviewDao().insertReview(con,rv);
		
		System.out.println("Dao에서 받아온 ID: "+rv.getWorkId());
		
		if(result>0) {
			commit(con);
			
			reviewList = new ReviewDao().selectReviewList(con, rv.getWorkId());
			System.out.println("ReviewService에서 WorkId : " + rv.getWorkId());
			
		}else {
			
			rollback(con);
			//System.out.println("안됨");
		}
		System.out.println("SERVICE: "+ reviewList);
		close(con);
		
		return reviewList;
	}

	
	//회원이 작성한 리뷰들 조회
	public ArrayList<Review> selectMyReviewList(int memberId) {
		Connection con = getConnection();
		ArrayList<Review> reviewList = new ReviewDao().selectMyReviewList(con,memberId);
		
		close(con);
		return reviewList;
	}

}
