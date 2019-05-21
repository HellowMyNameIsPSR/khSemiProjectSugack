package com.kh.semi.funding.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.funding.model.dao.FundingDao;
import com.kh.semi.funding.model.vo.Category;

public class FundingService {

	public ArrayList<Category> selectCategoryAll() {
		Connection con = getConnection();
		ArrayList<Category> list = new FundingDao().selectCategoryAll(con);
		close(con);
		return list;
	}

}
