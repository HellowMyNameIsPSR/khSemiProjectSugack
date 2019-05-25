<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,
				 com.kh.semi.funding.model.vo.*,
				 com.kh.semi.member.model.vo.*" %>
<%
	Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	ArrayList<HashMap<String, Object>> fundInfoList = 
				(ArrayList<HashMap<String, Object>>) request.getAttribute("fundInfoList");
	ArrayList<WorkPic> fileList = (ArrayList<WorkPic>) request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수작 - 2차펀딩작품등록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<%@ include file="stylesheet/eroll.html" %>
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
						<h2>판매 작품 2차 등록</h2>
					</header>
					<!-- Contents area -->
					<form id="salesInsert" action="<%= request.getContextPath() %>/insertEnroll2.fund" method="post">
					<!-- 기본정보 -->
						<div class="listBox">
							<div class="listTitle">
								<h2>등록한 펀딩 정보 확인</h2>
							</div>
							<div class="listContents">
							<div class="row" style="margin-bottom:0px;">
								<input type="text" value="<%= fundInfoList.get(0).get("workId") %>" id="workId" name="workId"
									style="display:none;">
								<div class="col-sm-4">
									<img src="<%= request.getContextPath() %>/uploadFundingGoodsImg/<%= fileList.get(0).getChangeName() %>"
													 style="height:80%; width:100%;" id="fundImg" name="fundImg">
								</div>
								<div class="col-sm-8">
									<div class="row">
										<table>
											<tr>
												<td colspan="5">
													<label class="form-control"><%= fundInfoList.get(0).get("workName") %></label>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<label class="pull-left">목표 금액(원)</label>
													<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("minVoo") %>" readonly>
												</td>
												<td colspan="2">
													<label class="pull-left">최대 목표 금액(원)</label>
													<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("maxVoo") %>" readonly>
												</td>
											</tr>
											<tr>
												<td>
													<label class="pull-left">펀딩 일수</label>
													<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("funDate") %>" readonly>
												</td>
												<td colspan="2">
													<label class="pull-left">시작일</label>
													<input type="date" class="form-control" id="fcStart" name="fcStart"
														   onchange="inputFcFinish();">
												</td>
												<td colspan="2">
													<label class="pull-left">종료일</label>
													<input type="text" class="form-control" id="fcFinish" name="fcFinish" 
														   placeholder="연도-월-일" readonly>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<label class="pull-left">배송시작일</label>
													<input type="date" class="form-control" id="deliDate" name="deliDate">
												</td>
												<td colspan="2">
													<label class="pull-left">배송비</label>
													<input type="text" class="form-control" id="deliPrice" name="deliPrice" 
														   value="<%= fundInfoList.get(0).get("deliPrice") %>" readonly>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				<!-- 기본정보 -->
				
				
				<!-- 협업여부 -->		
				<!-- <div class="listBox">
						<div class="listTitle">
							<h2>제작자 사전모집</h2>
						</div>
						<div class="listContents">
							<p class="subtext"> 
								※ 프로젝트 펀딩 공개 전 프로젝트에 함께 참여할 작가들을 모집할 수 있습니다. <br>
								신청 내역은 따로 볼 수 있으면 지원한 작가에 대해 수락, 거절이 가능합니다. <br>
								지원 시 필요한 자격 조건 또는 주의 사항에 대해 상세히 적어주세요.
							</p>
							<div class="listContents">
								<textarea id="projectComment" name="projectComment" placeholder="Comment" rows="10" cols="50"></textarea><br>
							</div>
						</div>
					</div> -->
				<!-- 협업여부 -->	
				
				<div align="center">
					<button class="all-btn"style="width: 150px;" type="submit" id="enrollFundingGoods2">추가정보 등록</button>
				</div>
				</form>
			</section>
		</div>
	</div>
	<%@ include file="authorMenuBar.jsp"%>
</div>
<script>
	$(function(){
		$("#accountCheck").hide();
		$("#enrollFundingGoods2").click(function(){
			var arr = $("#fcStart").val().split("-");
			var startDate = new Date(arr[0], arr[1] - 1, arr[2]);
			var now = new Date();
			var yyyy = now.getFullYear();
			var dd = now.getDate();
			var mm = now.getMonth();
			var today = new Date(yyyy, mm, dd);
			var deliDate = $("#deliDate").val();
			var fcStart =  $("#fcStart").val();
			var fcFinish = $("#fcFinish").val();
			console.log(today); console.log(startDate);
			if(startDate < today){
				alert("현재 보다 이전 날짜를 시작일로 지정할 수 없습니다.");
				return false;
			}
			if(fcStart == null || fcStart == "" || fcStart == "&nbsp;"){
				alert("펀딩 시작일을 지정해 주세요.");
				return false;
			}
			if(deliDate == null || deliDate == "" || deliDate == "&nbsp;") {
				alert("발송 예정일을 지정해 주세요.");
				return false;
			}
		});
	});

	function inputFcFinish() { //펀딩 종료일 지정
		console.log("시작일" + $("#fcStart").val());
		var term = parseInt(<%= fundInfoList.get(0).get("funDate") %> + "");
		console.log(term);
		
		var arr = $("#fcStart").val().split("-");
		var dt = new Date(arr[0], arr[1], arr[2]);
		var dt_v = new Date(arr[0], arr[1], arr[2]);
		
		dt_v.setDate(dt.getDate() + term);
		var fcFinish = dt_v.getFullYear() + "-" + dt_v.getMonth() + "-" + dt_v.getDate();
		$("#fcFinish").val(fcFinish);
	}
</script>
</body>
</html>