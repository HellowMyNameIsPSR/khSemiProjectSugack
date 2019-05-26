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
    <%@ include file="../author/stylesheet/eroll.html" %>
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
							<th colspan="2"><label class="form-control" style="text-align:center;">상태</label></th>
						</tr>
						<tr>
							<td>1차</td>
							<td id="applystate1"><%= applyHistory.get(index).getApplyStat1() %></td>
							<% if(applyHistory.get(index).getApplyStat1().equals("거부")) { %>
								<td><button id="reApply1" type="button" class="all-btn pull-right " 
											style="background:red; color:white;"
											data-toggle="modal" data-target="#myModal">재신청</button></td>
							<% } %>
						</tr>
						<tr>
							<td>2차</td>
							<td colspan="2"><%= applyHistory.get(index).getApplyStat2() %></td>
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
			      			<td colspan="2"><label class="form-control" style="background:#ccd9ff;">2차 신청 서류 첨부해 주세요.</label></td>
			      			<td colspan="3">
			      				<input type="text" value="사업자 등록증" class="form-control" id="businessLisenceArea">
			      			</td>
			      		</tr>
			      		<tr>
			      			<td colspan="2">
			      				<input type="text" value="구매 안전 서비스 관리 이용 확인증" class="form-control" id="confirmArea">
			      			</td>
			      			<td colspan="3">
			      				<input type="text" value="통신판매업 신고증" class="form-control" id="declarationArea">
			      			</td>
			      		</tr>
			      		<tr>
			      			<td colspan="5"><label class="form-control" style="background:#ccd9ff;">계좌를 인증해 주세요</label></td>
			      		</tr>
			      		<tr>
			      			<td><strong>은행명</strong></td>
			      			<td>
								<select name="bankcode" id="bankcode" class="form-control">
									<option value=''>선택하세요</option>
										<option value='003'>기업은행</option>
										<option value='004'>국민은행</option>
										<option value='011'>농협중앙회</option>
										<option value='012'>단위농협</option>
										<option value='020'>우리은행</option>
										<option value='031'>대구은행</option>
										<option value='005'>외환은행</option>
										<option value='023'>SC제일은행</option>
										<option value='032'>부산은행</option>
										<option value='045'>새마을금고</option>
										<option value='027'>한국씨티은행</option>
										<option value='034'>광주은행</option>
										<option value='039'>경남은행</option>
										<option value='007'>수협</option>
										<option value='048'>신협</option>
										<option value='037'>전북은행</option>
										<option value='035'>제주은행</option>
										<option value='064'>산림조합</option>
										<option value='071'>우체국</option>
										<option value='081'>하나은행</option>
										<option value='088'>신한은행</option>
										<option value='209'>동양종금증권</option>
										<option value='243'>한국투자증권</option>
										<option value='240'>삼성증권</option>
										<option value='230'>미래에셋</option>
										<option value='247'>우리투자증권</option>
										<option value='218'>현대증권</option>
										<option value='266'>SK증권</option>
										<option value='278'>신한금융투자</option>
										<option value='262'>하이증권</option>
										<option value='263'>HMC증권</option>
										<option value='267'>대신증권</option>
										<option value='270'>하나대투증권</option>
										<option value='279'>동부증권</option>
										<option value='280'>유진증권</option>
										<option value='287'>메리츠증권</option>
										<option value='291'>신영증권</option>
										<option value='238'>대우증권</option>
								</select>
							</td>
							<td><strong>예금주명</strong></td>
							<td colspan="2">
								<input type="text" class="form-control" name="accpnm" id="accpnm"
									   placeholder="계좌의 예금주명과 일치해야 합니다.">
							</td>
			      		</tr>
			      		<tr>
			      			<td><strong>주민등록번호 앞자리</strong></td>
							<td>
								<input type="text" placeholder="주민등록번호 앞 6자리" class="form-control"
											name="birthDay" id="birthDay">
							</td>
							<td><strong>계좌번호</strong></td>
							<td>
								<input type="text" class="form-constrol form-control" placeholder="'-'없이 입력해 주세요."
									   name="accnum" id="accnum">
							</td>
							<td>
								<button class="all-btn btn btn-primary btn-xs" id="confirmacc" type="button"
								onclick="fnSearchAccessToken()">계좌 인증</button>
							</td>
			      		</tr>
			      	</table>
				<% } %>
				</td>
			</tr>
			<tr>
				<td colspan="5"><hr><td>
			</tr>
			<tr>
				<% if(applyHistory.get(index).getApplyStat1().equals("승인")) { %>
					<td colspan="5" >
						<button class="btn  all-btn whenApply1StatusSuccess" type="submit" id="applyBtn2"
								style="margin-left:auto; margin-right:auto; margin:0 auto;">신청하기</button>
					</td>
				<% } %>
			</tr>    
		</table>
		<!-- 계좌 인증 관련 -->
				<table id="accountCheck">
					<colgroup>
						<col style="width: 180px" />
						<col style="width: *" />
					</colgroup>
					<tbody>
						<form name="authCodeFrm" id="authCodeFrm" method="GET"
							  action="https://testapi.open-platform.or.kr/oauth/2.0/authorize">
							<tr>
								<th><!-- <span class="ess">Client ID</span> --></th>
								<td> <!-- API KEY(키) -->
									<span><input type="hidden" id="client_id" name="client_id" style="width: 200px"
												 value="l7xx8184a1dcddbe407186a6eb87502014cf"></span>
								</td>
							</tr>
						</form>
						<tr>
							<th><!-- <span>Client Secret</span> --></th>
							<td> <!-- API Servlet(비번) -->
								<span><input type="hidden" id="client_secret" name="client_secret" style="width: 200px"
											 value="5145a0006d1e492e84160b33a178d005"></span>
							</td>
						</tr>
						<tr>
							<th><!-- <span>Access Token</span> --></th>
							<td>
								<span><input type="hidden" id="access_token" name="access_token" style="background: #e0e0e0"></span>
								<!-- <button type="button" onclick="fnSearchAccessToken()">토큰발급</button> -->
							</td>
						</tr>
						<tr>
							<th><!-- <span>은행코드</span> --></th>
							<td>
								<span><input type="hidden" class="txt" id="bank_code_std" name="bank_code_std"></span>
							</td>
						</tr>
						<tr>
							<th><!-- <span>계좌번호</span> --></th>
							<td><span><input type="hidden" class="txt" id="account_num" name="account_num"></span></td>
						</tr>
						<tr>
							<th><!-- <span>예금주 생년월일</span> --></th>
							<td><span><input type="hidden" class="txt" id="account_holder_info" name="account_holder_info"/></span>
						</tr>
						<tr>
							<th><!-- <span>요청일시</span> --></th>
							<td>
								<span style="width: 200px">
									<input type="hidden" class="txt" id="tran_dtime" title="요청일시 입력" name="tran_dtime" />
								</span>
								<!-- <button type="button" onclick="fnSearchRealName()">계좌실명조회</button> -->
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 계좌 인증 관련 -->	
	</div>	
</div>
<div id="file">
	<input type="file" name="businessLicense" id="businessLicense" onchange="loadFile(this, 1);" style="overflow:hidden; opacity:0;">
	<input type="file" name="confirm" id="confirm" onchange="loadFile(this, 2);" style="overflow:hidden;opacity:0;">
	<input type="file" name="declaration" id="declaration" onchange="loadFile(this, 3);" style="overflow:hidden;opacity:0;">
</div>
<%@ include file="../main/footer.jsp" %>
</form>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
          <h4 class="modal-title">재 신청 파일 전송</h4>
        </div>
        <div class="modal-body">
        <form action="<%= request.getContextPath() %>/insertReApply.at" method="post" encType="multipart/form-data">
	       	  <input type="text" value="1차 입점 서류 첨부" class="form-control" id="applyFileArea" readonly>
	       	  <input type="file" name="attachApplyFile" onchange="uploadApplyFile(this);"
	       	  	 	 id="attachApplyFile" style="overflow:hidden;opacity: 0;">
	        </div>
	        <div class="modal-footer">
	       	  <button type="submit" class="all-btn">전송하기</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
       	 </form>
      </div>
    </div>
  </div>	
	<script>
		$(function(){
			$("#applyFileArea").click(function(){ //1차 입점 서류 버튼 클릭
	   	  		console.log("1차 입점 서류 버튼 클릭");
	   	  		$("#attachApplyFile").click();
	   	  	});
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
			$("#reApply1").click(function(){
				
			});
		});
		function uploadApplyFile(value){
	  		if(value.files && value.files[0]){
	  			var reader = new FileReader();
	  			reader.onload = function(e) {
	  				$("#applyFileArea").val($("#attachApplyFile").val());
	  				$("#applyFileArea").attr("src", e.target.result);
	  			}
	  			reader.readAsDataURL(value.files[0]);
	  		} //end if
	  	}//end method
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
	<script type="text/javascript">
		$.support.cors = true;
		var reqDate = new Date();
		var year = reqDate.getFullYear() +"";
		var month = (reqDate.getMonth() + 1) > 10?reqDate.getMonth() + 1 + "":"0" + (reqDate.getMonth() + 1);
		var date = (reqDate.getDate() > 10?reqDate.getDate() + "":"0" + reqDate.getDate());
		var hour = reqDate.getHours() > 9?reqDate.getHours() + "":"0" + reqDate.getHours();
		var min = reqDate.getMinutes() > 10?reqDate.getMinutes() + "":"0" + reqDate.getMinutes();
		var sec = reqDate.getSeconds() > 10?reqDate.getSeconds() + "":"0" + reqDate.getSeconds();
		
		var currentTime = year + month + date + hour + min + sec;
		console.log(currentTime)
		$("#tran_dtime").val(currentTime); //요청일시
		/* 사용자인증 Access Token 획득 */
		function fnSearchAccessToken() {
			$("#bank_code_std").val($("#bankcode").val()); //은행코드
			$("#account_num").val($("#accnum").val()); //계좌번호
			var client_id = $("#client_id").val(); //API KEY
			var client_secret = $("#client_secret").val(); //API_SECRET
			var grant_type = "client_credentials";
			var scope = "oob";
			$.ajax({
				//url: "/tpt/test/getOauthToken",
				url : "https://testapi.open-platform.or.kr/oauth/2.0/token",
				type : "POST",
				//cache: false,
				contenType : "application/json",
				data : {
					"client_id" : client_id,
					"client_secret" : client_secret,
					"grant_type" : grant_type,
					"scope" : scope
				},
				dataType : "json",
				success : function(data, data2, data3) {
					var list = JSON.parse(data3.responseText);
					$("#access_token").val(list.access_token);
					$("#user_seq_no").val(list.user_seq_no);
					fnSearchRealName();
				},
				error : function(data, data2, data3) {
					alert('error!!!');
				}
			});
			//return false;
			
		}
		/* 계좌실명조회API */
		function fnSearchRealName() {
			var bank_code_std = $("#bank_code_std").val();
			var account_num = $("#account_num").val();
			var account_holder_info = $("#birthDay").val();
			var tran_dtime = $("#tran_dtime").val();
			var access_token = "Bearer " + $("#access_token").val();
			var resData = {
				"bank_code_std" : bank_code_std,
				"account_num" : account_num,
				"account_holder_info" : account_holder_info,
				"tran_dtime" : tran_dtime
			};
			$
					.ajax({
						url : "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name",
						beforeSend : function(request) {
							request.setRequestHeader("Authorization",
									access_token);
						},
						type : "POST",
						data : JSON.stringify(resData),
						dataType : "json",
						success : function(data, data2, data3) {
							console.log(data)
							if (data.account_holder_name == $("#accpnm").val()) {

								$("#sbm-flag").attr("checked", true);
								$("#sbm-ok").show();
								$("#sbm-no").hide();
								var checkacc = "인증됨";
								var pro_no = $
								{
									pro_no
								}
								;
								var bankcode = $('[name=bankcode]').val();
								var accpnm = $('[name=accpnm]').val();
								var accnum = $('[name=accnum]').val();

								
								//alert('계좌 인증에 성공하셨습니다.');
								$("#confirmacc").attr("disabled", "disabled").css({
									"background" : "#00b300",
									"color" : "white"
								}).text("계좌 인증 성공");
								$("#sbm-flag").attr("checked", true);
										$("#sbm-ok").show();
								$("#sbm-no").hide();
								$("[name=accpnm]").attr("readonly",
												"readonly");
								$("[name=accnum]").attr("readonly",
												"readonly");
								$("[name=bankcode]").not(":selected")
												.attr("disabled", "disabled");
								accCheck = true;
							} else {
								alert('계좌 인증에 실패했습니다.');
								$("#confirmacc").css({
									"background" : "#ff0000",
									"color" : "white"
								}).text("계좌 인증 성공");
								$("#confirmacc").text("재인증");
								$("#sbm-flag").attr("checked", true);
								$("#sbm-ok").hide();
								$("#sbm-no").show();
								accCheck = false;
							}
						},
						error : function(data, data2, data3) {
							alert('error!!!');
						}
					});
			//return false;
		}
	</script>	
</body>
</html>