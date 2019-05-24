package com.kh.semi.product.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.vo.Basket;
import com.kh.semi.product.model.vo.OrderList;
import com.kh.semi.product.model.vo.Payment;
import com.kh.semi.work.model.vo.WorkOption;

public class ProDao {
	private Properties prop = new Properties();
	
	public ProDao() {
		String fileName = ProDao.class.getResource("/sql/product/product-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	public ArrayList<HashMap<String, Object>> selectProductList(Connection con) {
		
		Statement stmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectProList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<HashMap<String, Object>>();
			
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("workContent", rset.getString("WORK_CONTENT"));
				hmap.put("deliPrice", rset.getInt("DELI_PRICE"));
				hmap.put("wrDate", rset.getDate("RS_DATE"));
				hmap.put("rsDate", rset.getDate("RS_DATE"));
				hmap.put("maxCount", rset.getInt("MAX_COUNT"));
				hmap.put("csDate", rset.getDate("RS_DATE"));
				hmap.put("workKind", rset.getString("WORK_KIND"));
				hmap.put("memberId", rset.getInt("MEMBER_ID"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("cid", rset.getInt("CID"));
				hmap.put("typeId", rset.getInt("TYPE_ID"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("wcount", rset.getInt("WCOUNT"));
				hmap.put("category", rset.getString("CATEGORY"));
				list.add(hmap);
				
				System.out.println("dao에서 : " + list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		System.out.println("dao에서: " + list);
		return list;
	}

	
	public ArrayList<HashMap<String, Object>> selectProductDetailList(Connection con, int workId) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectProDetailList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, workId);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("workContent", rset.getString("WORK_CONTENT"));
				hmap.put("deliPrice", rset.getInt("DELI_PRICE"));
				hmap.put("wrDate", rset.getDate("WR_DATE"));
				hmap.put("rsDate", rset.getDate("RS_DATE"));
				hmap.put("maxCount", rset.getInt("MAX_COUNT"));
				hmap.put("csDate", rset.getDate("CS_DATE"));
				hmap.put("workKind", rset.getString("WORK_KIND"));
				hmap.put("memberId", rset.getInt("MEMBER_ID"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("cid", rset.getInt("CID"));
				hmap.put("typeId", rset.getInt("TYPE_ID"));
				hmap.put("wcount", rset.getInt("WCOUNT"));
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("picType", rset.getString("PIC_TYPE"));
				hmap.put("opId", rset.getInt("OP_ID"));
				hmap.put("oname", rset.getString("ONAME"));
				hmap.put("oprice", rset.getInt("OPRICE"));
				hmap.put("ovalue", rset.getString("OVALUE"));
				list.add(hmap);
				
				System.out.println("Detaildao에서 : " + list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block!!
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
		
	}

	public Address selectUserAddress(Connection con, Member loginUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Address add = null;
		
		String query = prop.getProperty("selectUserInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, loginUser.getMemberId());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				add = new Address();
				add.setAddressId(rset.getInt("ADDRESS_ID"));
				add.setAddressName(rset.getString("ADDRESS_NAME"));
				add.setAddress(rset.getString("ADDRESS"));
				add.setPhone1(rset.getString("PHONE1"));
				add.setPhone2(rset.getString("PHONE2"));
				add.setMemberId(rset.getInt("MEMBER_ID"));
				add.setAddType(rset.getString("ADD_TYPE"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return add;
	}

	public HashMap<String, Object> selectProductPurchase(String workId, Connection con) {
		PreparedStatement pstmt = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectProDetailList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(workId));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("workContent", rset.getString("WORK_CONTENT"));
				hmap.put("deliPrice", rset.getInt("DELI_PRICE"));
				hmap.put("wrDate", rset.getDate("RS_DATE"));
				hmap.put("rsDate", rset.getDate("RS_DATE"));
				hmap.put("maxCount", rset.getInt("MAX_COUNT"));
				hmap.put("csDate", rset.getDate("RS_DATE"));
				hmap.put("workKind", rset.getString("WORK_KIND"));
				hmap.put("memberId", rset.getInt("MEMBER_ID"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("cid", rset.getInt("CID"));
				hmap.put("typeId", rset.getInt("TYPE_ID"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return hmap;
	}

	public int insertBasket(Connection con, Basket basket) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBasket");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, basket.getMemberId());
			pstmt.setInt(2, basket.getWorkId());
			pstmt.setInt(3, basket.getCount());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int selectOnePurchase(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		
		String query = prop.getProperty("selectOnePurchase");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				bid = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return bid;
	}

	public ArrayList<HashMap<String, Object>> selectBuyInfo(int bid, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> buyInfo = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		String query = prop.getProperty("selectBuyInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				buyInfo = new HashMap<String, Object>();
				buyInfo.put("basketId", rset.getInt("BASKET_ID"));
				buyInfo.put("memberId", rset.getInt("MID"));
				buyInfo.put("workId", rset.getInt("WID"));
				buyInfo.put("basketDate", rset.getDate("BASKET_DATE"));
				buyInfo.put("count", rset.getInt("COUNT"));
				buyInfo.put("workName", rset.getString("WORK_NAME"));
				buyInfo.put("price", rset.getInt("PRICE"));
				buyInfo.put("deliPrice", rset.getInt("DELI_PRICE"));
				buyInfo.put("authorName", rset.getString("MEMBER_NAME"));
				buyInfo.put("changeName", rset.getString("CHANGE_NAME"));
				list.add(buyInfo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int insertPayment(Connection con, Payment pay) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pay.getPayId());
			pstmt.setInt(2, pay.getPayPrice());
			pstmt.setString(3, pay.getPayStatus());
			pstmt.setString(4, pay.getPayMethod());
			pstmt.setString(5, pay.getCardNum());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertOrderList(Connection con, ArrayList<OrderList> oList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrderList");
		
		try {
			for(int i = 0; i < oList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, oList.get(i).getBundleCode());
				pstmt.setInt(2, oList.get(i).getBasketId());
				pstmt.setString(3, oList.get(i).getPayId());
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBasket(Connection con, ArrayList<OrderList> oList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBasket");
		
		try {
			for(int i = 0; i < oList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, oList.get(i).getBasketId());
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectCartBuyInfo(String[] bidArr, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> buyInfo = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		String query = prop.getProperty("selectBuyInfo");
		
		try {
			list = new ArrayList<HashMap<String, Object>>();
			for(int i = 0; i < bidArr.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(bidArr[i]));
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					buyInfo = new HashMap<String, Object>();
					buyInfo.put("basketId", rset.getInt("BASKET_ID"));
					buyInfo.put("memberId", rset.getInt("MID"));
					buyInfo.put("workId", rset.getInt("WID"));
					buyInfo.put("basketDate", rset.getDate("BASKET_DATE"));
					buyInfo.put("count", rset.getInt("COUNT"));
					buyInfo.put("workName", rset.getString("WORK_NAME"));
					buyInfo.put("price", rset.getInt("PRICE"));
					buyInfo.put("deliPrice", rset.getInt("DELI_PRICE"));
					buyInfo.put("authorName", rset.getString("MEMBER_NAME"));
					buyInfo.put("changeName", rset.getString("CHANGE_NAME"));
					list.add(buyInfo);
				}
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<WorkOption> selectOption(Connection con, int workId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<WorkOption> olist = null;
		WorkOption wo = null;
		
		String query = prop.getProperty("selectOption");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, workId);
			
			rset = pstmt.executeQuery();
			
			olist = new ArrayList<WorkOption>();
			while(rset.next()) {
				wo = new WorkOption();
				wo.setoName(rset.getString("ONAME"));
				wo.setwId(rset.getInt("WID"));
				
				olist.add(wo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return olist;
	}

	public int insertBasketOption(Connection con, int bid, int i) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBasketOption");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);
			pstmt.setInt(2, i);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertBasketOption(Connection con, int bid, String[] opId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBasketOption");
		
		try {
			for(int i = 0; i < opId.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, bid);
				pstmt.setInt(2, Integer.parseInt(opId[i]));
				
				result += pstmt.executeUpdate();		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateCount(Connection con, int workId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,workId);
			pstmt.setInt(2,workId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertPoint(Connection con, int memberId, int point, String pid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPoint");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, point);
			pstmt.setInt(2, memberId);
			pstmt.setString(3, pid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	//인기순 정렬
	public ArrayList<HashMap<String, Object>> selectProductListPop(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectProListPop");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<HashMap<String, Object>>();
			
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("workContent", rset.getString("WORK_CONTENT"));
				hmap.put("deliPrice", rset.getInt("DELI_PRICE"));
				hmap.put("wrDate", rset.getDate("RS_DATE"));
				hmap.put("rsDate", rset.getDate("RS_DATE"));
				hmap.put("maxCount", rset.getInt("MAX_COUNT"));
				hmap.put("csDate", rset.getDate("RS_DATE"));
				hmap.put("workKind", rset.getString("WORK_KIND"));
				hmap.put("memberId", rset.getInt("MEMBER_ID"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("cid", rset.getInt("CID"));
				hmap.put("typeId", rset.getInt("TYPE_ID"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("wcount", rset.getInt("WCOUNT"));
				hmap.put("category", rset.getString("CATEGORY"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				list.add(hmap);
				
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		System.out.println("Prodao pop에서: " + list);
		return list;
  }

  
	public int insertMinusPoint(Connection con, int mPoint, int memberId, String pid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMinusPoint");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mPoint);
			pstmt.setInt(2, memberId);
			pstmt.setString(3, pid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<OrderList> selectOrderId(Connection con, ArrayList<OrderList> oList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OrderList> list = null;
		OrderList order = null;
		
		String query = prop.getProperty("selectOrderId");
		
		try {
			list = new ArrayList<OrderList>();
			for(int i = 0; i < oList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, oList.get(i).getBasketId());
				
				rset = pstmt.executeQuery();
				if(rset.next()) {
					order = new OrderList();
					order.setOdId(rset.getInt("OD_ID"));
					order.setBundleCode(rset.getString("BUNDLE_CODE"));
					list.add(order);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int insertDelivery(ArrayList<OrderList> list, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		String query = prop.getProperty("insertDelivery");
		
		try {
			for(int i = 0; i < list.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "배송준비");
				pstmt.setInt(2, list.get(i).getOdId());
				
				result += pstmt.executeUpdate();	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}
	
	public ArrayList<HashMap<String, Object>> selectProductListLow(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectProListLow");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<HashMap<String, Object>>();
			
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("workContent", rset.getString("WORK_CONTENT"));
				hmap.put("deliPrice", rset.getInt("DELI_PRICE"));
				hmap.put("wrDate", rset.getDate("RS_DATE"));
				hmap.put("rsDate", rset.getDate("RS_DATE"));
				hmap.put("maxCount", rset.getInt("MAX_COUNT"));
				hmap.put("csDate", rset.getDate("RS_DATE"));
				hmap.put("workKind", rset.getString("WORK_KIND"));
				hmap.put("memberId", rset.getInt("MEMBER_ID"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("cid", rset.getInt("CID"));
				hmap.put("typeId", rset.getInt("TYPE_ID"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("wcount", rset.getInt("WCOUNT"));
				hmap.put("category", rset.getString("CATEGORY"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				list.add(hmap);
				
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		System.out.println("Prodao low에서: " + list);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectProductListNew(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectProListNew");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<HashMap<String, Object>>();
			
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("workContent", rset.getString("WORK_CONTENT"));
				hmap.put("deliPrice", rset.getInt("DELI_PRICE"));
				hmap.put("wrDate", rset.getDate("RS_DATE"));
				hmap.put("rsDate", rset.getDate("RS_DATE"));
				hmap.put("maxCount", rset.getInt("MAX_COUNT"));
				hmap.put("csDate", rset.getDate("RS_DATE"));
				hmap.put("workKind", rset.getString("WORK_KIND"));
				hmap.put("memberId", rset.getInt("MEMBER_ID"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("cid", rset.getInt("CID"));
				hmap.put("typeId", rset.getInt("TYPE_ID"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("wcount", rset.getInt("WCOUNT"));
				hmap.put("category", rset.getString("CATEGORY"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				list.add(hmap);
				
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		System.out.println("Prodao New에서: " + list);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectProductListHigh(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectProListHigh");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<HashMap<String, Object>>();
			
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("workContent", rset.getString("WORK_CONTENT"));
				hmap.put("deliPrice", rset.getInt("DELI_PRICE"));
				hmap.put("wrDate", rset.getDate("RS_DATE"));
				hmap.put("rsDate", rset.getDate("RS_DATE"));
				hmap.put("maxCount", rset.getInt("MAX_COUNT"));
				hmap.put("csDate", rset.getDate("RS_DATE"));
				hmap.put("workKind", rset.getString("WORK_KIND"));
				hmap.put("memberId", rset.getInt("MEMBER_ID"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("cid", rset.getInt("CID"));
				hmap.put("typeId", rset.getInt("TYPE_ID"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("wcount", rset.getInt("WCOUNT"));
				hmap.put("category", rset.getString("CATEGORY"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				list.add(hmap);
				
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		System.out.println("Prodao High에서: " + list);
		return list;
	}

}
























