<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title></title>
</head>
<body>
	<script>
		$(function(){
			location.href = "<%= request.getContextPath() %>/selectproptype.at";
		});
	</script>
</body>
</html>