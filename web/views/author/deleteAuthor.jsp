<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 작가탈퇴</title>
<style>
	.authorInfo {
	border:2px solid lightgray;
	margin: 20px 0px 20px 0px;
	box-shadow:2px 2px lightgray;
	}
	.authorInfo tr{
		padding:0 auto;
	}
	
	.authorInfo tr>td{
		background:white;
		height:80px;
		
	}

</style>
</head>
<body class="is-preload">
<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="authorHome.jsp" class="logo">
						<span class="glyphicon glyphicon-home"></span>
						&nbsp;
						<strong style="font-size:20px;">HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<h1>작가탈퇴</h1>
					</header>
					<!-- Contents area -->

					<form id="deleteAuthor" action="" method="post">
						<table class="authorInfo">
							<tr>
								<td><h2 style="margin: 0 auto; padding-left: 20px">판매자 등록 취소</h2>
							</td>
							</tr>
							<tr>
								<td style="width: 200px;">판매자 등록 취소 안내</td>
							</tr>
							<tr>
								<td>취소안내 내요오오오옹오오오오오옹 텍스트로만 작성 나중에</td>
							</tr>
							<tr>
								<td>판매자 이름</td>
							</tr>
							<tr>
								<td>판매자 이메일 또는 이메일</td>
							</tr>
						</table>


						<div align="center">

							<button style="width: 150px; background: lightgray;">등록취소신청</button>
						</div>

					</form>











				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>
			
</body>
</html>