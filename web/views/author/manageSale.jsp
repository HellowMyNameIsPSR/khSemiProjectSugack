<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.work.model.vo.*"%>
<% ArrayList<HashMap<String, Object>> list = 
		(ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 판매 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<%@ include file="../assets/css/author.html" %>
</head>
<body class="is-preload">
<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="/sg/views/author/authorHome.jsp" class="logo"> <span
						class="glyphicon glyphicon-home"></span> &nbsp; <strong
						style="font-size: 20px;">HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<h2>판매관리</h2>
					</header>
					<!-- Contents area -->
					
					<nav>
						<div class="menuDiv">
							<table class="saliMenu">
								<tr>
									<td class="menuA" onClick = "location.href='<%=request.getContextPath()%>/selectOrderList.wo'">주문조회</td>
									<td class="menuA" onClick = "location.href='<%=request.getContextPath()%>/selectExchangeList.wo'">환불관리</td>
									<td class="menuA" onClick = "location.href=''">교환관리</td>
									<td class="menuA" onClick = "location.href=''">취소관리</td>
								</tr>
							</table>
						</div>
					</nav>
					<div class="manageSaleTitle">
						<h2>주문 조회</h2>
					</div>
					<table class="inquiryTable" >
						<tr>
							<td>조회 기간</td>
							<td>
								<input id="startDate" name="startDate" type="date" style="margin-right:50px;" value="2019-01-01">
								<span class="glyphicon glyphicon-minus"></span>
								<input id="endDate" name="endDate" type="date" style="margin-left:50px;" value="2019-12-31">
							</td>
							<td>
								<input type="button" value="검색" id="searhDate"  class="all-btn" style="width:150px; height:40px;">
							</td>
						</tr>
						<tr>
							<td>상품명 조회</td>
							<td>
								<input id="workName" name="workName" type="text" style="width:400px;">
							</td>
							<td >
								<input type="button" value="검색" id="searhName"  class="all-btn" style="width:150px; height:40px;">
							</td>
						</tr>
					</table>
					
					<div class="manageSaleTable">
						<table class="listTable">
							<tr>
								<th style="width:30px;"><strong>NO.</strong></th>
								<th><strong>상품주문번호</strong></th>
								<th><strong>결제 일시</strong></th>
								<th><strong>상품명</strong></th>
								<th><strong>구매자명</strong></th>
								<th><strong>배송상태</strong></th>
							</tr>
							<!-- <tr>
								<td>0</td><td>OD_ID(ORDER_LIST)</td><td>PAY_DATE(PAYMENT)</td><td>WORK_NAME(WORK)</td><td>MEMBER_ID(MEMBER)</td><td>DELI_STATUS(DELIVERY)</td>
							</tr> -->
							<%
								int num = 0;
							 	for(int i = 0; i < list.size(); i++){
							 		HashMap<String, Object> hmap = list.get(i);
								num++;
							 %>
							<tr>
								<td><%= num %></td>
								<td><%= hmap.get("odId") %></td>
								<td><%= hmap.get("payDate") %></td>
								<td><%= hmap.get("workName") %></td>
								<td><%= hmap.get("memberId") %></td>
								<td><%= hmap.get("deliStatus") %></td>
							</tr>
							<% } %> 
						</table>
					</div>
					
					<%-- 페이지 처리 --%>
						<div class="pagingArea" align="center">
							<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectOrderList.wo?currentPage=1'">
								<span class="glyphicon glyphicon-chevron-left"></span>
								<span class="glyphicon glyphicon-chevron-left"></span>
							</button>
							<% if(currentPage <= 1) {%>
							<button class="pagingBtn2" disabled>
								<span class="glyphicon glyphicon-chevron-left"></span>
							</button>
							<%}else{ %>
							<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectOrderList.wo?currentPage=<%=currentPage - 1%>'">
								<span class="glyphicon glyphicon-chevron-left"></span>
							</button>
							<%} %>
							
							<%for(int p = startPage; p <= endPage; p++){
								
								if(p == currentPage) {%>
								
								<button class="pagingBtn" style="background-color:skyblue">
									<%=p%>
								</button>
								
								<%}else { %>
								
								<button class="pagingBtn" onclick="location.href='<%=request.getContextPath()%>/selectOrderList.wo?currentPage=<%=p%>'">
									<%=p%>
								</button>
								
								<%} %>
								
							<%} %>
							
							
							<% if(currentPage >= maxPage) {%>
							<button class="pagingBtn2" disabled>
								<span class="glyphicon glyphicon-chevron-right"></span> 
							</button>
							<%}else { %>
							<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectOrderList.wo?currentPage=<%=currentPage + 1%>'">
								<span class="glyphicon glyphicon-chevron-right"></span> 
							</button>
							<%} %>
							<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectOrderList.wo?currentPage=<%=maxPage%>'">
								<span class="glyphicon glyphicon-chevron-right"></span> 
								<span class="glyphicon glyphicon-chevron-right"></span> 
							</button>
							
						</div>
					<%-- <script>
						$(function(){
							$(".listTable td").mouseenter(function(){
								$(this)
									.parent()
									.css({"background":"black", "cursor":"pointer"});
							}).mouseout(function(){
								$(this)
									.parent()
									.css({"background-color":"black"});
							}).click(function(){
								var num = $(this).parent().children().eq(1).text();
								console.log(num);
								location.href="<%=request.getContextPath()%>/selectListOne.wo?num=" + num;
							});
						})
						
					</script> --%>
					








				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>
	<div style="height:300px;"></div>		
</body>
</html>