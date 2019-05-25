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
													<input type="number" maxlength="7" placeholder="제작가능금액" id="targetMinAmount" name="targetMinAmount" style="width:100%">
												</td>
												<td><label>원</label></td>
												<td>
													<input type="number" maxlength="7" placeholder="최대목표금액" id="targetMaxAmount" name="targetMaxAmount" style="width:100%">
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
										<input type="number" maxlength="7" id="fundingPrice" name="fundingPrice" placeholder="작품가격">
										<label>원</label>
									</div>
								</div>
								<hr>
								<div class="listContents">
									<h4>배송비</h4>
									<p class="subtext">※ 기본 배송료를 설정해 주세요.</p>
									<div class="row">
										<input type="number" maxlength="7"  id="deliPrice" name="deliPrice" placeholder="배송비">
										<label>원</label>
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
									<textarea id="policy" name="policy" rows="5" readonly>상품취소
주문한 상품의 취소를 원하실 경우에는 우선 [My Dongwon]에서 배송상황을 확인해 주십시오. 배송상태가 ‘결제완료’ 시점이라면 온라인상에서 즉시 취소가 가능합니다. 단, 배송상태가 ‘발송준비’나 ‘발송완료’ 상태에서는 취소가 불가하므로 반품으로 처리하게 됩니다.

주문 단계와 취소 가능 여부
1. 주문접수 : 주문완료 후 결제가 미완료된 상태입니다. 취소신청을 하시면 즉시 주문취소가 완료됩니다.
2 .결제완료 : 주문에 따른 결제가 완료된 상태입니다. 취소신청을 하시면 즉시 주문취소가 완료됩니다.
카드 승인취소는 즉시, 실시간계좌이체/가상계좌/무통장입금은 환불계좌로 환불하여 드리겠습니다.
3. 발송준비 : 상품 확보 또는 재고 준비 단계이며, 최대 2일 정도 소요됩니다. 상담을 통해 취소 신청을 하시면 반품으로 주문 취소가 이루어집니다.
4. 발송지연 : 상품 재고가 부족하거나 일시 품절 되어, 본사에서 재고를 확보하는 중입니다.
상담을 통해 취소 신청을 하시면 내용 확인 후 주문취소가 이루어집니다.
5. 발송불가 : 상품이 품절되어 발송이 어려운 상황입니다. 상담을 통해 취소 신청을 하시면 내용 확인 후 주문취소가 이루어집니다.
6. 발송완료 : 배송을 위하여 택배사로 상품이 전달된 상태입니다. 상담을 통해 취소 신청을 하시면 반품으로 주문 취소가 이루어집니다.
교환/반품/환불 정책
동원몰에서는 다음과 같은 기간 및 내용으로 교환,반품,환불을 보장하고 있습니다. 식품의 경우 상품특성상 포장을 개봉하시거나 상품을 취식하신 후에는 반품이 절대 불가하오니 이점 유의하시기 바랍니다 (단, 제품하자 시에는 예외입니다.) 상품 설명에 배송/교환/반품/취소 관련 안내가 기재된 경우 다음 안내사항보다 우선 적용됩니다.

[제품교환]
1. 고객변심으로 인한 교환시, 반품 상품확인이 완료된 후에 교환상품이 배송 됩니다.단, 교환상품의 재고가 품절인 경우, 교환은 불가하며 반품만 가능합니다. 이때 반품 배송비는 소비자 부담입니다.
2. 다른 상품으로의 교환은 불가능하며, 이 경우는 해당 상품은 반품하시고, 원하시는 다른 상품을 재주문 하여 주시기 바랍니다.
3. 교환, 환불 사유가 발생하였을 때는 상품을 인수하신 지 30일 이내에 가능하나, 상품특성상 처리 불가능한 경우가 있으며, 상품불량의 경우는 
제외입니다. 식품의 경우 상품특성상 포장을 개봉하시거나 상품을 취식하신 후에는 반품이 절대 불가하오니 이점 유의하시기 바랍니다. 
(단, 제품하자 시에는 예외입니다.) 문의전화 : 고객센터(1588-3745)
4. 상품 배송 전 취소 방법안내 배송상태가 ‘결제완료’ 시점이라면 온라인상에서 바로 취소가 가능합니다. 단, 배송상태가 ‘발송준비’ 또는 ‘발송완료’ 
단계에서는 취소가 불가하므로 반품처리로 전환 해야 합니다.
[교환신청 방법]
1. 주문서를 작성하신 후 바로 다른 상품으로 교환은 어려우시니 주문을 취소하시고 재주문을 하셔야 합니다. 취소를 하실 경우에는 우선 [My Dongwon]에서 배송상황을 확인해 주십시오.배송상태가 ‘결제완료’ 시점이라면 온라인상에서 바로 취소가 가능합니다. 단, 배송상태가 ‘발송준비’나 ‘발송완료’ 상태에서는 취소가 불가합니다.
2. 제품을 받은 후 교환신청을 하시려면 [My Dongwon] > [주문취소/반품/교환]에서 교환신청을 신청해 주십시오. 신청접수 후 고객변심으로 인한 교환시, 반품 상품확인이 완료된 후에 교환상품이 배송됩니다.단, 교환상품의 재고가 품절인 경우, 교환은 불가하며 반품만 가능합니다. 이때 배송비는 소비자 부담입니다.
[반품이 가능한 경우]
1. 제품 수령일 기준 30일 이내 (단, 구매자 단순변심 반품일 경우 수령 후 7일 이내) 반품이 가능합니다.
2. 제품 수령 후 제품이 주문 내용과 다른 경우, 제품이 동원몰이 제공한 정보와 다른 경우, 제품이 고객님께 인도될 당시 상품이 멸실 또는 훼손된 경우, 구매자 단순 변심(단, 냉장/냉동식품 제외) 경우 교환/반품이 가능합니다.
3. 전자상거래 등에서의 소비자보호에관한법률에 규정되어 있는 소비자 청약철회 가능범위에 해당되는 경우
4. 통신판매업자가 방문판매등에 관한 법률에서 규정하고 있는 광고에 표시하여야 할 사항을 표시하지 아니한 경우
[반품이 불가능한 경우]
1. 고객님의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우
2. 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 감소한 경우
3. 시간의 경과되어 재판매가 곤란할 정도로 상품의 가치가 상실된 경우(냉장, 냉동 제품 등)
4. 고객 주문확인 후 상품제작에 들어가는 주문제작 상품 (횟감 등)
5. 기타, 전자상거래등에서의 소비자보호에관한법률이 정하는 소비자 청약철회 제한에 해당 되는 경우
[반품이 불가능한 경우]
1. 배달되어진 상자에 붙어있는 운송장의 주소 및 택배사를 확인합니다.
2. [My Dongwon]에서 반품신청 합니다.
3. 배달되어진 택배사를 통해 상품을 반품 합니다.
- 상품배달시 동봉된 '청약철회서'를 작성하시어 반품하시는 상자 안에 넣어 주시기 바랍니다. “청약철회서”가 없는 경우에는 별도 종이에 철회일자, 주문일자, 상품명, 금액, 성명, 철회사유, 주소 등을 기재하여 동봉하여 주시기 바랍니다.
- 반품하실 때 택배기사에게 수령하신 반송장은 환불이 완료될 때까지 보관해 주시기 바랍니다.
- 반품비는 상품하자, 오배송 등의 문제로 교환/반품을 하실 때의 반품비는 착불로 처리하시고, 이외에 고객변심으로 인해 교환/반품을 하실때는 고객님께서 선불로 부담하시어 보내주시면 됩니다.
[유의사항]
반품 접수 절차 없이 임의로 반송할 경우, 반품내용을 확인할 수 없으므로 환불이 지연되거나 환불이 되지 않을 수 있습니다. 그러므로 반드시 홈페이지 상단의 [My Dongwon]의 주문배송확인에서 [반품신청]을 하시고, 반품절차에 따라 반품하여 주시기 바랍니다.

고객 변심 등의 귀책사유 접수 후 반품 접수일로부터 7영업일 이내에 반품배송비를 입금하지 않는 경우 반품접수 철회

(단, 반품배송비 입금 및 반품처리 완료 후 고객센터로 연락시 3영업일 이내 환불 접수 진행)

교환/반품 배송비
제품을 교환/반품 하실 때의 배송비 비용에 대한 안내입니다.

1. 상품하자 등의 문제로 교환/반품을 하실 경우 고객센터 사전접수 후 지정된 택배사를 이용하여 주시면 재발송 혹은 주문취소 처리해드리겠습니다. (착불, 동원몰 부담).
2. 단순 고객 변심에 의한 교환/반품인 경우 고객님께서 반품관련 왕복배송비를 부담하셔야 합니다. 
(※ 고객변심에 의해 반품시 배송비를 보내지 않으시면, 현금 입금인 경우 결제액에서 반품배송비의 금액을 제한 금액만 환불됩니다. 또 카드 결제인 경우에는 카드취소 승인이 안되니, 반드시 사전에 고객센터 접수 후 배송비를 부담해 주셔야 합니다.)
부분취소/부분반품
[현금 구매한 경우]
현금으로 구매하신 경우 부분 취소/반품이 가능합니다.
취소/반품을 원하시는 상품의 금액만큼 고객님의 환불계좌로 입금해 드립니다.

[신용카드로 구매한 경우]
여러 개의 상품을 신용카드로 결제한 경우엔 일부 제품만의 취소/반품이 불가합니다.
부득이 원하실 경우에는 전체 구매하신 상품을 모두 취소/반품하신 후 다시 재 구매하셔야 합니다.

환불절차
홈페이지 상단의 [MY Dongwon]에서 [취소],[반품]신청을 하시면, [취소]는 신청 후 3영업일 이내, [반품]은 반품완료(반송 물건이 본사에 도착한 것이 확인되는 시점) 확인 후 3영업일 이내에 환불 처리해 드립니다.(주말 및 공휴일 제외)

결제수단별 환불절차
1. 현금결제
실시간계좌이체/가상계좌/무통장입금은 반품 확인 후 2~3일 이내에 고객님의 환불계좌로 결제하신 금액을 환불하여 드립니다.
2. 신용카드 
신용카드로 결제하신 경우는 신용카드 승인이 취소되므로 결제 대금이 청구되지 않습니다.
신용카드 결제일에 대금이 청구될 경우 익월 신용카드 대금청구시 카드사에서 환급처리(마이너스 청구)해 드립니다.
3. 적립금 
고객님의 적립금은 사용하신 금액만큼 환원해 드립니다.
4. 쿠폰 
결제시 사용한 쿠폰은 다시 환원되지 않습니다.
※ 환불은 반드시 주문자 본인 및 입금자 명의의 계좌로만 받으실 수 있습니다. 
단, 주문자 본인 및 입금자 명의의 계좌로 환불이 없으실 경우, 
주문자께서 고객센터(1588-3745)로 연락 주시면 본인 확인을 거친 후 환불 받으실 수 있습니다.
</textarea><br>
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
				<input type="file" id="fundingDetailImg" name="fundingDetailImg" onchange="uploadFundingImg(this, 6);">
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
						case 6:
							$("#fundingDetailImg").attr("src", e.target.result);
							$("#fundingDetailImgArea").val($("#fundingDetailImg").val());
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