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
						<h3>탈퇴 회원 조회</h3>
						<form action="">
							<table class="table table-bordered">
								<tr>
									<td style="width:180px;">회원구분</td>
									<td style="width:150px;">
										<select name="" id="" style="width: 330px;">
											<option value="">일반회원</option>
											<option value="">판매회원</option>
										</select>
									</td>
									
									<td  colspan="2" style="width:750px;">
										<input type="text" />
									</td>
								</tr>
								
								<tr>
									<td>이름검색</td>
									<td style="width:150px;">
										<select name="" id="" style="width: 330px;">
											<option value="">이메일</option>
											<option value="">실명</option>
										</select>
									</td>
									
									<td  colspan="2" style="width:750px;">
										<input type="text" />
									</td>
								</tr>
								<tr>
									<td>탈퇴일</td>
									<td><input type="date" style="width:400px;"/></td>
									<td style="width:30px;"><label style="font-size:15px; text-align:center;">~</label></td>
									<td style="width:500px;">
										<input type="date" style="width:500px;"/>
									</td>
								</tr>
								<tr>
									<td style="width:180px;">탈퇴유형</td>
									<td style="width:150px;">
										<select name="" id="" style="width: 330px;">
											<option value="">일반</option>
											<option value="">강제 </option>
										</select>
									</td>
									
									<td  colspan="2" style="width:750px;">
										<input type="text" placeholder="상품명 입력"/>
									</td>
								</tr>

							</table>	
							<input type="submit" value="조회"/>					
						</form>
							<h3>탈퇴 회원 조회 결과</h3>
								<table class="table table-bordered" style="border:2px solid gray; text-align:center">
			<tr style="background:lightgray;">
				<td>번호</td>
				<td>이메일</td>
				<td>이름</td>
				<td>탈퇴일</td>
				<td>탈퇴유형</td>
			</tr>
			<tr>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>4</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>5</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
			<div class="row" style="padding-left:400px">
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