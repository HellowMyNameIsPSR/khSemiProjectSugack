<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<%@ include file="../assets/css/allCss.html" %>
	<%@ include file="../assets/css/main.html" %>
	<%@ include file="../assets/css/allCss.html" %>
	<title></title>
</head>
<!-- Sidebar -->
<div id="sidebar">
	<div class="inner">
		<!-- Logo -->
		<section class="alt">
			<a href="#">LOGO</a>
		</section>
		<!-- Menu -->
		<nav id="menu">
			<header class="major">
				<h2>Menu</h2>
			</header>
			<ul>
				<li><a href="authorHome.jsp">HOME</a></li>
				<li>
					<span class="opener">판매 작품</span>
					<ul>
						<li><a href="/sg/views/author/enrollSaleGoods.jsp">판매 작품 등록</a>
						<li><a onclick="manageSaleGoods()">판매 작품 관리</a>
						<li><a href="/sg/views/author/manageSale.jsp" >판매 관리</a>
						<li><a href="/sg/views/author/managePost.jsp">문의 / 리뷰 관리</a>
						<li><a href="/sg/views/author/saleStatistics.jsp">판매 통계</a>
					</ul> 
					<script>
						function manageSaleGoods() {
							location.href="<%=request.getContextPath()%>/selectSale.wo";
						}
					</script>
				</li>
				
				<li>
					<span class="opener">펀딩 작품</span>
					<ul>
						<li><a href="fundingGuide.jsp">펀딩 가이드</a>
						<li><a href="<%= request.getContextPath() %>/selectCategory.fund">펀딩 작품 등록</a>
						<li><a href="manageFundGoodsHistory.jsp">펀딩 작품 내역</a></li>
						<li><a href="makingApplicationHistory.jsp">제작 신청 내역</a>
						<li><a href="fundingStatistics.jsp">펀딩 통계</a>
					</ul>
				</li>
				<li><a href="authorStory.jsp">작가이야기</a></li>
				<li>
					<span class="opener">개인정보</span>
					<ul>
						<li><a href="editAuthorInfo.jsp">개인정보 수정</a>
						<li><a href="deleteAuthor.jsp">회원 탈퇴</a>
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
<!--  
<!-- script -->
<!-- script -->
<%-- <script src="<%= request.getContextPath() %>/views/assets/js/jquery.min.js"></script> --%>
<script src="<%= request.getContextPath() %>/views/assets/js/browser.min.js"></script>
<script src="<%= request.getContextPath() %>/views/assets/js/breakpoints.min.js"></script>
<script src="<%= request.getContextPath() %>/views/assets/js/util.js"></script>
<script src="<%= request.getContextPath() %>/views/assets/js/main.js"></script>
