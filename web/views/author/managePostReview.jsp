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
<title>수작 - 문의및리뷰 관리</title>
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
						<h2>문의/리뷰관리</h2>
					</header>
					<!-- Contents area -->
					
					<nav>
						<div class="menuDiv">
							<table class="postMenu">
								<tr>
									<td class="menuA" onClick = "location.href='<%=request.getContextPath()%>/selectQnaList.wo'">문의관리</td>
									<td class="menuA" onClick = "location.href='<%=request.getContextPath()%>/selectReviewList.wo'">리뷰관리</td>
					
								</tr>
							</table>
						</div>
					</nav>
					<div class="manageSaleTitle">
						<h2>리뷰관리</h2>
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
					
					
					<div class="managePostTable">
						<table class="listTable">
							<tr>
								<th style="width:30px;"><strong>NO.</strong></th>
								<th><strong>리뷰 번호</strong></th>
								<th><strong>상품명</strong></th>
								<th><strong>리뷰 내용</strong></th>
								<th><strong>별점</strong></th>
								<th><strong>작성자</strong></th>
								<th><strong>작성일</strong></th>
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
									<td><%= hmap.get("commentId") %></td>
									<td><%= hmap.get("workName") %></td>
									<td><%= hmap.get("content") %></td>
									<td><%= hmap.get("starPoint") %></td>
									<td><%= hmap.get("memberName") %></td>
									<td><%= hmap.get("writeDate") %></td>
								</tr>
								<% } %>
							</tbody> 
						</table>
					</div>
					
					
					
					<%-- 페이징 처리 --%>
					<div class="pagingArea" align="center">
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectReviewList.wo?currentPage=1'">
							<span class="glyphicon glyphicon-chevron-left"></span>
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<% if(currentPage <= 1) {%>
						<button class="pagingBtn2" disabled>
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<%}else{ %>
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectReviewList.wo?currentPage=<%=currentPage - 1%>'">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<%} %>
						
						<%for(int p = startPage; p <= endPage; p++){
							
							if(p == currentPage) {%>
							
							<button class="pagingBtn" style="background-color:skyblue">
								<%=p%>
							</button>
							
							<%}else { %>
							
							<button class="pagingBtn" onclick="location.href='<%=request.getContextPath()%>/selectReviewList.wo?currentPage=<%=p%>'">
								<%=p%>
							</button>
							
							<%} %>
							
						<%} %>
						
						
						<% if(currentPage >= maxPage) {%>
						<button class="pagingBtn2" disabled>
							<span class="glyphicon glyphicon-chevron-right"></span> 
						</button>
						<%}else { %>
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectReviewList.wo?currentPage=<%=currentPage + 1%>'">
							<span class="glyphicon glyphicon-chevron-right"></span> 
						</button>
						<%} %>
						<button class="pagingBtn2" onclick="location.href='<%=request.getContextPath()%>/selectReviewList.wo?currentPage=<%=maxPage%>'">
							<span class="glyphicon glyphicon-chevron-right"></span> 
							<span class="glyphicon glyphicon-chevron-right"></span> 
						</button>
						
					</div>
					<script>
					function searhDate(currentPage){
						var startDate = $("#startDate").val();
						var endDate = $("#endDate").val();
						
						console.log($("#startDate").val());
						console.log($("#endDate").val());
						
						$.ajax({
							url:"<%=request.getContextPath()%>/selectReviewDate.wo",
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
											'</td>'  +
											'<td> ' + num + "</td>" +
											'<td> ' + data.list[key].commentId + '</td>' + 
											'<td> ' + data.list[key].workName + '</td>' + 
											'<td> ' + data.list[key].content + '</td>' + 
											'<td> ' + data.list[key].starPoint + ' </td>' + 
											'<td> ' + data.list[key].memberName + ' </td>' + 
											'<td> ' + data.list[key].writeDate + ' </td>' + 
										'</tr>'
									);
								}
								
							}
						});
					}
					
					
					function searhName(currentPage){
						var workName = $("#workName").val();
						
						$.ajax({
							url:"<%=request.getContextPath()%>/selectReviewName.wo",
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
											'</td>'  +
											'<td> ' + num + "</td>" +
											'<td> ' + data.list[key].commentId + '</td>' + 
											'<td> ' + data.list[key].workName + '</td>' + 
											'<td> ' + data.list[key].content + '</td>' + 
											'<td> ' + data.list[key].starPoint + ' </td>' + 
											'<td> ' + data.list[key].memberName + ' </td>' + 
											'<td> ' + data.list[key].writeDate + ' </td>' + 
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
	
	<div style="height:400px;"></div>
			
</body>
</html>