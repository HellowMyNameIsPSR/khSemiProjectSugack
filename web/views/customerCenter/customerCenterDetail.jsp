<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.board.model.vo.*"%>
    <% 
   		Board b = (Board) request.getAttribute("b"); 
    	String dTitle = "";
		if(b.getDivision() == 10){
			dTitle = "공지사항";
		}else if(b.getDivision() == 11){
			dTitle = "상품FAQ";
		}else if(b.getDivision() == 12){
			dTitle = "주문/결제FAQ";
		}else if(b.getDivision() == 13){
			dTitle = "배송FAQ";
		}else if(b.getDivision() == 14){
			dTitle = "이벤트";
		}else if(b.getDivision() == 15){
			dTitle = "교환환불FAQ";
		}	
		int bno = b.getBno();
		int bd = b.getDivision();
    
    %>
<!DOCTYPE html>
<html>
<head>
<title>고객센터 공지사항</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <%@ include file="../assets/css/allCss.html" %>
    <style>
    	#noticeBoard {
    	border: 1px solid black;
    	}
    	
    		#noticeBoard th{
    		background: skyblue;
		
		text-align:center;
 	}
 	#noticeBoard th td {
 			text-align:center;
 	
 	}
 	
    
    </style>
    
</head>
<body>
	<%@ include file = "cutomerCenterMenubar.jsp" %>
	<div class="container">	
		<h2><%= dTitle %></h2>
		<table id="noticeBoard" class="table table-striped table-hover">
			<thead>
				<tr>
					<th>제목</th>
					<td colspan = "5"><%= b.getTitle() %></td>
				</tr>
				<tr>
					<th>날짜</th>
					<td><%= b.getWriteDate() %></td>
					<th>작성자</th>
					<td>운영자</td>
					<th>조회수</th>
					<td><%= b.getbCount() %></td>
				</tr>
			</thead>
			<tbody>
				
				<tr>					
					<td colspan = "6"> 내용</td>					
				</tr>
				<tr>		
					<td colspan = "6"><%= b.getContent() %></td>					
				</tr>
			
			</tbody>
			
		</table>

		<hr />
		<% if(loginUser != null && loginUser.getMemberType().equals("A")){ %>
		<button id="update" class="btn primary" style="float:right; background: skyblue;">수정하기</button>
		<p></p>
		<button id="delete" class="btn primary" style="float:right; background: skyblue;">삭제하기</button>
		
		<% } %>
	</div>
	
	<script>
		$(function(){
			$("#update").click(function(){
			
				location.href="<%= request.getContextPath()%>/cCenterNoticeSelect.bo?bNo=" + <%= b.getBno() %>;
			})
			$("#delete").click(function(){
				if(confirm("정말 삭제하시겠습니까 ?") == true){
					location.href="<%= request.getContextPath() %>/cCenterNoticeDelete.bo?bNo=" + <%= b.getBno() %>;
					alert("글이 삭제 되었습니다.");
					history.forward();
				}else{
					return;
				}
			})
			
		})
	
	
	</script>
	
</body>
</html>