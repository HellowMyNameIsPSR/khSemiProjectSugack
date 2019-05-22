<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.Member"%>
<% String memberId = request.getParameter("memberId");%>

<%
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
%>
<%-- <%
   int memberIdcheck = Integer.parseInt(memberId);

%> --%>
  
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
			<a href="#"></a>
		</section>
		<!-- Menu -->
		<nav id="menu">
			<header class="major">
				<h2>Menu</h2>
			</header>
			<ul>
			          
			
			     <%-- <%if (loginUser==null) { %> --%> 
				 <%-- <% if(loginUser.getMemberId()==Integer.parseInt(memberId)){%> --%>
				
				 <%-- <%}else if((loginUser.getMemberId()==memberIdcheck)){%> --%>
				<li><a href="views/tour/authorpageProEdit.jsp"><img alt="" src="/views/images/artist.jpg" style="width: 200px; height: 200px;">활동명</a></li>
		         <li>
				    <span ><a href="views/tour/authorPageDetail.jsp">스토리 글 작성</a></span>   
				
				</li>
		         <%-- <%}else if(loginUser==null || (loginUser.getMemberId()!=memberIdcheck) || (loginUser.getMemberId()==memberIdcheck)){ %> --%>
					
				<li>
					<span class="opener">작품갤러리</span>
					<ul>
						<li><a href="views/tour/comingSoonproduct.jsp">출시전 작품</a>
						<li><a href="views/tour/fundingProducts.jsp">펀딩상품</a>
						<li><a href="views/tour/proDuct.jsp">판매 상품</a>
					</ul>
				</li>
				<li>
					<span ><a href="comMent.au?num=<%=memberId %>">응원하기 </a></span>
					  
				
				</li>
				<%-- <%} %> --%>
				
			   
				
			  
				<li> 
				   
					<span><a href="">관심작가 등록하기</a></span>
				</li>
				
				
				
				
				<li>
					<span ><a href="selectAuthorStory.au?memberId=<%=memberId%>"> 작가스토리</a></span>
					
				</li>
				<li ><a href="views/tour/artistachieveMent.jsp">작가업적</a>
			</ul>
	
		</nav>
		<!-- Footer -->
		<!-- <footer id="footer">
			<ul class="contact">
				<li class="fa-envelope-o">information@untitled.tld</li>
				<li class="fa-phone">(000)000-000</li>
				<li class="fa-home">1234 Somewhere Road #8524 <br>
				Nashville, TN 00000-0000</li>
			</ul>
			<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>
			.Design:<a href="https://html5up.net">HTML5 UP</a>.</p>
		</footer> -->
	</div>
</div>
<!-- script -->
<script src="views/assets/js/jquery.min.js"></script>
<script src="views/assets/js/browser.min.js"></script>
<script src="views/assets/js/breakpoints.min.js"></script>
<script src="views/assets/js/util.js"></script>
<script src="views/assets/js/main.js"></script>