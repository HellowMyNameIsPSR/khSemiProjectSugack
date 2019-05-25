package com.kh.semi.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.board.model.vo.AuthorPageAttachmrnt;
import com.kh.semi.board.model.vo.AuthorWorkList;
import com.kh.semi.board.model.vo.AuthorWorkPic;
import com.kh.semi.board.model.vo.Board;
import com.kh.semi.board.model.vo.authorComent;

import oracle.net.aso.b;

import static com.kh.semi.common.JDBCTemplate.*;

public class AuthorPageDao {
	private Properties prop = new Properties();

	public AuthorPageDao() {

		String fileName = ProQnaDao.class.getResource("/sql/board/board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	// 프로필 작성 텍스트 등록메소드
	public int insertAuthorPageProContent(Connection con, Board b) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAuthorPageProContent");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getMemberId());
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getContent());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			close(pstmt);
		}

		return result;
	}

	// 게시판 확인 메소드
	public int selectAuthorPageProCurrval(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;

		String query = prop.getProperty("selectAuthorPageProCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				bid = rset.getInt("currval");
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

	// 첨부 파일 등록용 메소드
	public int insertAuthorPageAttachment(Connection con, ArrayList<AuthorPageAttachmrnt> fileList) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAuthorPageAttachment");

		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());

				int level = 0;
				if (i == 0)
					level = 0;
				else
					level = 1;
				pstmt.setInt(4, level);
				pstmt.setInt(5, fileList.get(i).getBno());

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

	
	//작가리스트 조회 
	public ArrayList<HashMap<String, Object>> selectAuthorPage(Connection con) {

		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectAuthorList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<HashMap<String, Object>>();

			while (rset.next()) {
				hmap = new HashMap<String, Object>();

				hmap.put("BNO", rset.getInt("BNO"));
				hmap.put("MemberID", rset.getInt("MEMBER_ID"));
				hmap.put("ProTitle", rset.getString("TITLE"));
				hmap.put("ProContent", rset.getString("CONTENT"));
				hmap.put("WRITE_DATE", rset.getDate("WRITE_DATE"));
				hmap.put("BCOUNT", rset.getInt("BCOUNT"));
				hmap.put("DIVISON", rset.getInt("DIVISON"));
				hmap.put("WORK_ID", rset.getInt("WORK_ID"));
				/*hmap.put("MODIFY_DATE", rset.getDate("MODIFY_DATE"));
				hmap.put("MATERIAL", rset.getString("MATERIAL"));*/
				
				hmap.put("FILE_CODE", rset.getInt("FILE_CODE"));
				hmap.put("ProOriginname", rset.getString("ORIGIN_NAME"));
				hmap.put("ProChangename", rset.getString("CHANGE_NAME"));
				hmap.put("FILE_TYPE", rset.getString("FILE_TYPE"));
				hmap.put("APPLY_CODE", rset.getInt("APPLY_CODE"));
				list.add(hmap);

				System.out.println("dao에값1:" + list);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		System.out.println("dao에값2:" + list);

		return list;
	}
   //작가스토리 상세페이지 리스트
	public HashMap<String, Object> selectAuthorStory(Connection con, int memberId, int bno) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
        HashMap<String ,Object> hmap = null;
        Board b = null;
        AuthorPageAttachmrnt at= null;
        ArrayList<AuthorPageAttachmrnt> list =null;
        
		
		String query = prop.getProperty("selectAuthorStory");

        try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, memberId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<AuthorPageAttachmrnt>();
			
			while(rset.next()) {
				b = new Board();
				
				b.setBno(rset.getInt("BNO"));
				b.setMemberId(memberId);
				b.setTitle(rset.getString("TITLE"));
				b.setContent(rset.getString("CONTENT"));
				b.setWriteDate(rset.getDate("WRITE_DATE"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setDivision(rset.getInt("DIVISON"));
				b.setWorkId(rset.getInt("WORK_ID"));
				/*b.setModifyDate(rset.getDate("MODIFY_DATE"));
				b.setMaterial(rset.getString("MATERIAL"));*/
				
				at = new AuthorPageAttachmrnt();
				
				at.setFileCode(rset.getInt("FILE_CODE"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setFileType(rset.getString("FILE_TYPE"));
				at.setApply_Code(rset.getInt("APPLY_CODE"));
				at.setBno(rset.getInt("BNO"));
				
				
				list.add(at);
				
			}
			
			
			
			hmap = new HashMap<String,Object>();
			hmap.put("board",b);
			hmap.put("AuthorPageAttachmrnt",list);
			
			System.out.println("board:"+b);
			System.out.println("dao값"+list);
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
			
		
        
		
		

		return hmap;
	}

	public int insertAuthorPageDetailContent(Connection con, Board b) {

		PreparedStatement pstmt = null;
		int result = 0;

		// Board 테이블 컬럼에 맞게

		String query = prop.getProperty("insertAuthorDetailBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getMemberId());
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getContent());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;

	}

	public int insertAuthorPageDetailAttachment(Connection con, ArrayList<AuthorPageAttachmrnt> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAuthorDetilAttachment");

		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());

				int level = 0;
				if (i == 0)
					level = 0;
				else
					level = 1;
				pstmt.setInt(4, level);
				pstmt.setInt(5, fileList.get(i).getBno());

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
    
	
   //댓글 작성 dao
	public int insertauthorComent(Connection con, authorComent ac) {
		
		PreparedStatement pstmt = null; 
		int result = 0 ; 
		
		String query = prop.getProperty("insertAuthorComment");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ac.getCntent());
			pstmt.setInt(2,ac.getBno());
			pstmt.setInt(3, ac.getWriterId());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		System.out.println("authorComent:" +result);
		return result;
	}
   //댓글 리스트  Dao
	public ArrayList<authorComent> SelectComent(int bno, Connection con, int memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		authorComent ac = null; 
		ArrayList<authorComent> list = null;
		
		String query = prop.getProperty("SelectauthorComent");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,bno);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<authorComent>();
			
			while(rset.next()) {
				ac = new authorComent();
				ac.setCommentId(rset.getInt("COMMENT_ID"));//댓글코드
				ac.setWriteDate(rset.getDate("WRITE_DATE"));//작성 날짜
				ac.setCntent(rset.getString("CONTENT")); // 댓글 내용
				ac.setBno(rset.getInt("BNO"));// 게시글 번호
				ac.setWriterId(rset.getInt("WRITER_ID"));//작성자 
                ac.setWriteLever(rset.getInt("WRITE_LEVEL"));//작성위치
                ac.setWorkid(rset.getInt("WORK_ID")); //작품코드
                ac.setEmail(rset.getString("EMAIL"));
                
                list.add(ac);
                
                
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
	    System.out.println("댓글 Dao list:"+list);		
				
				
		return list;
	}

	
	//작가 작품사진 리스트 Dao
	public ArrayList<HashMap<String, Object>> selectAuthorPdList(Connection con, int memberId) {
		
		
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		ResultSet  rset = null;
		
		String query = prop.getProperty("selectAuthorPdLIst");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HashMap<String,Object>>();
			while(rset.next()) {
				
				hmap =new HashMap<String,Object>();
				hmap .put("WorkId",rset.getInt("WORK_ID"));
				hmap .put("WorkName", rset.getString("WORK_NAME"));
				hmap .put("WorkContent" ,rset.getString("WORK_CONTENT"));
				hmap .put("DeliPrice", rset.getInt("DELI_PRICE"));
				hmap .put("WrDate", rset.getDate("WR_DATE"));
				hmap .put("RsDate", rset.getDate("RS_DATE"));
				hmap .put("MaxCount",rset.getInt("MAX_COUNT"));
				hmap .put("CsDate", rset.getDate("CS_DATE"));
				hmap .put("Work_Kind",rset.getString("WORK_KIND"));
				hmap .put("Price", rset.getInt("PRICE"));
				hmap .put("Cid", rset.getInt("CID"));
				hmap .put("TypeId" ,rset.getInt("TYPE_ID"));
				hmap .put("Wcount", rset.getInt("WCOUNT"));
				hmap .put("Wpid",rset.getInt("WP_ID") );
				hmap .put("OriginName", rset.getString("ORIGIN_NAME"));
				hmap .put("ChangeName", rset.getString("CHANGE_NAME"));
				hmap .put("FilePath", rset.getString("FILE_PATH"));
				hmap .put("PicType", rset.getString("PIC_TYPE"));
				
				list.add(hmap);
				System.out.println("dao에 " + list);
				
				
				
				
			}
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		
		return list;
	}


}
