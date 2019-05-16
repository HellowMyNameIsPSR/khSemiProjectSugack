<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.work.model.vo.*"%>
<%
	ArrayList<Work> list = (ArrayList<Work>)request.getAttribute("list");
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
						<script>
							$("#searhDate").click(function(){
								var startDate = $("#startDate").val();
								var endDate = $("#endDate").val();
								
								console.log($("#startDate").val());
								console.log($("#endDate").val());
								
								$.ajax({
									url:"<%=request.getContextPath()%>/selectDate.wo",
									data:{startDate: $("#startDate").val(), endDate: $("#endDate").val()},
									type:"get",
									success:function(data){
										//console.log(data);
										var num = 0;
										$("#tbody").find("tr").remove();
										$(".pagingArea").remove();
										
										console.log(data[0].workId)
										
										for(var i = 0; i < data.length; i++){
											num++;
											$("#tbody").append(
												"<tr>" +
													"<td> " + num + "</td>" + 
													"<td> " + data[i].workName + "</td>" + 
													"<td> " + data[i].price + "</td>" + 
													"<td> " + data[i].wrDate + "</td>" + 
													"<td></td>" +
												"</td>"
											);
										}
										
									}
								});
							});
							
							$("#searhName").click(function(){
								var workName = $("#workName").val();
								
								//console.log($("#workName").val());
								
								$.ajax({
									url:"<%=request.getContextPath()%>/selectName.wo",
									data:{workName: $("#workName").val()},
									type:"get",
									success:function(data){
										console.log(data);
										var num = 0;
										$("#tbody").find("tr").remove();
										$(".pagingArea").remove();
										
										console.log(data[0].workId)
										
										for(var i = 0; i < data.length; i++){
											num++;
											$("#tbody").append(
												"<tr>" +
													"<td> " + num + "</td>" + 
													"<td> " + data[i].workName + "</td>" + 
													"<td> " + data[i].price + "</td>" + 
													"<td> " + data[i].wrDate + "</td>" + 
													"<td></td>" +
												"</td>"
											);
										}
										
									}
								});
							});
							
						</script>
						
						
						
						<div class="manageSaleTable">
							<table class="listTable">
								<tr>
									<th style="width:30px;"><strong>NO.</strong></th>
									<th><strong>상품명</strong></th>
									<th><strong>판매가</strong></th>
									<th style="width:150px;"><strong>등록일</strong></th>
									<th style="width:100px;"><strong>상태</strong></th>
								</tr>
								<tbody id="tbody">
									
								 <%
									int num = 0;
								 	for(Work work : list){
									num++;
								 %>
								<tr>
									<td><%= num %></td>
									<td><%= work.getworkName() %></td>
									<td><%= work.getPrice() %>원</td>
									<td><%= work.getWrDate() %></td>
									<td></td>
								</tr>
								<% } %> 
								</tbody>
							</table>
						</div>
		
						<%-- 페이지 처리 --%>
						<div class="pagingArea" align="center">
							<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectSale.wo?currentPage=1'">
								<span class="glyphicon glyphicon-chevron-left"></span>
								<span class="glyphicon glyphicon-chevron-left"></span>
							</button>
							<% if(currentPage <= 1) {%>
							<button class="pagingBtn2" " disabled>
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
							<button class="pagingBtn2" disabled>
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
	<div style="height:300px;"></div>
			
</body>
</html>