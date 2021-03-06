<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.work.model.vo.*"%>
<% ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
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
									<td class="menuA" onClick = "location.href='<%=request.getContextPath()%>/adminSelectOrderList.wo'">주문조회</td>
									<td class="menuA" onClick = "location.href='<%=request.getContextPath()%>/adminSelectExchangeList.wo'">환불관리</td>
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
								<input onclick="searhDate(1)" type="button" value="검색" id="searhDate"  class="all-btn" style="width:150px; height:40px;">
							</td>
						</tr>
						<tr>
							<td>상품명 조회</td>
							<td>
								<input id="workName" name="workName" type="text" style="width:400px;">
							</td>
							<td >
								<input onclick="searhName(1)" type="button" value="검색" id="searhName"  class="all-btn" style="width:150px; height:40px;">
							</td>
						</tr>
					</table>

					<div class="manageSaleTable">
						<table class="listTable">
							<tr>
								<th style="width:40px;"><strong>NO.</strong></th>
								<th style="width:100px;"><strong>환불 코드</strong></th>
								<th><strong>상품명</strong></th>
								<th style="width:50px;"><strong>수량</strong></th>
								<th style="width:80px;"><strong>가격</strong></th>
								<th style="width:100px;"><strong>구매자</strong></th>
								<th style="width:100px;"><strong>환불요청일</strong></th>
								<th style="width:140px;"><strong>처리상태</strong></th>
								<th style="width:100px;"><strong>환불요청</strong></th>
							</tr>
							<tbody id="tbody">
								<%
									int num = 0;
								 	for(int i = 0; i < list.size(); i++){
								 		HashMap<String, Object> hmap = list.get(i);
									num++;
								 %>
								<tr>
									<td><%= num %></td>
									<td><%= hmap.get("refundId") %></td>
									<td><%= hmap.get("workName") %></td>
									<td><%= hmap.get("count") %></td>
									<td><%= hmap.get("refundPrice") %></td>
									<td><%= hmap.get("memberName") %></td>
									<td><%= hmap.get("refundDate") %></td>
									<td style="font-weight:bold; font-size:16px;color:#FF8D8D;"><%= hmap.get("refundStat") %></td>
									<td><button data-toggle="modal" data-target="#myModal<%= num %>" type="button" class="postBtn all-btn" style="height:30px;width:80px;padding:0px 0px 0px 0px;;">바로가기</button></td>
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
					<div id="modalArea">
					<%	int num1 = 0;
						for(int i = 0; i < list.size(); i++){
					 	HashMap<String, Object> hmap = list.get(i);
					 	num1++;%>
					<div class="modal fade" id="myModal<%=num1%>" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<form id="salesFrom"action="<%=request.getContextPath()%>/adminUpdateExchange.ad"method="post">
									<input type="hidden" name="refundId" value="<%=hmap.get("refundId")%>">
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
												<td><%=hmap.get("refundDate")%></td>
											</tr>
											<tr>
												<td style="font-weight:bold; font-size:17px;">환불코드</td>
												<td><%=hmap.get("refundId")%></td>
												<td style="font-weight:bold; font-size:17px;">구매자명님</td>
												<td><%=hmap.get("memberName")%></td>
											</tr>
											<tr>
												<td colspan="1" style="font-weight:bold; font-size:17px;">환불 요청</td>
												<td colspan="3">
													<select name="refundStat">
															<option value="환불 완료">환불 승인</option>
															<option value="환불 거절">환불 거절</option>
													</select>
												</td>
											</tr>
										</table>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-default" >신청하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<%
						}
					%> 
					</div>
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
						
						
						
					function searhDate(currentPage){
							var startDate = $("#startDate").val();
							var endDate = $("#endDate").val();
							
							console.log($("#startDate").val());
							console.log($("#endDate").val());
							
							$.ajax({
								url:"<%=request.getContextPath()%>/selectExchangeDate.wo",
								data:{startDate: $("#startDate").val(), endDate: $("#endDate").val(), currentPage:currentPage},
								type:"get",
								success:function(data){
									var currentPage = data.pi.currentPage;
		                            var maxPage = data.pi.maxPage;
		                            var startPage = data.pi.startPage;
		                            var endPage = data.pi.endPage;
		                            
		                            $("#tbody").find("tr").remove();
									$(".pagingArea").children().remove();
									$("#modalArea").children().remove();
									
									var $paging = $(".pagingArea");
									
									var $firstBtn = ('<button class="pagingBtn2" onclick="searhDate(1)">' +
													 '<span class="glyphicon glyphicon-chevron-left"><span class="glyphicon glyphicon-chevron-left">');
		                        	$paging.append($firstBtn);
		                        	
		                        	if(currentPage <= 1){
		                        		var $preBtn = (' <button class="pagingBtn2" disabled)>' +
										 				'<span class="glyphicon glyphicon-chevron-left">&nbsp;');
                   						$paging.append($preBtn);
		                        	}else{
		                        		var $preBtn = (' <button class="pagingBtn2" onclick="searhDate('+ (currentPage - 1) +')">' +
						 								'<span class="glyphicon glyphicon-chevron-left">&nbsp;');
   										$paging.append($preBtn);
		                        	}
		                        	
		                        	for(var p = startPage; p <= endPage; p++){
		                        		 if(p == currentPage){
		                        			 $numBtn = $(' <button class="pagingBtn" style="background-color:skyblue">'+ p +'</button>').text(p);;
		                        			 $paging.append($numBtn);
		                        		 }else{
		                        			 $numBtn = $(' <button class="pagingBtn" onclick="searhDate(' + p + ')">' + p).text(p);;
		                        			 $paging.append($numBtn);
		                        		 }
		                        	}
		                        	
		                        	if(currentPage <= 1){
		                        		var $nextBtn = (' <button class="pagingBtn2" disabled)>' +
										 				'<span class="glyphicon glyphicon-chevron-right">&nbsp;');
                   						$paging.append($nextBtn);
		                        	}else{
		                        		var $nextBtn = (' <button class="pagingBtn2" onclick="searhDate('+ (currentPage + 1) +')">' +
						 								'<span class="glyphicon glyphicon-chevron-right">&nbsp;');
   										$paging.append($nextBtn);
		                        	}
		                        	
		                        	
		                        	var $endBtn = (' <button class="pagingBtn2" onclick="searhDate('+ maxPage +')">' +
									 '<span class="glyphicon glyphicon-chevron-right"><span class="glyphicon glyphicon-chevron-right">');
               						$paging.append($endBtn);
		                        	
									var num = 0;
									
									for(var key in data.list){
										num++;
										$("#tbody").append(
											"<tr>" +
												'<td> ' + num + "</td>" +
												'<td> ' + data.list[key].refundId + '</td>' + 
												'<td> ' + data.list[key].workName + '</td>' + 
												'<td> ' + data.list[key].count + '</td>' + 
												'<td> ' + data.list[key].refundPrice + '</td>' + 
												'<td> ' + data.list[key].memberName + '</td>' + 
												'<td> ' + data.list[key].refundDate + '</td>' + 
												'<td style="font-weight:bold; font-size:16px;color:#FF8D8D;"> ' + data.list[key].refundStat + '</td>' + 
												'<td><button data-toggle="modal" data-target="#myModal<'+num+'" type="button" class="postBtn all-btn" style="height:30px;width:80px;padding:0px 0px 0px 0px;;">바로가기</button></td>'+ 
											'</tr>'
										);
										$("#modalArea").append(
											'<div class="modal fade" id="myModal' + num + '" role="dialog"><div class="modal-dialog">' +
											'<div class="modal-content"><div class="modal-header">' + 
											'<button type="button" class="close" data-dismiss="modal">&times;</button>' +
											'<h2 class="modal-title">환불 신청 사유</h2></div><div class="modal-body">' +
											'<table class="model-table"><tr><td style="font-weight:bold; width:100px; font-size:17px;">상품명</td>' +
											'<td colspan="3">' + data.list[key].workName + '</td></tr><tr></tr><tr>' +
											'<td colspan="4" style="font-weight:bold; text-align:center; font-size:17px;">환불 사유</td></tr><tr>' +
											'<td colspan="4" style="height:300px;">' + data.list[key].refundEnddate + '</td></tr><tr>' +
											'<td style="font-weight:bold; font-size:17px;">수량</td><td>' + data.list[key].count + '개</td>' +
											'<td style="font-weight:bold; font-size:17px;">환불 요청일</td><td>' + data.list[key].refundEnddate + '</td>' +
											'</tr><tr><td style="font-weight:bold; font-size:17px;">환불코드</td><td>' + data.list[key].refundId + '</td>' +
											'<td style="font-weight:bold; font-size:17px;">구매자명님</td><td>' + data.list[key].memberName + '</td></tr>' +
											'</table></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">' +
											'돌아가기</button></div></div></div></div>'
										);
									}
									
								}
							});
						}
						
						
						function searhName(currentPage){
							var workName = $("#workName").val();
							
							$.ajax({
								url:"<%=request.getContextPath()%>/selectExchangeName.wo",
								data:{workName: $("#workName").val(), currentPage:currentPage},
								type:"get",
								success:function(data){
									var currentPage = data.pi.currentPage;
		                            var maxPage = data.pi.maxPage;
		                            var startPage = data.pi.startPage;
		                            var endPage = data.pi.endPage;
		                            $("#tbody").find("tr").remove();
									$(".pagingArea").children().remove();
									$("#modalArea").children().remove();
									
									var $paging = $(".pagingArea");
									
									var $firstBtn = ('<button class="pagingBtn2" onclick="searhName(1)">' +
													 '<span class="glyphicon glyphicon-chevron-left"><span class="glyphicon glyphicon-chevron-left">');
		                        	$paging.append($firstBtn);
		                        	
		                        	if(currentPage <= 1){
		                        		var $preBtn = (' <button class="pagingBtn2" disabled)>' +
										 				'<span class="glyphicon glyphicon-chevron-left">&nbsp;');
                   						$paging.append($preBtn);
		                        	}else{
		                        		var $preBtn = (' <button class="pagingBtn2" onclick="searhName('+ (currentPage - 1) +')">' +
						 								'<span class="glyphicon glyphicon-chevron-left">&nbsp;');
   										$paging.append($preBtn);
		                        	}
		                        	
		                        	for(var p = startPage; p <= endPage; p++){
		                        		 if(p == currentPage){
		                        			 $numBtn = $(' <button class="pagingBtn" style="background-color:skyblue">'+ p +'</button>').text(p);;
		                        			 $paging.append($numBtn);
		                        		 }else{
		                        			 $numBtn = $(' <button class="pagingBtn" onclick="searhName(' + p + ')">' + p).text(p);;
		                        			 $paging.append($numBtn);
		                        		 }
		                        	}
		                        	
		                        	if(currentPage <= 1){
		                        		var $nextBtn = (' <button class="pagingBtn2" disabled)>' +
										 				'<span class="glyphicon glyphicon-chevron-right">&nbsp;');
                   						$paging.append($nextBtn);
		                        	}else{
		                        		var $nextBtn = (' <button class="pagingBtn2" onclick="searhName('+ (currentPage + 1) +')">' +
						 								'<span class="glyphicon glyphicon-chevron-right">&nbsp;');
   										$paging.append($nextBtn);
		                        	}
		                        	
		                        	
		                        	var $endBtn = (' <button class="pagingBtn2" onclick="searhName('+ maxPage +')">' +
									 '<span class="glyphicon glyphicon-chevron-right"><span class="glyphicon glyphicon-chevron-right">');
               						$paging.append($endBtn);
		                        	
									var num = 0;
									
									for(var key in data.list){
										num++;
										$("#tbody").append(
												"<tr>" +
												'<td> ' + num + "</td>" +
												'<td> ' + data.list[key].refundId + '</td>' + 
												'<td> ' + data.list[key].workName + '</td>' + 
												'<td> ' + data.list[key].count + '</td>' + 
												'<td> ' + data.list[key].refundPrice + '</td>' + 
												'<td> ' + data.list[key].memberName + '</td>' + 
												'<td> ' + data.list[key].refundDate + '</td>' + 
												'<td style="font-weight:bold; font-size:16px;color:#FF8D8D;"> ' + data.list[key].refundStat + '</td>' + 
												'<td><button data-toggle="modal" data-target="#myModal<%= num %>" type="button" class="postBtn all-btn" style="height:30px;width:80px;padding:0px 0px 0px 0px;;">바로가기</button></td>'+ 
											'</tr>'
										);
										
										$("#modalArea").append(
											'<div class="modal fade" id="myModal' + num + '" role="dialog"><div class="modal-dialog">' +
											'<div class="modal-content"><form id="salesFrom"action="<%=request.getContextPath()%>/updateExchange.wo"method="post">' +
											'<input type="hidden" name="refundId" value="' + data.list[key].refundId + '"><div class="modal-header">' +
											'<button type="button" class="close" data-dismiss="modal">&times;</button><h2 class="modal-title">환불 신청 사유</h2></div>' +
											'<div class="modal-body"><table class="model-table"><tr><td style="font-weight:bold; width:100px; font-size:17px;">상품명</td>' +
											'<td colspan="3">' + data.list[key].workName + '</td></tr><tr></tr><tr><td colspan="4" style="font-weight:bold; text-align:center; font-size:17px;">환불 사유</td>' +
											'</tr><tr><td colspan="4" style="height:300px;">' + data.list[key].refundReason + '</td></tr><tr>' +
											'<td style="font-weight:bold; font-size:17px;">수량</td><td>' + data.list[key].count + ' 개</td><td style="font-weight:bold; font-size:17px;">환불 요청일</td>' +
											'<td>' + data.list[key].refundDate + '</td></tr><tr><td style="font-weight:bold; font-size:17px;">환불코드</td><td>' + data.list[key].refundId + '</td>' +
											'<td style="font-weight:bold; font-size:17px;">구매자명님</td><td>' + data.list[key].memberName + '</td></tr><tr>' +
											'<td colspan="1" style="font-weight:bold; font-size:17px;">환불 요청</td><td colspan="3"><select name="refundStat">' +
											'<option value="환불 승인 요청">환불 승인 요청</option><option value="환불 거절">환불 거절</option></select></td></tr></table></div><div class="modal-footer">' +
											'<button type="submit" class="btn btn-default" >신청하기</button></div></form></div></div></div>'
										);
									}
									
								}
							});
						}						
					</script>
							
					 <%-- 페이지 처리 --%>
					<div class="pagingArea" align="center">
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
					
					


				</section>
			</div>
		</div>
		<%@ include file="adminMenubar.jsp" %>
	</div>


	<div style="height:400px;"></div>



</body>
</html>