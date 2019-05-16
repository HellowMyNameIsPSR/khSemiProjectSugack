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
					<a href="adminHome.jsp" class="logo"> Admin<strong>HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<h3>블랙리스트관리</h3>
						<form action="">
							<table class="table table-bordered">
								<tr>
									<td style="width: 180px;">경고분류</td>
									<td style="width: 700px;">
									<select name="" id="">
											<option value="">1차</option>
											<option value="">2차</option>
											<option value="">3차</option>											
									</select>
								</tr>	
								<tr>
									<td>경고일자</td>
									<td><input type="date" style="width: 400px;" /></td>
									<td style="width: 30px;"><label
										style="font-size: 15px; text-align: center;">~</label></td>
									<td style="width: 200px;"><input type="date"
										style="width: 200px;" /></td>
								</tr>
								<tr>
									<td>경고종류</td>
									<td style="width: 150px;"><select name="" id=""
										style="width: 330px;">
											<option value="">상품</option>
											<option value="">펀딩</option>
											<option value="">판매자</option>
											<option value="">기타</option>
									</select>
									</td>
								</tr>
								<tr>
									<td style="width: 180px;">신고위치</td>
									<td style="width: 150px;">
									<select name="" id=""
										style="width: 150px;">
											<option value="">상품</option>
											<option value="">펀딩</option>
											<option value="">기타</option>
									</select>
									</td>
									<td style="width: 150px;">
									<select name="" id=""
										style="width: 150px;">
											<option value="">상품</option>
											<option value="">펀딩</option>
											<option value="">기타</option>
									</select>
									</td>
									<td style="width: 150px;">
									<select name="" id=""
										style="width: 150px;">
											<option value="">상품</option>
											<option value="">펀딩</option>
											<option value="">기타</option>
									</select>
									</td>
								</tr>
								<tr>
									<td>신고자</td>
									<td colspan="3">
										<input type="text" />
									</td>
								</tr>

							</table>
							<input type="submit" value="조회" />
						</form>
						<h3>블랙리스트 조회 결과</h3>
						<table class="table table-bordered"
							style="border: 2px solid gray; text-align: center">
							<tr style="background: lightgray;">
								<td>번호</td>
								<td>경고분류</td>
								<td>신고일자</td>
								<td>신고종류</td>
								<td>신고위치</td>
								<td>신고내용</td>
								<td>신고자</td>
							</tr>
							<tr>
								<td>1</td>
								<td></td>
								<td></td>
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
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>3</td>
								<td></td>
								<td></td>
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
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>5</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
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
		<%@ include file="adminMenubar.jsp"%>
	</div>

</body>
</html>