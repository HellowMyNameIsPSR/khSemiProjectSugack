<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>
	.Form{
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
			<div class="Form" align="center">
				<h2 align="center">아이디/비밀번호 찾기</h2>
				<br>
				<div class="panel-group" id="accordion">
					  <div class="panel panel-default">
					    <div class="panel-heading">
					      <h4 class="panel-title">
					        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">이메일을 잃어 버리셨나요?</a>
					      </h4>
					    </div>
					    <div id="collapse1" class="panel-collapse collapse in form-horizontal">
					      <div class="panel-body form-group">
					      	<div class="col-sm-12">
					      		<label class="col-sm-3">이름</label>
						      	<div class="col-sm-6">
						      		<input type="text" name="name" id="name1" class="form-control">
						      	</div>
						    </div>
						    <div class="col-sm-12"><br></div>
						    <div class="col-sm-12">
					      		<label class="col-sm-3">생년월일</label>
						      	<div class="col-sm-6">
						      		<input type="date" name="birthDate" id="birth1" class="form-control">
						      	</div>
						    </div>
						    <div class="col-sm-12"><br></div>
						    <div class="col-sm-3"></div>
						    <div class="col-sm-6">
						    <button type="submit" class="btn btn-primary btn-md btn-block" onclick="idFind();">아이디 찾기</button>	
						    </div>				     
						   </div>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading">
					      <h4 class="panel-title">
					        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">비밀번호를 잃어 버리셨나요?</a>
					      </h4>
					    </div>
					    <div id="collapse2" class="panel-collapse collapse">
					      <div class="panel-body form-group">
					      <div class="col-sm-12">
					      		<label class="col-sm-3">이름</label>
						      	<div class="col-sm-6">
						      		<input type="text" name="name" id="name2" class="form-control">
						      	</div>
						    </div>
						    <div class="col-sm-12"><br></div>
					      	<div class="col-sm-12">
					      		<label class="col-sm-3">가입시 이메일</label>
						      	<div class="col-sm-6">
						      		<input type="email" name="email" id="email" class="form-control">
						      	</div>
						    </div>
						    <div class="col-sm-12"><br></div>
						    <div class="col-sm-12">
					      		<label class="col-sm-3">생년월일</label>
						      	<div class="col-sm-6">
						      		<input type="date" name="birthDate" id="birth2" class="form-control">
						      	</div>
						    </div>
						    <div class="col-sm-12"><br></div>
						    <div class="col-sm-3"></div>
						    <div class="col-sm-6">
						    <button type="submit" class="btn btn-primary btn-md btn-block" onclick="passwordFind();">비밀번호 찾기</button>	
						    </div>				     
						   </div>
					    </div>
					  </div>
					  <br>
					 <div>
				</div>
					
			
			</div>
			
		
	</div>
	<script>
		function idFind(){
			var name = $("#name1").val();
			var birth = $("#birth1").val();
			
			$.ajax({
				url:"<%=request.getContextPath()%>/idFind.me",
				type:"post",
				data:{name:name, birth:birth},
				success:function(data){
					if(data == "fail") {
						alert("존재하지 않는 이메일 입니다.");
					}else {
						alert("회원님의 이메일은 : " + data + "입니다");
					}
				}
			});
		}
		
		function passwordFind(){
			var name = $("#name2").val();
			var birth = $("#birth2").val();
			var email = $("#email").val();

			$.ajax({
				url:"<%=request.getContextPath()%>/passwordFind.me",
				type:"post",
				data:{name:name, birth:birth, email:email},
				success:function(data){
					if(data == "ok") {
						alert("이메일로 임시 비밀번호를 발송했습니다.");
						location.href = "<%=request.getContextPath()%>/views/member/memberLoginForm.jsp";
					}else {
						alert("존재하지 않는 회원입니다.");
					}
				}
			});
		}
	</script>
	
</body>
</html>

















