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
							<div class="row" style="float: left; margin-left:10px;width:20%">
								1:1질문관리
							</div>
							<div class="row" style="width:60%">
								2019년
							</div>
							<div class="" style="text-align:center; clear:both; float: left; width: 25%;">
								신규질문
								<p>0건</p>
							</div>
							<div class="" style="text-align:center; float: left; width: 25%;">
								신규질문
								<p>0건</p>
							</div>
							<div class="" style="text-align:center; float: left; width: 25%;">
								신규질문
								<p>0건</p>
							</div>
							<div class="" style="text-align:center; float: left; width: 25%;">
								신규질문
								<p>0건</p>
							</div>
						</div>
						<br><br><br>
						<div class="row" style="height:40px;  margin-top:0px; margin-left: 0; margin-right: auto;">
									<h4>최근 신청 리스트(5건)</h4>
								</div>
						<table class="table table-bordered"	id="reqListArea" style="border: 2px solid gray; text-align: center">
							<tr style="background: lightgray;">
								<th>신청번호</th>
								<th>점포명</th>
								<th>회원아이디(이메일)</th>
								<th>가입신청내용</th>
								<th>신청일자</th>
								<th>잔여일자</th>
								<th>상태</th>

							</tr>
							
							</tr>
							
						</table>
						
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