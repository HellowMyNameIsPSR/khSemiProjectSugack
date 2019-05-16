<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출관련통계</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 <script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
    src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="//www.google.com/jsapi"></script>
</head>
<body>
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
				<div id="searchArea">
					<label>검색기준</label>
					<select id="date">
							<option value="day">일별</option>
							<option value="week">주별</option>
							<option value="month">월별</option>
					</select>
					<br>
					<input type="date" id="startDate" name="startDate" value="2019-01-01">
					<input type="date" id="endDate" name="endDate" value="2019-12-31">
					<input type="button" value="검색" id="searh">
					
				</div>
					<div id="chartArea" style="height:500px;"></div>
					<div id="tableArea"></div>
					
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="adminMenubar.jsp" %>
	</div>
	
	<script>
		google.charts.load('current', {'packages':['corechart', 'table']});
		google.charts.setOnLoadCallback(chart);		
 
		function chart(){
			$("#searh").click(function(){
				var startDate = $("#startDate").val();
				var endDate = $("#endDate").val();
				
				if($("#date").val() == 'month'){
				var option = {
						title:'매출통계',
						vAxis:{title:"원"},
						hAxis:{title:"년월"},
						legend: { position: "none" }
						};
				var chartData;
				$.ajax({
					url:"<%=request.getContextPath()%>/selectSalesForMonth.ad",
					data:{startDate:startDate, endDate:endDate},
					async : false,
					type:"get",
					success:function(data){
						console.log(data);
						chartData = new google.visualization.DataTable(data);	
						
					}
				});
				var chart = new google.visualization.ColumnChart(document.querySelector('#chartArea'));
				chart.draw(chartData, option);
				var table = new google.visualization.Table(document.querySelector("#tableArea"));
				table.draw(chartData, {showRowNumber: true, width: '100%', height: '100%'});
				
				}else if($("#date").val() == 'week'){
					var option = {
							title:'매출통계',
							vAxis:{title:"원"},
							hAxis:{title:"주간"},
							legend: { position: "none" }
							};
					var chartData;
					$.ajax({
						url:"<%=request.getContextPath()%>/selectSalesForWeek.ad",
						async : false,
						data:{startDate:startDate, endDate:endDate},
						type:"get",
						success:function(data){
							console.log(data);
							chartData = new google.visualization.DataTable(data);	
						}
					});
					var chart = new google.visualization.ColumnChart(document.querySelector('#chartArea'));
					chart.draw(chartData, option);
					var table = new google.visualization.Table(document.querySelector("#tableArea"));
					table.draw(chartData, {showRowNumber: true, width: '100%', height: '100%'});
				}else {
					var option = {
							title:'매출통계',
							vAxis:{title:"원"},
							hAxis:{title:"일"},
							legend: { position: "none" }
							};
					var chartData;
					$.ajax({
						url:"<%=request.getContextPath()%>/selectSalesForDay.ad",
						async : false,
						data:{startDate:startDate, endDate:endDate},
						type:"get",
						success:function(data){
							console.log(data);
							chartData = new google.visualization.DataTable(data);	
						}
					});
					var chart = new google.visualization.ColumnChart(document.querySelector('#chartArea'));
					chart.draw(chartData, option);
					var table = new google.visualization.Table(document.querySelector("#tableArea"));
					table.draw(chartData, {showRowNumber: true, width: '100%', height: '100%'});
				}
			})
			
		}
	</script>
</body>
</html>





























