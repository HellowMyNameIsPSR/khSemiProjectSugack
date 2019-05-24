<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,
				 com.kh.semi.funding.model.vo.*,
				 com.kh.semi.member.model.vo.*" %>
<%
	Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	ArrayList<HashMap<String, Object>> fundInfoList = 
				(ArrayList<HashMap<String, Object>>) request.getAttribute("fundInfoList");
	ArrayList<WorkPic> workPic = (ArrayList<WorkPic>) request.getAttribute("workPic");
	String status = (String) request.getAttribute("status");
%>
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
													<label>작품명</label>
													<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("workName") %>">
												</td>
												<td colspan="2"> <!-- 작품 카테고리 -->
													<label>카테고리</label>
													<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("category") %>">
												</td>
											</tr>
											<tr>
												<td colspan="2"> <!-- 작품 등록일 -->
													<label>작품 등록일</label>
													<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("enrollDate") %>">													
												</td>
												<td colspan="2"> <!-- 작품 가격 -->
													<label>작품 가격</label>
													<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("price") %>">
												</td>
											</tr>
											<tr>
												<td colspan="5">
													<label class="pull-left">내용</label>
													<textarea id="contents" name="contents" readonly><%= fundInfoList.get(0).get("workContent") %></textarea>
												</td>
											</tr>
											<tr>
												<td>
													<label class="pull-left">펀딩 일수</label>
													<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("fundTerm") %> 일" readonly>
												</td>
												<td colspan="2">
													<label class="pull-left">시작일</label>
													<input type="text" class="form-control" id="fcStart" name="fcStart"
														   value="<%= fundInfoList.get(0).get("fcStart") %>" readonly>
												</td>
												<td colspan="2">
													<label class="pull-left">종료일</label>
													<input type="text" class="form-control" id="fcFinish" name="fcFinish" 
														    value="<%= fundInfoList.get(0).get("fcFinish") %>" readonly>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<label class="pull-left">배송시작일</label>
													<input type="text" class="form-control" id="deliDate" name="deliDate"
															value="<%= fundInfoList.get(0).get("deliDate") %>" readonly>
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
			<% if(status.equals("진행중")) { %>
				<!-- 펀딩 현황 -->
				<div class="row" style="border:1px solid lightgray; margin:20px 0px 20px 0px; padding:20px 0px 20px 0px;">
					<div class="row" style="width:100%;">
						<h2>펀딩 진행도</h2>
					</div>
				  	<div class="row" style="width:100%;">
				   		<div class="progress" style="width:100%;">
						    <div id="fundProgress2" class="progress-bar progress-bar-danger progress-bar-striped  active" role="progressbar" 
						    	 aria-valuenow="<%= fundInfoList.get(0).get("fundPrice") %>" 
					    		 aria-valuemin="0" 
					    		 aria-valuemax="<%= fundInfoList.get(0).get("maxVoo") %>"></div>
					    </div>
				  	</div>
				  	
				  	<div class="listContents" style="width:100%;">
				  		<div class="row">
							<table>
								<tr>
									<td>
										<label class="pull-left">현재 모금액</label>
										<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("fundPrice") %> 원 " readonly>
									</td>
									<td>
										<label class="pull-left">제작 시작 금액</label>
										<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("minVoo") %> 원" readonly>
									</td>
									<td>
										<label class="pull-left">최대 목표 금액</label>
										<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("maxVoo") %> 원" readonly>
									</td>
								</tr>
							</table>
						</div>
				  	</div>					
				</div>
			<% } %>
			<!-- 펀딩 현황 -->
			<!-- 작품 이미지 -->
			<div class="listBox">
				<div class="listContents" style="width:100%; margin-bottom:0px;">
				    <button id="workImgBtn" style="width:100%;" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
				    	작품 이미지
				    <span class="caret"></span></button>
				    <div id="workImg" style="width:100%; padding:10px;">
				    	<table id="workImgArea">
				    		<% if(workPic != null) { 
					    		for(int i = 0; i < workPic.size(); i++) {
					    			if(!workPic.get(i).getPicType().equals("fundDetail")) {%>
						    			<tr>
						    				<td><img src="<%= request.getContextPath() %>/uploadFundingGoodsImg/<%= workPic.get(i).getChangeName() %>" 
						    						 style="width:100%; height:80%;"></td>
						    			</tr>
					    			<% } %>
					    		<% } %>				    		
					    	<% } %>
					    	<tr>
					    		<td><button id="closeImg" class="pull-right" type="button"
					    					style="background:white; color:lightgray; border:0px;">닫기</button></td>
					    	</tr>
				    	</table>
				    </div>
				 </div>
			</div>
			
			<!-- 작품 이미지 -->
			<!-- 작품 상세 이미지 -->
			<div class="listBox">
				<div class="listContents" style="width:100%;">
				    <button id="workDetailBtn" style="width:100%;" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
				    	작품 상세 이미지
				    <span class="caret"></span></button>
				    <div id="workDetailImg" style="width:100%;">
				    	<table id="workDetailArea">
				    		<% if(workPic != null) { 
				    			for(int i = 0; i < workPic.size(); i++) { 
				    				if(workPic.get(i).getPicType().equals("fundDetail")) {%>
				    					<tr>
						    				<td><img src="<%= request.getContextPath() %>/uploadFundingGoodsImg/<%= workPic.get(i).getChangeName() %>" 
						    						 style="width:100%; height:80%;"></td>
						    			</tr>
				    				<% } %>
				    			<% } %>
				    		<% } %>
				    		<tr>
					    		<td><button id="closeDetail"class="pull-right" type="button"
					    					style="background:white; color:lightgray; border:0px;">닫기</button></td>
					    	</tr>
				    	</table>
				    </div>
				 </div>
			</div>
			<!-- 작품 상세 이미지 -->
				
				<div align="center">
					<button class="all-btn"style="width: 150px;" type="button" id="goList">목록 으로</button>
					<!-- <button class="all-btn"style="width: 150px;" type="button" id="applyDelWork">삭제 신청 하기</button> -->
				</div>
			</section>
		</div>
	</div>
	<%@ include file="authorMenuBar.jsp"%>
</div>
<script>
	var accCheck = false;
	var percent2 = ((<%= fundInfoList.get(0).get("fundPrice") %>/<%= fundInfoList.get(0).get("maxVoo") %>) * 100) + "%";
	console.log(percent2);
	
	var clickCtn = 0;
	var clickCtn2 = 0;
	$(function(){
		$("#workImgArea").hide();
		$("#workDetailArea").hide();
		$("#goList").click(function(){
			location.href = "/sg/views/author/manageFundGoodsHistory.jsp";
		});
		/* $("#applyDelWork").click(function(){
			alert("삭제요청");
		}); */
		$("#fundProgress2").css({
			"width" : percent2
		}).text("최대 목표 금액 진행 률 : " + percent2);
		
		$("#workImgBtn").click(function(){
			location.href = "#workImgArea";
			if(clickCtn == 0){
				clickCtn++;
				$("#workImgArea").show();
			} else {
				clickCtn = 0;
				$("#workImgArea").hide();
			}			
		});
		
		$("#closeImg").click(function(){
			$("#workImgArea").hide();
			clickCtn = 0;
		});
		
		$("#workDetailBtn").click(function(){
			location.href = "#workDetailArea";
			if(clickCtn2 == 0){
				clickCtn2++;
				$("#workDetailArea").show();
			} else {
				clickCtn2 = 0;
				$("#workDetailArea").hide();
			}			
		});
		$("#closeDetail").click(function(){
			$("#workDetailArea").hide();
			clickCtn2 = 0;
		});
			
	});

</script>
</body>
</html>