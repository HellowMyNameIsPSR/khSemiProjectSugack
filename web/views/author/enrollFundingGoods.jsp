<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.funding.model.vo.*,
				 java.util.*" %>
<%
	ArrayList<Category> categoryList = 
		(ArrayList<Category>) request.getAttribute("categoryList");
	ArrayList<String> authorTypeList =
			(ArrayList<String>) request.getAttribute("authorTypeList");
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
			<form action="<%= request.getContextPath() %>/insertFund.fund" method="post" encType="multipart/form-data">
				<section id="contents">
					<header class="main" style="margin-top:10px;">
						<h2>펀딩 작품등록</h2>
					</header>
					<!-- Contents area -->
					<!-- 카테고리 -->
						<div class="listBox" id="categoryArea">
							<div class="listTitle">
								<h2>공예 유형 선택</h2>
							</div>
							<div class="listContents">
								<% for(int i = 0; i < authorTypeList.size(); i++) { %>
									<input type="radio" name="authorType" id="<%= authorTypeList.get(i) %>"
									value="<%= authorTypeList.get(i) %>">
									<label for="<%= authorTypeList.get(i) %>">
										<%= authorTypeList.get(i) %>
									</label>
								<% } %>
							</div>
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
						<div class="listBox" id="fundGoodsArea">
							<div class="listTitle">
								<h2>펀딩 작품 명</h2>
							</div>
							<div class="listContents">
								<p class="subtext">※프로젝트 제목은 제작하고자 하는 작품명 혹은 프로젝트 주제가 잘 드러나도록 
								적어 주시는 것이 좋습니다. 짥은 제목은 모바일 환경 혹은 SMS에 사용됩니다.</p>
								<div class="row">
									<input type="text" id="fundingGoodsName" name="fundingGoodsName" placeholder="작품명" style="width: 100%;">
								</div>
							</div>
						</div>
					<!-- 프로그램 제목 -->
					<!-- 프로젝트 이미지 -->
						<div class="listBox">
							<div class="listTitle">
								<h2>펀딩작품 이미지</h2>
							</div>
							<div class="listContents"
								style="border-bottom: 1px solid lightgray;">
								<h4>작품 이미지</h4>
								<p class="subtext">
									※ 첫번째 사진이 대표 이미지로, 프로젝트의 썸네일 등으로 사용됩니다. <br> 
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
											 	  style="width:150px; height:150px;"
											 	  id="fundingImgArea1">
										</div>
										<div class="col-sm-2" style="margin-left:10px;" >
											 <img src="<%= request.getContextPath() %>/authorRelationFile/basicImage.png"
											 	  style="width:150px; height:150px;"
											 	  id="fundingImgArea2">
										</div>
										<div class="col-sm-2" style="margin-left:10px;">
											 <img src="<%= request.getContextPath() %>/authorRelationFile/basicImage.png"
											 	  style="width:150px; height:150px;"
											 	  id="fundingImgArea3">
										</div>
										<div class="col-sm-2" style="margin-left:10px;">
											 <img src="<%= request.getContextPath() %>/authorRelationFile/basicImage.png"
											 	  style="width:150px; height:150px;"
											 	  id="fundingImgArea4">
										</div>
										<div class="col-sm-2" style="margin-left:10px;">
											 <img src="<%= request.getContextPath() %>/authorRelationFile/basicImage.png"
											 	  style="width:150px; height:150px;"
											 	  id="fundingImgArea5">
										</div>
								</div>
							</div>
							<div class="listContents">
								<h4>펀딩작품 상세보기 이미지</h4>
								<p class="subtext">
									※ 프로젝트 상세페이지에 첨부할 이미지를 첨부해 주세요.
								</p>
								<input type="text" value="첨부파일" class="form-control" id="fundingDetailImgArea" readonly>							
							</div>
						</div>
					<!-- 프로젝트 이미지 -->
					<!-- 프로젝트 설명 -->
						<div class="listBox" id="fundCommentsArea">
							<div class="listTitle">
								<h2>펀딩작품 설명</h2>
							</div>
							<div class="listContents">
								<textarea id="fundComments" name="fundComments" placeholder="Comment" rows="5"></textarea><br>
							</div>
						</div>
					<!-- 프로젝트 설명 -->
					<!-- 출시 예정 작품 -->
						<!-- <div class="listBox">
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
						</div> -->
					<!-- 출시 예정 작품 -->						
						<!-- <div align="center">
							<button class="all-btn" style="width: 150px;" id="enrollfunding1">Next > </button>
						</div> -->
			
					<!-- Contents area -->
					<!-- 펀딩 목표 금액 -->
						<div class="listBox" id="targetAmountArea">
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
									<div class="col-sm-10">
										<table>
											<tr>
												<td>
													<input type="number" placeholder="최소목표금액" id="targetMinAmount" name="targetMinAmount" style="width:100%">
												</td>
												<td><label>원</label></td>
												<td>
													<input type="number" placeholder="최대목표금액" id="targetMaxAmount" name="targetMaxAmount" style="width:100%">
												</td>
												<td><label>원</label></td>
											</tr>
										</table>
									</div>
								</div>								
							</div>
						</div>
					<!-- 펀딩 목표 금액 -->
					<!-- 프로젝트 기간 -->
						<div class="listBox" id="fundingTermArea">
							<div class="listTitle">
								<h2>펀딩 진행 기간</h2>
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
					<!-- 펀딩 가격 구성 -->
						<div class="listBox" id="fundingPriceArea">
								<div class="listTitle">
									<h2>펀딩작품 가격</h2>
								</div>
								<div class="listContents">
									<h4>판매 가격</h4>
									<p class="subtext">※ 제품 수량 1개당 판매가격을 측정해 주세요.</p>
									<div class="row">
										<input type="number" id="fundingPrice" name="fundingPrice" placeholder="작품가격">
										<label>일</label>
									</div>
								</div>
								<hr>
								<div class="listContents">
									<h4>배송비</h4>
									<p class="subtext">※ 기본 배송료를 설정해 주세요.</p>
									<div class="row">
										<input type="number" id="deliPrice" name="deliPrice" placeholder="배송비">
										<label>일</label>
									</div>
								</div>
							</div>
					<!-- 펀딩 가격 구성 -->
					<!-- 환불 및 교환 정책 -->
						<div class="listBox" id="acceptFundArea">
							<div class="listTitle">
								<h2>환불 및 교환 정책</h2>
							</div>
							<div class="listContents">
								<p class="subtext">
									※ 우리 홈페이지의 환불 및 교환 정책에 관한 내용에 동의하십니까?							
								</p>
								<div class="row">
									<textarea id="policy" name="policy" placeholder="Comment" rows="5"></textarea><br>
								</div>
								<div class="row">
									<input type="checkbox" id="acceptFund" name="acceptFund">
									<label for="acceptFund">약관에 동의합니다.</label>
								</div>
							</div>
						</div>
					<!-- 환불 및 교환 정책 -->
					<div align="center">
						<button class="all-btn" style="width: 150px;" type="submit" id="enrollfunding2"> 등록하기 </button>
					</div>
			<div id="fundingFiles">
				<input type="file" id="fundingImg1" name="fundingImg1" onchange="uploadFundingImg(this, 1);">
				<input type="file" id="fundingImg2" name="fundingImg2" onchange="uploadFundingImg(this, 2);">
				<input type="file" id="fundingImg3" name="fundingImg3" onchange="uploadFundingImg(this, 3);">
				<input type="file" id="fundingImg4" name="fundingImg4" onchange="uploadFundingImg(this, 4);">
				<input type="file" id="fundingImg5" name="fundingImg5" onchange="uploadFundingImg(this, 5);">
				<input type="file" id="fundingDetailImg" name="fundingDetailImg" onchange="uploadFundingDetailImg(this);">
			</div>
			</section>
		</form>
	</div>
	</div>
		<%@ include file="authorMenuBar.jsp"%>
	</div>
	<script>
		$(function(){
			//유효성 검사 후 서블릿 요청
			$("#enrollfunding2").click(function(){
				var regData = true;
				var category = $(":input:radio[name=category]:checked").val();
				var authorType = $(":input:radio[name=authorType]:checked").val();
				var goodsName = $("#fundingGoodsName").val();
				var fundComments = $("#fundComments").val();
				var minAmount = $("#targetMinAmount").val();
				var maxAmount = $("#targetMaxAmount").val();
				var fundingTerm = $("#fundingTerm").val();
				var fundingPrice = $("#fundingPrice").val();
				var deliPrice = $("#deliPrice").val();
				var acceptFund = $("input:checkbox[id=acceptFund]").is(":checked");
				
				
				if(category == null || category == "" || category == "&nbsp;"){
					regData = false;
					alert("카테고리 값을 선택 해 주세요.");
					location.href = "#categoryArea";
					return false;
				}
				if(authorType == null || authorType == "" || authorType == "&nbsp;"){
					regData = false;
					alert("공예 유형을 선택 해 주세요.");
					location.href = "#categoryArea";
					return false;
				}
				if(goodsName == null || goodsName == "" || goodsName == "&nbsp;"){
					regData = false;
					alert("펀딩 작품 명을 입력해 주세요.");
					location.href = "#fundGoodsArea";
					return false;
				}
				if(fundComments == null || fundComments == "" || fundComments == "&nbsp;"){
					regData = false;
					alert("작품 설명을 적어주세요. 심사 시 불의익을 받을 수 있습니다.");
					location.href = "#fundCommentsArea";
					return false;
				}
				if(minAmount == null || minAmount < 0){
					regData = false;
					alert("최소 금액을 설정해 주세요.");
					location.href = "#targetAmountArea";
					return regData;
				}
				if(maxAmount == null || maxAmount < 0){
					regData = false;
					alert("최대 금액을 설정해 주세요.");
					location.href = "#targetAmountArea";
					return regData;
				}
				if(fundingTerm == null || fundingTerm < 1){
					regData = false;
					alert("펀딩 진행 기간을 설정해 주세요.");
					location.href = "#fundingTermArea";
					return regData;
				}
				if(fundingPrice == null || fundingPrice < 0){
					regData = false;
					alert("펀딩 작품 가격을 설정해 주세요.");
					location.href = "#fundingPriceArea";
					return regData;
				}
				if(deliPrice == null || deliPrice < 0){
					regData = false;
					alert("배송비를 설정해 주세요.");
					location.href = "#fundingPriceArea";
					return regData;
				}
				if(acceptFund == false){
					regData = false;
					alert("약관에 동의해 주세요.");
					location.href = "#acceptFundArea";
					return regData;
				}
				return regData;
			});
			
			//파일 버튼 처리
			$("#fundingFiles").hide();
			$("#fundingImgArea1").click(function(){
				$("#fundingImg1").click();
			});
			$("#fundingImgArea2").click(function(){
				$("#fundingImg2").click();
			});
			$("#fundingImgArea3").click(function(){
				$("#fundingImg3").click();
			});
			$("#fundingImgArea4").click(function(){
				$("#fundingImg4").click();
			});
			$("#fundingImgArea5").click(function(){
				$("#fundingImg5").click();
			});
			$("#fundingDetailImgArea").click(function(){
				$("#fundingDetailImg").click();
			});
		});
		//펀딩 작품 이미지
		function uploadFundingImg(value, num){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					switch(num){
						case 1:
							$("#fundingImg1").attr("src", e.target.result);
							$("#fundingImgArea1").attr("src", e.target.result);
							break;
						case 2:
							$("#fundingImg2").attr("src", e.target.result);
							$("#fundingImgArea2").attr("src", e.target.result);
							break;
						case 3:
							$("#fundingImg3").attr("src", e.target.result);
							$("#fundingImgArea3").attr("src", e.target.result);
							break;
						case 4:
							$("#fundingImg4").attr("src", e.target.result);
							$("#fundingImgArea4").attr("src", e.target.result);
							break;
						case 5:
							$("#fundingImg5").attr("src", e.target.result);
							$("#fundingImgArea5").attr("src", e.target.result);
							break;
					}
				} //end func
				reader.readAsDataURL(value.files[0]);
			} //end if
		} //end func
		
		//펀딩 작품 상세페이지
		function uploadFundingDetailImg(value) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#fundingDetailImg").attr("src", e.target.result);
					$("#fundingDetailImgArea").val($("#fundingDetailImg").val());
				}//end func
				reader.readAsDataURL(value.files[0]);
			} //end if
		} //end func
	</script>
</body>
</html>