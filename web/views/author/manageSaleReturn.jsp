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
					<a href="authorHome.jsp" class="logo"> <span
						class="glyphicon glyphicon-home"></span> &nbsp; 
						<strong style="font-size: 20px;">HOME</strong>
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
									<td class="menuA" onClick = "location.href='<%=request.getContextPath()%>/selectExchangeList.wo'">교환관리</td>
									<td class="menuA" onClick = "location.href='<%=request.getContextPath()%>/manageSaleReturn.jsp'">반품관리</td>
									<td class="menuA" onClick = "location.href='<%=request.getContextPath()%>/manageSaleCancel.jsp'">취소관리</td>
								</tr>
							</table>
						</div>
					</nav>
					<div class="manageSaleTitle">
						<h2>반품관리</h2>
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
								<th><strong>주문일시</strong></th>
								<th><strong>주문상태</strong></th>
								<th><strong>상품명</strong></th>
								<th><strong>수량</strong></th>
								<th><strong>구매자명</strong></th>
								<th><strong>구매자ID</strong></th>
							</tr>
							<tr>
								<th style="width:30px;"><strong>NO.</strong></th>
								<th><strong>상품주문번호</strong></th>
								<th><strong>교환요청일</strong></th>
								<th><strong>상품명</strong></th>
								<th><strong>수량</strong></th>
								<th><strong>구매자명</strong></th>
								<th><strong>교환처리상태</strong></th>
							<%
								int num = 0;
							 	for(int i = 0; i < list.size(); i++){
							 		HashMap<String, Object> hmap = list.get(i);
								num++;
							 %>
							<tr>
								<td><%= num %></td>
								<td><%= hmap.get("odId") %></td>
								<td><%= hmap.get("refundEnddate") %></td>
								<td><%= hmap.get("workName") %></td>
								<td><%= hmap.get("count") %></td>
								<td><%= hmap.get("memberId") %></td>
								<td><%= hmap.get("refundDate") %></td>
							</tr>
							<% } %> 
						</table>
					</div>
					
					<div class="manageButton">
						<table style="height:100%;">
							<tr align="center">
								<td width="150px;min-width:150px;">반품 처리</td>
								<td><button style="width:120px;">반품 전 처리</button></td>
								<td><button style="width:120px;">반품 중 처리</button></td>
								<td><button style="width:120px;">반품 완료 처리</button></td>
								<td><button style="width:120px;">반품 거절 처리</button></td>
							</tr>
						</table>
					</div>






				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>
			
</body>
</html>