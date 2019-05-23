package com.kh.semi.work.model.dao;

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
import java.util.Properties;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import com.kh.semi.member.model.vo.Member;
import com.kh.semi.work.model.vo.PageInfo;
import com.kh.semi.work.model.vo.PicFile;
import com.kh.semi.work.model.vo.Work;
import com.kh.semi.work.model.vo.WorkOption;
import com.kh.semi.work.model.vo.WorkPic;

public class WorkDao {
	private Properties prop = new Properties();
	
	public WorkDao() {
		String fileName = 
				WorkDao.class
				.getResource("/sql/work/work-query.properties")
				.getPath();
		
			try {
				prop.load(new FileReader(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
				
	}
	
	//작품 판매 등록 메소드
	public int insertSale(Connection con, Work work) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertSale");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, work.getworkName());
			pstmt.setString(2, work.getWorkContent());
			pstmt.setInt(3, work.getDeliPrice());
			pstmt.setInt(4, work.getMemberId());
			pstmt.setInt(5, work.getPrice());
			pstmt.setInt(6, work.getCid());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	//옵션 등록용 메소드
	public int insertOption(Connection con, ArrayList<WorkOption> workOption) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOption");
		
		try {
			for(int i = 0; i < workOption.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, workOption.get(i).getoName());
				pstmt.setInt(2, workOption.get(i).getoPrice());
				pstmt.setString(3, workOption.get(i).getoValue());
				
				System.out.println("상품Id : " + workOption.get(i).getwId());
				System.out.println("옵션명 : " + workOption.get(i).getoName());
				System.out.println("옵션가격 : " + workOption.get(i).getoPrice());
				System.out.println("옵션값 : " + workOption.get(i).getoValue());
				
				result += pstmt.executeUpdate();
			}
			
			
			/*for(int i = 0; i < workPic.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, workPic.get(i).getoriginName());
				pstmt.setString(2, workPic.get(i).getchangeName());
				pstmt.setString(3, workPic.get(i).getfilePath());*/
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("옵션 dao 값 : " + result);
		return result;
	}

	//판매작품관리 리스트 보기용 메소드
	public ArrayList<HashMap<String, Object>> selectSalesList(Connection con, PageInfo pi, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectSalesList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("price", rset.getInt("WORK_ID"));
				hmap.put("wrDate", rset.getDate("WR_DATE"));

				list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getListCount(Connection con, String memberId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public int insertPicFile(Connection con, ArrayList<WorkPic> workPic) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPicFile");
		
		try {
			for(int i = 0; i < workPic.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, workPic.get(i).getoriginName());
				pstmt.setString(2, workPic.get(i).getchangeName());
				pstmt.setString(3, workPic.get(i).getfilePath());
				
				String type = "saleRep";
				if(i == 0) type = "saleRep";
				else type = "saleDetail";
				
				pstmt.setString(4, type);
				
				result += pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertContentsImage(Connection con, ArrayList<PicFile> picFile) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPicFile");
		
		try {
			for(int i = 0; i < picFile.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, picFile.get(i).getOriginName());
				pstmt.setString(2, picFile.get(i).getChangeName());
				pstmt.setString(3, picFile.get(i).getFilePath());
				pstmt.setInt(4, picFile.get(i).getBno());
				
				result += pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int workId = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				workId = rset.getInt("currval");
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return workId;
	}

	

	public Work selectOne(Connection con, int num) {
		Work work = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				work = new Work();
				work.setWorkId(rset.getInt("WORK_ID"));;
				work.setworkName(rset.getString("WORK_NAME"));
				work.setWorkContent(rset.getString("WORK_CONTENT"));
				work.setDeliPrice(rset.getInt("DELI_PRICE"));
				work.setPrice(rset.getInt("PRICE"));
				work.setCid(rset.getInt("CID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return work;
	}

	public ArrayList<WorkPic> selectImg(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<WorkPic> fileList = null;
		
		String query = prop.getProperty("selectImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			fileList = new ArrayList<WorkPic>();
			
			while(rset.next()) {
				WorkPic workPic = new WorkPic();
				workPic.setWpid(rset.getString("WP_ID"));
				workPic.setoriginName(rset.getString("ORIGIN_NAME"));
				workPic.setchangeName(rset.getString("CHANGE_NAME"));
				workPic.setfilePath(rset.getString("FILE_PATH"));
				workPic.setpicType(rset.getString("PIC_TYPE"));
				
				fileList.add(workPic);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return fileList;
	}

	public int updateSale(Connection con, Work work) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateSale");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, work.getworkName());
			pstmt.setString(2, work.getWorkContent());
			pstmt.setInt(3, work.getDeliPrice());
			pstmt.setInt(4, work.getPrice());
			pstmt.setInt(5, work.getCid());
			pstmt.setInt(6, work.getWorkId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int updatePicFile(Connection con, ArrayList<WorkPic> workPic, Work work, ArrayList<String> wpId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePicFile");
		

		try {
			for(int i = 0; i < workPic.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, workPic.get(i).getoriginName());
				pstmt.setString(2, workPic.get(i).getchangeName());
				pstmt.setString(3, wpId.get(i));

				result += pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<HashMap<String, Object>> selectImageList(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectImageList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("WORK_CONTENT", rset.getString("WORK_CONTENT"));
				hmap.put("delePice", rset.getInt("DELI_PRICE"));
				hmap.put("wrDate", rset.getDate("WR_DATE"));
				hmap.put("rsDate", rset.getDate("RS_DATE"));
				hmap.put("mexCount", rset.getInt("MAX_COUNT"));
				hmap.put("csDate", rset.getDate("CS_DATE"));
				hmap.put("workKind", rset.getString("WORK_KIND"));
				hmap.put("memberId", rset.getInt("MEMBER_ID"));
				hmap.put("price", rset.getInt("MAX_COUNT"));
				hmap.put("cid", rset.getInt("CID"));
				hmap.put("typeId", rset.getInt("TYPE_ID"));
				hmap.put("wCount", rset.getInt("WCOUNT"));
				
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				
				hmap.put("category", rset.getString("CATEGORY"));
				System.out.println("da0 hmap : " + hmap.size());
				list.add(hmap);
			}
			
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		System.out.println("dao : " + list.size());
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectOrderList(Connection con, PageInfo pi, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectOrderList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		System.out.println("스타트 : " + startRow);
		System.out.println("엔드 : " + endRow);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("odId", rset.getInt("OD_ID"));
				hmap.put("payDate", rset.getDate("PAY_DATE"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("memberId", rset.getString("MEMBER_NAME"));
				hmap.put("deliCompany", rset.getString("DELI_COMPANY"));
				hmap.put("invNum", rset.getInt("INV_NUM"));
				hmap.put("deliStatus", rset.getString("DELI_STATUS"));
				
				list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int orderListCount(Connection con, String memberId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("orderlistCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectExchangeList(Connection con, PageInfo pi, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectExchangeList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("refundId", rset.getInt("REFUND_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("count", rset.getInt("COUNT"));
				hmap.put("refundEnddate", rset.getDate("REFUND_ENDDATE"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("refundDate", rset.getString("REFUND_DATE"));
				hmap.put("refundReason", rset.getString("REFUND_REASON"));
				hmap.put("odId", rset.getInt("OD_ID"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int exchangeListCount(Connection con, String memberId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("exchangeListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectQnaList(Connection con, PageInfo pi, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectQnaList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("bno", rset.getInt("BNO"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("title", rset.getString("TITLE"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("writeDate", rset.getDate("WRITE_DATE"));
				hmap.put("content", rset.getString("CONTENT"));
				hmap.put("divison", rset.getInt("DIVISON"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int qnaListCount(Connection con, String memberId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("qnaListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectReviewList(Connection con, PageInfo pi, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectReviewList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("commentId", rset.getInt("COMMENT_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("content", rset.getString("CONTENT"));
				hmap.put("starPoint", rset.getString("STAR_POINT"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("writeDate", rset.getDate("WRITE_DATE"));
				hmap.put("bno", rset.getInt("BNO"));
				hmap.put("writerId", rset.getInt("WRITER_ID"));
				hmap.put("workId", rset.getInt("WORK_ID"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int reviewListCount(Connection con, String memberId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("reviewListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectExchangeDate(Connection con, PageInfo pi, String memberId, String wrDate1, String wrDate2) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectExchangeDate");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, wrDate1);
			pstmt.setString(3, wrDate2);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("refundId", rset.getInt("REFUND_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("count", rset.getInt("COUNT"));
				hmap.put("refundEnddate", rset.getDate("REFUND_ENDDATE"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("refundDate", rset.getString("REFUND_DATE"));
				hmap.put("refundReason", rset.getString("REFUND_REASON"));
				hmap.put("odId", rset.getInt("OD_ID"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int exchangeDateCount(Connection con, String memberId, String wrDate1, String wrDate2) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("exchangeDateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, wrDate1);
			pstmt.setString(3, wrDate2);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public int deleteAuthor(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAuthor");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m.getMemberId());
	
			result += pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectExchangeName(Connection con, PageInfo pi, String memberId, String workName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String name = "%" + workName + "%";
		
		String query = prop.getProperty("selectExchangeName");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, name);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("refundId", rset.getInt("REFUND_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("count", rset.getInt("COUNT"));
				hmap.put("refundEnddate", rset.getDate("REFUND_ENDDATE"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("refundDate", rset.getString("REFUND_DATE"));
				hmap.put("refundReason", rset.getString("REFUND_REASON"));
				hmap.put("odId", rset.getInt("OD_ID"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int exchangeNameCount(Connection con, String memberId, String workName) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String name = "%" + workName + "%";
		
		String query = prop.getProperty("exchangeNameCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, name);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectOrderDate(Connection con, PageInfo pi, String memberId,String wrDate1, String wrDate2) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectOrderDate");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, wrDate1);
			pstmt.setString(3, wrDate2);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("odId", rset.getInt("OD_ID"));
				hmap.put("payDate", rset.getDate("PAY_DATE"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("memberId", rset.getString("MEMBER_NAME"));
				hmap.put("deliStatus", rset.getString("DELI_STATUS"));
				
				list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int orderDateCount(Connection con, String memberId, String wrDate1, String wrDate2) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("orderDateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, wrDate1);
			pstmt.setString(3, wrDate2);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectOrderName(Connection con, PageInfo pi, String memberId, String workName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String name = "%" + workName + "%";
		
		String query = prop.getProperty("selectOrderName");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, name);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("odId", rset.getInt("OD_ID"));
				hmap.put("payDate", rset.getDate("PAY_DATE"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("memberId", rset.getString("MEMBER_NAME"));
				hmap.put("deliStatus", rset.getString("DELI_STATUS"));
				
				list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int orderNameCount(Connection con, String memberId, String workName) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String name = "%" + workName + "%";
		
		String query = prop.getProperty("orderNameCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, name);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}
	
	public ArrayList<HashMap<String, Object>> selectSalesDate(Connection con, PageInfo pi, String memberId, String wrDate1, String wrDate2) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectSalesDate");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, wrDate1);
			pstmt.setString(3, wrDate2);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("price", rset.getInt("WORK_ID"));
				hmap.put("wrDate", rset.getDate("WR_DATE"));

				list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getDateCount(Connection con, String memberId, String wrDate1, String wrDate2) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("getDateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, wrDate1);
			pstmt.setString(3, wrDate2);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectWorkName(Connection con, PageInfo pi, String memberId, String workName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String name = "%" + workName + "%";
		
		String query = prop.getProperty("selectWorkName");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, name);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("workId", rset.getInt("WORK_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("price", rset.getInt("WORK_ID"));
				hmap.put("wrDate", rset.getDate("WR_DATE"));

				list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int WorkNameCount(Connection con, String memberId, String workName) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String name = "%" + workName + "%";
		
		String query = prop.getProperty("WorkNameCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, name);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectQnaDate(Connection con, PageInfo pi, String memberId, String wrDate1, String wrDate2) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectQnaDate");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, wrDate1);
			pstmt.setString(3, wrDate2);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("bno", rset.getInt("BNO"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("title", rset.getString("TITLE"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("writeDate", rset.getDate("WRITE_DATE"));
				hmap.put("content", rset.getString("CONTENT"));
				hmap.put("divison", rset.getInt("DIVISON"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int qnaDateCount(Connection con, String memberId, String wrDate1, String wrDate2) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("qnaDateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, wrDate1);
			pstmt.setString(3, wrDate2);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectQnaName(Connection con, PageInfo pi, String memberId, String workName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String name = "%" + workName + "%";
		
		String query = prop.getProperty("selectQnaName");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, name);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("bno", rset.getInt("BNO"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("title", rset.getString("TITLE"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("writeDate", rset.getDate("WRITE_DATE"));
				hmap.put("content", rset.getString("CONTENT"));
				hmap.put("divison", rset.getInt("DIVISON"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int qnaNameCount(Connection con, String memberId, String workName) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String name = "%" + workName + "%";
		
		String query = prop.getProperty("qnaNameCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, name);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectReviewDate(Connection con, PageInfo pi, String memberId, String wrDate1, String wrDate2) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectReviewDate");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, wrDate1);
			pstmt.setString(3, wrDate2);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("commentId", rset.getInt("COMMENT_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("content", rset.getString("CONTENT"));
				hmap.put("starPoint", rset.getString("STAR_POINT"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("writeDate", rset.getDate("WRITE_DATE"));
				hmap.put("bno", rset.getInt("BNO"));
				hmap.put("writerId", rset.getInt("WRITER_ID"));
				hmap.put("workId", rset.getInt("WORK_ID"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int reviewDateCount(Connection con, String memberId, String wrDate1, String wrDate2) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("reviewDateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, wrDate1);
			pstmt.setString(3, wrDate2);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectReveiwName(Connection con, PageInfo pi, String memberId, String workName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String name = "%" + workName + "%";
		
		String query = prop.getProperty("selectReveiwName");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, name);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
		
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				hmap.put("commentId", rset.getInt("COMMENT_ID"));
				hmap.put("workName", rset.getString("WORK_NAME"));
				hmap.put("content", rset.getString("CONTENT"));
				hmap.put("starPoint", rset.getString("STAR_POINT"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("writeDate", rset.getDate("WRITE_DATE"));
				hmap.put("bno", rset.getInt("BNO"));
				hmap.put("writerId", rset.getInt("WRITER_ID"));
				hmap.put("workId", rset.getInt("WORK_ID"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int reviewNameCount(Connection con, String memberId, String workName) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		String name = "%" + workName + "%";
		
		String query = prop.getProperty("reviewNameCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberId));
			pstmt.setString(2, name);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public int updateDeli(Connection con, String memberId, String deliCompany, String invNum, String deliStatus, String odId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateDeli");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, deliCompany);
			pstmt.setString(3, invNum);
			pstmt.setString(4, deliStatus);
			pstmt.setString(5, odId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}




























