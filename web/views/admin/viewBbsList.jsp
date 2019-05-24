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
	<style>
	#admincCenter{
		text-align:center;
		
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
					<a href="adminHome.jsp" class="logo">
						Admin<strong>HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<h3>고객센터 관리</h3>
						<div>
							<table id="admincCenter">
								<tr style="background: skyblue;">
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
										<button id="notice">게시글보기 / 수정</button>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>상품FAQ</td>
									<td>sellFAQ</td>
									<td></td>
									<td>
										<button id="sellFAQ">게시글보기 / 수정</button>
									</td>
								</tr>								
								<tr>
									<td>3</td>
									<td>주문/결제FAQ</td>
									<td>BuyFAQ</td>
									<td></td>
									<td>
										<button id="BuyFAQ">게시글보기 / 수정</button>
									</td>
								</tr>
								<tr>
									<td>4</td>
									<td>배송</td>
									<td>Logistic</td>
									<td></td>
									<td>
										<button id="Logistic">게시글보기 / 수정</button>
									</td>
								</tr>
								<tr>
									<td>5</td>
									<td>교환/환불FAQ</td>
									<td>refund</td>
									<td></td>
									<td>
										<button id="refundFAQ">게시글보기 / 수정</button>
									</td>
								</tr>
								<tr>
									<td>6</td>
									<td>이벤트</td>
									<td>Event</td>
									<td></td>
									<td>
										<button id="Event">게시글보기 / 수정</button>
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
	<script>
		$(function(){
			$("#notice").click(function(){
				var id = "10"
				location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo?id=" + id;
			})
			$("#sellFAQ").click(function(){
				var id = "11"

				location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo?id=" + id;

			})
			$("#Logistic").click(function(){
				var id = "13"

				location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo?id=" + id;

			})
			$("#BuyFAQ").click(function(){
				var id = "12"

				location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo?id=" + id;

			})
			$("#refundFAQ").click(function(){
				var id = "15"

				location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo?id=" + id;

			})			
			$("#Event").click(function(){
				var id = "14"

				location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo?id=" + id;
				
			})
			
			
			
			
			
		});
	</script>
			
</body>
</html>