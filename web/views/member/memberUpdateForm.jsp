<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	.joinForm{
		border:1px solid lightgray;
		width:600px;
		height:650px;
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
		width:100px;
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
			<div class="joinForm hidden-xs">
				<h2 align="center">회원정보수정</h2>
				<div class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-3">이메일</label>
						<div class="col-sm-6">
							<input type="email" name="email" id="email" class="form-control" readonly value="<%=loginUser.getEmail()%>">
							<input type="hidden" name="memberId" id="memberId" value="<%= loginUser.getMemberId() %>">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">비밀번호</label>
						<div class="col-sm-6">
							<input type="password" name="password" id="password" class="form-control">
						</div>
						<label class="control-label col-sm-3" id="passwordResult"></label>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">비밀번호확인</label>
						<div class="col-sm-6">
							<input type="password" name="password2" id="password2" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">핸드폰</label>
						<div class="col-sm-6">
							<input type="tel" name="phone" id="phone" class="form-control" value="<%=loginUser.getPhone()%>">
						</div>
					</div>	
					<div class="form-group">
						<label class="control-label col-sm-3">성별</label>
						<div class="col-sm-6">
						<% if(loginUser.getGender() != null) {%>
							<input type="hidden" name="gender" value="<%=loginUser.getGender()%>">
							<select class="form-control" id="gender" disabled>
							    <option value="M">남자</option>
							    <option value="F">여자</option>
							  </select>
						<%}else { %>
							  <select class="form-control" id="gender" name="gender">
							    <option value="M">남자</option>
							    <option value="F">여자</option>
							  </select>
						<%} %>
						</div>
					
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3">생년월일</label>
						<div class="col-sm-6">
							<% if(loginUser.getBirthDate() != null) {%>
							<input type="date" name="birthDate" id="birthDate" class="form-control" value="<%=sdf.format(loginUser.getBirthDate())%>">
							<%}else { %>
							<input type="date" name="birthDate" id="birthDate" class="form-control" value="1999-01-01">
							<%} %>
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="control-label col-sm-3"></label>
						<div class="col-sm-6">
							<button onclick="update();" class="btn btn-primary btn-md btn-block">정보수정</button>
							<button onclick="location.href='<%=request.getContextPath()%>/index.jsp'" class="btn btn-default btn-md btn-block"> 취소 </button>
							
							
						</div>
					</div>
				
				</div>
					
				
			</div>
			
			
			
		
	</div>
	<script>
		function update(){
			var password = $("#password").val();
			var phone = $("#phone").val();
			var gender = $("#gender").val();
			var birthDate = $("#birthDate").val();
			var memberId = $("#memberId").val();
			var email = $("#email").val();
			$.ajax({
				url:"<%=request.getContextPath()%>/update.me",
				type:"post",
				data:{password:password, phone:phone, gender:gender, birthDate:birthDate, memberId:memberId, email:email},
				success:function(data){
					if(data == "ok") {
						alert("정보가 성공적으로 수정되었습니다.");
					}else {
						alert("정보수정에 실패했습니다.");
					}
				}
			});
			
		}
		
		$(function(){
			$("#password2").change(function(){
				var password = $("#password").val();
				var password2 = $("#password2").val();
				console.log(password);
				console.log(password2);
				
				if(password == password2){
					$("#passwordResult").text("일치합니다").css("color", "yellowgreen");
				}else{
					$("#passwordResult").text("일치하지않습니다").css("color", "red");
				}
			});
		});
	</script>
	
</body>
</html>




















