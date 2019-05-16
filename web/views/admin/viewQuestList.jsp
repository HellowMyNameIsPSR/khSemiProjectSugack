<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 관리자홈</title>
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
						<div class="topper" style="border: 2px solid black; width: 500px;height: 200px; margin: 0 auto;">
							<div class="row" style="float: left;border: 1px solid red; margin-left:10px;width:20%">
								1:1질문관리
							</div>
							<div class="row" style="border: 1px solid red; width:60%">
								2019년
							</div>
							<div class="" style="clear:both; float: left; border: 1px solid blue; width: 25%;">
								신규질문
								<p>0건</p>
							</div>
							<div class="" style="float: left; border: 1px solid blue; width: 25%;">
								신규질문
								<p>0건</p>
							</div>
							<div class="" style="float: left; border: 1px solid blue; width: 25%;">
								신규질문
								<p>0건</p>
							</div>
							<div class="" style="float: left; border: 1px solid blue; width: 25%;">
								신규질문
								<p>0건</p>
							</div>
						</div>
						
						<h3>1:1문의관리</h3>
						<h3><a href="viewQuestListCustomer.jsp">고객회원질문보기</a></h3>
						<h3><a href="viewQuestListSeller.jsp">판매회원질문보기</a></h3>
					</header>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="adminMenubar.jsp" %>
	</div>
			
</body>
</html>