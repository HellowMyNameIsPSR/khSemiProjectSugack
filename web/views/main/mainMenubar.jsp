<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.Member"%>
<%
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<%@ include file="../assets/css/allCss.html" %>
<title></title>
<style>
	/* 네비 전체 */
	.navbar{
		padding: 0px auto;
		margin: 0px auto;
	    border-radius: 0px;
	}
	/* 네비 상단 */
	.navbar-top{
		background:skyblue;
		height:50px;
	}
	
	/* 네비 중단 */
	.navbar-middle{
		background:lightblue;
		height:100px ;
	}
	.navbar-brand {
		font-size:50px;
		width:250px;		
	}
	/* 숨겨진 네비 */
	.midNav-appear{
		background:lightblue;
		height:75px;
		padding-top:15px;
	}
	.navbar-logo{
		font-size:30px;
		width:160px;
	}
	/* 숨겨진 네비 메뉴 */
	.appear-menu li>a{
		display:inline;
		left: 40%;
	} 
	.appear-menu li{
		display:inline; 
	}
	
	/* 중단네비 공백 */
	.nav-middle{
		height:25px;
	}
	/* 네비 하단 */
	.navbar-bottom{
		background:skyblue;
		height:50px;
		margin-bottom:15px;
	}
	
	.bottomNav-appear{
		background:skyblue;
		height:50px;
		margin-bottom:15px;
	}
	/* 메뉴버튼 */
	.navbar-toggle{
		background:none !important;
		left:30px;
		border: 0px;
	}

	.category{
		width:400px;
		height:250px;
	}
	.downMenu{
		width:100%;
		height:100%;
		padding:10px 0px 10px 10%;
		margin-top:15px;
		border:1px solid black;
		background:skyblue;
	}
	
	.navbar-default {
	    background-color: white;
	    border-color:white;
	}
	
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-default asdf">
			<!-- 네비 상단   (로그인후 바뀌는건 우짤까요?? if else문 사용 가능한가요??)-->
			
			<% if(loginUser != null) {%>
			<nav class="navbar navbar-top hidden-xs">
				<ul class="nav navbar-nav pull-right">
					<li><a><%= loginUser.getMemberName() %>님 환영합니다</a></li>
					<li><a href="<%=request.getContextPath()%>/logout.me">로그아웃</a></li>
					<li><a href="<%= request.getContextPath() %>/views/member/memberUpdateForm.jsp">회원정보수정</a></li>
					<li><a href="<%= request.getContextPath() %>/views/application/checkApply.jsp">입점신청</a></li>
				</ul>
			</nav>
			<%} else { %>
			<nav class="navbar navbar-top hidden-xs">
				<ul class="nav navbar-nav pull-right">
					<li><a href="<%= request.getContextPath() %>/views/member/memberLoginForm.jsp">로그인</a></li>
					<li><a href="<%= request.getContextPath() %>/views/member/memberJoinForm.jsp">회원가입</a></li>
					<li><a href="<%= request.getContextPath() %>/views/application/checkApply.jsp">입점신청</a></li>
				</ul>
			</nav>
			<%} %>
			<!-- 모바일 중단 네비바 -->
			<nav class="navbar midNav-appear visible-xs">
				<div class="container">
				<div class="navbar-brand navbar-logo" href="#">
					<!-- <img src="../views/images/pic01.jpg" alt="가죽"> -->
				</div>
					<ul class="nav navbar-nav appear-menu">
						<li><a href="#마이페이지" class="glyphicon glyphicon-user"></a></li>
						<li><a href="#장바구니" class="glyphicon glyphicon-briefcase"></a></li>
						<li><a href="#고객센터" class="glyphicon glyphicon-earphone"></a></li>
					</ul"web/index.html">
				</div>
			</nav>
			
			<!-- 리나가 수정함 -->
			<!-- 네비 중단 -->
			<% if(loginUser == null) {%>
			<nav class="navbar navbar-middle hidden-xs">
				<div class="nav-middle"></div>
				<div class="container">
					<div class="navbar-brand " href="#">
						<!-- <img src="views/images/logo.png" alt="가죽"> -->
					</div>
						<ul class="nav navbar-nav navbar-right">
							<li><a onclick="myPage();">My정보</a></li>
							<li><a href="<%= request.getContextPath() %>/views/member/cart.jsp">장바구니</a></li>
							<li><a href="<%= request.getContextPath() %>/views/customerCenter/customerCenterNotice.jsp">고객센터</a></li>
						</ul>
				</div>
			</nav>
			<%}else{%>
			
			<nav class="navbar navbar-middle hidden-xs">
				<div class="nav-middle"></div>
				<div class="container">
					<div class="navbar-brand " href="#">
						<!-- <img src="views/images/logo.png" alt="가죽"> -->
					</div>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="<%= request.getContextPath() %>/views/member/myPage.jsp">My정보</a></li>
							<li><a href="<%= request.getContextPath() %>/views/member/cart.jsp">장바구니</a></li>
							<li><a href="<%= request.getContextPath() %>/views/customerCenter/customerCenterNotice.jsp">고객센터</a></li>
						</ul>
				</div>
			</nav>
			<%} %>
			<!-- 모바일 네비 하단 -->
			<nav class="navbar bottomNav-appear visible-xs">
				<div class="container bottom">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle pull-left"
							data-toggle="collapse" data-target="#myNavbar">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<!-- <div class="collapse downMenu" id="myNavbar">
						<ul class="nav navbar-nav">
							<li><a href="#myPage">카테고리</a></li>
							<li><a href="#myPage">판매</a></li>
							<li><a href="#band">펀딩</a></li>
							<li><a href="#tour">작가이야기</a></li>
							<li><a href="#contact">About</a></li>
						</ul>
					</div> -->
				</div>
			</nav>
			<!-- 네비 하단 --> 
			<nav class="navbar navbar-bottom hidden-xs">
				<div class="container bottom">
					<div class="collapse navbar-collapse" id="myNav">
						<ul class="nav navbar-nav navbar-left">
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">카테고리 <span class="caret"></span></a>
								<ul class="dropdown-menu category">
									<li><a href="#">가죽</a></li>
									<li><a href="#">귀금속</a></li>
									<li><a href="#">직물</a></li>
									<li><a href="#">목공</a></li>
									<li><a href="#">도자기</a></li>
									<li><a href="#">기타</a></li>
								</ul>
							</li>
							<!-- <li><a href="../product/products.jsp">판매</a></li> -->
							<li><a href="<%= request.getContextPath()%>/selectProduct.pro">판매</a>
							<li><a href="<%= request.getContextPath() %>/views/fundingProduct/fundingProducts.jsp">펀딩</a></li>
							<%-- <li><a href="<%= request.getContextPath()%>/selectAuthorPage.tn">작가이야기</a></li> --%>
							<li><a href="<%= request.getContextPath()%>/views/tour/artistStorey.jsp">작가이야기</a></li>
							<li><a href="#contact">About</a></li>
						</ul>
					</div>
				</div>
			</nav>



		</nav> <!-- 전체 네비 -->

		
	</header>
	<script>
		function myPage(){
			alert("로그인 후, 사용가능합니다!");
			location.href='<%=request.getContextPath()%>/views/member/memberLoginForm.jsp';
		}
	
		function goAuthorPage(){
			location.href='<%=request.getContextPath()%>/selectAuthorPage.tn';
		}
		
		
		
		</script>
</body>
</html>