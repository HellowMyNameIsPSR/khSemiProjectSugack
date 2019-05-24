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
<!-- Sidebar!! -->
<div id="sidebar">
	<div class="inner">
		<!-- Logo -->
		<section class="alt">
			<a href="index.jsp"><img
			id="authorLogo" src="/sg/views/main/images/logo.png"
			style="display: inline-block; width:150px;"></a>
		</section>
		<!-- Menu -->
		<nav id="menu">
			<header class="major">
				<h2>Menu</h2>
			</header>
			<ul>
				<li><a href="<%=request.getContextPath()%>/myPage.me">주문내역</a></li>
				<li>
					<span class="opener">좋아요리스트</span>
					<ul>
						<li><a href="views/board/likeAuthor.jsp">관심작가</a></li>
						<li><a href="<%=request.getContextPath()%>/selectFundLike.fund?mid=<%=loginUser.getMemberId()%>">관심 펀딩 상품</a></li>
						<li><a href="<%=request.getContextPath()%>/selectLikeList.me?mid=<%=loginUser.getMemberId()%>">관심 판매상품</a></li>
					</ul>
				</li>
				<li>
					<span class="opener">게시글관리</span>
					<ul>
						 <!-- <li><a href="views/board/boardReview.jsp">응원글 및 </a>  -->
						 <li><a href="<%=request.getContextPath()%>/selectReview.co?mid=<%=loginUser.getMemberId()%>">응원글 및 리뷰</a></li>
						<li><a href="<%=request.getContextPath()%>/selectProQna.bo?mid=<%=loginUser.getMemberId()%>">문의</a></li>
					</ul>
				</li>
				<li><a href="<%=request.getContextPath()%>/selectPoint.me">적립금 사용 내역</a></li>
				<li>
					<span class="opener">개인정보</span>
					<ul>
						
						<li><a href="<%=request.getContextPath()%>/addressList.me?num=<%=loginUser.getMemberId()%>">내 주소 관리</a>
						<li><a href="views/board/withDrawal.jsp">회원 탈퇴</a>
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
<script src="views/assets/js/jquery.min.js"></script>
<script src="views/assets/js/browser.min.js"></script>
<script src="views/assets/js/breakpoints.min.js"></script>
<script src="views/assets/js/util.js"></script>
<script src="views/assets/js/main.js"></script>







