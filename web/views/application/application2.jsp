<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>입점신청 내역</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <%@ include file="../assets/css/allCss.html" %>
    <script src="js/applyBtn.js"></script>
	<style>
		h2{
			text-align:center;
		}
    	.readTable {
    		margin-left:auto; 
    		margin-right:auto; 
    		margin:0 auto; 
    		text-align:center;
    		border-spacing:5px;
    		border-collapse:separate;
    		max-width:100%;
    		bakcground-color:transparent;
    	}
    </style>
</head>
<body>
	<!-- 메뉴 -->
	<%@ include file="../main/mainMenubar.jsp" %>
	<h2>입점 신청</h2>
	<div class="container-fluid bg-grey">
	<table class="readTable">
			<tr>
				<td colspan="3">
					작가 정보
				</td>
			</tr>
			<tr>
				<td rowspan="6">
					<img src="../images/pic01.jpg" style="width:100%;" id="brandImg" name="brandImg">
				</td>
			</tr>
			<tr>
				<td>
					<input class="form-control" id="name" name="name" placeholder="Name" type="text" readonly>
				</td>
				<td>
					<input class="form-control" id="brandName" name="brandName" placeholder="Brand Name" type="text" readonly>
				</td>
			</tr>	
			<tr>
				<td colspan="2">
					<input class="form-control" id="email" name="email" placeholder="Email" type="email" readonly>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label class="form-control" id="category">공예유형</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" readonly></textarea>
				</td>
			</tr>  
			<tr>
				<td colspan="2">
					<label class="form-control" id="fileName">파일명</label>
				</td>
			</tr>    	
		</table>	
	</div>
	<div id="contact" class="container bg-grey">
	<div class="row">
	<!-- 입점 신청 상태 -->
	<div class="col-sm-4 form-group">
		<table class="readTable" style="border:1px solid #b3b3cc; text-align:center; width:80%;">
			<tr>
				<th><label class="form-control" style="text-align:center;">차수</label></th>
				<th><label class="form-control" style="text-align:center;">상태</label></th>
			</tr>
			<tr>
				<td>1차</td>
				<td>-</td>
			</tr>
			<tr>
				<td>2차</td>
				<td>-</td>
			</tr>
		</table>
	</div>
	<!-- 2차 입점 신청 파일 -->
      <div class="col-sm-6 form-group">
      	 <table class="readTable">
      		<tr>
      			<td colspan="5"><label class="form-control">2차 신청 서류 첨부</label>
      		</tr>
      		<tr>
      			<td colspan="2">
      				<input type="text" id="account" name="account" placeholder="계좌번호" class="form-control">
      			</td>
      			<td><button id="accountCheck" class="btn pull-right btn-default">계좌인증</button></td>
      			<td colspan="3">
      				<label class="form-control">사업자 등록증
			       		<input type="file" name="attachBrandFile" id="attachBrandFile" style="overflow:hidden; opacity:0;">
			       	</label>
      			</td>
      		</tr>
      		<tr>
      			<td colspan="3">
      				<label class="form-control">구매 안전 서비스 관리 이용 확인증
			       		<input type="file" name="attachBrandFile" id="attachBrandFile" style="overflow:hidden;opacity:0;">
			       	</label>
      			</td>
      			<td colspan="3">
      				<label class="form-control">통신판매업 신고증
			       		<input type="file" name="attachBrandFile" id="attachBrandFile" style="overflow:hidden;opacity:0;">
			       	</label>
      			</td>
      		</tr>
      	</table>
      </div>
     </div>
      
       <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn pull-right all-btn" type="submit" id="applyBtn2">신청하기</button>
        </div>
      </div>
	</div>					
</body>
</html>