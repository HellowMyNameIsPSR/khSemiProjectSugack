<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
	.homeTalbe{
		width:900px;
	}
	.homeTalbe tr{
		border:none;
	}
	.homeTalbe tr>td{
		background:white;
	}
	.topSmmary{
		height:150px;
		border:2px solid lightgray;
		box-shadow:2px 2px lightgray;
		width:400px;
		cursor:pointer;
		margin-bottom:40px;
	}
	.summaryTable{
		width:100%;
		height:100%;
		margin:0px 0px 0px 0px;
		
	}
	.summaryTable tr>td{
		height:20px;
		font-size:15px;
		border:1px solid lightgray;
		background: radial-gradient(white, #F6FFFF) fixed;
	}
	.summaryDiv{
		border:2px solid lightgray;
		box-shadow:2px 2px lightgray;
		background: radial-gradient(white, #F6FFFF) fixed;
		cursor:pointer;
		width:400px;
		height:313px;
		margin-bottom:30px;
	}
	.postList tr>td{
		background: radial-gradient(white, #F6FFFF) fixed;
		font-size:14px;
		border:1px solid lightgray;
	}
	.menuTitle{
		background:linear-gradient(to bottom, #F7FBFF, #CFE8FE) !important;
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
					<a href="/sg/views/author/authorHome.jsp" class="logo"> <span
						class="glyphicon glyphicon-home"></span> &nbsp; <strong
						style="font-size: 20px;">HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main" style="margin-bottom:50px;">
						<h2>판매자 HOME</h2>
					</header>
					<!-- Contents area -->
					<table class="homeTalbe">
						<tr>
							<td>
								<div class="topSmmary" align="center" onclick="orderList()">
									<table class="summaryTable">
										<tr style="background: white;">
											<td rowspan="3" style="font-weight:bold;vertical-align:middle;font-size:15px;width:180px;text-align:center;">주문배송조회</td>
											<td>배송전</td>
											<td id="before" style="font-weight:bold;color:skyblue;"></td>
										</tr>
										<tr style="background: white;">
											<td>배송중</td>
											<td id="ing" style="font-weight:bold;color:skyblue;"></td>
										</tr>
										<tr style="background: white;">
											<td>배송완료</td>
											<td id="after" style="font-weight:bold;color:skyblue;"></td>
										</tr>
									</table>
								</div>
							</td>
							<td>
								<div class="topSmmary" align="center" onclick="exchangeList()">
									<table class="summaryTable">
										<tr style="background: white;">
											<td rowspan="3" style="font-weight:bold;vertical-align:middle;font-size:15px;width:180px;text-align:center;">환불조회</td>
											<td>환불 요청</td>
											<td id="before2" style="font-weight:bold;color:skyblue;"></td>
										</tr>
										<tr style="background: white;">
											<td>환불 승인 요청</td>
											<td id="ing2" style="font-weight:bold;color:skyblue;"></td>
										</tr>
										<tr style="background: white;">
											<td>환불 완료</td>
											<td id="after2" style="font-weight:bold;color:skyblue;"></td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<h3>판매 매출 통계</h3>
								<div style="width:97%;" class="summaryDiv" id="chart_div" onClick = " location.href='saleStatistics.jsp'"></div>
							</td>
							
						</tr>
						<tr>
							<td>
								<h3>공지사항</h3>
								<div class="summaryDiv" onclick="ccNoticeBoard()">
									<table class="postList"  style="margin:0px 0px 0px 0px">
										<tr align="center">
											<td class="menuTitle"> NO.</td>
											<td class="menuTitle" colspan="2"><strong>공지사항</strong></td>
										</tr>
										<tbody id="tbody2">
										
										</tbody>
									</table>
								</div>
							</td>
							<td>
								<h3>최근 문의</h3>
								<div class="summaryDiv" onclick="qnaList()">
									<table class="postList"  style="margin:0px 0px 0px 0px">
										<tr align="center" style="">
											<td class="menuTitle" style="width:50px;"><strong>NO.</strong></td>
											<td class="menuTitle"><strong>상품명</strong></td>
											<td class="menuTitle" style="width:100px;"><strong>문의 제목</strong></td>
										</tr>
										<tbody id="tbody">
										
										</tbody>
									</table>
								</div>
							</td>
						</tr>
					</table>
					
				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>
	<script>
		function orderList() {
			location.href="<%=request.getContextPath()%>/selectOrderList.wo";
		}
		function exchangeList() {
			location.href="<%=request.getContextPath()%>/selectExchangeList.wo";
		}
		function ccNoticeBoard() {
			location.href="<%=request.getContextPath()%>/ccNoticeBoard.bo";
		}
		function qnaList() {
			location.href="<%=request.getContextPath()%>/selectQnaList.wo";
		}
		
		
		$(document).ready(function() {
			var num = 0;
			$.ajax({
				url:"<%=request.getContextPath()%>/selectQnaMainList.wo",
				type:"get",
				success:function(data){
					for(var key in data.list){
						num++;
						$("#tbody").append(
							"<tr>" +
								'<td style="text-align:center;">' + num + '</td>' + 
								'<td>' + data.list[key].workName + '</td>' + 
								'<td style="text-align:center;">>' + data.list[key].title + '</td>' +
							'</tr>'
						);
					}
				}
			});
			$.ajax({
				url:"<%=request.getContextPath()%>/selectOrderCount.wo",
				type:"get",
				success:function(data){
					$("#before").append(data[0] + '건');
					$("#ing").append(data[1] + '건');
					$("#after").append(data[2] + '건');
				}
			});
			$.ajax({
				url:"<%=request.getContextPath()%>/selectExchangerCount.wo",
				type:"get",
				success:function(data){
					$("#before2").append(data[0] + '건');
					$("#ing2").append(data[1] + '건');
					$("#after2").append(data[2] + '건');
				}
			});
			$.ajax({
				url:"<%=request.getContextPath()%>/selectNoticeMainList.wo",
				type:"get",
				success:function(data){
					for(var key in data){
						num++;
						if(key <6){
							$("#tbody2").append(
								"<tr>" +
									'<td style="text-align:center; width:50px;">' + num + '</td>' + 
									'<td>' + data[key].title + '</td>' +
								"</tr >"
							);
						}
					}
				}
			});
		});
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