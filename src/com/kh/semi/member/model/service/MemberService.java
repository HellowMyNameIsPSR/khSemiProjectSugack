package com.kh.semi.member.model.service;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Address;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.member.model.vo.Point;
import com.kh.semi.product.model.vo.Basket;
import com.kh.semi.work.model.vo.WorkOption;

import static com.kh.semi.common.JDBCTemplate.*;

import java.net.PasswordAuthentication;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MemberService {

	public int insertMember(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con, m);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public Member loginMember(String email, String password) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginMember(con, email, password);
		
		close(con);
		
		return loginUser;
	}

	public Member updateMember(Member m) {
		Connection con = getConnection();
		Member loginUser = null;
		
		int result = new MemberDao().updateMember(con, m);
		
		if(result > 0) {
			commit(con);
			loginUser = new MemberDao().loginMember(con, m.getEmail(), m.getPassword());
		}else {
			rollback(con);
		}
		close(con);
		
		return loginUser;
	}

	public int idCheck(String email) {
		Connection con = getConnection();
		
		int result = new MemberDao().idCheck(con, email);
		
		close(con);
		
		return result;
	}

	public int passwordCheck(String email, String password) {
		Connection con = getConnection();
		
		int result = new MemberDao().passwordCheck(con, email, password);
		
		return result;
	}
	
	public int insertAddress(Address add) {
		Connection con = getConnection();
		int result = 0;
		ArrayList<Address> list = new MemberDao().addressList(con, add.getMemberId());
		
		
		if(list.size() < 3) {
			result = new MemberDao().insertAddress(con, add);
		}else {
			result = -1;
		}
		
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public ArrayList<Address> addressList(int memberId) {
		Connection con = getConnection();
		
		ArrayList<Address> list = new MemberDao().addressList(con, memberId);
		
		close(con);
		
		return list;
	}

	public int deleteAddress(int addressId) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteAddress(con, addressId);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Address selectAddress(int addressId) {
		Connection con = getConnection();
		
		Address add = new MemberDao().selectAddress(con, addressId);
		
		close(con);
		
		
		return add;
	}

	public int updateAddress(Address add) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateAddress(con, add);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectCartList(int memberId) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new MemberDao().selectCartList(con, memberId);
		
		close(con);
		
		return list;
	}

	public int deleteCart(String[] bidArr) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteCart(con, bidArr);
		
		if(result == bidArr.length) {
			commit(con);
			int result2 = new MemberDao().deleteBasketOption(con, bidArr);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int countUpdate(int bid, int count) {
		Connection con = getConnection();
		
		int result = new MemberDao().countUpdate(con, bid, count);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<WorkOption> selectOptionList(int memberId) {
		Connection con = getConnection();
		
		ArrayList<WorkOption> olist = new MemberDao().selectOptionList(memberId, con);
		
		close(con);
		
		return olist;
	}

	public HashMap<String, Object> selectOrderList(int memberId) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		ArrayList<String> bundleList = new MemberDao().selectBundleCode(con, memberId);
		ArrayList<HashMap<String, Object>> orderList = new MemberDao().selectOrderList(con, memberId);
		ArrayList<WorkOption> olist = new MemberDao().selectBuyOptionList(memberId, con);
		int totalPoint = new MemberDao().selectTotalPoint(con, memberId);
		
		hmap.put("blist", bundleList);
		hmap.put("orderList", orderList);
		hmap.put("olist", olist);
		hmap.put("totalPoint", totalPoint);
		
		close(con);
		
		return hmap;
	}

	public int sendMail(String email, String randomCode) {
		String host = "smtp.naver.com";
		String pass = "Wnffkdl!23";
		String user = "dlwlgus1757@naver.com";
		int result = 0;
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(user, pass); 
				} 
			});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			
			message.setSubject("수작에서 보낸 인증번호 입니다");
			
			message.setText("다음의 문자를 넣고 인증하기 버튼을 눌러주세요\n" + randomCode);
			
			Transport.send(message);
			System.out.println("성공");
			result = 1;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}

	public String selectEmail(String name, Date birthDate) {
		Connection con = getConnection();
		
		String email = new MemberDao().selectEmail(con, name, birthDate);
		
		close(con);
		
		return email;
	}

	public int findPassword(Member m, String randomCode) {
		Connection con = getConnection();
		int result2 = 0;
		int result3 = 0;
		
		int result = new MemberDao().findPassword(m, con);
		
		if(result > 0) {
			result2 = sendPassword(m.getEmail(), randomCode);
			if(result2 > 0) {
				result3 = new MemberDao().updatePassword(con, m);
				if(result3 > 0) {
					commit(con);
				}else {
					rollback(con);
				}
			}			
		}
		
		return result3;
	}
	
	public int sendPassword(String email, String randomCode) {
		String host = "smtp.naver.com";
		String pass = "Wnffkdl!23";
		String user = "dlwlgus1757@naver.com";
		int result = 0;
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(user, pass); 
				} 
			});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			
			message.setSubject("수작에서 보낸 인증번호 입니다");
			
			message.setText("회원님의 임시 비밀번호는 : " + randomCode);
			
			Transport.send(message);
			System.out.println("성공");
			result = 1;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}

	public ArrayList<Point> selectPoint(int memberId) {
		Connection con = getConnection();
		
		ArrayList<Point> list = new MemberDao().selectPoint(con, memberId);
		
		close(con);
		
		return list;
	}


}






























