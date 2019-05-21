package test.com.kh.semi.work.model.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;

import com.kh.semi.work.model.service.WorkService;

public class TestWorkService {
	private WorkService workService;
	
	@Before
	public void beforTest() {
		workService = new WorkService();
	}
	
	@Test
	public void testSelectImageList() {
		assertNotNull(workService.selectImageList());
	}
} //end class
