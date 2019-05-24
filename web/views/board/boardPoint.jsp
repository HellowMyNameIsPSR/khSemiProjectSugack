<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.member.model.vo.*"%>
<%
	ArrayList<Point> list = (ArrayList<Point>)request.getAttribute("list");
	int totalPoint = 0; 
	for(int i = 0; i < list.size(); i++) {
	totalPoint += list.get(i).getPoint();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적립금 내역</title>
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
					<div class="name">적립금 내역</div>
				</header>
				
				<section id="contents">
					<div class="container">
						<div class="table">
							<table>
								<tr style="text-align:center;">
									<td>날짜</td>
									<td>적립금</td>
									<td>내용</td>
									<td>총 적립금</td>
								</tr>
								<% 
									for(int i = 0; i < list.size(); i++) {
								%>
									<%if(list.get(i).getPoint() != 0) {%>
										 <tr style="text-align:center;">
											<td><%=list.get(i).getpDate() %></td>
											<td><%=list.get(i).getPoint() %></td>
											<%if(list.get(i).getpLocation().equals("PAYED")) {%>
											<td>상품 구매</td>
											<%} %>
											<td><%=totalPoint %></td>
										</tr>
									<%} totalPoint -= list.get(i).getPoint(); %>
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
			
</body>
</html>