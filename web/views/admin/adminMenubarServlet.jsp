<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<!-- <link rel="stylesheet" href="../assets/css/main.css" /> -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<style>
			<%@ include file="../assets/css/main.html" %>
	</style>
	<title></title>
</head>
<!-- Sidebar -->
<div id="sidebar">
	<div class="inner">
		<!-- Logo -->
		<section class="alt">
			<a href="../../index.jsp">LOGO</a>
		</section>
		<!-- Menu -->
		<nav id="menu">
			<header class="major">
				<h2>Menu</h2>
			</header>
			<ul>
				<li><a href="adminHome.jsp">HOME</a></li>
				<li>
					<span class="opener">상품 관리</span>
					<ul>
						<li><a href="viewGoodsList.jsp">판매상품 조회 / 삭제</a>
						<li><a href="viewFundingList.jsp">펀딩상품 조회  / 삭제</a>
					</ul>
				</li>
				<li>
					<span class="opener">회원 관리</span>
					<ul>
						<li><a href="viewMemList.jsp">회원관리</a>
						<li><a href="viewWithdrawalMemList.jsp">탈퇴회원관리</a>
						<li><a href="viewBlackMemList.jsp">블랙리스트 관리</a>
						<li><a href="viewSellMemList.jsp">판매자관리</a>
					</ul>
				</li>
				<li>
					<span class="opener">운영</span>
					<ul>
						<li><a href="<%=request.getContextPath()%>/reqMemList.ad">입점신청관리</a>
						<li><a href="viewQuestList.jsp">1:1문의관리</a>
						<li><a href="viewMileList.jsp">적립금관리</a>
						<li><a href="viewBbsList.jsp">고객센터관리</a>
					</ul>
				</li>
				<li><span class="opener">통계</span>
					<ul>
						<li><a href="adminSalesStatistics.jsp">매출관련통계</a>
						<li><a href="adminMemberStatistics.jsp">회원관련통계</a>
						<li><a href="adminAuthorStatistics.jsp">작가관련통계</a>
					</ul>
				</li>
			</ul>
		</nav>
		<!-- Footer -->
		<footer id="footer">
			<ul class="contact">
				<li class="fa-envelope-o">information@untitled.tld</li>
				<li class="fa-phone">(000)000-000</li>
				<li class="fa-home">1234 Somewhere Road #8524 <br>
				Nashville, TN 00000-0000</li>
			</ul>
			<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>
			.Design:<a href="https://html5up.net">HTML5 UP</a>.</p>
		</footer>
	</div>
</div>
<!-- script -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/browser.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>