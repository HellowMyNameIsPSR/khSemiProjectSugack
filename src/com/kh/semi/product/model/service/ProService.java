package com.kh.semi.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.product.model.dao.ProDao;
import static com.kh.semi.common.JDBCTemplate.*;
public class ProService {

	//상품목록 보기용 메소드
	public ArrayList<HashMap<String, Object>> selectProductList() {
		
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new ProDao().selectProductList(con);
		close(con);
		
		System.out.println("상품목록 보기용 Service에서 : " + list);
		return list;
	}

	
	//상품 상세보기용 메소드
	public ArrayList<HashMap<String, Object>> selectProductDetailList(int workId) {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = new ProDao().selectProductDetailList(con,workId);
		close(con);
		
		System.out.println("DetailService에서 : " + list);
		return list;
	}

}
