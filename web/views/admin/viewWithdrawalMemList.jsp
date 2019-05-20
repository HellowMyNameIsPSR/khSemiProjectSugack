<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 관리자홈</title>
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
						<h3>탈퇴 회원 조회</h3>
						
						<div>
							<table class="table table-bordered">
								<tr>
									<td style="width:180px;">회원유형</td>
									<td style="width:150px;" colspan="3">
										<input type="radio" name="memberType" value="N" id="radio1" checked/><label for="radio1">일반회원</label>
										<input type="radio" name="memberType" value="W" id="radio2" /><label for="radio2">판매회원</label>
									</td>
									
								</tr>
								<tr>
									<td style="width:180px;">검색유형</td>
									<td style="width:150px;">
										<input type="radio" name="searchType" value="name" id="searchradio1" checked/><label for="searchradio1">이름</label>
										<input type="radio" name="searchType" value="email" id="searchradio2" /><label for="searchradio2">이메일</label>
									</td>
									
									<td  colspan="2" style="width:600px;">
										<input type="text" name="searchText">
									</td>
								</tr>
								
								<tr>
									<td>탈퇴일</td>
									<td><input type="date" name="withdrawalStart" style="width:300px;"/></td>
									<td style="width:30px;"><label style="font-size:15px; text-align:center;">~</label></td>
									<td style="width:500px;">
										<input type="date" name="withdrawalLast" style="width:300px;"/>
									</td>
								</tr>

								<tr>
									<td style="width:180px;">탈퇴유형</td>
									<td colspan="3" style="width:150px;">
										<input type="radio" name="withdrawalType" value="ban" id="radio3" checked/><label for="radio3">강제</label>
										<input type="radio" name="withdrawalType" value="normal" id="radio4" /><label for="radio4">일반</label>
									</td>
									
									
								</tr>

							</table>	
							<button id="searchWithdrawal" style="float:right;">조회</button>				
						</div>
							<h3>탈퇴 회원 조회 결과</h3>
								<table id="searchResultWithdrawal" class="table table-bordered" style="border:2px solid gray; text-align:center">
								<thead>
									<tr style="background:lightgray;">
										<td>번호</td>
										<td>회원유형</td>
										<td>이메일</td>
										<td>이름</td>
										<td>가입일</td>
										<td>탈퇴일</td>
										<td>탈퇴유형</td>
									</tr>
								
								</thead>
								<tbody>
								
								</tbody>
		</table>
			<div class="row" style="padding-left:400px">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
					</header>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="adminMenubar.jsp" %>
	</div>
	<script>
	$("#searchWithdrawal").click(function(){
		var searchType = $("input[name='searchType']:checked").val();
		var searchText = $("input[name='searchText']").val();
		var memberType = $("input[name='memberType']:checked").val();
		var withdrawalStart = $("input[name='withdrawalStart']").val();
		var withdrawalLast = $("input[name='withdrawalLast']").val();
		//탈퇴유형이 아직 없으므로 주석처리함
		//var withdrawalType = $("input[name='withdrawalType']:checked").val();
		var searchMember = {searchType:searchType, searchText:searchText, memberType:memberType, withdrawalStart:withdrawalStart, withdrawalLast:withdrawalLast}
		
		$.ajax({
			url:"<%= request.getContextPath() %>/withdrawalCheck.ad",
			data:searchMember,
			type:"get",
			success:function(data){
				console.log(data);
				$tableBody = $("#searchResultWithdrawal tbody");
				
				$tableBody.html('');
				
				$.each(data, function(index, value){
					var $tr = $("<tr>");
					var $noTd = $("<td>").text(index + 1);
					var $memType = $("<td>").text(decodeURIComponent(value.memberType));
					var $nameTd = $("<td>").text(decodeURIComponent(value.memberName));
					var $emailTd = $("<td>").text(decodeURIComponent(value.memberEmail));
					var $withdrawalDay = $("<td>").text(value.withdrawalDay);
					var $joindayTd = $("<td>").text(value.memberJoinDay);
					var $withdrawalType = $("<td>").text("아직");
					
		
					$tr.append($noTd);
					$tr.append($memType);
					$tr.append($emailTd);
					$tr.append($nameTd);
					$tr.append($joindayTd);
					$tr.append($withdrawalDay);
					$tr.append($withdrawalType);
					$tableBody.append($tr); 
					
				})
			}
			
		});
	})
	</script>
			
</body>
</html>