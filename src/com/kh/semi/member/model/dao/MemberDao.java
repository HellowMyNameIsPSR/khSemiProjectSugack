package com.kh.semi.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.product.model.vo.Basket;
import com.kh.semi.work.model.vo.WorkOption;

import static com.kh.semi.common.JDBCTemplate.*;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getEmail());
			pstmt.setString(2, m.getMemberName());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getPassword());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member loginMember(Connection con, String email, String password) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member();
				loginUser.setMemberId(rset.getInt("MEMBER_ID"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setPassword(rset.getString("PASSWORD"));
				loginUser.setMemberName(rset.getString("MEMBER_NAME"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setGender(rset.getString("GENDER"));
				loginUser.setBirthDate(rset.getDate("BIRTH_DATE"));
				loginUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginUser.setMemberType(rset.getString("MEMBER_TYPE"));
				loginUser.setAuthorDate(rset.getDate("AUTHOR_DATE"));
				loginUser.setOutDate(rset.getDate("OUT_DATE"));
				loginUser.setModifyDate(rset.getDate("L_MODIFY_DATE"));
				loginUser.setStatus(rset.getString("STATUS"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

	public int updateMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getPassword());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getGender());
			pstmt.setDate(4, m.getBirthDate());
			pstmt.setInt(5, m.getMemberId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int idCheck(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}
	
	public int passwordCheck(Connection con, String email, String password) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("passwordCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int insertAddress(Connection con, Address add) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAddress");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, add.getAddress());
			pstmt.setInt(2, add.getMemberId());
			pstmt.setString(3, add.getPhone1());
			pstmt.setString(4, add.getPhone2());
			pstmt.setString(5, add.getAddressName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Address> addressList(Connection con, int memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Address add = null;
		ArrayList<Address> list = null;
		
		String query = prop.getProperty("addressList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Address>();
			while(rset.next()) {
				add = new Address();
				add.setAddressId(rset.getInt("ADDRESS_ID"));
				add.setAddressName(rset.getString("ADDRESS_NAME"));
				add.setAddress(rset.getString("ADDRESS"));
				add.setPhone1(rset.getString("PHONE1"));
				add.setPhone2(rset.getString("PHONE2"));
				add.setMemberId(rset.getInt("MEMBER_ID"));
				add.setAddType(rset.getString("ADD_TYPE"));
				
				list.add(add);
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

	public int deleteAddress(Connection con, int addressId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAddress");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, addressId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public Address selectAddress(Connection con, int addressId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Address add = null;
		
		String query = prop.getProperty("selectAddress");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, addressId);
			
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
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return add;
	}

	public int updateAddress(Connection con, Address add) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAddress");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, add.getAddress());
			pstmt.setInt(2, add.getMemberId());
			pstmt.setString(3, add.getPhone1());
			pstmt.setString(4, add.getPhone2());
			pstmt.setString(5, add.getAddressName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectCartList(Connection con, int memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> cart = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		String query = prop.getProperty("selectCartList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				cart = new HashMap<String, Object>();
				cart.put("bid", rset.getInt("BASKET_ID"));
				cart.put("mid", rset.getInt("MID"));
				cart.put("wid", rset.getInt("WID"));
				cart.put("basketDate", rset.getDate("BASKET_DATE"));
				cart.put("count", rset.getInt("COUNT"));
				cart.put("changeName", rset.getString("CHANGE_NAME"));
				cart.put("price", rset.getInt("PRICE"));
				cart.put("deliPrice", rset.getInt("DELI_PRICE"));
				cart.put("authorName", rset.getString("MEMBER_NAME"));
				cart.put("workName", rset.getString("WORK_NAME"));
				list.add(cart);
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

	public int deleteCart(Connection con, String[] bidArr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteCart");
		
		try {
			for(int i = 0; i < bidArr.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(bidArr[i]));
				
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

	public int countUpdate(Connection con, int bid, int count) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("countUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, count);
			pstmt.setInt(2, bid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<WorkOption> selectOptionList(int memberId, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		WorkOption wo = null;
		ArrayList<WorkOption> olist = null;
		
		String query = prop.getProperty("selectBasketOption");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			
			rset = pstmt.executeQuery();
			
			olist = new ArrayList<WorkOption>();
			while(rset.next()) {
				wo = new WorkOption();
				wo.setOpId(rset.getInt("OP_ID"));
				wo.setoName(rset.getString("ONAME"));
				wo.setoPrice(rset.getInt("OPRICE"));
				wo.setoValue(rset.getString("OVALUE"));
				wo.setwId(rset.getInt("BASKET_ID"));
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

	public int deleteBasketOption(Connection con, String[] bidArr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBasketOption");
		
		return 0;
	}

	public ArrayList<HashMap<String, Object>> selectOrderList(Connection con, int memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		String query = prop.getProperty("selectOrderList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("bid", rset.getInt("BASKET_ID"));
				hmap.put("mid", rset.getInt("MID"));
				hmap.put("wid", rset.getInt("WID"));
				hmap.put("basketDate", rset.getDate("BASKET_DATE"));
				hmap.put("count", rset.getInt("COUNT"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("deliPrice", rset.getInt("DELI_PRICE"));
				hmap.put("authorName", rset.getString("MEMBER_NAME"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("bundleCode", rset.getString("BUNDLE_CODE"));
				hmap.put("payDate", rset.getDate("PAY_DATE"));
				list.add(hmap);
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

	public ArrayList<String> selectBundleCode(Connection con, int memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> bundleList = null;
		
		String query = prop.getProperty("selectBundleCode");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			
			rset = pstmt.executeQuery();
			
			bundleList = new ArrayList<String>();
			while(rset.next()) {
				bundleList.add(rset.getString(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bundleList;
	}

	public ArrayList<WorkOption> selectBuyOptionList(int memberId, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		WorkOption wo = null;
		ArrayList<WorkOption> olist = null;
		
		String query = prop.getProperty("selectBuyOption");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			
			rset = pstmt.executeQuery();
			
			olist = new ArrayList<WorkOption>();
			while(rset.next()) {
				wo = new WorkOption();
				wo.setOpId(rset.getInt("OP_ID"));
				wo.setoName(rset.getString("ONAME"));
				wo.setoPrice(rset.getInt("OPRICE"));
				wo.setoValue(rset.getString("OVALUE"));
				wo.setwId(rset.getInt("BASKET_ID"));
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

	

}






















