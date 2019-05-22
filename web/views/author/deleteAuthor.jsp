<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.member.model.vo.*"%>
<% Member member = (Member)request.getSession().getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 작가탈퇴</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<%@ include file="../assets/css/author.html" %>
<style>
	
	.deleteDiv{
		background: radial-gradient(white, #F6FFFF) fixed;
		border:2px solid lightgray;
		box-shadow:2px 2px lightgray;
		margin-botton:50px;
		min-width:500px;
	}
	.deleteTable{
		margin:0px 0px 0px 0px;
		min-width:500px;
	}
	.deleteTable tr>td{
		margin:0px 0px 0px 0px;
		border:2px solid lightgray;
		font-size:13px;
		background: radial-gradient(white, #F6FFFF) fixed;
		height:20px;
	}
	.all-btn{
		margin-top:70px;
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
					<a href="/sg/views/author/authorHome.jsp" class="logo"> <span
						class="glyphicon glyphicon-home"></span> &nbsp; <strong
						style="font-size: 20px;">HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<h2>작가 등록 취소</h2>
					</header>
					<!-- Contents area -->
					<div class="manageSaleTitle" style="min-width:500px;">
						<h2>작가 등록 취소</h2>
					</div>
					<div class="deleteDiv">
						<table class="deleteTable">
							<tr style="height:40px; text-align:center; font-weight:bold;">
								<td colspan="2" style="font-size:20px;">판매자 등록 취소 안내</td>
							</tr>
							<tr style="height:100px;">
								<td colspan="2">꺼져줄께 수작 없이 잘살아~~</td>
							</tr>
							<tr>
								<td style="width:150px; font-weight:bold; font-size:15px;">판매자 이름</td>
								<td><%= member.getMemberName() %></td>
							</tr>
							<tr>
								<td style="width:150px; font-weight:bold; font-size:15px;">이메일</td>
								<td><%= member.getEmail() %></td>
							</tr>
						</table>
					</div>

					<div align="center">
						<button class="all-btn" style="width:150px;" data-toggle="modal" data-target="#modal">등록취소신청</button>
					</div>
					
					
					
					<div class="modal fade" id="modal" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h2 class="modal-title">작가 등록 취소</h2>
								</div>
								<div class="modal-body" style="padding:0px 0px 50px 0px; text-align:center;">
									<br><br><br><br><br>
									<h3>정말 판매자 등록 취소를 하시겠습니까?</h3>
									<button type="button" class="all-btn" style="width:130px;" onclick="deleteAuthor()">예</button> &nbsp; &nbsp; &nbsp; &nbsp;
									<button type="button" class="all-btn" style="width:130px;"  data-dismiss="modal">아니요</button>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">돌아가기</button>
								</div>
							</div>
						</div>
					</div>
					<script>
						function deleteAuthor() {
							location.href="<%=request.getContextPath()%>/deleteAuthor.wo";
						}
					</script>
				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>
	
	<div style="height:500px;"></div>
			
</body>
</html>