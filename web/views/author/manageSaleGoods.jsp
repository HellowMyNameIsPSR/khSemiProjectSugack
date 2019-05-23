<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.work.model.vo.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
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
									<th style="width:30px;"><strong>NO.</strong></th>
									<th style="width:70px;"><strong>상품코드</strong></th>
									<th><strong>상품명</strong></th>
									<th><strong>판매가</strong></th>
									<th style="width:150px;"><strong>등록일</strong></th>

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
										<td><%= hmap.get("workId") %></td>
										<td><%= hmap.get("workName") %></td>
										<td><%= hmap.get("price") %>원</td>
										<td><%= hmap.get("wrDate") %></td>
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
							<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectSale.wo?currentPage=1'">
								<span class="glyphicon glyphicon-chevron-left"></span>
								<span class="glyphicon glyphicon-chevron-left"></span>
							</button>
							<% if(currentPage <= 1) {%>
							<button class="pagingBtn2" disabled>
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
						
						function searhDate(currentPage){
							var startDate = $("#startDate").val();
							var endDate = $("#endDate").val();
							
							console.log($("#startDate").val());
							console.log($("#endDate").val());
							
							$.ajax({
								url:"<%=request.getContextPath()%>/selectDate.wo",
								data:{startDate: $("#startDate").val(), endDate: $("#endDate").val(), currentPage:currentPage},
								type:"get",
								success:function(data){
									var currentPage = data.pi.currentPage;
		                            var maxPage = data.pi.maxPage;
		                            var startPage = data.pi.startPage;
		                            var endPage = data.pi.endPage;
		                            
		                            $("#tbody").find("tr").remove();
									$(".pagingArea").children().remove();
									
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
												'<td> ' + data.list[key].workId + '</td>' + 
												'<td> ' + data.list[key].workName + '</td>' + 
												'<td> ' + data.list[key].price + '</td>' + 
												'<td> ' + data.list[key].wrDate + ' </td>' + 
											'</td>'
										);
									}
									
								}
							});
						}
						
						
						function searhName(currentPage){
							var workName = $("#workName").val();
							
							$.ajax({
								url:"<%=request.getContextPath()%>/selectName.wo",
								data:{workName: $("#workName").val(), currentPage:currentPage},
								type:"get",
								success:function(data){
									var currentPage = data.pi.currentPage;
		                            var maxPage = data.pi.maxPage;
		                            var startPage = data.pi.startPage;
		                            var endPage = data.pi.endPage;
		                            $("#tbody").find("tr").remove();
									$(".pagingArea").children().remove();
									
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
												'<td> ' + data.list[key].workId + '</td>' + 
												'<td> ' + data.list[key].workName + '</td>' + 
												'<td> ' + data.list[key].price + '</td>' + 
												'<td> ' + data.list[key].wrDate + ' </td>' + 
											'</tr>'
										);
									}
									
								}
							});
						}		
						
						
					</script>
					

				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>
	<div style="height:300px;"></div>
			
</body>
</html>