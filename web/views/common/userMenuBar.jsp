<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.*"%>
<%
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<!-- <link rel="stylesheet" href="../assets/css/main.css" /> -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<style>
		<%@ include file="../assets/css/main.html" %>
		<%@ include file="../assets/css/allCss.html"%>
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
				<li><a href="myPage.jsp">주문내역</a></li>
				<li>
					<span class="opener">좋아요리스트</span>
					<ul>
						<li><a href="likeAuthor.jsp">관심작가</a>
						<li><a href="likeFundingPro.jsp">관심 펀딩 상품</a>
						<li><a href="likePro.jsp">관심 판매상품</a>
					</ul>
				</li>
				<li>
					<span class="opener">게시글관리!</span>
					<ul>
						 <li><a href="boardReview.jsp">응원글 및 리뷰</a> 
						<%-- <li><a href="<%=request.getContextPath() %>/selectReview.co?num=<%=loginUser.getMemberId() %>">응원글 및 리뷰</a> --%>
						<li><a href="<%=request.getContextPath()%>/selectProQna.bo?num=<%=loginUser.getMemberId()%>">문의</a>
					</ul>
				</li>
				<li><a href="boardPoint.jsp">적립금 사용 내역</a></li>
				<li>
					<span class="opener">개인정보</span>
					<ul>
						<li><a href="modifyMe.jsp">개인정보 수정</a>
						<li><a href="<%=request.getContextPath()%>/addressList.me?num=<%=loginUser.getMemberId()%>">내 주소 관리</a>
						<li><a href="withDrawal.jsp">회원 탈퇴</a>
					</ul>
				</li>
				<li><a href="#">고객센터</a>
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







