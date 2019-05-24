<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,
				 com.kh.semi.funding.model.vo.*,
				 com.kh.semi.member.model.vo.*" %>
<%-- <%
	Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	ArrayList<HashMap<String, Object>> fundInfoList = 
				(ArrayList<HashMap<String, Object>>) request.getAttribute("fundInfoList");
	ArrayList<WorkPic> fileList = (ArrayList<WorkPic>) request.getAttribute("fileList");
%> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수작 - 2차펀딩작품등록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>	
	<%@ include file="stylesheet/eroll.html" %>
	<style>
		.btn-default{
			margin-bottom:0px;
			border:0px;
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
						<h2>판매 작품 2차 등록</h2>
					</header>
					<!-- Contents area -->
					<form id="salesInsert" action="<%= request.getContextPath() %>/insertEnroll2.fund" method="post">
					<!-- 기본정보 -->
						<div class="listBox">
							<div class="listTitle">
								<h2>펀딩 정보 확인</h2>
							</div>
							<div class="listContents">
							
							<div class="row" style="margin-bottom:0px;">
							
								<div class="col-sm-12">
									<div class="row">
										<table>
											<tr>
												<td colspan="3"> <!-- 작품명 -->
													<label class="form-control"><%-- <%= fundInfoList.get(0).get("workName") %> --%></label>
												</td>
												<td colspan="2"> <!-- 작품 카테고리 -->
													<label class="form-control"><%-- <%= fundInfoList.get(0).get("workName") %> --%></label>
												</td>
											</tr>
											<tr>
												<td colspan="2"> <!-- 작품 등록일 -->
													<label class="form-control"><%-- <%= fundInfoList.get(0).get("workName") %> --%></label>
												</td>
												<td colspan="2"> <!-- 작품 가격 -->
													<label class="form-control"><%-- <%= fundInfoList.get(0).get("workName") %> --%></label>
												</td>
											</tr>
											<tr>
												<td colspan="5">
													<label class="pull-left">내용</label>
													<textarea id="contents" name="contents" readonly></textarea>
												</td>
											</tr>
											<tr>
												<td>
													<label class="pull-left">펀딩 일수</label>
													<input type="text" class="form-control" value="<%-- <%= fundInfoList.get(0).get("funDate") %> --%>" readonly>
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
														   value="<%-- <%= fundInfoList.get(0).get("deliPrice") %> --%>" readonly>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				<!-- 기본정보 -->
				<!-- 펀딩 현황 -->
				<div class="row" style="border:1px solid lightgray; margin:20px 0px 20px 0px; padding:20px 0px 20px 0px;">
					<div class="row" style="width:100%;">
						<h2>펀딩 진행도</h2>
					</div>
					<div class="row" style="width:100%;">
						<div class="progress" style="width:100%; margin-left:10px;">
					    	<div  class="progress-bar progress-bar-info" role="progressbar" 
					    		  aria-valuenow="100000" aria-valuemin="0" aria-valuemax="250000" style="width:40%">
					     	 	40% Complete (info)
				     		 </div>
				   		</div>
				  	</div>
				  	<div class="listContents" style="width:100%;">
				  		<div class="row">
							<table>
								<tr>
									<td>
										<label class="pull-left">현재 모금액</label>
										<input type="text" class="form-control" value="<%-- <%= fundInfoList.get(0).get("minVoo") %> --%>" readonly>
									</td>
									<td>
										<label class="pull-left">목표 금액</label>
										<input type="text" class="form-control" value="<%-- <%= fundInfoList.get(0).get("minVoo") %> --%>" readonly>
									</td>
									<td>
										<label class="pull-left">최대 목표 금액</label>
										<input type="text" class="form-control" value="<%-- <%= fundInfoList.get(0).get("maxVoo") %> --%>" readonly>
									</td>
								</tr>
							</table>
						</div>
				  	</div>					
				</div>
			<!-- 펀딩 현황 -->
			<!-- 작품 이미지 -->
			<div class="listBox">
				<div class="dropdown">
				    <button style="width:100%;"class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
				    	작품 이미지
				    <span class="caret"></span></button>
				    <div class="dropdown-menu" style="background:red; width:100%; height:100px;">
				      <!--작품 이미지 영역 -->
				    </div>
				  </div>
			</div>
			<!-- 작품 이미지 -->
			<!-- 작품 상세 이미지 -->
			<div class="listBox">
				<div class="dropdown">
				    <button style="width:100%;"class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
				    	작품 상세 이미지
				    <span class="caret"></span></button>
				    <div class="dropdown-menu" style="background:red; width:100%; height:100px;">
				      <!--작품 이미지 영역 -->
				    </div>
				  </div>
			</div>
			<!-- 작품 상세 이미지 -->
				
				<div align="center">
					<button class="all-btn"style="width: 150px;" type="submit" id="enrollFundingGoods2">목록 으로</button>
					<button class="all-btn"style="width: 150px;" type="button" id="enrollFundingGoods2">삭제 신청 하기</button>
				</div>
				</form>
			</section>
		</div>
	</div>
	<%@ include file="authorMenuBar.jsp"%>
</div>
<script>
	var accCheck = false;
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
			if(accCheck == false){
				alert("계좌 인증을 완료해 주세요.");
				return false;
			}
		});
	});

	function inputFcFinish() { //펀딩 종료일 지정
		console.log("시작일" + $("#fcStart").val());
		var term = parseInt(<%-- <%= fundInfoList.get(0).get("funDate") %> --%> + "");
		console.log(term);
		
		var arr = $("#fcStart").val().split("-");
		var dt = new Date(arr[0], arr[1], arr[2]);
		var dt_v = new Date(arr[0], arr[1], arr[2]);
		
		dt_v.setDate(dt.getDate() + term);
		var fcFinish = dt_v.getFullYear() + "-" + dt_v.getMonth() + "-" + dt_v.getDate();
		$("#fcFinish").val(fcFinish);
	}
	
	function EnrollAddInfo() { //추가 정보 등록
		
	} //end func
</script>
</body>
</html>