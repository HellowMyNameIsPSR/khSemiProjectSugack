<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.funding.model.vo.*,
				 java.util.*" %>
<%
	ArrayList<Category> categoryList = 
		(ArrayList<Category>) request.getAttribute("categoryList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수작 - 펀딩 작품 등록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<%@ include file="stylesheet/eroll.html" %>
	<%@ include file="../assets/css/allCss.html" %>
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
			<form action="" method="post" encType="multipart/form-data">
			<div id="firstSection">
				<section id="contents">
					<header class="main" style="margin-top:10px;">
						<h2>펀딩 작품등록</h2>
					</header>
					<!-- Contents area -->
					<!-- 카테고리 -->
						<div class="listBox">
							<div class="listTitle">
								<h2>카테고리</h2>
							</div>
							<div class="listContents">
								<% for(int i = 0; i < categoryList.size(); i++) { %>
									<input type="radio" name="category" id="<%= categoryList.get(i).getCid() %>"
									value="<%= categoryList.get(i).getCategory() %>">
									<label for="<%= categoryList.get(i).getCid() %>">
										<%= categoryList.get(i).getCategory() %>
									</label>
								<% } %>
								<p class="subtext">※ 카테고리에 맞지 않는 경우 심사에 불이익이 있을 수 있습니다.</p>
							</div>
						</div>
					<!-- 카테고리 -->
					<!-- 프로그램 제목 -->
						<div class="listBox">
							<div class="listTitle">
								<h2>프로젝트 제목</h2>
							</div>
							<div class="listContents">
								<p class="subtext">※프로젝트 제목은 제작하고자 하는 작품명 혹은 프로젝트 주제가 잘 드러나도록 
								적어 주시는 것이 좋습니다. 짥은 제목은 모바일 환경 혹은 SMS에 사용됩니다.</p>
								<div class="row">
									<input type="text" placeholder="프로젝트 명" style="width: 100%;">
								</div>
							</div>
						</div>
					<!-- 프로그램 제목 -->
					<!-- 프로젝트 이미지 -->
						<div class="listBox">
							<div class="listTitle">
								<h2>프로젝트 이미지</h2>
							</div>
							<div class="listContents"
								style="border-bottom: 1px solid lightgray;">
								<h4>작품 이미지</h4>
								<p class="subtext">
									※ 대표 이미지는 프로젝트의 썸네일 등으로 사용됩니다. <br> 
									가장 중요한 시각적 요소로 후원자들이 프로젝트를 쉽게 파악하고 좋은 인상을 줄 수 있는 이미지를 선정하세요.<br>
								</p>
								<p class="subtext">
									※ 권장 크기 : 640px * 640px<br> &nbsp; &nbsp; 추가이미지는 최대 7개까지
									설정할 수 있습니다.<br> &nbsp; &nbsp; jpg, jpeg, gif, png, bmp 형식의
									정지 이미지만 등록됩니다.
								</p>
								<div class="row">
										<div class="col-sm-2" style="margin-left:10px;">
											 <img src="<%= request.getContextPath() %>/authorRelationFile/basicImage.png"
											 	  style="width:150px; height:150px;">
										</div>
										<div class="col-sm-2" style="margin-left:10px;">
											 <img src="<%= request.getContextPath() %>/authorRelationFile/basicImage.png"
											 	  style="width:150px; height:150px;">
										</div>
										<div class="col-sm-2" style="margin-left:10px;">
											 <img src="<%= request.getContextPath() %>/authorRelationFile/basicImage.png"
											 	  style="width:150px; height:150px;">
										</div>
										<div class="col-sm-2" style="margin-left:10px;">
											 <img src="<%= request.getContextPath() %>/authorRelationFile/basicImage.png"
											 	  style="width:150px; height:150px;">
										</div>
										<div class="col-sm-2" style="margin-left:10px;">
											 <img src="<%= request.getContextPath() %>/authorRelationFile/basicImage.png"
											 	  style="width:150px; height:150px;">
										</div>
								</div>
							</div>
							<div class="listContents">
								<h4>프로젝트 상세보기 이미지</h4>
								<p class="subtext">
									※ 프로젝트 상세페이지에 첨부할 이미지를 첨부해 주세요.
								</p>
								<input type="text" value="첨부파일" class="form-control" id="confirmArea" readonly>							
							</div>
						</div>
					<!-- 프로젝트 이미지 -->
					<!-- 프로젝트 설명 -->
						<div class="listBox">
							<div class="listTitle">
								<h2>프로젝트 설명</h2>
							</div>
							<div class="listContents">
								<textarea id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
							</div>
						</div>
					<!-- 프로젝트 설명 -->
					<!-- 출시 예정 작품 -->
						<div class="listBox">
							<div class="listTitle">
								<input type="checkbox" id="commingSoonGoods" name="commingSoonGoods">
								<label for="commingSoonGoods">출시 예정 작품</label>
							</div>
							<div class="listContents">
								<p class="subtext">
									※ 출시 예정일을 지정해 주세요. 지정한 날짜에 작품이 오픈됩니다.
								</p>
								<input type="date" id="commingSoonDate" name="commingSoonDate">
							</div>
						</div>
					<!-- 출시 예정 작품 -->						
						<div align="center">
							<button class="all-btn" style="width: 150px;" id="enrollfunding1">Next > </button>
						</div>
				</section>
			</div>				
			<!-- 다음 -->
			<div id="secondSection">
				<section id="contents">
					<header class="main" style="margin-top:10px;">
						<h2>판매 작품등록</h2>
					</header>
					<!-- Contents area -->
					<!-- 펀딩 목표 금액 -->
						<div class="listBox">
							<div class="listTitle">
								<h2>펀딩 목표 금액</h2>
							</div>
							<div class="listContents">
								<p class="subtext">
									※ 펀딩의 총 목표 금액을 설정해 주세요.<br>
									마감일 자정까지 100%이상을 달성했을 시 후원금이 전달됩니다. 마감일 전 후원을 취소하시는 분들이 있어 초과달성을 목표로 하는 것이 유리합니다. <br>
									목표 금액은 제작비, 인건비, 배송료, 예비 비용 등을 고려하시기 바랍니다.
								</p>
								<div class="row">
									<input type="text" placeholder="목표금액" id="targetAmount" name="targetAmount" style="width:60%">
									<label>원</label>
								</div>
								
							</div>
						</div>
					<!-- 펀딩 목표 금액 -->
					<!-- 프로젝트 기간 -->
						<div class="listBox">
							<div class="listTitle">
								<h2>프로젝트 기간</h2>
							</div>
							<div class="listContents">
								<p class="subtext">※프로젝트를 몇 일동안 진행하시겠습니까?</p>
								<div class="row">
									<input type="number" id="fundingTerm" name="fundingTerm" placeholder="진행일수">
									<label>일</label>
								</div>
							</div>
						</div>
					<!-- 프로젝트 기간 -->
					<!-- 리워드 구성 -->
						<div class="listBox">
							<div class="listTitle">
								<h2>리워드 구성</h2>
							</div>
							<div class="listContents">
							<div class="row">
								<p class="subtext">
									※ 후원자들을 위한 리워드 내용을 입려하세요. 
								</p>
								<input type="button" value="+" class="all-btn" style="margin-left:10px;">
							</div>
								<div class="row">          
									  <table class="table table-bordered" id="fundOptionTable">
									      <tr>
									        <th>작품 명</th>
									        <th>구성품</th>
									        <th>추가금액</th>
									      </tr>
									      <tr>
									        <td>John</td>
									        <td>Doe</td>
									        <td>john@example.com</td>
									      </tr>
									      <tr>
									        <td>Mary</td>
									        <td>Moe</td>
									        <td>mary@example.com</td>
									      </tr>
									      <tr>
									        <td>July</td>
									        <td>Dooley</td>
									        <td>july@example.com</td>
									      </tr>
									  </table>
									</div>
							</div>
							<hr>
							<div class="listContents">
								<h4>구매 제한</h4>
								<div class="row">
									<label>1인당 </label>
									<select style="width:50%;">
										<option>구성품</option>
										<option>구성품</option>
										<option>구성품</option>
									</select>
									<label>을(를) </label>
									<input type="number" placeholder="수량">
									<label> 개로 제한합니다.</label>
								</div>
							</div>
						</div>
					<!-- 리워드 구성 -->
					<!-- 환불 및 교환 정책 -->
						<div class="listBox">
							<div class="listTitle">
								<h2>환불 및 교환 정책</h2>
							</div>
							<div class="listContents">
								<p class="subtext">
									※ 우리 홈페이지의 환불 및 교환 정책에 관한 내용에 동의하십니까?							
								</p>
								<div class="row">
									<textarea id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
								</div>
								<div class="row">
									<input type="checkbox" id="acceptFund" name="acceptFund">
									<label for="acceptFund">약관에 동의합니다.</label>
								</div>
							</div>
						</div>
					<!-- 환불 및 교환 정책 -->
					<div align="center">
						<button class="all-btn" style="width: 150px;" id="enrollFundingGoods2">Next > </button>
					</div>
				</section>
			</div>
		</form>
	</div>
	</div>
		<%@ include file="authorMenuBar.jsp"%>
	</div>
	<script>
		$(function(){
			$("#secondSection").hide();
			$("#firstSection").click(function(){
				$("#firstSection").hide();
				$("#secondSection").show();
			});
		});
	</script>
</body>
</html>