<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 관리자홈</title>
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
						<h3>판매회원관리</h3>
						<form action="">
							<table class="table table-bordered">
								<tr>
									<td style="width: 180px;">판매자명</td>
									<td style="width: 700px;" colspan="3">
									<input type="text" />
								</tr>	
								<tr>
									<td>판매일자</td>
									<td><input type="date" style="width: 400px;" /></td>
									<td style="width: 30px;"><label
										style="font-size: 15px; text-align: center;">~</label></td>
									<td style="width: 200px;"><input type="date"
										style="width: 200px;" /></td>
								</tr>
								<tr>
									<td>작가유형</td>
									<td style="width: 150px;" colspan="3"><select name="" id=""
										style="width: 330px;">
											<option value="">가죽</option>
											<option value="">직물</option>
											<option value="">도공</option>
											<option value="">기타</option>
									</select>
									</td>
								</tr>
							
								<tr>
									<td>
										<select name="" id="">
											<option value="">판매중</option>
											<option value="">판매완료</option>
										</select>
									</td>
									<td colspan="3">
									<input type="text" style="width:700px;"/>
									</td>
								</tr>

							</table>
							<input type="submit" value="조회" />
						</form>
						<h3>판매자 조회 결과</h3>
						<table class="table table-bordered"
							style="border: 2px solid gray; text-align: center">
							<tr style="background: lightgray;">
								<td>번호</td>
								<td>작가명</td>
								<td>작가유형</td>
								<td>판매등록일자</td>
								<td>상품재료</td>
								<td>상품명</td>
								<td>신고자</td>
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
					</header>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="adminMenubar.jsp" %>
	</div>
			
</body>
</html>