package test.com.kh.semi.funding.model.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;

import com.kh.semi.funding.model.service.FundingService;

public class FundingServiceTest {
	
	private FundingService fundingService;
	
	@Before
	public void beforTest() {
		fundingService = new FundingService();
	}

	@Test
	public void testSelectCategoryAll() {
		assertNotNull(fundingService.selectCategoryAll());
	}
} //end class
