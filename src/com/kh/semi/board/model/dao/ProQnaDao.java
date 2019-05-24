package com.kh.semi.board.model.dao;



import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.board.model.vo.ProQna;
import com.kh.semi.board.model.vo.ProQnaComment;

public class ProQnaDao {
	private Properties prop = new Properties();
	public ProQnaDao() {
	
		String fileName = ProQnaDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	

	//Q&A문의글 작성용 메소드
	public int insertProQna(Connection con, ProQna qna) {
		
		PreparedStatement pstmt = null;	
		int result = 0;
		
		String query = prop.getProperty("insertQna");
		
		try {
			pstmt = con.prepareStatement(query);
		
			
			pstmt.setInt(1, qna.getMid());
			pstmt.setString(2, qna.getcategory());
			pstmt.setString(3, qna.getContent());
			pstmt.setInt(4, qna.getWorkId());
			//pstmt.setInt(3, qna.getBno());  //작품코드
			
			//pstmt.setInt(4, Integer.parseInt(qna.getcategory()));
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	//게시글 리스트 조회
	public ArrayList<ProQna> selectList(Connection con, int memberId) {
		ArrayList<ProQna> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectQna");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ProQna>();
		
			while(rset.next()) {
				
				ProQna qna = new ProQna();
				qna.setRowNum(rset.getInt("ROWNUM"));
				qna.setBno(rset.getInt("BNO"));
				qna.setcategory(rset.getString("TITLE"));
				qna.setWriteDate(rset.getDate("WRITE_DATE"));
				qna.setMid(rset.getInt("MEMBER_ID"));
				
				list.add(qna);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch bloc!k
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}



	//문의내역 자세히보기
	public ProQna selectOne(Connection con, int num) {
		
		ProQna qna = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectQnaOne");
		System.out.println(query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			System.out.println("ProQnaDao에서");
			if(rset.next()) {
				qna = new ProQna();
				
				qna.setBno(rset.getInt("BNO"));
				qna.setContent(rset.getString("CONTENT"));
				qna.setcategory(rset.getString("TITLE"));
				qna.setWriteDate(rset.getDate("WRITE_DATE"));
				qna.setWriter(rset.getString("MEMBER_NAME"));
				qna.setWorkName(rset.getString("WORK_NAME"));
				
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(qna);
		return qna;
	}


	//문의글에 답변작성용 메소드
	public int insertComment(Connection con,ProQnaComment comment/*ProQna qna*/) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertComment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			pstmt.setString(1, comment.getContent());
			pstmt.setInt(2, comment.getBno());
			pstmt.setInt(3, comment.getWriterId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	//답변리스트 조회용 메소드
	/*public ArrayList<ProQnaComment> selectCommentList(Connection con, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProQnaComment> list = null;
		
		String query = prop.getProperty("selectCommentList");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ProQnaComment>();
			
			while(rset.next()) {
				
				ProQna qna = new ProQna();
				
				qna.setWriteDate(rset.getDate("WRITE_DATE"));
				qna.setContent(rset.getString("CONTENT"));
				qna.setBno(rset.getInt("BNO"));
				
				ProQnaComment comment = new ProQnaComment();
				comment.setWriteDate(rset.getDate("WRITE_DATE"));
				comment.setContent(rset.getString("CONTENT"));
				comment.setBno(rset.getInt("BNO"));
				
				list.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
		
		
		selectCommentList=SELECT B.CONTENT, M.MEMBER_NAME, B.WRITE_DATE FROM B_COMMENT B JOIN BOARD BD ON (BD.BNO=B.BNO) JOIN MEMBER M ON(M.MEMBER_ID=BD.MEMBER_ID) where BNO = ?
	}*/

	//답변리스트 조회용 메소드
	public ArrayList<ProQnaComment> selectCommentList(Connection con, int bno) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ProQnaComment> list = null;
		
		String query = prop.getProperty("selectCommentList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ProQnaComment>();
			
			while(rset.next()) {
				ProQnaComment c =  new ProQnaComment();
				c.setCid(rset.getInt("COMMENT_ID"));
				c.setWriteDate(rset.getDate("WRITE_DATE"));
				c.setContent(rset.getString("CONTENT"));
				c.setBno(rset.getInt("BNO"));
				c.setWriterId(rset.getInt("WRITER_ID"));
				c.setWriteLevel(rset.getInt("WRITE_LEVEL"));
				c.setWriter(rset.getString("MEMBER_NAME"));
				
				System.out.println("ProQnaDao c : " + c);
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return list;
	}


	

	


	
}
