<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.board.model.vo.*,java.util.*"%>
<%
	ArrayList<ProQna> list = (ArrayList<ProQna>)request.getAttribute("list");
	/* System.out.println("boardQna에서");!
	System.out.println(" list : " + list); */
	//ProQna qna = (ProQna)request.getAttribute("qna");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의글 내역!</title>
<style>
	.name{
		width:100%;
		font-size:30px;
	}
</style>
</head>
<body>

<!-- Wrapper -->
	<div id="wrapper">
	
		<!-- Main -->
		<div id="main">
				
			<div class="inner">
				
				<!-- Header -->
				
				<header id="header">
					<div class="name">문의 내역</div>
				</header>
				
				<section id="contents">
					<div class="container">
					
						<div class="table">
							<table id="listArea">
								<tr style="text-align:center;">
									<td>번호</td>
									<td></td>
									<td>문의종류</td>
									<td>작성날짜</td>
								</tr>
								  <% 
								  	int num = 0;
								  for(ProQna pro :list){ 
								  %>  
								<tr style="text-align:center;">
									<input type="hidden" id="bno<%=num++%>" class="bno" value="<%= pro.getBno() %>">
									<td><%= pro.getRowNum() %></td>
									<td><input type="hidden" id="bno<%=num++%>" class="bno" value="<%= pro.getBno() %>"></td>
									<td> <%= pro.getcategory() %></td>
									<td><%=pro.getWriteDate() %></td>
								</tr>
								 <%} %>  
								
								
							</table>
						</div>
					
					
					</div>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="../common/userMenubarServlet.jsp" %>
	</div>
	<script>
		$(function(){
			$("#listArea td").click(function(){
				var bno = $(this).parent().children().eq(0).val();
				
				 location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + bno; 
			});
		})
	</script>	
</body>
</html>