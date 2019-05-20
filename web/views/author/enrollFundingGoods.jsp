<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<section id="contents">
					<header class="main">
						<h2>펀딩 작품등록</h2>
					</header>
					<!-- Contents area -->

					<form id="salesInsert" action="" method="post">

						<div class="listBox">
							<div class="listTitle">
								<h2>카테고리</h2>
							</div>
							<div class="listContents">
								<div>
									<button onclick="">카테고리명 검색</button>
									<button onclick="">카테고리명 선택</button>
								</div>
								<div>
									<table class="searchBox">
										<tr>
											<td><input type="text" placeholder="카테고리명 입력"
												style="width: 100%;"></td>
											<td width="7%"><span class="glyphicon glyphicon-search"></span></td>
										</tr>
									</table>
								</div>
								<p class="subtext">※ 카테고리에 맞지 않는 경우 심사에 불이익이 있을 수 있습니다.</p>
							</div>
						</div>


						<div class="listBox">
							<div class="listTitle">
								<h2>프로젝트 제목</h2>
							</div>
							<div class="listContents">
								<p class="subtext">※프로젝트 제목은 제작하고자 하는 작품명 혹은 프로젝트 주제가 잘 드러나도록 
								적어 주시는 것이 좋습니다. 짥은 제목은 모바일 환경 혹은 SMS에 사용됩니다.</p>
								<div class="">
									<input type="text" placeholder="프로젝트 명" style="width: 100%;">
								</div>
							</div>
						</div>

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


						<div class="listBox">
							<div class="listTitle">
								<h2>프로젝트 설명</h2>
							</div>
							<div class="listContents">
								<textarea id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
							</div>
						</div>
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
						

					</form>
						<div align="center">
							<button class="all-btn" style="width: 150px;" type="submit" id="enrollfunding1">Next > </button>
						</div>
				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp"%>
	</div>
	<script>
		$(function(){
			$("#enrollfunding1").click(function(){
				location.href = "<%= request.getContextPath() %>/views/author/enrollFundingGoods2.jsp";
			});
		});
	</script>
</body>
</html>