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
						<h3>고객센터 관리</h3>
						<div>
							<table>
								<tr>
									<td>번호</td>
									<td>게시판제목</td>
									<td>게시판아이디</td>
									<td>새글 / 총게시글</td>
									<td>게시글관리</td>
								</tr>
								<tr>
									<td>1</td>
									<td>공지사항</td>
									<td>notice</td>
									<td></td>
									<td>
										<button onclick="#">게시글보기 / 수정</button>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>판매FAQ</td>
									<td></td>
									<td></td>
									<td>
										<button onclick="#">게시글보기 / 수정</button>
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td>펀딩FAQ</td>
									<td></td>
									<td></td>
									<td>
										<button onclick="#">게시글보기 / 수정</button>
									</td>
								</tr>
								<tr>
									<td>4</td>
									<td>구매FAQ</td>
									<td></td>
									<td></td>
									<td>
										<button onclick="#">게시글보기 / 수정</button>
									</td>
								</tr>
								<tr>
									<td>5</td>
									<td>이벤트</td>
									<td></td>
									<td></td>
									<td>
										<button onclick="#">게시글보기 / 수정</button>
									</td>
								</tr>
							</table>
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