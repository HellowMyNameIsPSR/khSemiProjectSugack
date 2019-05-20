package test.com.kh.semi.author.model.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import com.kh.semi.author.model.service.AuthorService;
import com.kh.semi.author.model.vo.Author;

public class AuthorServiceTest {
	//필드로 객체와 매개변수를 선언해 주어야 함.
	private AuthorService authorService;
	private String brandName;
	private Author author;
	private int memberId;
	
	@Before
	public void beforTest() { //test 실행 전에 실행됨
		
		authorService = new AuthorService();
		/*
		//testSelectBrandName()
		brandName = "빛나리";
		*/
		
		memberId = 2;
	}
	
	//Ignore는 test 메소드 무시 : 여러개 작성할 수 있음!
	@Ignore
	@Test
	public void testSelctBrandName() { //브랜드명 검색
		//메소드 호출, 넘어오는 값
		assertEquals(authorService.selectBrandName(brandName), 1);
	}
	
	@Ignore
	@Test
	public void testSelectBrandName2() { //작가 공예 유형 값이 존재 하는가?
		assertNotNull(authorService.selectProTypeList());		
	}
	
	public void testSelectOneAuthorApply() {
		assertEquals(authorService.selectOneAuthorApply(memberId), 1);
	}
	
} //end class
