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
	
	@Before
	public void beforTest() { //test 실행 전에 실행됨
		
		authorService = new AuthorService();
		/*
		//testSelectBrandName()
		brandName = "빛나리";
		*/
		author = new Author();
		author.setMemberId(2);
		author.setBrandName("네네");
		author.setApplyContent("안녕하세요. 친환경적인 디자인으로 편안함을 줄 수 있는 브랜드 안영입니다.");
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
	
	@Ignore
	@Test
	public void testInsertAuthor() { //작가 테이블에 정보 저장
		assertEquals(authorService.insertAuthor(author), 1);
	} //end method
	
	@Test
	public void testInsertAuthorType() {
		assertEquals(authorService.insertAuthorType(2, "천공예"), 1);
	}
	
} //end class
