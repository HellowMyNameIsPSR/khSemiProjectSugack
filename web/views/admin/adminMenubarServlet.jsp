<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<%@ include file="../assets/css/main.html" %>
	<%@ include file="../assets/css/allCss.html" %>
	<title></title>
</head>
<!-- Sidebar -->
<div id="sidebar">
	<div class="inner">
		<!-- Logo -->
		<section class="alt">
			<a href="<%=request.getContextPath()%>/selectImgList.wo"> <img
			id="authorLogo" src="/sg/views/main/images/logo.png"
			style="display: inline-block;">
		</a>
		</section>
		<!-- Menu -->
		<nav id="menu">
			<header class="major">
				<h2>관리자 메뉴</h2>
			</header>
			<ul>
				<li><a href="/sg/views/admin/adminHome.jsp">HOME</a></li>
				<li>
					<span class="opener">상품 관리</span>
					<ul>
						<li><a href="/sg/views/admin/viewGoodsList.jsp">판매상품 조회 / 삭제</a>
						<li><a href="/sg/views/admin/viewFundingList.jsp">펀딩상품 조회  / 삭제</a>
					</ul>
				</li>
				<li>
					<span class="opener">회원 관리</span>
					<ul>
						<li><a href="/views/admin/viewMemList.jsp">회원관리</a>
						<li><a href="/views/admin/viewWithdrawalMemList.jsp">탈퇴회원관리</a>
						<li><a href="/views/admin/viewBlackMemList.jsp">블랙리스트 관리</a>
						<li><a href="/views/admin/viewSellMemList.jsp">판매자관리</a>
					</ul>
				</li>
				<li>
					<span class="opener">운영</span>
					<ul>
						<li><a href="<%=request.getContextPath()%>/reqMemList.ad">입점신청관리</a>
						<li><a href="/views/admin/viewQuestList.jsp">1:1문의관리</a>
						<li><a href="/views/admin/viewMileList.jsp">적립금관리</a>
						<li><a href="/views/admin/viewBbsList.jsp">고객센터관리</a>
					</ul>
				</li>
				<li><span class="opener">통계</span>
					<ul>
						<li><a href="/views/admin/adminSalesStatistics.jsp">매출관련통계</a>
						<li><a href="/views/admin/adminMemberStatistics.jsp">회원관련통계</a>
						<li><a href="/views/admin/adminAuthorStatistics.jsp">작가관련통계</a>
					</ul>
				</li>
			</ul>
		</nav>
		<!-- Footer -->
		<footer id="footer">
			<ul class="contact">
				<li class="fa-envelope-o">poohsla@naver.com</li>
				<li class="fa-phone">010-9141-6557</li>
				<li class="fa-home">kh정보교육원 2층 C강의장 <br>
				Gangname Seoul, Republic of Korea</li>
			</ul>
			<p class="copyright">&copy; 手作. All rights reserved. .</p>
		</footer>
	</div>
</div>
<!-- script -->
<!-- <script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/browser.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script> -->
<script src="<%= request.getContextPath() %>/views/assets/js/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/views/assets/js/browser.min.js"></script>
<script src="<%= request.getContextPath() %>/views/assets/js/breakpoints.min.js"></script>
<script src="<%= request.getContextPath() %>/views/assets/js/util.js"></script>
<script src="<%= request.getContextPath() %>/views/assets/js/main.js"></script>
