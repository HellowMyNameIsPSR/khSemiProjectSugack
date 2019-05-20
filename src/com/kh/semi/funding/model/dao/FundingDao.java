package com.kh.semi.funding.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.funding.model.vo.Category;
import static com.kh.semi.common.JDBCTemplate.*;

public class FundingDao {
	
	private Properties prop = new Properties();
	
	public FundingDao() {
		String fileName = FundingDao.class
				.getResource("/sql/funding/funding-query.properties")
				.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //end try
	} //end constr

	public ArrayList<Category> selectCategoryAll(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = null;
		String query = prop.getProperty("selectCategoryAll");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Category>();
			while(rset.next()) {
				Category category = new Category();
				category.setCid(rset.getInt("CID"));
				category.setCategory(rset.getString("CATEGORY"));
				list.add(category);
			} //end while
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

}
