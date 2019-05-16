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
	table{
		border: 1px solid gray;
		
	}
</style>
</head>


<body>
	<div class="container">
	<%@ include file = "cutomerCenterMenubar.jsp" %>
	
		<table class="table table-bordered" style="border:2px solid gray; text-align:center">
		<tr style="background:lightgray;">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		<tr>
			<td>1</td>
			<td>아니글쎼</td>
			<td>김진환</td>
			<td>2019-11-5</td>
		</tr>
		<tr>
			<td>1</td>
			<td>아니글쎼</td>
			<td>김진환</td>
			<td>2019-11-5</td>
		</tr>
		<tr>
			<td>1</td>
			<td>아니글쎼</td>
			<td>김진환</td>
			<td>2019-11-5</td>
		</tr>
		<tr>
			<td>1</td>
			<td>아니글쎼</td>
			<td>김진환</td>
			<td>2019-11-5</td>
		</tr>
		<tr>
			<td>1</td>
			<td>아니글쎼</td>
			<td>김진환</td>
			<td>2019-11-5</td>
		</tr>
		<tr>
			<td>1</td>
			<td>아니글쎼</td>
			<td>김진환</td>
			<td>2019-11-5</td>
		</tr>
		<tr>
			<td>1</td>
			<td>아니글쎼</td>
			<td>김진환</td>
			<td>2019-11-5</td>
		</tr>
		<tr>
			<td>1</td>
			<td>아니글쎼</td>
			<td>김진환</td>
			<td>2019-11-5</td>
		</tr>
		<tr>
			<td>1</td>
			<td>아니글쎼</td>
			<td>김진환</td>
			<td>2019-11-5</td>
		</tr>
		<tr>
			<td>1</td>
			<td>아니글쎼</td>
			<td>김진환</td>
			<td>2019-11-5</td>
		</tr>
		</table>
		<a href="customerCenterQuesWrite.jsp"><button class="btn btn-primary" style="float:right">글 작성하기</button></a>
		<div class="row" style="padding-left:400px">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</div>
		<form class="form-search">
	  <div class="input-append">
	    <input type="text" class="span2 search-query">
	    <button type="submit" class="btn">검색</button>
	  </div>
	</form>
	</div>

</body>
</html>