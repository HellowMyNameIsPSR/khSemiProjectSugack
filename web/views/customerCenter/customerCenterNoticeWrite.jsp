<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	.row {
		width: 100%;
	}
	#writeTable th {
		text-align:center;
		width: 20%;
		background: skyblue;
	}
</style>
</head>


<body>
	<%@ include file = "cutomerCenterMenubar.jsp" %>
	<div class="container">
		<div class="row">
		<form action="<%= request.getContextPath()%>/cCenterNoticeWrite.bo">
			<table class="table-bordered table-hover" id="writeTable" style="margin: 0 auto; width: 100%;">
				<tr>
				<th>작성 게시판 유형</th>
					<td>
						<select name="bType">
							<option value="10">공지사항</option>
							<option value="11">상품FAQ</option>
							<option value="12">주문/결제FAQ</option>
							<option value="13">배송관련</option>
							<option value="14">이벤트</option>
							<option value="15"> 교환환불FAQ</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>작성일자</th>
					<td>
						<input type="date" name="date" id="currentDate">
					</td>
				</tr>
				<tr>
					<th>제목</th>			
					<td>
						<input type="text" name="title" placeholder="제목을 입력해주세요"/>
					</td>
				</tr>
				<tr>
					<th>작성내용</th>
					<td>
						<textarea name="content" id="" cols="30" rows="10" style="width: 100%; resize: none;"></textarea>
					</td>
				</tr>
				
			</table>
			<input type="submit" class="btn" style="float:right" value="작성하기"/>
		</form>
		
		</div>
	</div>
	<script>
 		 document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
	</script>
	<%@ include file="/views/main/footer.jsp" %>
</body>
</html>