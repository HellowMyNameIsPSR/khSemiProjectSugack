<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.semi.board.model.vo.*"%>
	
	<%
		ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
		int i = 1;
	%>

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
    		#noticeBoard th{
    		background: skyblue;
		
		text-align:center;
 	}
 	#noticeBoard tr {
 			text-align:center;
 	
 	}
    
    </style>
    
</head>


<body>
<%@ include file = "cutomerCenterMenubar.jsp" %>
	<div class="container">	
		<h2>상품FAQ</h2>
		<table id="noticeBoard" class="table table-striped table-hover">
			<thead>
				<tr>
					<th>게시글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th> 조회수</th>
				</tr>
			</thead>
			<tbody>
				<% for(Board b : list) { %>
				<tr>
					<td><%= b.getBno()%></td>
					<td><%= b.getTitle() %></td>
					<td>운영자</td>
					<td><%= b.getWriteDate() %></td>
					<td><%= b.getbCount() %></td>
					
				</tr>
				<% } %>
			
			</tbody>
		</table>
		<hr />
		<% if(loginUser != null && loginUser.getMemberType().equals("A")){ %>
		<button id="write" class="btn primary" style="float:right">작성하기</button>
		<% } %>
	</div>
	<script>
	$(function(){
		$("#noticeBoard tr td").mouseenter(function(){
			$(this).parent().css({"background":"lightyellow", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"white"});
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
			console.log(num);
			location.href="<%=request.getContextPath()%>/cCenterNoticeDetail.bo?num=" + num;
			
		});
		$("#write").click(function(){
			location.href="<%= request.getContextPath()%>/views/customerCenter/customerCenterNoticeWrite.jsp";
			
		})
	})
	


	
	</script>
	
	<%@ include file="/views/main/footer.jsp" %>
</body>
</html>