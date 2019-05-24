package com.kh.semi.board.model.service;

import java.util.ArrayList;
import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.semi.board.model.dao.cCenterDao;
import com.kh.semi.board.model.vo.Board;

public class cCenterService {
	
	public ArrayList<Board> noticeList() {
		Connection con = getConnection();
		System.out.println("서비스 들어옴");

		ArrayList<Board> list = new cCenterDao().noticeList(con);
		
		close(con);
		
		
		return list;
	}

	public Board selectOne(int num) {
		Connection con = getConnection();
		System.out.println("서비스 들어옴");

		Board b = new cCenterDao().selectOne(num, con);
		
		close(con);
		
		System.out.println("서비스에서 출력하는 b" + b);
		return b;
	}

	public int insertBoard(Board b) {
		Connection con = getConnection();
		
		int result = new cCenterDao().insertBoard(con, b);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		close(con);
		
		return result;
	}

	public ArrayList<Board> FaqOrderList() {
		Connection con = getConnection();
		System.out.println("서비스 들어옴");

		ArrayList<Board> list = new cCenterDao().FaqOrderList(con);
		
		close(con);
		
		
		return list;
		
	}

}
