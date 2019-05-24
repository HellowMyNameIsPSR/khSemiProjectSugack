<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.*"%>
<%
	Member loginUser = (Member) request.getSession().getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수작 - 펀딩작품내역</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<%@ include file="stylesheet/eroll.html" %>
	<%@ include file="../assets/css/author.html" %>
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
					<div class="menuDiv">
						<table class="postMenu">
							<tr>
								<td class="menuA" id="status1">상태 : 대기</td>
								<td class="menuA" id="status5">상태 : 출시예정</td>
								<td class="menuA" id="status2">상태 : 진행중</td>
								<td class="menuA" id="status3">상태 : 종료</td>
								<td class="menuA" id="status4">상태 : 승인</td>
							</tr>
						</table>
					</div> 
					
					<hr>
					
					<div class="row">          
						  <table class="table table-bordered" id="selectFundGoodsTable">
						  	<thead>
						      <tr>
						        <th>작품명</th>
						        <th>등록일</th>
						        <th>시작일</th>
						        <th>종료일</th>
						        <th>상태</th>
						      </tr>
						     </thead>
						     <tbody></tbody>
						  </table>
						</div>
				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp"%>
	</div>
	<script>
		  $(function(){
			console.log(<%= loginUser.getMemberId() %>)
			$.ajax({
				url : "<%= request.getContextPath() %>/selectSortFund.fund",
				type : "post",
				data : {status : "대기", memberId : <%= loginUser.getMemberId() %>},
				success : function(data) {
					console.log(data);
					$tableBody = $("#selectFundGoodsTable tbody");
					for(var key in data){
						var fund = data[key];
						var $tr = $("<tr class='selectTr'>");
						var $workIdTd = $("<td class='hideTd'>").text(fund.workId);
						var $nameTd = $("<td>").text(decodeURIComponent(fund.workName));
						var $wrDateTd = $("<td >").text(decodeURIComponent(fund.wrDate));
						var $fcStartTd = $("<td>").text(decodeURIComponent(fund.fcStart));
						var $fcFinishTd = $("<td>").text(decodeURIComponent(fund.fcFinish));
						var $funStatus = $("<td>").text(decodeURIComponent(fund.funStatus));
						
						$tr.append($workIdTd);
						$tr.append($nameTd);
						$tr.append($wrDateTd);
						$tr.append($fcStartTd);
						$tr.append($fcFinishTd);
						$tr.append($funStatus);
						$tableBody.append($tr);
					}
					$(".hideTd").hide();
					$(".selectTr").click(function(){
						console.log($(this).children(".hideTd").text());
					}); 
				},
				error : function(data) {
					console.log(data);
					console.log("통신 실패!");
				}
			});
			$("#status1").click(function(){
				sortTable(1);
			});
			$("#status2").click(function(){
				sortTable(2);
			});
			$("#status3").click(function(){
				sortTable(3);
			});
			$("#status4").click(function(){
				sortTable(4);
			});
			$("#status5").click(function(){
				sortTable(5);
			});
			
			
		}); 
		//정렬방식을 선택 했을 때
		function sortTable(num) {
			var status = "";
			switch(num){
				case 1: status = "대기"; break;
				case 2: status = "진행중"; break;
				case 3: status = "종료"; break;
				case 4: status = "승인"; break;
				case 5: status = "출시예정"; break;
			}
			$.ajax({
				url : "<%= request.getContextPath() %>/selectSortFund.fund",
				type : "post",
				data : {status : status, memberId : <%= loginUser.getMemberId() %>},
				success : function(data) {
					if(data != null){
						$tableBody = $("#selectFundGoodsTable tbody");
						var $tr;
						$tableBody.children().remove();
						for(var key in data){
							var fund = data[key];
							$tr = $("<tr class='selectTr'>");
							var $workIdTd = $("<td class='hideTd'>").text(fund.workId);
							var $nameTd = $("<td>").text(decodeURIComponent(fund.workName));
							var $wrDateTd = $("<td>").text(decodeURIComponent(fund.wrDate));
							var $fcStartTd = $("<td>").text(decodeURIComponent(fund.fcStart));
							var $fcFinishTd = $("<td>").text(decodeURIComponent(fund.fcFinish));
							var $funStatus = $("<td>").text(decodeURIComponent(fund.funStatus));
							
							$tr.append($workIdTd);
							$tr.append($nameTd);
							$tr.append($wrDateTd);
							$tr.append($fcStartTd);
							$tr.append($fcFinishTd);
							$tr.append($funStatus);
							$tableBody.append($tr);
							
						}
						$(".hideTd").hide();
						$(".selectTr").click(function(){
							console.log($(this).children(".hideTd").text());
							var workId = $(this).children(".hideTd").text();
							if(status == "승인"){
								//alert("2차 등록 화면으로 넘어감");		
								location.href = "<%= request.getContextPath() %>/selectFundCon.fund?workId=" + workId;
							} else{
								location.href = "<%= request.getContextPath() %>/views/author/fundingProductDetail.jsp";
							} //end if
						});
					}			
				},
				error : function(data) {
					console.log(data);
					console.log("통신 실패!");
				}
			});
		} //end func 
	</script>
</body>
</html>