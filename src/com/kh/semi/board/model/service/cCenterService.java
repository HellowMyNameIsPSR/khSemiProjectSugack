package com.kh.semi.board.model.service;

import java.util.ArrayList;
import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.semi.board.model.dao.cCenterDao;
import com.kh.semi.board.model.vo.Board;

public class cCenterService {
	
	public cCenterService() {
		
	}

	public ArrayList<Board> noticeList() {
		Connection con = getConnection();
		System.out.println("서비스 들어옴");

		ArrayList<Board> list = new cCenterDao().noticeList(con);
		
		close(con);
		
		
		return list;
	}

	public Board selectOne(int num) {
		// TODO Auto-generated method stub
		return null;
	}

}
