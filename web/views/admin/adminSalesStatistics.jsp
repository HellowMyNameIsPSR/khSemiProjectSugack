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
					<select id="date">
							<option value="day">일별</option>
							<option value="week">주별</option>
							<option value="month">월별</option>
					</select>
					
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
		<%-- google.charts.setOnLoadCallback(table);
		
		function table(){
			$("#date").change(function(){
				if($(this).val() == 'month'){
				var chartData;
				$.ajax({
					url:"<%=request.getContextPath()%>/selectSalesForMonth.ad",
					async : false,
					type:"get",
					success:function(data){
						console.log(data);
						chartData = new google.visualization.DataTable(data);	
						
					}
				});
				var table = new google.visualization.Table(document.getElementById('#tableArea'));
		        table.draw(chartData, {showRowNumber: true, width: '100%', height: '100%'});
				}
			});
		} --%>
	
		function chart(){
			$("#date").change(function(){
				if($(this).val() == 'month'){
				var option = {
						title:'매출통계',
						vAxis:{title:"원"},
						hAxis:{title:"년월"},
						legend: { position: "none" }
						};
				var chartData;
				$.ajax({
					url:"<%=request.getContextPath()%>/selectSalesForMonth.ad",
					async : false,
					type:"get",
					success:function(data){
						console.log(data);
						chartData = new google.visualization.DataTable(data);	
						
					}
				});
				var chart = new google.visualization.ColumnChart(document.querySelector('#chartArea'));
				chart.draw(chartData, option);
				}else if($(this).val() == 'week'){
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
						type:"get",
						success:function(data){
							console.log(data);
							chartData = new google.visualization.DataTable(data);	
						}
					});
					var chart = new google.visualization.ColumnChart(document.querySelector('#chartArea'));
					chart.draw(chartData, option);
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
						type:"get",
						success:function(data){
							console.log(data);
							chartData = new google.visualization.DataTable(data);	
						}
					});
					var chart = new google.visualization.ColumnChart(document.querySelector('#chartArea'));
					chart.draw(chartData, option);
				}
			})
			
		}
	</script>
</body>
</html>





























