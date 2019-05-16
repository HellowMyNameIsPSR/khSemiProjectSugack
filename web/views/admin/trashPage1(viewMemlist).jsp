<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원관리</title>
<style>
	 .container{
	width: 80%;`
	}
	
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body class="is-preload">
<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="adminHome.jsp" class="logo">
						Admin<strong>HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<h3>회원정보조회</h3>
						<table class="table table-bordered"
							style="border: 2px solid gray; height: 150px; width: 800px; margin: auto; text-align: center">
							<tr style="background: lightgray;">
								<td>신규회원수</td>
								<td>총 회원수</td>
								<td>탈퇴회원수</td>
							</tr>

							<tr>
								<td>0명</td>
								<td>0명</td>
								<td>0명</td>
							</tr>
						</table>
						<br><br><br><br>
						<h3>최근 가입회원</h3>
						<table class="table table-bordered"
							style="border: 2px solid gray; height: 150px; width: 800px; margin: auto; text-align: center">
							<tr style="background: lightgray;">
								<td>가입일자</td>
								<td>이메일(ID)</td>
								<td>회원이름</td>
							</tr>
				
							<tr>
								<td><% %></td>
								<td>lina@naver.com</td>
								<td>우리나</td>
							</tr>
							<tr>
								<td><% %></td>
								<td>lina@naver.com</td>
								<td>우리나</td>
							</tr>
							<tr>
								<td><% %></td>
								<td>lina@naver.com</td>
								<td>우리나</td>
							</tr>
							<tr>
								<td><% %></td>
								<td>lina@naver.com</td>
								<td>우리나</td>
							</tr>
							<tr>
								<td><% %></td>
								<td>lina@naver.com</td>
								<td>우리나</td>
							</tr>
						</table>
							<div class="row" style="padding-left: 400px">
								<ul class="pagination justify-content-center">
									<li class="page-item"><a class="page-link" href="#">Previous</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">Next</a></li>
								</ul>
							</div>
						</div>
					</header>
					<!-- Contents area -->
				</section>
			</div>
		<%@ include file="adminMenubar.jsp" %>
	</div>
			
</body>
</html>