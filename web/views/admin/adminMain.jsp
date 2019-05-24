<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
    <%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy년MM월dd일");
    String today = formatter.format(new java.util.Date());
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 <script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
    src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="//www.google.com/jsapi"></script>
<style>

	.container{
	width: 80%;`
	}
	
	
	
</style>
</head>
<body>
	<h2>운영자 님 환영합니다!</h2>
<div class="container">
	<!--! <div class="main-1">
	<h3>날짜</h3>
	<br>
	<h4>오늘의 할일</h4>
		<table class="table table-bordered" style="border:2px solid gray; height:150px; width:800px; margin:auto; text-align:center">
		 	<tr style="background:lightgray;">
		 		<td>주문</td>
		 		<td>매출</td>
		 		<td>입점신청</td>
		 		<td>1:1문의</td>
		 		<td>신규회원</td>
		 		<td>방문자</td>
		 	</tr>
		 	
		 	<tr>
		 		<td><a href="#">0</a>건</td>
		 		<td>00원</td>
		 		<td><a href="viewReqMemList.jsp">0</a>건</td>
		 		<td><a href="viewQuestList.jsp">0</a>건</td>
		 		<td>0명</td>
		 		<td>0명</td>
		 	</tr>
		</table>
	</div> -->
	<!--   <div class=main-2>
		<h3>이번주 내홈페이지 통계</h3>
		<table class="table table-bordered" style="border:2px solid gray; height: 150px; width: 800px; margin:auto; text-align:center">
			<tr style="background:lightgray;">
				<td>구분</td>
				<td>날짜1</td>
				<td>날짜2</td>
				<td>날짜4</td>
				<td>날짜5</td>
				<td>날짜6</td>
				<td>날짜7</td>
				<td>날짜8</td>
				<td>이번주합계</td>
			</tr>
			<tr>
				<td>매출(액)</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>주문(건수)</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>취소/환불/교환</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<br>
	<hr>
	-->
	<div class="main-3">
		<h3>오늘(<%= today %>)의 통계</h3>
		<div id="chart_div" style="width:900px; height:300px;"></div>
		<div id="chart_div2" style="width:900px; height:300px;"></div>
		
	</div>
</div>
		<script>
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(chart);
			
			function chart(){
				var option = {
						title:'월별 회원가입자',
						vAxis:{title:"명"},
						hAxis:{title:"년월"},
						legend: { position: "none" }
						};
				var startDate = '2019-01-01';
				var endDate = '2019-12-31';
				var date = 'month';
				var gender = 'all';
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
				var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div'));
				chart.draw(chartData, option);
			}
			
			google.charts.setOnLoadCallback(chart2);
			function chart2(){
				var startDate = '2019-01-01';
				var endDate = '2019-12-31';
				var option = {
						title:'월별 매출',
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
				var chart = new google.visualization.ColumnChart(document.querySelector('#chart_div2'));
				chart.draw(chartData, option);
			}

		</script>


</body>
</html>