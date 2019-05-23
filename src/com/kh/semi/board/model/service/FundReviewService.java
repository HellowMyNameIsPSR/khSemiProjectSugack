package com.kh.semi.board.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.board.model.dao.FundReviewDao;
import com.kh.semi.board.model.dao.ReviewDao;
import com.kh.semi.board.model.vo.Review;

public class FundReviewService {

	
	//리뷰 등록용 메소드
	public ArrayList<Review> insertReviewList(Review rv) {
		Connection con = getConnection();
		ArrayList<Review> reviewList = null;
		System.out.println("서블릿에서 받아온 ID" + rv.getWorkId());
		
		int result = new FundReviewDao().insertReview(con,rv);
		
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

	
	//해당 펀딩작품에 해당하는 모든 리뷰 조회하기
	public ArrayList<Review> selectAllReview(int workId) {
		Connection con = getConnection();
		ArrayList<Review> list = new FundReviewDao().selectAllReview(con,workId);
		
		close(con);
		return list;
	}

}
