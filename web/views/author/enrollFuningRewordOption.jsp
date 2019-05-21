<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수작 - 리워드 추가구성</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<%@ include file="stylesheet/eroll.html" %>
	<%@ include file="../assets/css/allCss.html" %>
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
						<h2>리워드 추가 구성</h2>
					</header>
					<!-- Contents area -->
					<div class="listBox" id="categoryArea">
						<div class="listTitle">
							<h2>리워드 구성</h2>
						</div>
							<div class="listContents">
							<div class="row">
								<p class="subtext">
									※ 추가적으로 리워드 구성을 하시겠습니까?
								</p>
								<input type="button" value="+" class="all-btn" style="margin-left:10px;">
							</div>
								<div class="row">          
									  <table class="table table-bordered" id="fundOptionTable">
									      <tr>
									        <th>작품 명</th>
									        <th>구성품</th>
									        <th>추가금액</th>
									      </tr>
									      <tr>
									        <td>John</td>
									        <td>Doe</td>
									        <td>john@example.com</td>
									      </tr>
									      <tr>
									        <td>Mary</td>
									        <td>Moe</td>
									        <td>mary@example.com</td>
									      </tr>
									      <tr>
									        <td>July</td>
									        <td>Dooley</td>
									        <td>july@example.com</td>
									      </tr>
									  </table>
									</div>
							</div>
							<hr>
							<div class="listContents">
								<h4>구매 제한</h4>
								<div class="row">
									<label>1인당 </label>
									<select style="width:50%;">
										<option>구성품</option>
										<option>구성품</option>
										<option>구성품</option>
									</select>
									<label>을(를) </label>
									<input type="number" placeholder="수량">
									<label> 개로 제한합니다.</label>
								</div>
							</div>
							</div>
					<div align="center">
						<button class="all-btn" style="width: 150px;" id="enrollRewordOption">건너뛰기</button>
						<button class="all-btn" style="width: 150px;" id="enrollRewordOption">등록하기</button>
					</div>
				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp"%>
	</div>
</body>
</html>