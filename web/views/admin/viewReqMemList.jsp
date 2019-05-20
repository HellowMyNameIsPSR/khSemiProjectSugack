<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.author.model.vo.*"%>
    <%
    	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("reqMemList");
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 관리자홈</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
						<div class="main-1">
								<table class="stat" style="height:150px; width:800px; margin:auto; text-align:center; background: white;">
									<tr>
								 		<td><h3>입점신청현황</h3></td>
								 		<td colspan="2">0000년00월00일</td>
								 		<td></td>
								 	</tr>
								 	<tr>
								 		<td>오늘의 신청수</td>
								 		<td>신청대기</td>
								 		<td>승인완료</td>
								 		<td>승인거부</td>
								 	</tr>
								 	
								 	<tr>
								 		<td>0건</td>
								 		<td>00건</td>
								 		<td>-건</td>
								 		<td>0건</td>
							
								 	</tr>
								</table>
								
								<div class="row" style="height:40px; border: 1px solid red; margin-top:0px; margin-left: 0; margin-right: auto;">
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
							<% for(int i = 0; i < 5; i++){ 
								HashMap<String,Object> hmap = list.get(i);
							%>
							<tr>
								<td><%= i + 1 %></td>
								<td><%= hmap.get("authorName") %></td>
								<td><%= hmap.get("email")%></td>
								<td><%= hmap.get("authorContent")%></td>
								<td><%= hmap.get("applyDate")%></td>
								<td><%= hmap.get("applyDate")%></td>
								<td><%= hmap.get("authorStatus")%></td>
							<% } %>
							</tr>
							
						</table>
						<div class="row" style="padding-left: 400px">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#">Previous</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</div>
							</div>
						<!--  <h3><a href="viewReqMemListDetail.jsp">입점신청세부보기</a></h3> -->
					</header>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="adminMenubar.jsp" %>
	</div>
	<script>
	$(function(){
		$("#reqListArea td").mouseenter(function(){
			$(this).parent().css({"background":"gray", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"white"});
		}).click(function(){
			var authorName = $(this).parent().children().eq(1).text();
			console.log(authorName);
			var list = $()
			
			//form안에 없기 때문에 페이를 통쨰로 넘긴다
			location.href="<%=request.getContextPath()%>/selectOneReqMem.ad?authorName=" + authorName;
		});
	})
	
	</script>
			
</body>
</html>