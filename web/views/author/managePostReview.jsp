<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 문의및리뷰 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	.managePostTitle{
		margin: 20px 0px 20px 0px;
		height:70px;
		padding-top:15px;
		padding-left:20px;
		min-width:650px;
	}
	
	.subTitle{
		border:1px solid gray;
		margin: 20px 0px 20px 0px;
		box-shadow:2px 2px lightgray;
		height:50px;
		padding-top:5px;
		padding-left:20px;
		background:lightgray;
		font-size:20px;
		min-width:650px;
	}
	
	.postMenu{
		margin-bottom:70px;
		min-width:650px;
		width:40%
	}
	.postMenu tr>td{
		border:1px solid gray;
		box-shadow:2px 2px lightgray;
		background:rightgray;
		text-align:center;
	}
	.menuA:hover{
		background:skyblue;
		cursor:pointer
	}
	
	.managePostContents{
		border:2px solid lightgray;
		margin: 20px 0px 20px 0px;
		box-shadow:2px 2px lightgray;
		height:150px;
		min-width:650px;
	}
	
	.managePostTable{
		border:2px solid lightgray;
		margin: 20px 0px 20px 0px;
		box-shadow:2px 2px lightgray;
		height:500px;
		min-width:650px;

	}
	
	.listTable tr>td{
		border:1px solid darkgray;
		font-size:13px;
		text-align:center;
		background:white;
	}
	.listTable tr>th{
		border:1px solid darkgray;
		font-size:13px;
		text-align:center;
		background:lightgray;
		padding-top:7px;
		padding-botton:7px;
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
					<a href="authorHome.jsp" class="logo"> <span
						class="glyphicon glyphicon-home"></span> &nbsp; 
						<strong style="font-size: 20px;">HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main managePostTitle">
						<h2>문의/리뷰관리</h2>
					</header>
					
					<div class="subTitle">
						<p><strong>리뷰관리</strong></p>
					</div>
					<!-- Contents area -->
					
					<nav>
						<table class="postMenu">
							<tr>
								<td class="menuA" onClick = " location.href='managePost.jsp'">문의관리</td>
								<td class="menuA" onClick = " location.href='managePostReview.jsp'">리뷰관리</td>
				
							</tr>
						</table>
					</nav>
					
					
					<div class="managePostContents" align="center">
						<br>
						<p>리뷰 날짜 조회 날짜로 검색 api 찾아서 하기</p>
						<button style="width: 150px;">검색</button>
					</div>
					
					
					<div class="managePostTable">
						<table class="listTable">
							<tr>
								<th style="width:30px;"><strong>NO.</strong></th>
								<th><strong>리뷰 상품명</strong></th>
								<th><strong>리뷰 제목</strong></th>
								<th><strong>리뷰 내용</strong></th>
							</tr>
							<tr><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td>
							</tr>
						</table>
					</div>
					
					
					
				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>
			
</body>
</html>