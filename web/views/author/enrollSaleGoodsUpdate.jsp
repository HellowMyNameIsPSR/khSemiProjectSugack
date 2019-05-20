<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.work.model.vo.*"%>
<%
	Work work = (Work) request.getAttribute("work");
	ArrayList<WorkPic> workPic = (ArrayList<WorkPic>) request.getAttribute("fileList");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 판매 작품 등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<%@ include file="../assets/css/allCss.html" %>

<style>
	body{
		background: radial-gradient(white, #F6FFFF) fixed;
	}
	img{
		background-image:url("/sg/views/images/noImage.png");
		background-size:100%;
		cursor: pointer;
	}
	.listBox {
		border: 2px solid lightgray;
		margin: 20px 0px 20px 0px;
		box-shadow: 2px 2px lightgray;
		background: radial-gradient(white, #F6FFFF) fixed;
		min-width:850px;
	}
	.listTitle {
		border-bottom: 1px solid lightgray;
		margin: 0px 0px 20px 0px;
		padding-top:20px;
		padding-left: 20px;
		min-width:850px;
		border-radius: 5px 5px 5px 5px;

	}
	.listContents {
		margin: 20px 0px 20px 0px;
		padding-left: 20px;
		padding-right: 20px;
		min-width:850px;
	}
	.listContents div {
		margin: 20px 0px 20px 0px;
	}
	.unit {
		display: inline;
		width: 200px;
		min-width:850px;
	}
	.optionTitle {
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
		margin: 20px 0px 20px 0px;
		padding: 20px 0px 0px 20px;
		min-width:850px;
		background: linear-gradient(to right, #F6FFFF, white 50%);
	}
	.subtext {
		margin: 10px 0 0;
		font-size: 12px;
		ling-height: 18px;
		color: skyblue;
	}
	.priceBox{
		width:400px;
	}
	.priceBox tr {
		background: white !important;
		border-color: white !important;
	}
	.priceBox tr td {
		border: 1px solid lightgray;
		text-align: center;
	}
	.priceBox tr td input {
		width: 100%;
	}
	.searchBox {
		display: none;
	}
	.searchTable tr {
		background: white !important;
		border: 1px solid lightgray;
		display: block;
	}
	.checkBox {
		border: 1px solid skyblue;
		/* display: none; */
		padding: 10px 10px 10px 10px;
		min-width:800px;
		
	}
	.checkBox tr{
		height:20px;
		border:none;
	}
	.checkBox tr>td{
		padding:5px 0px 0px 10px;
		width:25%;
		border-right:1px solid skyblue;
		background: radial-gradient(white, #F6FFFF) fixed;
	}
	.searchBox tr td input {
		border: none;
	}
	.all-btn{
		width: 150px;
		height: 40px;
		text-align: center;
		font-size: 13px;
		display: inline-block;
		border-radius: 5px 5px 5px 5px;
	}
	a {
		border-bottom: none !important;
	}
	.optionBox{
		display:none;
		border: 1px solid skyblue;
		padding:10px 10px 10px 10px;
	}
	.optionTable{
		border:none;
	}
	.optionTable tr>td,.optionTable1 tr>td,
	.optionTable2 tr>td,.optionTable3 tr>td,
	.optionTable4 tr>td{
		background-color:white;
	}
	
	#iconBox{
		cursor: pointer;
		display: table-cell;
		border:1px solid gray;
		width:30px !important;
		height:30px;
		vertical-align: middle;
	}
	#iconBox:hover{
		background-color:lightgray;
	}
	
	.optionBtn{
		display:inline-block;
		padding-top:2px;
		font-size:17px;
		height:35px;
		width:120px;
		border:1px solid #89C3F6;
		background-color:#CFE9FF;
		border-radius: 5px 5px 5px 5px;
		color:#1176CE;
	}
	.optionBtn:hover{
		cursor: pointer;
		background-color:#9ECDF6;
	}
	.imgBox tr>td{
		background: radial-gradient(white, #F6FFFF) fixed;
		padding:10px 0px 10px 0px;
	}
	.imgDiv{
		border:1px dashed gray;
		text-align:center;
		display:table-cell;
		vertical-align:middle;
		padding: 5px 5px 0px 5px;
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
				
				
				<!-- section -->
				<section id="contents">
					<header class="main">
						<span style="font-size:40px;">판매 작품 수정</span>
					</header>
					<!-- Contents area -->
					<!-- 확인후 지우기 -->
				 	
				 	
				 	
				 	
				 	
					<form action="<%=request.getContextPath()%>/updateSale.wo" method="post" encType="multipart/form-data">
						<input type="number" name="workId" value="<%=work.getWorkId()%>" style="display:none;">
						<div class="listBox">
							<div class="listTitle">
								<h2>카테고리</h2>
							</div>
							<div class="listContents">
								<!-- <div>
									<button type="button" class="all-btn" id="search">카테고리명검색</button>
									<button type="button" class="all-btn" id="checked">카테고리명선택</button>
								</div> -->
								<div class="searchBox">
									<table class="searchTable">
										<tr>
											<td><input type="text" placeholder="카테고리명 입력" name=""
												style="width: 100%;"></td>
											<td width="7%"><span class="glyphicon glyphicon-search"></span></td>
										</tr>
									</table>
								</div>

								<!-- <script>
									$(function() {
										$("#search").click(function() {
											$(".searchBox").show();
											$(".checkBox").hide()
										});
										$("#checked").click(function() {
											$(".searchBox").hide();
											$(".checkBox").show()
										});
									});
								</script> -->

								<table class="checkBox">
									<tr>
										<td>
											<input type="radio" id="case" name="cid" value="1"> 
											<label for="case">케이스</label>
										</td>
										<td>
											<input type="radio" id="interior" name="cid" value="2"> 
											<label for="interior">인테이어 소품</label>
										</td>
										<td>
											<input type="radio" id="dress" name="cid" value="3"> 
									<label for="dress">의류</label>
										</td>
										<td>
											<input type="radio" id="child" name="cid" value="4"> 
											<label for="child">육아, 아동</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" id="furniture" name="cid" value="5"> 
										<label for="furniture">가구</label>
										</td>
										<td>
											<input type="radio" id="fshoes" name="cid" value="6"> 
										<label for="fshoes">여성 수제화</label>
										</td>
										<td>
											<input type="radio" id="underwear" name="cid" value="7"> 
											<label for="underwear">속옷, 양말류</label>
										</td>
										<td>
											<input type="radio" id="kitchen" name="cid" value="8"> 
										<label for="kitchen">주방, 생활</label> 
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" id="earring" name="cid" value="9"> 
											<label for="earring">귀걸이</label>
										</td>
										<td>
											<input type="radio" id="mshoes" name="cid" value="10"> 
											<label for="mshoes">남성 수제화</label>
										</td>
										<td>
											<input type="radio" id="fiberOthers" name="cid" value="11"> 
											<label for="fiberOthers">기타 섬유, 퀄트</label>
										</td>
										<td>
											<input type="radio" id="animal" name="cid" value="12"> 
											<label for="animal">반려동물 용품</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" id="ring" name="cid" value="13"> 
											<label for="ring">반지</label>
										</td>
										<td>
											<input type="radio" id="pottery" name="cid" value="14"> 
											<label for="pottery">도자기</label> 
										</td>
										<td>
											<input type="radio" id="bag" name="cid" value="15"> 
											<label for="bag">가방, 파우치</label> 
										</td>
										<td>
											<input type="radio" id="stationery" name="cid" value="16">  
											<label for="stationery">문구, 팬시</label> 
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" id="necklace" name="cid" value="17"> 
											<label for="necklace">목걸이</label> 
										</td>
										<td>
											<input type="radio" id="electronic" name="cid" value="18">  
											<label for="electronic">전자기기 관련</label>
										</td>
										<td>
											<input type="radio" id="fashionOthers" name="cid" value="19">  
											<label for="fashionOthers">패션 잡화</label>
										</td>
										<td>
											<input type="radio" id="watch" name="cid" value="20">  
											<label for="watch">시계</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" id="bracelet" name="cid" value="21"> 
										<label for="bracelet">팔찌</label> 
										</td>
										<td>
											<input type="radio" id="wallet" name="cid" value="22">  
											<label for="wallet">지갑</label> 
										</td>
										<td>
											<input type="radio" id="accessory" name="cid" value="23"> 
											<label for="accessory">그외 악세서리</label>> 
										</td>
										<td>
											<input type="radio" id="toy" name="cid" value="24"> 
										<label for="toy">인형, 장난감</label>
										</td>
									</tr>
									<tr>
										<td>
											<input type="radio" id="crafts" name="cid" value="25">
											<label for="crafts">공예</label> 
										</td>
										<td>
											<input type="radio" id="theOthers" name="cid" value="26">
											<label for="theOthers">기타</label> 
										</td>
										<td>
										
										</td>
										<td>
										
										</td>
									</tr>
								</table>
								<p class="subtext">※ 상품과 맞지 않는 카테고리에 등록할 경우 강제 이동되거나 판매중지,판매금지 될 수 있습니다.</p>
								
							</div>
						</div>

			        	<script>
						 
			            	
			            	$(function(){
			                	$("input[name=cid]").each(function (){
			                		var arr = '<%=work.getCid()%>';
			                		for(var i = 0; i < arr.length; i++) {
			                			if($(this).val() == arr[i]) {
			                				$(this).attr("checked", true);
			                			}
			                		}
			                	})
			                });
						</script>
						
						
						<!-- 상품명  -->
						<div class="listBox">
							<div class="listTitle">
								<h2>상품명</h2>
							</div>
							<div class="listContents">
								<input name="workName" value="<%=work.getworkName()%>"type="text" placeholder="상품명 입력" style="width: 100%;">
								<p class="subtext">※판매 상품과 직접 관련이 없는 다른 상품명 입력 시 관리자에 의해 판매금지될 수 있습니다.</p>
							</div>
						</div>
						
						
						<!-- 상품가격   -->
						<div class="listBox">
							<div class="listTitle">
								<h2>상품가격</h2>
							</div>
							<div class="listContents">
								<table class="priceBox" style="background: white;">
									<tr>
										<td style="width:100px">판매가</td>
										<td style="width:250px;">
											<input name="price" value="<%=work.getPrice()%>" type="number" placeholder="숫자만 입력" value="0" style = "text-align:right;">
										</td>
										<td style="width:50`px">원</td>
									</tr>
									<tr>
										<td colspan="4" style="border:none"></td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>
											<input name="deliPrice" value="<%=work.getDeliPrice()%>" type="number" placeholder="숫자만 입력" value="0" style = "text-align:right;">
										</td>
										<td>원</td>
									</tr>
								</table>
								<p class="subtext">※ 판매가격의 매출수수료 5%가 과금됩니다.</p>
							</div>
						</div>

						<!-- 옵션   -->
						<div class="listBox">
							<div class="listTitle">
								<h2>옵션 선택</h2>
							</div>
							<div class="listContents">
								<div>
									<button type="button" class="all-btn openOption">설정함</button>
									<button type="button" class="all-btn closeOption">설정안함</button>
								</div>

								<div class="optionBox">
									<table class="optionTable">
										<tr align="center">
											<td>옵션명</td>
											<td>옵션값</td>
											<td>추가비용</td>
											<td align="center">
												<span id="iconBox" class="glyphicon glyphicon-minus minus0">
											</span></td>
											<td align="center">
												<span id="iconBox"class="glyphicon glyphicon-plus plus0">
											</span></td>
										</tr>

										<tbody class="optiontbody">
											<tr align="center">
												<td>
													<input type="text" name="optionName" placeholder="옵션명 입력">
												</td>
												<td>
													<input type="text" name="optionVal" placeholder="옵션값 입력">
												</td>
												<td>
													<input type="number" name="plusSale" placeholder="추가비용 입력">
												</td>
												<td colspan="2"></td>
											</tr>
										</tbody>
									</table>

								</div>
								<div align="center">
									<div class="optionBtn" id="deleteBtn">
										<span class="glyphicon glyphicon-minus"></span>&nbsp;옵션 삭제
									</div>
									<div class="optionBtn" id="addBtn">
										<span class="glyphicon glyphicon-plus"></span>&nbsp;옵션 추가
									</div>
								</div>

							</div>
						</div>

						<script>
							var num = 0;
							var cnt = 0;
							var cnt1 = 0;
							var cnt2 = 0;
							var cnt3 = 0;
							var cnt4 = 0;
							var opCnt = 0;
							
							$(function(){
								// 옵션 설정함/설정안함
								$(".openOption").click(function(){
									$(".optionBox").show();
								});
								
								$(".closeOption").click(function(){
									$(".optionBox").hide();
								});
								
								
								//옵션갑 추가 삭제1
								$(".plus0").on("click", function() {
									cnt++;
									$(".optiontbody:last").append(
										'<tr align="center">' +
											'<td> <input style="display:none;" type="text" name="optionName" placeholder="옵션명 입력"> </td>' +		
											'<td>' + '<input type="text" name="optionVal'+ cnt + '" placeholder="옵션값 입력">' +'</td>' +
											'<td>' + '<input type="number" name="plusSale'+ cnt + '" placeholder="추가비용 입력">' +'</td>' +
											'<td colspan="2"></td>' +
										'</tr>'
									);
								});
								$(".minus0").on("click", function(){
									cnt--;
									if(cnt < 0){
										cnt = 0;
									}else if(cnt >= 0){
										$(".optiontbody tr:last").remove();
									}
								});
								//옵션갑 추가 삭제2
								$(document).on("click",".plus1", function() {
									cnt1++;
									$(".optiontbody1:last").append(
										'<tr align="center">' +
											'<td> <input style="display:none;" type="text" name="optionName1" placeholder="옵션명 입력"> </td>' +		
											'<td>' + '<input type="text" name="optionVal1' + cnt1 + '" placeholder="옵션값 입력">' +'</td>' +
											'<td>' + '<input type="number" name="plusSale1' + cnt1 + '" placeholder="추가비용 입력">' +'</td>' +
											'<td colspan="2"></td>' +
										'</tr>'
									);
								});
								$(document).on("click", ".minus1", function(){
									cnt1--;
									if(cnt1 < 0){
										cnt1 = 0;
									}else if(cnt1 >= 0){
										$(".optiontbody1 tr:last").remove();
									}
								});
								//옵션갑 추가 삭제3
								$(document).on("click",".plus2", function() {
									cnt2++;
									$(".optiontbody2:last").append(
										'<tr align="center">' +
											'<td> <input style="display:none;" type="text" name="optionName2" placeholder="옵션명 입력"> </td>' +		
											'<td>' + '<input type="text" name="optionVal2' + cnt2 + '" placeholder="옵션값 입력">' +'</td>' +
											'<td>' + '<input type="number" name="plusSale2' + cnt2 + '" placeholder="추가비용 입력">' +'</td>' +
											'<td colspan="2"></td>' +
										'</tr>'
									);
								});
								$(document).on("click", ".minus2", function(){
									cnt2--;
									if(cnt2 < 0){
										cnt2 = 0;
									}else if(cnt2 >= 0){
										$(".optiontbody2 tr:last").remove();
									}
								});
								//옵션갑 추가 삭제4
								$(document).on("click",".plus3", function() {
									cnt3++;
									$(".optiontbody3:last").append(
										'<tr align="center">' +
											'<td> <input style="display:none;" type="text" name="optionName3" placeholder="옵션명 입력"> </td>' +		
											'<td>' + '<input type="text" name="optionVal3' + cnt3 + '" placeholder="옵션값 입력">' +'</td>' +
											'<td>' + '<input type="number" name="plusSale3' + cnt3 + '" placeholder="추가비용 입력">' +'</td>' +
											'<td colspan="2"></td>' +
										'</tr>'
									);
								});
								$(document).on("click", ".minus3", function(){
									cnt3--;
									if(cnt3 < 0){
										cnt3 = 0;
									}else if(cnt3 >= 0){
										$(".optiontbody3 tr:last").remove();
									}
								});
								//옵션갑 추가 삭제5
								$(document).on("click",".plus4", function() {
									cnt4++;
									$(".optiontbody4:last").append(
										'<tr align="center">' +
											'<td> <input style="display:none;" type="text" name="optionName4" placeholder="옵션명 입력"> </td>' +		
											'<td>' + '<input type="text" name="optionVal4' + cnt4 + '" placeholder="옵션값 입력">' +'</td>' +
											'<td>' + '<input type="number" name="plusSale4' + cnt4 + '" placeholder="추가비용 입력">' +'</td>' +
											'<td colspan="2"></td>' +
										'</tr>'
									);
								});
								
								$(document).on("click", ".minus4", function(){
									cnt4--;
									if(cnt4 < 0){
										cnt4 = 0;
									}else if(cnt4 >= 0){
										$(".optiontbody4 tr:last").remove();
									}
								});
								
								//옵션박스 추가 삭제
								$("#addBtn").click(function() {
									num++;
									if(opCnt <= 4){
										opCnt++;
										opCtn = 4;
										$(".optionBox").last().append(
											'<table class="optionTable'+ num +'">' +
												'<tr align="center">' +
													'<td>옵션명</td>' +
													'<td>옵션값</td>' +
													'<td>추가비용</td>' +
													'<td align="center">' +
														'<span id="iconBox" class="glyphicon glyphicon-minus minus' + num + '"></span>' +
													'</td>' +
													'<td align="center">' +
														'<span id="iconBox" class="glyphicon glyphicon-plus plus' + num + '"></span>' +
													'</td>' +
												'</tr>' +
												'<tbody class="optiontbody' + num + '">' +
													'<tr align="center">' +
														'<td>' +
															'<input type="text" name="optionName'+ num +'" placeholder="옵션명 입력">' +
														'</td>' +		
														'<td>' + '<input type="text" name="optionVal'+ num +'0" placeholder="옵션값 입력">' +'</td>' +
														'<td>' + '<input type="number" name="plusSale'+ num +'0" placeholder="추가비용 입력">' +'</td>' +
														'<td colspan="2"></td>' +
													'</tr>' +
												'</tbody>' +
											'</table>'
										);
									}
								});
								
								$("#deleteBtn").on("click", function(){
									opCnt--;
									num--;
									if(opCnt < 0){
										opCnt = 0;
									}else if(opCnt >= 0){
										$(".optionBox").children().last().remove();
									}
								});
								
							});
						</script>



						<div class="listBox" >
							<div class="listTitle">
								<h2>상품이미지</h2>
							</div>
							<table class="imgBox">
								<tr>
									<td colspan="4" style="padding-left:30px;">대표이미지</td>
								</tr>
								<tr>
									<td></td>
									<td colspan="3">
										<div class="imgDiv">
											<img src="<%=request.getContextPath()%>/uploadSalesImage/<%=workPic.get(0).getchangeName()%>" id="titleImg" width="300" height="240">
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="4" style="padding-left:30px;">
										<p class="subtext">※ 권장 크기 : 640px * 640px</p>
									</td>
								</tr>
								<tr>
									<td colspan="4" style="padding-left:30px;">추가이미지</td>
								</tr>
								<tr align="center">
									<% for(int i = 1; i < 5; i++){ 
										if(workPic.size() > i) {%>
										<td>
											<div class="imgDiv">
												<img id="subImg<%=i%>" src="<%=request.getContextPath()%>/uploadSalesImage/<%=workPic.get(i).getchangeName()%>" style="width:180px;height:150px;">
											</div>
										</td>
										<%} else{%>		
										<td>
											<div class="imgDiv">
												<img id="subImg<%=i%>" src="" style="width:180px;height:150px;">
											</div>
										</td>
										<% } %>
									<%} %>
								</tr>
							</table>
						</div>
						<div id="fileArea">
							<% for(int i = 0; i < workPic.size(); i++) {%>
								<textarea id="wpId<%=i%>" name="wpId<%=i %>"><%=workPic.get(i).getWpid()%></textarea>
							<% } %>
							<input type="file" id="workImg0" name="workImg0" onchange="loadImg(this,1)" >
							<input type="file" id="workImg1" name="workImg1" onchange="loadImg(this,2)" >
							<input type="file" id="workImg2" name="workImg2" onchange="loadImg(this,3)" >
							<input type="file" id="workImg3" name="workImg3" onchange="loadImg(this,4)" >
							<input type="file" id="workImg4" name="workImg4" onchange="loadImg(this,5)" >
						</div>
						<script>
						
						$(function(){
							$("#fileArea").hide();
							
							$("#titleImg").click(function(){
								$("#workImg0").click();
							});
							$("#subImg1").click(function(){
								$("#workImg1").click();
							});
							$("#subImg2").click(function(){
								$("#workImg2").click();
							});
							$("#subImg3").click(function(){
								$("#workImg3").click();
							});
							$("#subImg4").click(function(){
								$("#workImg4").click();
							});
						});
						
							
							function loadImg(value, num){
								if(value.files && value.files[0]){
									var reader = new FileReader();
									reader.onload = function(e){
											
										switch(num){
										case 1 :
											$("#titleImg").attr("src", e.target.result);
											break;
										case 2 : 
											$("#subImg1").attr("src", e.target.result);
											break;
										case 3 : 
											$("#subImg2").attr("src", e.target.result);
											break;
										case 4 : 
											$("#subImg3").attr("src", e.target.result);
											break;
										case 5 : 
											$("#subImg4").attr("src", e.target.result);
											break;
										}
									}
									
									reader.readAsDataURL(value.files[0]);
								}
							}
						</script>
						
						
						
						<!-- 상품상세설명 -->
						<div class="listBox" style="height:100%; padding-botton:50px;">
							<div class="listTitle">
								<h2>상품상세설명</h2>
							</div>
							<div style="padding:30px 30px 30px 30px;">
						 		<textarea name="workContent" id="summernote">
						 		<%=work.getWorkContent()%>
						 		</textarea>
							</div>
						</div>
						
						<script>
					/*	$('#summernote').summernote({
					        height : 400,
					        onImageUpload : function(files, editor, welEditable) {
					            sendFile(files[0], editor, welEditable);
					        },
					        lang : 'ko-KR'
					        
				        	callbacks: {
								onImageUpload: function(files) {
									//your upload process

								}

							}
					    });*/
						
						$(document).ready(function() {
						      $('#summernote').summernote({
						        height: 400,
						        minHeight: null,
						        maxHeight: null,
						        focus: true,
						         callbacks: {
						        	 /*  onImageUpload: function(files, editor, welEditable) {
						            for (var i = files.length - 1; i >= 0; i--) {
						              sendFile(files[i], this);
						            }
						          }*/

						        }
						      });
						    });
						    
						   /* function sendFile(file, el) {
						      var form_data = new FormData();
						      form_data.append('file', file);
						      $.ajax({
						        data: form_data,
						        type: "POST",
						        url: 'InsertContentsImageServlet.wo',
						        cache: false,
						        contentType: false,
						        enctype: 'multipart/form-data',
						        processData: false,
						        success: function(url) {
						          $(el).summernote('editor.insertImage', url);
						          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
						        }
						      });
						    }
*/


				 		</script>

						
						
						<div align="center">
							<button type="reset" class="all-btn" style="width:150px;">취소</button>
							<button type="submit" class="all-btn" style="width:150px;">수정하기</button>
						</div>
						




					</form>
					
					
						
						

						
					
					
						
						
				</section>
			</div>
		</div>
		<%@ include file="authorMenuBarsub.jsp" %>
	</div>
			<!-- <div style="height:300px;"></div> -->
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
</body>
</html>