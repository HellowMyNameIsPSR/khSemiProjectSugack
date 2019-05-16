<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 판매 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	.manageSaleTitle{
		margin: 20px 0px 20px 0px;
		height:70px;
		padding-top:15px;
		padding-left:20px;
		min-width:650px;
	}
	.saliMenu{
		margin-bottom:70px;
		min-width:650px;
	}
	.saliMenu tr>td{
		border:1px solid gray;
		box-shadow:2px 2px lightgray;
		background:rightgray;
		text-align:center;
	}
	
	.menuA:hover{
		background:skyblue;
		cursor:pointer
	}
	
	
	.subTitle{
		border:1px solid gray;
		margin: 20px 0px 20px 0px;
		box-shadow:2px 2px lightgray;
		height:50px;
		padding-top:5px;
		padding-left:20px;
		background:lightgray;
		font-size:20px;
		min-width:650px;
	}
	


	.manageSaleContents{
		border:2px solid lightgray;
		margin: 20px 0px 20px 0px;
		box-shadow:2px 2px lightgray;
		height:150px;
		min-width:650px;
	}
	.manageSaleTable{
		border:2px solid lightgray;
		margin: 20px 0px 20px 0px;
		box-shadow:2px 2px lightgray;
		height:500px;
		min-width:650px;

	}
	
	.listTable tr>td{
		border:1px solid darkgray;
		font-size:13px;
		text-align:center;
		background:white;
	}
	.listTable tr>th{
		border:1px solid darkgray;
		font-size:13px;
		text-align:center;
		background:lightgray;
		padding-top:7px;
		padding-botton:7px;
	}
	
	.manageButton{
		border:2px solid lightgray;
		margin: 20px 0px 20px 0px;
		box-shadow:2px 2px lightgray;
		height:100px;
		min-width:650px;
	}



</style>
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
						class="glyphicon glyphicon-home"></span> &nbsp; 
						<strong style="font-size: 20px;">HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main manageSaleTitle">
						<h2>판매 관리</h2>
					</header>
					<!-- Contents area -->
					<div class="subTitle">
						<p><strong>반품관리</strong></p>
					</div>
					
					<nav>
						<table class="saliMenu">
							<tr>
								<td class="menuA" onClick = " location.href='manageSale.jsp'">주문조회</td>
								<td class="menuA" onClick = " location.href='manageSaleExchange.jsp'">교환관리</td>
								<td class="menuA" onClick = " location.href='manageSaleReturn.jsp'">반품관리</td>
								<td class="menuA" onClick = " location.href='manageSaleCancel.jsp'">취소관리</td>
							</tr>
						</table>
					</nav>

					
					<div class="manageSaleContents" align="center">
						<br>
						<p>반품 조회 날짜로 검색 api 찾아서 하기</p>
						<button style="width: 150px;">검색</button>
					</div>



					
					<div class="manageSaleTable">
						<table class="listTable">
							<tr>
								<th style="width:30px;"><strong>NO.</strong></th>
								<th><strong>상품주문번호</strong></th>
								<th><strong>주문일시</strong></th>
								<th><strong>주문상태</strong></th>
								<th><strong>상품명</strong></th>
								<th><strong>수량</strong></th>
								<th><strong>구매자명</strong></th>
								<th><strong>구매자ID</strong></th>
							</tr>
							<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
							<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
							</tr>
						</table>
					</div>
					
					<div class="manageButton">
						<table style="height:100%;">
							<tr align="center">
								<td width="150px;min-width:150px;">반품 처리</td>
								<td><button style="width:120px;">반품 전 처리</button></td>
								<td><button style="width:120px;">반품 중 처리</button></td>
								<td><button style="width:120px;">반품 완료 처리</button></td>
								<td><button style="width:120px;">반품 거절 처리</button></td>
							</tr>
						</table>
					</div>






				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>
			
</body>
</html>