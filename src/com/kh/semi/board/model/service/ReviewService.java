package com.kh.semi.board.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.board.model.dao.ReviewDao;
import com.kh.semi.board.model.vo.Review;
public class ReviewService {

	
	//리뷰 작성용 메소드
	public ArrayList<Review> insertReviewList(Review rv) {
		
		Connection con = getConnection();
		ArrayList<Review> reviewList = null;
		
		
		int result = new ReviewDao().insertReview(con,rv);
		
		
		
		if(result>0) {
			commit(con);
			
			reviewList = new ReviewDao().selectReviewList(con, rv.getWorkId());
			System.out.println("ReviewService에서 WorkId : " + rv.getWorkId());
			
		}else {
			
			rollback(con);
		
		}
		System.out.println("SERVICE: "+ reviewList);
		close(con);
		
		return reviewList;
	}

	
	//회원이 작성한 리뷰들 조회용 메소드
	public ArrayList<Review> selectMyReviewList(int memberId) {
		Connection con = getConnection();
		ArrayList<Review> reviewList = new ReviewDao().selectMyReviewList(con,memberId);
		
		close(con);
		return reviewList;
	}


	//마이페이지에서 리뷰 삭제용 메소드
	public int deleteReview(int memberId, int workId) {
		Connection con = getConnection();
		int result = new ReviewDao().deleteReview(con, memberId, workId);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	//작품에 해당하는 모든 리뷰 조회용 메소드
	public ArrayList<Review> selectAllReview(int workId) {
		
		Connection con = getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReview(con,workId);
		
		close(con);
		return list;
	}

}
