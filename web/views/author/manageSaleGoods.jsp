<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.work.model.vo.*"%>
<%
	ArrayList<Work> list = (ArrayList<Work>)request.getAttribute("list");
	System.out.println("ㄹ12312412421 : " + list);
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	System.out.println(currentPage);
	System.out.println(maxPage);
	System.out.println(startPage);
	System.out.println(endPage);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 판매 작품 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<%@ include file="../assets/css/allCss.html" %>
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
						<h2>판매 상품관리</h2>
					</header>
					<!-- Contents area -->

					<div class="manageSaleTitle">
						<h2>상품 조회 및 수정</h2>
					</div>
					
					<table class="inquiryTable" >
						<tr>
							<td>조회 기간</td>
							<td>
								<input name="wrDate1" type="date" style="margin-right:50px;">
								<span class="glyphicon glyphicon-minus"></span>
								<input name="wrDate2" type="date" style="margin-left:50px;">
							</td>
						</tr>
						<tr>
							<td>상품명 조회</td>
							<td colspan="2"><input type="text" name="wnInquiry" style="width:250px;"></td>
						</tr>
						<tr align="center">
							<td colspan="3">
								<button type="submit" class="all-btn" style="width:150px; height:40px;">검색</button>
							</td>
						</tr>
					</table>
						
						
					<div class="manageSaleTable">
						<table class="listTable">
							<tr>
								<th style="width:30px;"><strong>NO.</strong></th>
								<th><strong>상품명</strong></th>
								<th><strong>판매가</strong></th>
								<th style="width:150px;"><strong>등록일</strong></th>
								<th style="width:100px;"><strong>상태</strong></th>
							</tr>
							<%for(Work work : list){ %>
							<tr>
								<td><%= work.getWorkId() %></td>
								<td><%= work.getworkName() %></td>
								<td><%= work.getPrice() %>원</td>
								<td><%= work.getWrDate() %></td>
								<td></td>
							</tr>
							<% } %>
						</table>
					</div>
	
					<%-- 페이지 처리 --%>
					<div class="pagingArea" align="center">
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectSale.wo?currentPage=1'">
							<span class="glyphicon glyphicon-chevron-left"></span>
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<% if(currentPage <= 1) {%>
						<button class="pagingBtn2" style="background:black;" disabled>
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<%}else{ %>
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectSale.wo?currentPage=<%=currentPage - 1%>'">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<%} %>
						
						<%for(int p = startPage; p <= endPage; p++){
							
							if(p == currentPage) {%>
							
							<button class="pagingBtn" style="background-color:skyblue">
								<%=p%>
							</button>
							
							<%}else { %>
							
							<button class="pagingBtn" onclick="location.href='<%=request.getContextPath()%>/selectSale.wo?currentPage=<%=p%>'">
								<%=p%>
							</button>
							
							<%} %>
							
						<%} %>
						
						
						<% if(currentPage >= maxPage) {%>
						<button class="pagingBtn2" style="background:black;" disabled>
							<span class="glyphicon glyphicon-chevron-right"></span> 
						</button>
						<%}else { %>
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectSale.wo?currentPage=<%=currentPage + 1%>'">
							<span class="glyphicon glyphicon-chevron-right"></span> 
						</button>
						<%} %>
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectSale.wo?currentPage=<%=maxPage%>'">
							<span class="glyphicon glyphicon-chevron-right"></span> 
							<span class="glyphicon glyphicon-chevron-right"></span> 
						</button>
						
					</div>
					
					<script>
						$(function(){
							$(".listTable tr").mouseenter(function(){
								$(this)
									.parent()
									.css({"background":"darkgray", "cursor":"pointer"});
							}).mouseout(function(){
								$(this)
									.parent()
									.css({"background":"black"});
							}).click(function(){
								var num = $(this).parent().children().eq(0).text();
								console.log(num);
								location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num;
							});
						})
						
					</script>

				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>
			
</body>
</html>