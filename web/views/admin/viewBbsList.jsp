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
									<td>배송</td>
									<td>Logistic</td>
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
				location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo"
			})
			$("#sellFAQ").click(function(){
				location.href="<%= request.getContextPath()%>/views/customerCenter/customerCenterFaqGoods.jsp"

			})
			$("#Logistic").click(function(){
				location.href="<%= request.getContextPath()%>/views/customerCenter/customerCenterNotice.jsp"

			})
			$("#BuyFAQ").click(function(){
				location.href="<%= request.getContextPath()%>/views/customerCenter/customerCenterFaqOrder.jsp"

			})
			$("#refundFAQ").click(function(){
				location.href="<%= request.getContextPath()%>/views/customerCenter/customerCenterFaqCancel.jsp"

			})			
			$("#Event").click(function(){
				location.href="<%= request.getContextPath()%>/views/customerCenter/customerCenterEvent.jsp"

			})
			
			
			
			
			
		});
	</script>
			
</body>
</html>