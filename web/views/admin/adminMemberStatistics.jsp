<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관련 통계</title>
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
				<div id="searchArea" style="background:lightgray; border:1px solid black; padding:10px">
					<label>검색기준</label>
					<select id="date" style="width:90%;">
							<option value="day">일별</option>
							<option value="week">주별</option>
							<option value="month">월별</option>
					</select>
					<br>
					<input type="date" id="startDate" name="startDate" value="2019-01-01">
					<input type="date" id="endDate" name="endDate" value="2019-12-31">
					 <br><br>
					
					<input type="radio" value="M" name="gender" id="male"> <label for="male">남</label>
					<input type="radio" value="F" name="gender" id="female"> <label for="female">여</label>
					<input type="radio" value="all" name="gender" id="all"> <label for="all">전체보기</label>
					<input type="button" value="검색" id="search">
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
		google.charts.load('current', {'packages':['corechart', 'table', 'bar']});
		google.charts.setOnLoadCallback(chart);		
 
		function chart(){
			$("#search").click(function(){
				var startDate = $("#startDate").val();
				var endDate = $("#endDate").val();
				var gender = $('input[name="gender"]:checked').val()
				var date = $("#date").val();
				console.log(gender);
				if(date == 'month'){
				/* var option = {
						title:'월별 회원가입자',
						vAxis:{title:"명"},
						hAxis:{title:"년월"},
						legend: { position: "none" },
						subtitle:'male on the left, female on the right'
						}; */
						var options = {
								vAxis:{title:"명"},
								hAxis:{title:"년월"},
						          chart: {
						            title: '월별 회원가입자',
						            subtitle: 'male, female',
						          }
						        };
				var chartData;
				$.ajax({
					url:"<%=request.getContextPath()%>/selectMemberForMonth.ad",
					data:{startDate:startDate, endDate:endDate, gender:gender, date:date},
					async : false,
					type:"get",
					success:function(data){
						console.log(data);
						chartData = new google.visualization.DataTable(data);	
						
					}
				});
				var chart = new google.visualization.ColumnChart(document.querySelector('#chartArea'));
				chart.draw(chartData, options);
				var table = new google.visualization.Table(document.querySelector("#tableArea"));
				table.draw(chartData, {showRowNumber: true, width: '100%', height: '100%'});
				
				}else if(date == 'week'){
					var options = {
							vAxis:{title:"명"},
							hAxis:{title:"년월"},
					          chart: {
					            title: '주간 회원가입자',
					            subtitle: 'male, female',
					          }
					        };
					var chartData;
					$.ajax({
						url:"<%=request.getContextPath()%>/selectMemberForWeek.ad",
						async : false,
						data:{startDate:startDate, endDate:endDate, date:date, gender:gender},
						type:"get",
						success:function(data){
							console.log(data);
							chartData = new google.visualization.DataTable(data);	
						}
					});
					var chart = new google.visualization.ColumnChart(document.querySelector('#chartArea'));
					chart.draw(chartData, options);
					var table = new google.visualization.Table(document.querySelector("#tableArea"));
					table.draw(chartData, {showRowNumber: true, width: '100%', height: '100%'});
				}else {
					var options = {
							vAxis:{title:"명"},
							hAxis:{title:"년월"},
					          chart: {
					            title: '일별 회원가입자',
					            subtitle: 'male, female',
					          }
					        };
					var chartData;
					$.ajax({
						url:"<%=request.getContextPath()%>/selectMemberForDay.ad",
						async : false,
						data:{startDate:startDate, endDate:endDate, gender:gender, date:date},
						type:"get",
						success:function(data){
							console.log(data);
							chartData = new google.visualization.DataTable(data);	
						}
					});
					var chart = new google.visualization.ColumnChart(document.querySelector('#chartArea'));
					chart.draw(chartData, options);
					var table = new google.visualization.Table(document.querySelector("#tableArea"));
					table.draw(chartData, {showRowNumber: true, width: '100%', height: '100%'});
				}
			})
			
		}
	</script>
</body>
</html>


























