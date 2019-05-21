package test.com.kh.semi.funding.model.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import com.kh.semi.funding.model.service.FundingService;
import com.kh.semi.funding.model.vo.Funding;
import com.kh.semi.funding.model.vo.Work;
import com.kh.semi.funding.model.vo.WorkPic;

public class FundingServiceTest {
	
	private FundingService fundingService;
	private Work fundWork;
	private ArrayList<WorkPic> fileList;
	private Funding fund;
	
	@Before
	public void beforTest() {
		fundingService = new FundingService();
		
		fund = new Funding();
		fund.setMaxVoo(100);
		fund.setMinVoo(200);
		fund.setFunDate(7);
		fund.setFundStatus("대기");
		
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
	
	@Test
	public void insertFundingWork() {
		assertEquals(fundingService.insertFundingWork(fundWork, fileList, fund), 1);
	}
} //end class
