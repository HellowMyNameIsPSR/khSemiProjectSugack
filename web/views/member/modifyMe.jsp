<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<style>
	.name{
		width:100%;
		font-size:30px;
	}
</style>
</head>
<body>

<!-- Wrapper -->
	<div id="wrapper">
	
		<!-- Main -->
		<div id="main">
				
			<div class="inner">
				
				<!-- Header -->
				
				<header id="header">
					<div class="name">개인정보수정</div>
				</header>
				
				<section id="contents">
					<div class="container">
						<div class="modiMe">
							<table>
								<tr style="background:gray;color:white; font-size:20px;">
									<td colspan="2">기본정보</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="email"></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password"></td>
								</tr>
								
								<tr>
									<td>비밀번호 확인</td>
									<td><input type="password"></td>
								</tr>
								
								<tr>
									<td>닉네임</td>
									<td><input type="text"></td>
								</tr>
								
								<tr>
									<td>휴대폰번호</td>
									<td><input type="tel"></td>
								</tr>
						
							</table>
							<input type="submit"value="수정하기" style="float:right;">
							 <!-- 공지사항 게시판처럼 처음에 수정하기 버튼누르면 수정가능하고, 저장하기로 이름이 바뀜 -->
						</div>
						
						
						<br><br><br><br><br><br><hr><br><br>
						<div class="delivery">
						<table>
							<tr style="background:gray;color:white; font-size:20px;">
								<td colspan="2">배송지정보</td>
							</tr>
							<tr>
								<td colspan="2">
									<select>
										<option>주소1</option>
										<option>주소2</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>
									<input type="text" placeholder="우편번호">
								</td>
								<td>
									<button>우편번호찾기</button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="text" placeholder="기본주소">
								</td>
							</tr>
							
							<tr>
								<td colspan="2">
									<input type="text" placeholder="상세주소">
								</td>
							</tr>
						</table>
						<input type="submit"value="수정하기" style="float:right;">
						</div>
					</div>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="../common/userMenuBar.jsp" %>
	</div>
			
</body>
</html>