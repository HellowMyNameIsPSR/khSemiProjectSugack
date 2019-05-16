package com.kh.semi.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.product.model.dao.ProDao;
import static com.kh.semi.common.JDBCTemplate.*;
public class ProService {

	public ArrayList<HashMap<String, Object>> selectProductList() {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new ProDao().selectProductList(con);
		close(con);
		
		System.out.println("Service에서 : " + list);
		return list;
	}

}
