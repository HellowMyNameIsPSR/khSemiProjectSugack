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
		border: 1px solid red ;
		align:center;
	}
</style>
</head>


<body>
	<div class="container">
	<%@ include file = "cutomerCenterMenubar.jsp" %>
		<form action="">
			<table>
				<tr>
					<td>
						<select name="" id="">
							<option value="">유형1</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" placeholder="제목을 입력해주세요"/>
					</td>
				</tr>
				<tr>
					<td>
						<textarea name="content" id="" cols="30" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="" value="">공개
					</td>
				</tr>
			</table>
			<input type="submit" value="작성하기"/>
		</form>
		
	</div>

</body>
</html>