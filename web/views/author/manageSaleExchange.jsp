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
								</tr>
							</table>
						</div>
					</nav>
					<div class="manageSaleTitle">
						<h2>환불관리</h2>
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
								<th style="width:40px;"><strong></strong></th>
								<th style="width:40px;"><strong>NO.</strong></th>
								<th><strong>환불 코드</strong></th>
								<th><strong>상품명</strong></th>
								<th><strong>수량</strong></th>
								<th><strong>환불요청일</strong></th>
								<th><strong>구매자명</strong></th>
								<th><strong>환불처리상태</strong></th>
								<tbody id="tbody">
									<%
										int num = 0;
									 	for(int i = 0; i < list.size(); i++){
									 		HashMap<String, Object> hmap = list.get(i);
										num++;
									 %>
									<tr>
										<td style="padding:0px 0px 10px 15px; font-size:12px; text-align:left; width:30px;">
											<input type="radio" id="<%= num %>" name="cid" value="">
											<label for="<%= num %>" style=""></label>
										</td>
										<td data-toggle="modal" data-target="#myModal<%= num %>"><%= num %></td>
										<td data-toggle="modal" data-target="#myModal<%= num %>"><%= hmap.get("refundId") %></td>
										<td data-toggle="modal" data-target="#myModal<%= num %>"><%= hmap.get("workName") %></td>
										<td data-toggle="modal" data-target="#myModal<%= num %>"><%= hmap.get("count") %></td>
										<td data-toggle="modal" data-target="#myModal<%= num %>"><%= hmap.get("refundEnddate") %></td>
										<td data-toggle="modal" data-target="#myModal<%= num %>"><%= hmap.get("memberName") %></td>
										<td style="font-weight:bold; font-size:16px;color:#FF8D8D;"><%= hmap.get("refundDate") %></td>
									</tr>
									<!-- <script>
										$("#waitBtn").click(function(){
											$("#update").val('대기중');
										}
									</script> -->
									<% } %> 
								</tbody>
						</table>
					</div>
					<%	int num1 = 0;
						for(int i = 0; i < list.size(); i++){
					 	HashMap<String, Object> hmap = list.get(i);
					 	num1++;%>
					<div class="modal fade" id="myModal<%=num1%>" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h2 class="modal-title">환불 신청 사유</h2>
								</div>
								<div class="modal-body">
									<table class="model-table">
										<tr>
											<td style="font-weight:bold; width:100px; font-size:17px;">상품명</td>
											<td colspan="3"><%=hmap.get("workName")%></td>
										</tr>
										<tr>
										</tr>
										<tr>
											<td colspan="4" style="font-weight:bold; text-align:center; font-size:17px;">환불 사유</td>
										</tr>
										<tr>
											<td colspan="4" style="height:300px;"><%=hmap.get("refundReason")%></td>
										</tr>
										<tr>
											<td style="font-weight:bold; font-size:17px;">수량</td>
											<td><%=hmap.get("count")%> 개</td>
											<td style="font-weight:bold; font-size:17px;">환불 요청일</td>
											<td><%=hmap.get("refundEnddate")%></td>
										</tr>
										<tr>
											<td style="font-weight:bold; font-size:17px;">환불코드</td>
											<td><%=hmap.get("refundId")%></td>
											<td style="font-weight:bold; font-size:17px;">구매자명님</td>
											<td><%=hmap.get("memberName")%></td>
										</tr>
									</table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">돌아가기</button>
								</div>
							</div>
						</div>
					</div>
					<%
						}
					%> 

					<div class="manageButton">
						<table style="height:100%;">
							<tr align="center">
								<td width="150px;min-width:150px;">환불 처리</td>
								<td><button id="waitBtn" class="all-btn"style="width:150px;">환불 대기중 처리</button></td>
								<td><button id="completeBtn" class="all-btn"style="width:150px;">환불 완료 처리</button></td>
								<td><button id="refusalBtn" class="all-btn"style="width:150px;">교환불 불가</button></td>
							</tr>
						</table>
					</div>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<script>
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
								
							});
						})
						
						
						
						$("#searhDate").click(function(){
								var startDate = $("#startDate").val();
								var endDate = $("#endDate").val();
								
								console.log($("#startDate").val());
								console.log($("#endDate").val());
								
								$.ajax({
									url:"<%=request.getContextPath()%>/selectExchangeDate.wo",
									data:{startDate: $("#startDate").val(), endDate: $("#endDate").val()},
									type:"get",
									success:function(data){
										//console.log(data);
										var num = 0;
										$("#tbody").find("tr").remove();
										$(".pagingArea1").remove();
										
										
										for(var i = 0; i < data.length; i++){
											num++;
											$("#tbody").append(
												"<tr>" +
													'<td style="padding:0px 0px 10px 15px; font-size:12px; text-align:left; width:30px;">' +
														'<input type="radio"' + 'id="<%= num %>"'+ 'name="cid">'  +
														'<label for="<%= num %>" style=""></label>'  +
													'</td>'  +
													'<td> ' + num + "</td>" +
													'<td> ' + data[i].refundId + '</td>' + 
													'<td> ' + data[i].workName + '</td>' + 
													'<td> ' + data[i].count + '</td>' + 
													'<td> ' + data[i].refundEnddate + ' </td>' + 
													'<td> ' + data[i].memberName + '</td>' + 
													'<td style="font-weight:bold; font-size:16px;color:#FF8D8D;"> ' + data[i].refundDate + '</td>' + 
												'</td>'
											);
										}
										
									}
								});
							});
							
							$("#searhName").on("click", function(){
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
													"<td> " + data[i].workId + "</td>" + 
													"<td> " + data[i].workName + "</td>" + 
													"<td> " + data[i].price + "원 </td>" + 
													"<td> " + data[i].wrDate + "</td>" + 
												"</td>"
											);
											
											
										}
										
									}
								});
							});
					</script>
					
							
					<%-- 페이지 처리 --%>
					<div class="pagingArea1" align="center">
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectExchangeList.wo?currentPage=1'">
							<span class="glyphicon glyphicon-chevron-left"></span>
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<% if(currentPage <= 1) {%>
						<button class="pagingBtn2" disabled>
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<%}else{ %>
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectExchangeList.wo?currentPage=<%=currentPage - 1%>'">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<%} %>
						
						<%for(int p = startPage; p <= endPage; p++){
							
							if(p == currentPage) {%>
							
							<button class="pagingBtn" style="background-color:skyblue">
								<%=p%>
							</button>
							
							<%}else { %>
							
							<button class="pagingBtn" onclick="location.href='<%=request.getContextPath()%>/selectExchangeList.wo?currentPage=<%=p%>'">
								<%=p%>
							</button>
							
							<%} %>
							
						<%} %>
						
						
						<% if(currentPage >= maxPage) {%>
						<button class="pagingBtn2" disabled>
							<span class="glyphicon glyphicon-chevron-right"></span> 
						</button>
						<%}else { %>
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectExchangeList.wo?currentPage=<%=currentPage + 1%>'">
							<span class="glyphicon glyphicon-chevron-right"></span> 
						</button>
						<%} %>
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectExchangeList.wo?currentPage=<%=maxPage%>'">
							<span class="glyphicon glyphicon-chevron-right"></span> 
							<span class="glyphicon glyphicon-chevron-right"></span> 
						</button>
						
					</div>
							

					 <%-- 페이지 처리 --%>
					<%--<div class="pagingArea" align="center">
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectExchangeDate.wo?currentPage=1'">
							<span class="glyphicon glyphicon-chevron-left"></span>
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<% if(currentPage <= 1) {%>
						<button class="pagingBtn2" disabled>
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<%}else{ %>
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectExchangeDate.wo?currentPage=<%=currentPage - 1%>'">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<%} %>
						
						<%for(int p = startPage; p <= endPage; p++){
							
							if(p == currentPage) {%>
							
							<button class="pagingBtn" style="background-color:skyblue">
								<%=p%>
							</button>
							
							<%}else { %>
							
							<button class="pagingBtn" onclick="location.href='<%=request.getContextPath()%>/selectExchangeDate.wo?currentPage=<%=p%>'">
								<%=p%>
							</button>
							
							<%} %>
							
						<%} %>
						
						
						<% if(currentPage >= maxPage) {%>
						<button class="pagingBtn2" disabled>
							<span class="glyphicon glyphicon-chevron-right"></span> 
						</button>
						<%}else { %>
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectExchangeDate.wo?currentPage=<%=currentPage + 1%>'">
							<span class="glyphicon glyphicon-chevron-right"></span> 
						</button>
						<%} %>
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectExchangeDate.wo?currentPage=<%=maxPage%>'">
							<span class="glyphicon glyphicon-chevron-right"></span> 
							<span class="glyphicon glyphicon-chevron-right"></span> 
						</button>
						
					</div>
 --%>



				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>


	<div style="height:400px;"></div>



</body>
</html>