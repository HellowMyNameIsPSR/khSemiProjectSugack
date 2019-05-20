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
<title>수작</title>
<style>
	#logoImg{
		cursor:pointer;
		margin:0px 0px 0px 7%;
		height:100px;
	}
	.topMemu{
		margin-right:5%;
	}
	#middleMenu{
		margin-right:3%;
		text-align:center;
	}
	#middleMenu li{
		margin-right:10px;
		text-align:center;
	}
	.middleIcon{
		margin-top:0px;
		font-size:25px;
		line-height:45px;
	}
	.category{
		background: radial-gradient(white, #E7F3FE);
		border:1px solid #E5E5E5;
	}
	.category tr>td{
		border-right:1px solid #EFEFEF;
		padding-left:40px;
		width:200px;
	}
	.navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:hover, .navbar-default .navbar-nav>.open>a:focus {
	   background: linear-gradient(to bottom, #4FADFF, #E7F3FE );
	   color: black;
	   border-radius: 5px 5px;
	}
	/* 네비 전체 */
	.navbar{
		padding: 0px auto;
		margin: 0px auto;
	    border-radius: 0px;
	}
	/* 네비 상단 */
	.navbar-top{
		background: linear-gradient(to bottom, #F7FBFF, #CFE8FE );
		border-bottom:1px solid lightgray;
		height:50px;
	}
	
	/* 네비 중단 */
	.navbar-middle{
		background: radial-gradient(white, #E7F3FE);
		height:100px ;
	}
	.navbar-brand {
		font-size:50px;
		width:250px;		
	}
	/* 숨겨진 네비 */
	.midNav-appear{
		background: radial-gradient(white, #E7F3FE);
		height:100px ;
	}
	.navbar-logo{
		font-size:30px;
		width:160px;
	}
	/* 숨겨진 네비 메뉴 */
	.hideMiddleMenu{
		display:inline-block;
		width:250px;
	}
	.hideMiddleMenu li{
		font-size:20px;
		display:inline-block;
		left:250px;
	} 
	.appear-menu li{
		display:inline; 
	}
	
	/* 네비 하단 */
	.navbar-bottom{
		background: linear-gradient(to top, #F7FBFF, #CFE8FE );
		height:50px;
		border-top:1px solid lightgray;
	}
	
	.bottomNav-appear{
		background: linear-gradient(-150deg, #F7FBFF, #CFE8FE);
		height:50px;
		margin-bottom:15px;
		border-top:1px solid lightgray;
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
		height:120%;
		padding:10px 0px 10px 40px;
		background: radial-gradient(white, #E7F3FE);
		border:1px solid #E5E5E5;
	}
	
	.navbar-default {
	    background-color: white;
	    border-color:white;
	}
	.downBtn{
		float:left;
		font-size:30px;
		margin-top:0px;
		color:gray;
	}
	.mobileDownMenu{
		background: radial-gradient(white, #E7F3FE);
		border:1px solid #E5E5E5;
		padding:10px 0px 10px 20px;
	}
</style>
</head>

<body>

	<header>
		<nav class="navbar navbar-default">
			<!-- 네비 상단   (로그인후 바뀌는건 우짤까요?? if else문 사용 가능한가요??)-->
			<% if(loginUser != null && loginUser.getMemberType().equals("W")){%>
				<nav class="navbar navbar-top hidden-xs">
				<ul class="nav navbar-nav pull-right topMemu">
					<li><a style="font-weight:bold; color:black;"><%= loginUser.getMemberName() %> 님</a></li>
					<li>
						<a href="<%=request.getContextPath()%>/logout.me">
							<span class="glyphicon glyphicon-log-out"></span> &nbsp; 로그아웃
						</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/views/member/memberUpdateForm.jsp">
							<span class="glyphicon glyphicon-user"></span> &nbsp; 회원정보수정
						</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/views/author/authorHome.jsp">
							<span class="glyphicon glyphicon-tree-deciduous"></span> &nbsp; 판매하기
						</a>
					</li>
				</ul>
			</nav>
			<% } else if(loginUser != null){%>
			<nav class="navbar navbar-top hidden-xs">
				<ul class="nav navbar-nav pull-right topMemu">
					<li><a style="font-weight:bold; color:black;"><%= loginUser.getMemberName() %> 님</a></li>
					<li>
						<a href="<%=request.getContextPath()%>/logout.me">
							<span class="glyphicon glyphicon-log-out"></span> &nbsp; 로그아웃
						</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/views/member/memberUpdateForm.jsp">
							<span class="glyphicon glyphicon-user"></span> &nbsp; 회원정보수정
						</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/views/application/getPTypeList.jsp">
							<span class="glyphicon glyphicon-tree-deciduous"></span> &nbsp; 입점신청
						</a>
					</li>

				</ul>
			</nav>
			<%} else { %>
			<nav class="navbar navbar-top hidden-xs">
				<ul class="nav navbar-nav pull-right">
					<li>
						<a href="<%= request.getContextPath() %>/views/member/memberLoginForm.jsp">
							<span class="glyphicon glyphicon-log-in"></span> &nbsp; 로그인
						</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/views/member/memberJoinForm.jsp">
							<span class="glyphicon glyphicon-user"></span> &nbsp; 회원가입
						</a>
					</li>
					<li>
						<a href="<%= request.getContextPath() %>/views/application/getPTypeList.jsp">
							<span class="glyphicon glyphicon-tree-deciduous"></span> &nbsp; 입점신청
						</a>
					</li>
				</ul>
			</nav>
			<%} %>
			
			<!-- 리나가 수정함 fdsa-->
			<!-- 모바일 중단 네비바 -->
			<% if(loginUser == null) {%>
			<nav class="navbar midNav-appear visible-xs">
				<div class="container">
					<a href="<%=request.getContextPath()%>/selectImgList.wo">
						<img id="logoImg"src="/sg/views/main/images/logo.png" style="display:inline-block;">
					</a>
					<ul class="nav navbar-nav navbar-right hideMiddleMenu" align="center">
						<li>
							<a onclick="myPage();">
								<span class="glyphicon glyphicon-user"></span><br><span style="font-size:12px;">My정보</span>
							</a>
						</li>
						<li>
							<a href="<%= request.getContextPath() %>/views/member/cart.jsp">
								<span class="glyphicon glyphicon-shopping-cart"></span><br><span style="font-size:12px;">장바구니</span>
							</a>
						</li>
						<li>
							<a href="<%= request.getContextPath() %>/views/customerCenter/customerCenterNotice.jsp">
								<span class="glyphicon glyphicon-earphone"></span><br><span style="font-size:12px;">고객센터</span>
							</a>
						</li>
					</ul>
				</div>
			</nav>
			<nav class="navbar navbar-middle hidden-xs">
				<div class="container">
					<a href="<%=request.getContextPath()%>/selectImgList.wo">
						<img id="logoImg" src="/sg/views/main/images/logo.png" >
					</a>
					<ul id="middleMenu" class="nav navbar-nav navbar-right">
						<li>
							<a onclick="myPage();">
								<span class="glyphicon glyphicon-user middleIcon"></span><br>My정보
							</a>
						</li>
						<li>
							<a href="<%= request.getContextPath() %>/views/member/cart.jsp">
								<span class="glyphicon glyphicon-shopping-cart middleIcon"></span><br>장바구니
							</a>
						</li>
						<li>
							<a href="<%= request.getContextPath() %>/views/customerCenter/customerCenterNotice.jsp">
								<span class="glyphicon glyphicon-earphone middleIcon"></span><br>고객센터
							</a>
						</li>
					</ul>

				</div>
			</nav>
			<%}else{%>
			<nav class="navbar midNav-appear visible-xs">
				<div class="container">
					<a href="<%=request.getContextPath()%>/selectImgList.wo">
						<img id="logoImg"src="/sg/views/main/images/logo.png" style="display:inline-block;">
					</a>
					<ul class="nav navbar-nav navbar-right hideMiddleMenu" align="center">
						<li>
							<a href="<%= request.getContextPath() %>/views/member/myPage.jsp">
								<span class="glyphicon glyphicon-user"></span><br><span style="font-size:12px;">My정보</span>
							</a>
						</li>
						<li>
							<a href="<%= request.getContextPath() %>/views/member/cart.jsp">
								<span class="glyphicon glyphicon-shopping-cart"></span><br><span style="font-size:12px;">장바구니</span>
							</a>
						</li>
						<li>
							<a href="<%= request.getContextPath() %>/views/customerCenter/customerCenterNotice.jsp">
								<span class="glyphicon glyphicon-earphone"></span><br><span style="font-size:12px;">고객센터</span>
							</a>
						</li>
					</ul>
				</div>
			</nav>
			
			<nav class="navbar navbar-middle hidden-xs">
				<div class="container">
					<a href="<%=request.getContextPath()%>/selectImgList.wo">
						<img id="logoImg" src="/sg/views/main/images/logo.png" >
					</a>
					<ul id="middleMenu" class="nav navbar-nav navbar-right">
						<li>
							<a href="<%= request.getContextPath() %>/views/member/myPage.jsp">
								<span class="glyphicon glyphicon-user middleIcon"></span><br>My정보
							</a>
						</li>
						<li>
							<a href="<%= request.getContextPath() %>/views/member/cart.jsp">
								<span class="glyphicon glyphicon-shopping-cart middleIcon"></span><br>장바구니
							</a>
						</li>
						<li>
							<a href="<%= request.getContextPath() %>/views/customerCenter/customerCenterNotice.jsp">
								<span class="glyphicon glyphicon-earphone middleIcon"></span><br>고객센터
							</a>
						</li>
					</ul>
				</div>
			</nav>
			<%} %>
			<!-- 모바일 네비 하단 -->
			
			<nav class="navbar navbar-bottom visible-xs" style="z-index:10000;">
				<div class="container bottom">
						<button type="button" class="navbar-toggle downBtn" data-toggle="collapse"data-target="#myNavbar">
							<span class="glyphicon glyphicon-align-justify"></span>
						</button>
						</div>
					<div class="collapse navbar-collapse" id="myNavbar" >
						<ul class="nav navbar-nav navbar-left mobileDownMenu">
							<li><a href="">카테고리</a>
							<li><a href="<%=request.getContextPath()%>/selectProduct.pro">판매</a>
							<li><a href="<%=request.getContextPath()%>/views/fundingProduct/fundingProducts.jsp">펀딩</a></li>
							<li><a href="<%=request.getContextPath()%>/views/tour/authorpageMain.jsp">작가이야기</a></li>
							<li><a href="#contact">About</a></li>
						</ul>
					</div>
			</nav>
			
			
			
			 <!-- 네비 하단 --> 
			<nav class="navbar navbar-bottom hidden-xs">
				<div class="container bottom">
					<div class="collapse navbar-collapse" id="myNav">
						<ul class="nav navbar-nav navbar-left">
							<li class="dropdown">
								 <a class="dropdown-toggle" data-toggle="dropdown" href="#">
								 	카테고리<span class="caret"></span>
								</a>
								<ul class="dropdown-menu" style="padding:0px 0px 0px 0px;">
									<li>
										<table class="category" style="width:800px;">
											<tr>
												<td><a href="#">케이스</a></td>
												<td><a href="#">인테이어 소품</a></td>
												<td><a href="#">의류</a></td>
												<td><a href="#">육아, 아동</a></td>
											</tr>
											<tr>
												<td><a href="#">가구</a></td>
												<td><a href="#">여성 수제화</a></td>
												<td><a href="#">속옷, 양말류</a></td>
												<td><a href="#">주방, 생활</a></td>
											</tr>
											<tr>
												<td><a href="#">귀걸이</a></td>
												<td><a href="#">남성 수제화</a></td>
												<td><a href="#">기타 섬유, 퀄트</a></td>
												<td><a href="#">반려동물 용품</a></td>
											</tr>
											<tr>
												<td><a href="#">반지</a></td>
												<td><a href="#">도자기</a></td>
												<td><a href="#">가방, 파우치</a></td>
												<td><a href="#">문구, 팬시</a></td>
											</tr>
											<tr>
												<td><a href="#">목걸이</a></td>
												<td><a href="#">전자기기 관련</a></td>
												<td><a href="#">패션 잡화</a></td>
												<td><a href="#">시계</a></td>
											</tr>
											<tr>
												<td><a href="#">팔찌</a></td>
												<td><a href="#">지갑</a></td>
												<td><a href="#">그외 악세서리</a>></td>
												<td><a href="#">인형, 장난감</a></td>
											</tr>
											<tr>
												<td><a href="#">공예</a></td>
												<td><a href="#">기타</a></td>
												<td></td>
												<td></td>
											</tr>
										</table>
									</li>
								</ul>
							</li>
							<li><a href="<%=request.getContextPath()%>/selectProduct.pro">판매</a>
							<li><a href="<%=request.getContextPath()%>/views/fundingProduct/fundingProducts.jsp">펀딩</a></li>
							<li><a href="<%= request.getContextPath()%>/selectAuthorPage.tn">작가이야기</a></li>
							<li><a href="#contact">About</a></li>
						</ul>
					</div>
				</div>
			</nav>


		</nav>









		


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