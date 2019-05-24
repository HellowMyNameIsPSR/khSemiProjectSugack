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
			vertical-align: middle;
		text-align:center;
 	}
 	#noticeBoard tr td {
 			
 					vertical-align: middle;
 		
 	}
 	
    
    </style>
    
</head>
<body>
	<%@ include file = "cutomerCenterMenubar.jsp" %>
	<div class="container">	
		<h2><%= dTitle %> 수정</h2>
		<form id="updateNotice">
		<table id="noticeBoard" class="table table-striped table-hover">
			<thead>
				<tr>
					<th>제목</th>
					<td colspan = "5">
					
					<input type="text" size="50" name="title" value="<%= b.getTitle() %>"/>
					<input type="hidden" name="bNo" value="<%= b.getBno() %>"/>
					
					</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
					<input type="date" name="date" value="<%= b.getWriteDate() %>">
					</td>
					<th>작성자</th>
					<td>운영자</td>
					<th>조회수</th>
					<td><%= b.getbCount() %></td>
				</tr>
			</thead>
			<tbody>
				
				<tr>					
					<td colspan = "6">내용</td>					
				</tr>
				<tr>		
					<td colspan = "6">
					<textarea name="content" cols="150" rows="10" style="resize:none;"><%= b.getContent() %></textarea>
					</td>					
				</tr>
			
			</tbody>
			
		</table>

		<hr />
		<% if(loginUser != null && loginUser.getMemberType().equals("A")){ %>
		<div align="center">
		
		<button id="updateF" class="btn primary" style="float:right; background: skyblue;">수정완료</button>
		<button id="cancel" class="btn primary" style="float:right; background: skyblue;">목록으로</button>
		</div>
		
		<% } %>
	<script>
		
		function complete(){
			$("#updateNotice").attr("action", "<%= request.getContextPath()%>/cCutomerCenterNoticeUpdate.bo?bNo=" + <%= bno%>);
			
			}

	</script>
	</form>
	</div>
	
</body>
</html>