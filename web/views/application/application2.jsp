<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.author.model.vo.*,
				java.util.*" %>
<%
	ArrayList<ApplyHistory> applyHistory
				= (ArrayList<ApplyHistory>) request.getAttribute("applyHistory");
	Integer index = (Integer) request.getAttribute("index"); 
%>
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
	<h2>입점 신청 내역</h2>
<form action="<%= request.getContextPath() %>/insertApply2.at" method="post" encType="multipart/form-data">
	<div class="container-fluid bg-grey">
		<div class="row">
			<table class="readTable">
			<tr>
				<td colspan="3">
					<label class="form-control" style="background:#ccd9ff;">1차 입점 신청 내역</label>
				</td>
			</tr>
			<tr>
				<td rowspan="6">
					<img src="<%= request.getContextPath() %>/uploadApply/<%= applyHistory.get(index).getChangeName() %>" 
					style="height:80%;" id="brandImg" name="brandImg">
				</td>
			</tr>
			<tr>
				<td> <!--작가 이름 -->
					<input class="form-control" type="text" readonly id="memberName" name="memberName"
					value="<%= applyHistory.get(index).getMamberName() %>">
				</td>
				<td> <!--브랜드 명-->
					<input class="form-control" id="brandName" name="brandName" type="text" readonly
					value="<%= applyHistory.get(index).getAuthorName() %>">
				</td>
			</tr>	
			<tr>
				<td colspan="2"> <!-- 이메일 -->
					<input class="form-control" id="email" name="email" type="email" readonly
					value="<%= applyHistory.get(index).getEmail() %>">
				</td>
			</tr>
			<tr>
				<td><!-- 작가 공예 유형 -->
					<input class="form-control" id="authorType" name="authorType" type="text" readonly
					value="<%= applyHistory.get(index).getMaterial() %>">
				</td>
				<td><!-- 가입일 -->
					<input class="form-control" id="authorDate" name="authorDate" type="text" readonly
					value="<%= applyHistory.get(index).getApplyDate() %>">
				</td>
			</tr>
			<tr>
				<td colspan="2"> <!-- 가입내용 -->
					<textarea class="form-control" id="comments" name="comments" rows="5" readonly><%= applyHistory.get(index).getApplyContent() %></textarea>
				</td>
			</tr> 
			<tr>
				<td colspan="2">
					<table class="readTable" style="border:1px solid #b3b3cc; text-align:center; width:100%;">
						<tr>
							<th><label class="form-control" style="text-align:center;">차수</label></th>
							<th><label class="form-control" style="text-align:center;">상태</label></th>
						</tr>
						<tr>
							<td>1차</td>
							<td><%= applyHistory.get(index).getApplyStat1() %></td>
						</tr>
						<tr>
							<td>2차</td>
							<td><%= applyHistory.get(index).getApplyStat2() %></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<!-- 1차 입점 신청이 성공 처리 되었을 때 -->
				<% if(applyHistory.get(index).getApplyStat1().equals("승인")) { %>
					<table class="readTable" style="width:100%;">
			      		<tr>
			      			<td colspan="5"><label class="form-control" style="background:#ccd9ff;">2차 신청 서류 첨부</label></td>
			      		</tr>
			      		<tr>
			      			<td>
			      				<input type="text" id="account" name="account" placeholder="계좌번호" class="form-control">
			      			</td>
			      			<td><button id="accountCheck" class="btn pull-right btn-default">계좌인증</button></td>
			      			<td colspan="2">
			      				<input type="text" value="사업자 등록증" class="form-control" id="businessLisenceArea">
			      			</td>
			      		</tr>
			      		<tr>
			      			<td colspan="2">
			      				<input type="text" value="구매 안전 서비스 관리 이용 확인증" class="form-control" id="confirmArea">
			      			</td>
			      			<td colspan="2">
			      				<input type="text" value="통신판매업 신고증" class="form-control" id="declarationArea">
			      			</td>
			      		</tr>
			      	</table>
				<% } %>
				</td>
			</tr>
			<tr>
				<% if(applyHistory.get(index).getApplyStat1().equals("승인")) { %>
					<td colspan="3">
						<button class="btn pull-right all-btn whenApply1StatusSuccess" type="submit" id="applyBtn2">신청하기</button>
					</td>
				<% } %>
			</tr>    
		</table>	
	</div>	
</div>
<div id="file">
	<input type="file" name="businessLicense" id="businessLicense" onchange="loadFile(this, 1);" style="overflow:hidden; opacity:0;">
	<input type="file" name="confirm" id="confirm" onchange="loadFile(this, 2);" style="overflow:hidden;opacity:0;">
	<input type="file" name="declaration" id="declaration" onchange="loadFile(this, 3);" style="overflow:hidden;opacity:0;">
</div>
<%@ include file="../main/footer.jsp" %>
</form>	
	<script>
		$(function(){
			$("#file").hide();
			$("#businessLisenceArea").click(function(){
				$("#businessLicense").click();
			});
			$("#confirmArea").click(function(){
				$("#confirm").click();
			});
			$("#declarationArea").click(function(){
				$("#declaration").click();
			});
		});
		function loadFile(value, num) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					switch(num){
						case 1:
							$("#businessLicense").attr("src", e.target.result);
							$("#businessLisenceArea").val($("#businessLicense").val());
							break;
						case 2:
							$("#confirm").attr("src", e.target.result);
							$("#confirmArea").val($("#confirm").val());
							break;
						case 3:
							$("#declaration").attr("src", e.target.result);
							$("#declarationArea").val($("#declaration").val());
							break;
					}
				} //end func(e)
				reader.readAsDataURL(value.files[0]);
			} //end if
		} //end func
	</script>	
</body>
</html>