<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String event = "15"; %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

	a:hover{
		cursor:pointer;
		
	}

	
	
	
</style>
</head>
<body>
	<%@ include file="../main/mainMenubar.jsp" %>

	<div class="Topper" style="height:100px; background: lightgray; align: center; ">
			<div style="text-align:center; float:left; height: 100px; width: 300px;">
				<h2 style="color:white;">고객센터</h2>
			</div>
			
	</div>
	<div class="tabbable" style="margin:0 auto; align: center;  margin-left:220px; margin-top:10px" >
		<ul class="nav nav-tabs" style = "margin:0 auto; align: center;">
			<li><a href="#tab2" data-toggle="tab">자주묻는질문</a></li>
			<li><a href="#tab3" data-toggle="tab">공지사항</a></li>
		</ul>
		<div class="tab-content" style="margin-top:10px; margin-left: 10px;">
			<div class="tab-pane" id="tab2">
					<table>
						<tr>
							<td><a id="Logistic">배송문의</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>						
							<td><a id="refundFAQ">교환/환불</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td><a id="BuyFAQ">주문/결제</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td><a id="sellFAQ"> 상품문의</a></td>
						</tr>
					</table>
			</div>
			<div class="tab-pane" id="tab3">
				<table>
					<tr>
						<td><a id="notice">공지사항</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><a id="event">이벤트</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		$("#notice").click(function(){
			var id = "10"
			location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo?id=" + id;
		})
		$("#sellFAQ").click(function(){
			var id = "11"

			location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo?id=" + id;

		})
		$("#Logistic").click(function(){
			var id = "13"

			location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo?id=" + id;

		})
		$("#BuyFAQ").click(function(){
			var id = "12"

			location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo?id=" + id;

		})
		$("#refundFAQ").click(function(){
			var id = "15"

			location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo?id=" + id;

		})			
		$("#event").click(function(){
			var id = "14"

			location.href="<%= request.getContextPath()%>/ccNoticeBoard.bo?id=" + id;

		})
		
		
		
		
		
	});
	</script>
	
</body>
</html>