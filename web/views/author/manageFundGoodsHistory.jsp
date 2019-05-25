<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.*, com.kh.semi.author.model.vo.*"%>
<%
	Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	//PageInfo pi = null;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수작 - 펀딩작품내역</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<%@ include file="stylesheet/eroll.html" %>
	<%@ include file="../assets/css/author.html" %>
	<style>
		.listTable {
			margin:0px 0px 0px 0px;
			border:2px solid darkgray;
			box-shadow:2px 2px lightgray;
			min-width:750px;
		}
		.listTable tr>td{
			border:1px solid darkgray;
			font-size:13px;
			text-align:center;
			background: radial-gradient(white, #F6FFFF) fixed;
			height:20px;
		}
		.listTable tr>th{
			border:1px solid darkgray;
			font-size:13px;
			text-align:center;
			background:lightgray;
			padding-top:7px;
			padding-botton:7px;
			height:20px;
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
								<td class="menuA" id="status6">상태 : 거부</td>
							</tr>
						</table>
					</div> 
					
					<hr>
					
					<div class="row">          
						  <table class="table table-bordered listTable" id="selectFundGoodsTable">
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
					<div class="row" align="center">
						<div class="col-sm-12">
							<ul class="pagination" id="btnArea">
							 <!--  <li><a href="#">1</a></li>
							  <li><a href="#">2</a></li>
							  <li><a href="#">3</a></li>
							  <li><a href="#">4</a></li>
							  <li><a href="#">5</a></li> -->
							</ul>
						</div>
					</div>
				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp"%>
	</div>
	<script>
		 var workId = null;
		 var workNAme = null;
		 var wrDate = null;
		 var fcStart = null;
		 var fcFinish = null;
		 var funStatus = null;
		 var status = "";
		 var $ul = $("#btnArea");
		 var $tableBody = $("#selectFundGoodsTable tbody");
		  $(function(){
			console.log(<%= loginUser.getMemberId() %>);
			
			sortTable(1);
			
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
			$("#status6").click(function(){
				sortTable(6);
			});
			
		}); 
		  
		 function listPrint(num){
			console.log("num : " + num);
			$tableBody.children().remove();
			 for(var key = (num - 1) * 10; key < num * 10; key++){
				if(workId[key] != null && workId[key] != "&nbsp;" && workId[key] != ""){
					var $tr = $("<tr class='selectTr'>");
					var $workIdTd = $("<td class='hideTd'>").text(workId[key]);
					var $nameTd = $("<td>").text(workNAme[key]);
					var $wrDateTd = $("<td >").text(wrDate[key]);
					var $fcStartTd = $("<td>").text(fcStart[key]);
					var $fcFinishTd = $("<td>").text(fcFinish[key]);
					var $funStatus = $("<td>").text(funStatus[key]);
					
					
					$tr.append($workIdTd);
					$tr.append($nameTd);
					$tr.append($wrDateTd);
					$tr.append($fcStartTd);
					$tr.append($fcFinishTd);
					$tr.append($funStatus);
					$tableBody.append($tr);
				}			
				
			} 
			$(".hideTd").hide();
			$(".selectTr").click(function(){
				console.log($(this).children(".hideTd").text());
				var workId = $(this).children(".hideTd").text();
				location.href = "<%= request.getContextPath() %>/selectManyInfo.fund?workId=" + workId 
				+ "&&status=" + status;
			}); 
		} //end func
		
		
		//정렬방식을 선택 했을 때
		function sortTable(num) {		
			workId = new Array();
			workNAme = new Array();
			wrDate = new Array();
			fcStart = new Array();
			fcFinish = new Array();
			funStatus = new Array();
			$ul.children().remove();
			$tableBody.children().remove();
			switch(num){
				case 1: status = "대기"; break;
				case 2: status = "진행중"; break;
				case 3: status = "종료"; break;
				case 4: status = "승인"; break;
				case 5: status = "출시예정"; break;
				case 6: status = "거부"; break;
			}
			$.ajax({
				url : "<%= request.getContextPath() %>/selectSortFund.fund",
				type : "post",
				data : {status : status, memberId : <%= loginUser.getMemberId() %>},
				beforSend : function(){ //실행되기 전
					workId = new Array();
					workNAme = new Array();
					wrDate = new Array();
					fcStart = new Array();
					fcFinish = new Array();
					funStatus = new Array();
					$ul.children().remove();
					$tableBody.children().remove();
				},
				success : function(data) {
					if(data != null){
						var btn = 0; //버튼의 갯수
						var size = data.length;
						btn = size / 10;
						console.log(btn);
						if(btn > 0 && btn < 1){
							btn = 1;
						}
						$ul = $("#btnArea");
						for(var  i = 1; i <= btn; i++){
							$li = $("<li>");
							$a = $("<button onclick='listPrint("+ i + ");'>").text(i);
							$li.append($a);
							$ul.append($li);
						}
						
						var ca = /\+/g;					
						
						for(var key in data){
							var fund = data[key];
							workId[key] = fund.workId;
							workNAme[key] = decodeURIComponent(fund.workName.replace(ca," "));
							wrDate[key] = decodeURIComponent(fund.wrDate.replace(ca," "));
							fcStart[key] = decodeURIComponent(fund.fcStart.replace(ca," "));
							fcFinish[key] = decodeURIComponent(fund.fcFinish.replace(ca," "));
							funStatus[key] = decodeURIComponent(fund.funStatus.replace(ca," "));
						} //end for	
					} //end id
					listPrint(1);
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