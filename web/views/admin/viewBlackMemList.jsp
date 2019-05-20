<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 관리자홈</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="adminHome.jsp" class="logo"> Admin<strong>HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<h3>블랙리스트관리</h3>
						<form action="">
							<table class="table table-bordered">
								<tr>
									<td style="width: 180px;">경고분류</td>
									<td style="width: 700px;">
									<select name="warnLevel">
											<option value="1c">1차</option>
											<option value="2c">2차</option>
											<option value="3c">3차</option>											
									</select>
									<td colspan="2"></td>
								</tr>	
								<tr>
									<td>경고일자</td>
										<td>
											<input type="date" style="width: 400px;" name="warnStart">
										</td>
										<td style="width: 30px;"><label	style="font-size: 15px; text-align: center;">~</label></td>
										<td style="width: 200px;">
											<input type="date" style="width: 200px;" name="warnLast">
										</td>
								</tr>
								<tr>
									<td>경고종류</td>
									<td style="width: 150px;">
										<select name="warnType" style="width: 330px;">
											<option value="product">상품</option>
											<option value="funding">펀딩</option>
											<option value="seller">판매자</option>
											<option value="other">기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="width: 180px;">신고위치</td>
									<td style="width: 150px;">
									<select name="warnLocation " style="width: 150px;">
											<option value="">상품</option>
											<option value="">펀딩</option>
											<option value="">기타</option>
									</select>
									</td>
									<td style="width: 150px;">
									<select name="" id="" style="width: 150px;">
											<option value="">상품</option>
											<option value="">펀딩</option>
											<option value="">기타</option>
									</select>
									</td>
									<td style="width: 150px;">
									<select name="" id=""
										style="width: 150px;">
											<option value="">상품</option>
											<option value="">펀딩</option>
											<option value="">기타</option>
									</select>
									</td>
								</tr>
								<tr>
									<td>신고자</td>
									<td colspan="3">
										<input type="text" />
									</td>
								</tr>

							</table>
							<button id="searchBlackList" style="float:right;">조회</button>				

						</form>
						<h3>블랙리스트 조회 결과</h3>
						<table class="table table-bordered"
							style="border: 2px solid gray; text-align: center">
							<thead>
							<tr style="background: lightgray;">
								<td>번호</td>
								<td>경고분류</td>
								<td>신고일자</td>
								<td>신고종류</td>
								<td>신고위치</td>
								<td>신고내용</td>
								<td>신고자</td>
							</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
						<div class="row" style="padding-left: 400px">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#">Previous</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</div>
					</header>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="adminMenubar.jsp"%>
	</div>
	<script>
	//블랙리스트 값은 아직 정해지지 않아 대기
	$("#searchBlackList").click(function(){
		var warnLevel = $("input[name='warnLevel']:selected").val();
		var warnStart = $("input[name='warnStart']").val();
		var warnLast = $("input[name='warnLast']").val();
		var warnType = $("input[name='warnType']:selected").val();
		var warnLocation = $("input[name='warnLocation']:selected").val();
		
		
		$.ajax({
			url:"<%= request.getContextPath() %>/blackMemberCheck.ad",
			data:searchMember,
			type:"get",
			success:function(data){
				var $tr = $("<tr>");
				var $noTd = $("<td>").text(index + 1);
				//var $warnLevel = $("td").
				
			}
		})

	})
	</script>

</body>
</html>