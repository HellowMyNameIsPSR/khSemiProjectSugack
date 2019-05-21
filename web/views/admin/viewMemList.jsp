<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.admin.model.vo.*"%>
<% 
ArrayList<SearchMember> list = (ArrayList<SearchMember>) request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원관리</title>
<style>
	 .container{
	width: 80%;`
	}
	.checkbox-inline{
		background: red;
	}
	
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body class="is-preload">
<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="adminHome.jsp" class="logo">
						Admin<strong>HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<h3>회원정보조회</h3>
	
									
						<div>
							<table class="table table-bordered">
								<tr>
									<td style="width:180px;">개인정보</td>
									<td style="width:150px;">
										<input type="radio" name="searchType" value="name" id="searchradio1" checked/><label for="searchradio1">이름</label>
										<input type="radio" name="searchType" value="email" id="searchradio2" /><label for="searchradio2">이메일</label>
									</td>
									
									<td  colspan="2" style="width:600px;">
										<input type="text" name="searchText">
									</td>
								</tr>
								
								<tr>
									<td>회원유형</td>
									<td style="width:150px;">
										<input type="radio" name="memberType" value="N" id="radio1" checked/><label for="radio1">일반회원</label>
										<input type="radio" name="memberType" value="W" id="radio2" /><label for="radio2">판매회원</label>
									</td>
									
								</tr>
								<tr>
									<td>가입일</td>
									<td><input type="date" name="joinStart" style="width:300px;"/></td>
									<td style="width:30px;"><label style="font-size:15px; text-align:center;">~</label></td>
									<td style="width:500px;">
										<input type="date" name="joinLast" style="width:300px;"/>
									</td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td><input type="date" name="birthDateStart" style="width:300px;"/></td>
									<td style="width:30px;"><label style="font-size:15px; text-align:center;">~</label></td>
									<td style="width:500px;">
										<input type="date" name="birthDateLast" style="width:300px;"/>
									</td>
								</tr>
								<tr>
									<td style="width:180px;">성별</td>
									<td colspan="3" style="width:150px;">
										<input type="radio" name="gender" value="M" id="radio3" checked/><label for="radio3">남자</label>
										<input type="radio" name="gender" value="F" id="radio4" /><label for="radio4">여자</label>
									</td>
									
									
								</tr>

							</table>	
							<button id="searchMemList" style="float:right;">조회</button>				
						</div>
						
		<table class="table table-bordered" id="memberInfoTable" style="border:2px solid gray; text-align:center">
			<thead>
			<tr style="background:lightgray;">
				<td>번호</td>
				<td>회원유형</td>
				<td>회원이메일</td>
				<td>회원이름</td>
				<td>회원가입일</td>
				<td>생년월일</td>
				<td>성별</td>
			</tr>
			</thead>
			<tbody>
			
			</tbody>
			
		</table>
		<div class="row" style="padding-left:200px">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
						
						</div>
					</header>
					<!-- Contents area -->
				</section>
			</div>
		<%@ include file="adminMenubar.jsp" %>
	</div>
	<script>
	$("#searchMemList").click(function(){
		var searchType = $("input[name='searchType']:checked").val();
		var searchText = $("input[name='searchText']").val();
		var memberType = $("input[name='memberType']:checked").val();
		var joinStart = $("input[name='joinStart']").val();
		var joinLast = $("input[name='joinLast']").val();
		var birthDateLast = $("input[name='birthDateLast']").val();
		var birthDateStart = $("input[name='birthDateStart']").val();
		var gender = $("input[name='gender']:checked").val();
		var searchMember = {searchType:searchType, searchText:searchText, memberType:memberType, joinStart:joinStart, joinLast:joinLast, birthDateStart:birthDateStart,
				birthDateLast:birthDateLast, gender:gender}
		
		$.ajax({
			url:"<%= request.getContextPath() %>/memberCheck.ad",
			data:searchMember,
			type:"get",
			success:function(data){
				//console.log(data);
				$tableBody = $("#memberInfoTable tbody");
				
				$tableBody.html('');
				
				$.each(data, function(index, value){
					var $tr = $("<tr>");
					var $noTd = $("<td>").text(index + 1);
					var $memType = $("<td>").text(decodeURIComponent(value.memberType));
					var $nameTd = $("<td>").text(decodeURIComponent(value.memberName));
					var $emailTd = $("<td>").text(decodeURIComponent(value.memberEmail));
					var $joindayTd = $("<td>").text(value.memberJoinDay);
					var $birthDate = $("<td>").text(value.memberBirthDay);
					var $gender = $("<td>").text(decodeURIComponent(value.memberGender));
					
					
					$tr.append($noTd);
					$tr.append($memType);
					$tr.append($emailTd);
					$tr.append($nameTd);
					$tr.append($joindayTd);
					$tr.append($birthDate);
					$tr.append($gender);
					$tableBody.append($tr); 
					
					
				})
			}
			
		});
	})
	</script>
</body>
</html>