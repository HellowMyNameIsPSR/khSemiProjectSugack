<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>
	.loginForm{
		border:1px solid lightgray;
		width:600px;
		height:500px;
		padding:30px;
		margin-top:50px;
	}
	table{
		margin-top:50px;
	}
	input{
		padding:5px;
	}
	.btn{
		width:50px;
	}
	.btn-block{
		width:300px;
	}
	form{
		margin-top:20px;
	}
	h2{
		margin-bottom:20px;
	}
</style>
</head>
<body>
<%@ include file="../main/mainMenubar.jsp" %>
	<div class="container" align="center">
			<div class="loginForm" align="center">
				<h2 align="center">로그인</h2>
			
				<form action="<%= request.getContextPath() %>/login.me" method="post" class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-3">이메일</label>
						<div class="col-sm-6">
							<input type="text" name="email" id="email" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">비밀번호</label>
						<div class="col-sm-6">
							<input type="password" name="password" id="password" class="form-control">
						</div>
					</div>
					
					<br>
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<button type="submit" class="btn btn-primary btn-md btn-block">로그인</button>
						<button type="reset" class="btn btn-default btn-md btn-block" onclick="location.href='memberJoinForm.jsp'"> 회원가입 </button>
						<button type="button" class="btn btn-primary btn-md btn-block" onclick="idPwdFind();">아이디/비밀번호 찾기</button>
					</div>
				</form>
					
			
			</div>
			
		
	</div>

<script>
	$(function(){
		var msg = "<%=msg%>";
		console.log(msg);
		if(msg == "1") {
			alert("존재하지 않는 아이디 입니다.");
			$("#email").focus();
		}else if(msg == "-1"){
			alert("비밀번호가 틀립니다.");
			$("#password").focus();
		}
	});
	
	function idPwdFind(){
		location.href="findIdAndPassword.jsp";
	}
	
</script>	
</body>
</html>




















