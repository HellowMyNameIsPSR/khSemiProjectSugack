<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 작가홈</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 <script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
    src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="//www.google.com/jsapi"></script>
<style>
<style>
	.manageSaleTitle{
		margin: 20px 0px 20px 0px;
		height:70px;
		padding-top:15px;
		padding-left:20px;
		min-width:650px;
	}
	
	.topSmmary{
		display:inline-block;
		width:22%;
		height:150px;
		border:2px solid lightgray;
		box-shadow:2px 2px lightgray;
		background:rightgray;
		text-align:center;
		margin: 0 10px 10px 10px;
	}
	
	.summaryTable{
		height:100%;
	}
	.summaryTable tr>td{
		height:20px;
		font-size:12px;
		border:1px solid lightgray;
	}
	
	
	.tableBox{
		display:inline-block;
		min-width:900px;
	}
	.topSmmary2{
		display:inline-block;
		width:400px;
		min-width:400px;
		height:150px;
		border:2px solid lightgray;
		box-shadow:2px 2px lightgray;
		background:rightgray;
		text-align:center;
		margin: 0 10px 10px 10px;
	}
	
	.summaryTable2{
		height:100%;
	}
	.summaryTable2 tr{
		min-width:400px;
	}
	.summaryTable2 tr>td{
		height:20px;
		font-size:12px;
		border:1px solid lightgray;
	}
	
	
	.middleSummary{
		height:300px;
		width:100%;
		min-width:900px;
		margin-bottom:20px;
	}
	
	.summaryDiv{
		display:inline-block;
		border:2px solid lightgray;
		box-shadow:2px 2px lightgray;
		height:100%;
		margin:0 10px 0 10px;
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
						<h2>판매자 HOME</h2>
					</header>
					<!-- Contents area -->
					
					<div class="hidden-sm hidden-xs">
					
						<div class="topSmmary" align="center">
							<table class="summaryTable">
								<tr style="background: white;">
									<td rowspan="3" style="cursor:pointer" onClick = " location.href='managePost.jsp'">주문</td>
									<td>누적주문</td>
									<td>0건</td>
								</tr>
								<tr style="background: white;">
									<td>신규주문</td>
									<td>0건</td>
								</tr>
								<tr style="background: white;">
									<td>주문취소</td>
									<td>0건</td>
								</tr>
							</table>
						</div>
	
						<div class="topSmmary" align="center">
							<table class="summaryTable">
								<tr style="background: white;">
									<td rowspan="3">배송</td>
									<td>배송준비</td>
									<td>0건</td>
								</tr>
								<tr style="background: white;">
									<td>배송중</td>
									<td>0건</td>
								</tr>
								<tr style="background: white;">
									<td>배송완료</td>
									<td>0건</td>
								</tr>
							</table>
						</div>
	
						<div class="topSmmary" align="center">
							<table class="summaryTable">
								<tr style="background: white;">
									<td rowspan="3" style="cursor:pointer" onClick = " location.href='managePost.jsp'">취소</td>
									<td>취소요청</td>
									<td>0건</td>
								</tr>
								<tr style="background: white;">
									<td>반품요청</td>
									<td>0건</td>
								</tr>
								<tr style="background: white;">
									<td>교환요청</td>
									<td>0건</td>
								</tr>
							</table>
						</div>
	
						<div class="topSmmary" align="center">
							<table class="summaryTable">
								<tr style="background: white;">
									<td rowspan="3" style="cursor:pointer" onClick = " location.href='saleStatistics.jsp'">정산</td>
									<td>금일정산</td>
									<td>0건</td>
								</tr>
								<tr style="background: white;">
									<td>정산예정</td>
									<td>0건</td>
								</tr>
								<tr style="background: white;">
									<td>누적정산</td>
									<td>0건</td>
								</tr>
							</table>
						</div>
	
					</div>
					
					
					
					
					<div class="visible-sm visible-xs">
						<div class="tableBox">
							<div class="topSmmary2" align="center">
								<table class="summaryTable2">
									<tr style="background: white;">
										<td rowspan="3" style="cursor:pointer" onClick = " location.href='managePost.jsp'">주문</td>
										<td>누적주문</td>
										<td>0건</td>
									</tr>
									<tr style="background: white;">
										<td>신규주문</td>
										<td>0건</td>
									</tr>
									<tr style="background: white;">
										<td>주문취소</td>
										<td>0건</td>
									</tr>
								</table>
							</div>
		
							<div class="topSmmary2" align="center">
								<table class="summaryTable2">
									<tr style="background: white;">
										<td rowspan="3">배송</td>
										<td>배송준비</td>
										<td>0건</td>
									</tr>
									<tr style="background: white;">
										<td>배송중</td>
										<td>0건</td>
									</tr>
									<tr style="background: white;">
										<td>배송완료</td>
										<td>0건</td>
									</tr>
								</table>
							</div>
						</div>
						
						
						
						<div class="tableBox">
							<div class="topSmmary2" align="center">
								<table class="summaryTable2">
									<tr style="background: white;">
										<td rowspan="3" style="cursor:pointer" onClick = " location.href='managePost.jsp'">취소</td>
										<td>취소요청</td>
										<td>0건</td>
									</tr>
									<tr style="background: white;">
										<td>반품요청</td>
										<td>0건</td>
									</tr>
									<tr style="background: white;">
										<td>교환요청</td>
										<td>0건</td>
									</tr>
								</table>
							</div>
		
							<div class="topSmmary2" align="center">
								<table class="summaryTable2">
									<tr style="background: white;">
										<td rowspan="3"  style="cursor:pointer" onClick = " location.href='saleStatistics.jsp'">정산</td>
										<td>금일정산</td>
										<td>0건</td>
									</tr>
									<tr style="background: white;">
										<td>정산예정</td>
										<td>0건</td>
									</tr>
									<tr style="background: white;">
										<td>누적정산</td>
										<td>0건</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					
					
					
					<div class="middleSummary">
						<div class="summaryDiv" id="chart_div"  style="cursor:pointer; min-width:370px;" onClick = " location.href='saleStatistics.jsp'">
							<h4>판매 매출 통계</h4>
						</div>
						<div class="summaryDiv" style="cursor:pointer; min-width:225px;" onClick = " location.href='saleStatistics.jsp'">
							판매 현황
						</div>
						<div class="summaryDiv" style=" min-width:225px;">
							공지사항
						</div>
					</div>
					
					<div class="middleSummary">
						<div class="summaryDiv" style="cursor:pointer; min-width:370px;"  onClick = " location.href='fundingStatistics.jsp'">
							펀딩 매출 통계
						</div>
						<div class="summaryDiv" style="cursor:pointer; min-width:225px;" onClick = " location.href='fundingStatistics.jsp'">
							펀딩 현황
						</div>
						<div class="summaryDiv" style="cursor:pointer; min-width:225px;" onClick = " location.href='managePost.jsp'">
							최근 문의/리뷰
						</div>
					</div>
					
					
					
				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>
	<script>
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(chart);
			function chart(){
				var option = {
						title:'월별 매출',
						vAxis:{title:"원"},
						hAxis:{title:"년월"},
						legend: { position: "none" }
						};
				var chartData;
				$.ajax({
					url:"<%=request.getContextPath()%>/selectSalesForMonth.at",
					async : false,
					type:"get",
					success:function(data){
						console.log(data);
						chartData = new google.visualization.DataTable(data);	
					}
				});
				var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div'));
				chart.draw(chartData, option);
			}

		</script>		
</body>
</html>