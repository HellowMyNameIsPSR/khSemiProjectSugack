<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수작 - 펀딩 작품 등록2</title>
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
						<h2>판매 작품등록</h2>
					</header>
					<!-- Contents area -->

					<form id="salesInsert" action="" method="post">

						<div class="listBox">
							<div class="listTitle">
								<h2>펀딩 목표 금액</h2>
							</div>
							<div class="listContents">
								<p class="subtext">
									※ 펀딩의 총 목표 금액을 설정해 주세요.<br>
									마감일 자정까지 100%이상을 달성했을 시 후원금이 전달됩니다. 마감일 전 후원을 취소하시는 분들이 있어 초과달성을 목표로 하는 것이 유리합니다. <br>
									목표 금액은 제작비, 인건비, 배송료, 예비 비용 등을 고려하시기 바랍니다.
								</p>
								<div class="row">
									<input type="text" placeholder="목표금액" id="targetAmount" name="targetAmount" style="width:60%">
									<label>원</label>
								</div>
								
							</div>
						</div>


						<div class="listBox">
							<div class="listTitle">
								<h2>프로젝트 기간</h2>
							</div>
							<div class="listContents">
								<p class="subtext">※프로젝트를 몇 일동안 진행하시겠습니까?</p>
								<div class="row">
									<input type="number" id="fundingTerm" name="fundingTerm" placeholder="진행일수">
									<label>일</label>
								</div>
							</div>
						</div>

						<div class="listBox">
							<div class="listTitle">
								<h2>리워드 구성</h2>
							</div>
							<div class="listContents">
							<div class="row">
								<p class="subtext">
									※ 후원자들을 위한 리워드 내용을 입려하세요. 
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
							<!-- <hr>
							<div class="listContents">
								<h4>예상 배송일</h4>
								<div class="row">
									<input type="date">
									<label>일부터 순차적 발송</label>
								</div>
							</div> -->
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


						<div class="listBox">
							<div class="listTitle">
								<h2>환불 및 교환 정책</h2>
							</div>
							<div class="listContents">
								<p class="subtext">
									※ 우리 홈페이지의 환불 및 교환 정책에 관한 내용에 동의하십니까?							
								</p>
								<div class="row">
									<textarea id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
								</div>
								<div class="row">
									<input type="checkbox" id="acceptFund" name="acceptFund">
									<label for="acceptFund">약관에 동의합니다.</label>
								</div>
							</div>
						</div>
					</form>
					<div align="center">
						<button class="all-btn" style="width: 150px;" id="enrollFundingGoods2">Next > </button>
					</div>
				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp"%>
	</div>
	<script>
	$(function(){
		$("#fundOptionTable").children().children().mouseenter(function(){
			$(this).css({
				"border" : "2px solid #3366ff"
			});
		}).mouseout(function(){
			$(this).css({
				"border" : "1px solid #ddd"
			});
		}).click(function(){
			console.log("클릭");
		});
		
		$("#enrollFundingGoods2").click(function(){
			location.href = "<%= request.getContextPath() %>/views/author/enrollFundingGoods3.jsp";
		});
	});
	</script>
</body>
</html>