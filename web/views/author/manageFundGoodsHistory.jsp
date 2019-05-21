<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수작 - 펀딩작품내역</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<%@ include file="stylesheet/eroll.html" %>
</head>
<body class="is-preload">
<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="authorHome.jsp" class="logo"> <span
						class="glyphicon glyphicon-home"></span> &nbsp; <strong
						style="font-size: 20px;">HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<h2>펀딩 작품 내역</h2>
					</header>
					<!-- Contents area -->
					<div class="row">
						<select name="sortTable" id="sortTable" onchange="sortTable();">
							<option value="최근등록" selected>최근등록</option>
							<option value="대기">상태 : 대기</option>
							<option value="진행">상태 : 진행중</option>
							<option value="종료">상태 : 종료</option>
						</select>
					</div><br>

					<div class="row">          
						  <table class="table table-bordered">
						    <thead>
						      <tr>
						        <th>작품명</th>
						        <th>등록일</th>
						        <th>시작일</th>
						        <th>종료일</th>
						        <th>상태</th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr>
						        <td>John</td>
						        <td>Doe</td>
						        <td>john@example.com</td>
						        <td>Doe</td>
						        <td>john@example.com</td>
						      </tr>
						      <tr>
						        <td>Mary</td>
						        <td>Moe</td>
						        <td>mary@example.com</td>
						        <td>Doe</td>
						        <td>john@example.com</td>
						      </tr>
						      <tr>
						        <td>July</td>
						        <td>Dooley</td>
						        <td>july@example.com</td>
						        <td>Doe</td>
						        <td>john@example.com</td>
						      </tr>
						    </tbody>
						  </table>
						</div>
				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp"%>
	</div>
	<script>
		//드롭박스에서 값을 선택 했을 때
		function sortTable() {
			var sortTable = document.getElementById("sortTable");
			var selectData = sortTable.options[sortTable.selectedIndex].value;
			console.log(selectData);
		} //end func 
		$(function(){
			
			$.ajax({
				url : "",
				type : "get",
				success : function(data) {
					
				},
				error : function(data) {
					
				},
				complete : function(data) {
					
				}
			});
		}); 
	</script>
</body>
</html>