package test.com.kh.semi.funding.model.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Date;
import java.util.ArrayList;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import com.kh.semi.funding.model.service.FundingService;
import com.kh.semi.funding.model.vo.AuthorAccount;
import com.kh.semi.funding.model.vo.Funding;
import com.kh.semi.funding.model.vo.SortFunding;
import com.kh.semi.funding.model.vo.Work;
import com.kh.semi.funding.model.vo.WorkPic;
import com.kh.semi.member.model.vo.Member;

public class FundingServiceTest {
	
	private FundingService fundingService;
	private Work fundWork;
	private ArrayList<WorkPic> fileList;
	private Funding fund;
	private SortFunding sortFunding;
	private AuthorAccount authorAcc;
	
	@Before
	public void beforTest() {
		fundingService = new FundingService();
		
		sortFunding  = new SortFunding();
		sortFunding.setFunStatus("대기");
		
		authorAcc = new AuthorAccount();
		authorAcc.setBackName("test");
		authorAcc.setAccountNumber("test");;
		authorAcc.setVerifyAccount("Y");
		authorAcc.setAuthorName("test");
		authorAcc.setAuthorbirth("970922");
		authorAcc.setType("개인");
		authorAcc.setMemberId(10);
		
		fund = new Funding();
		fund.setMaxVoo(100);
		fund.setMinVoo(200);
		fund.setFunDate(7);
		fund.setFundStatus("대기");
		fund.setWorkId(Integer.parseInt("17907"));
		fund.setDeliDate(Date.valueOf("2019-07-05"));
		fund.setStartDate(Date.valueOf("2019-06-10"));
		fund.setFinishDate(Date.valueOf("2019-06-21"));
		fund.setCooperation("N");
		
		fundWork = new Work();
		fundWork.setWorkName("test funding name");
		fundWork.setWorkContent("test funding content");
		fundWork.setPrice(1000);
		fundWork.setDeliPrice(3000);
		fundWork.setWorkKind("펀딩");
		fundWork.setMemberId(2);
		fundWork.setAuthorType("천공예");
		fundWork.setCategory("케이스");
		
		fileList = new ArrayList<WorkPic>();
		WorkPic workPic = new WorkPic();
		workPic.setFilePath("test file path");
		workPic.setOriginName("test origin name");
		workPic.setChangeName("test change name");
		workPic.setPicType("펀딩");
		fileList.add(workPic);
	}
	
	@Ignore
	@Test
	public void testSelectCategoryAll() {
		assertNotNull(fundingService.selectCategoryAll());
	}
	
	@Ignore
	@Test
	public void testSelectAuthorType() {
		assertNotNull(fundingService.selectAuthortype(2));
	}
	
	@Ignore
	@Test
	public void testIinsertFundingWork() {
		assertEquals(fundingService.insertFundingWork(fundWork, fileList, fund), 1);
	}
	@Ignore
	@Test
	public void testSelectSortFunding() {
		assertNotNull(fundingService.selectSortFunding(2, sortFunding));
	}
	@Ignore
	@Test
	public void testSelectFundContents() {
		assertNotNull(fundingService.selectFundContents(2, 47));
	}
	@Ignore
	@Test
	public void testSelectWorkPicFile() {
		assertNotNull(fundingService.selectWorkPicFile(2, 47));
	}
	@Ignore
	@Test
	public void testUpdateFundingAndAuthoAcc() {
		assertEquals(fundingService.updateFundingAndInsertAcc(fund, authorAcc), 1);
	}
	
	@Test
	public void testSelectUserFundingProDetail() {
		assertNotNull(fundingService.selectUserFundingProDetail(17907, 8502, "대기"));
	}
	
} //end class
