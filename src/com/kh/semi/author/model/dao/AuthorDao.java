package com.kh.semi.author.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.author.model.vo.ApplyHistory;
import com.kh.semi.author.model.vo.Author;
import com.kh.semi.author.model.vo.PicFile;
import com.kh.semi.author.model.vo.ProType;
import com.kh.semi.funding.model.vo.AuthorAccount;

public class AuthorDao {
	
	private Properties prop = new Properties();
	
	public AuthorDao() {
		String fileName = AuthorDao.class
				.getResource("/sql/author/author-query.properties")
				.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //end try
	} //end constr

	//브랜드명이 존재하는 지 검색
	public int selectBrandName(Connection con, String brandName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectBrandName");
		int cnt = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, brandName);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				cnt++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return cnt;
	} //end method

	//작가 공예유형 데이터 가져오기
	public ArrayList<ProType> selectProTypeList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectProTypeAll");
		ArrayList<ProType> list = null;
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<ProType>();
			while(rset.next()) {
				ProType pType = new ProType();
				pType.setTypeId(rset.getInt("TYPE_ID"));
				pType.setMaterial(rset.getString("MATERIAL"));
				list.add(pType);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	} // end method

	//작가 정보 저장
	public int insertAuthor(Connection con, Author author) {
		int resultAuthor = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertAuthor");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, author.getMemberId());
			pstmt.setString(2, author.getBrandName());
			pstmt.setString(3, author.getApplyContent());
			pstmt.setString(4, "1차신청");
			resultAuthor = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return resultAuthor;
	} //end method

	//작가 유형 정보 저장
	public int insertAuthorType(Connection con, int memberId, String selectPType) {
		int resultAuthorType = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertAuthorType");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			pstmt.setString(2, selectPType);
			resultAuthorType = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultAuthorType;
	} //end method

	public int insertApply1File(Connection con, int memberId, ArrayList<PicFile> fileList) {
		PreparedStatement pstmt = null;
		int resultFile = 0;
		String query = prop.getProperty("insertApply1File");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				String fileType = "";
				if(i == 0) {
					fileType = "브랜드로고";
				} else {
					fileType = "1차입점서류";
				}				
				pstmt.setString(4, fileType);
				pstmt.setInt(5, memberId);
				resultFile += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return resultFile;
	}
	
	//1차 입점 신청 후 입점 내역 정보 저장한다.
	public int insertAuthorApply(Connection con, int memberId) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertAuthorApply");
		int result = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "대기");
			pstmt.setString(2, "-");
			pstmt.setInt(3, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	} //end method

	//사용자의 입점 정보 가져오기
	public ArrayList<ApplyHistory> selectOneAuthorApply(Connection con, int memberId) {
		PreparedStatement pstmt = null;
		ArrayList<ApplyHistory> list = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOneAuthorApply");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			rset = pstmt.executeQuery();
			list = new ArrayList<ApplyHistory>();
			while(rset.next()) {
				ApplyHistory applyHistory = new ApplyHistory();
				applyHistory.setMemberId(rset.getInt("MEMBER_ID"));
				applyHistory.setMamberName(rset.getString("MEMBER_NAME"));
				applyHistory.setEmail(rset.getString("EMAIL"));
				applyHistory.setAuthorName(rset.getString("AUTHOR_NAME"));
				applyHistory.setApplyContent(rset.getString("APPLY_CONTENT"));
				applyHistory.setApplyStat1(rset.getString("APPLY_STAT1"));
				applyHistory.setApplyStat2(rset.getString("APPLY_STAT2"));
				applyHistory.setApplyDate(rset.getDate("APPLY_DATE"));
				applyHistory.setCraftId(rset.getInt("CRAFT_ID"));
				applyHistory.setMaterial(rset.getString("MATERIAL"));
				applyHistory.setOriginName(rset.getString("ORIGIN_NAME"));
				applyHistory.setChangeName(rset.getString("CHANGE_NAME"));
				applyHistory.setFilePath(rset.getString("FILE_PATH"));
				applyHistory.setFileType(rset.getString("FILE_TYPE"));
				
				list.add(applyHistory);
			} //end while
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	//2차 입점 신청 파일을 저장한다.
	public int insertApply2(Connection con, int memberId, ArrayList<PicFile> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertApply2");
		try {
			String filePath = "";
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				if(fileList.get(i).getFileType().equals("businessLicense")) {
					filePath = "사업자등록증";
				} else if(fileList.get(i).getFileType().equals("confirm")) {
					filePath = "구매안전확인증";
				} else {
					filePath = "통신판매업신고증";
				}//end if
				pstmt.setString(4, filePath);
				pstmt.setInt(5, memberId);
				result += pstmt.executeUpdate();
			} //end for			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//2차신청상태 대기로 변경하기
	public int updateAuthorApplyStat2(Connection con, int memberId) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateAuthorApplyStat2");
		int result = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "대기");
			pstmt.setInt(2, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Integer> selectSalesForMonth(Connection con, int memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Integer> list = null;
		
		String query = prop.getProperty("selectSalesForMonth");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Integer>();
			while(rset.next()) {
				list.add(rset.getInt("SALES"));
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

	public ArrayList<String> getMonth(Connection con, int memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list = null;
		
		String query = prop.getProperty("selectSalesForMonth");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<String>();
			while(rset.next()) {
				list.add(rset.getString("MONTH"));
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

	public int insertAcc(Connection con, AuthorAccount authorAcc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertAuthorAcc");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, authorAcc.getBackName());
			pstmt.setString(2, authorAcc.getAccountNumber());
			pstmt.setString(3, authorAcc.getVerifyAccount());
			pstmt.setString(4, authorAcc.getAuthorName());
			pstmt.setString(5, authorAcc.getAuthorbirth());
			pstmt.setString(6, authorAcc.getType());
			pstmt.setInt(7, authorAcc.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertApplyList(Connection con, int alNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String quest = prop.getProperty("insertApplyList");
		
		try {
			pstmt = con.prepareStatement(quest);
			pstmt.setString(1, "대기");
			pstmt.setInt(2, alNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

} //end class
























