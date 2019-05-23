<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,
				 com.kh.semi.funding.model.vo.*,
				 com.kh.semi.member.model.vo.*" %>
<%
	Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	ArrayList<HashMap<String, Object>> fundInfoList = 
				(ArrayList<HashMap<String, Object>>) request.getAttribute("fundInfoList");
	ArrayList<WorkPic> fileList = (ArrayList<WorkPic>) request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수작 - 2차펀딩작품등록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<%@ include file="stylesheet/eroll.html" %>
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
					<form id="salesInsert" action="" method="post">
					<!-- 기본정보 -->
						<div class="listBox">
							<div class="listTitle">
								<h2>등록한 펀딩 정보 확인</h2>
							</div>
							<div class="listContents">
							<div class="row" style="margin-bottom:0px;">
								<div class="col-sm-4">
									<img src="<%= request.getContextPath() %>/uploadFundingGoodsImg/<%= fileList.get(0).getChangeName() %>"
													 style="height:80%; width:100%;" id="fundImg" name="fundImg">
								</div>
								<div class="col-sm-8">
									<div class="row">
										<table>
											<tr>
												<td colspan="5">
													<label class="form-control"><%= fundInfoList.get(0).get("workName") %></label>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<label class="pull-left">목표 금액(원)</label>
													<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("minVoo") %>" readonly>
												</td>
												<td colspan="2">
													<label class="pull-left">최대 목표 금액(원)</label>
													<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("maxVoo") %>" readonly>
												</td>
											</tr>
											<tr>
												<td>
													<label class="pull-left">펀딩 일수</label>
													<input type="text" class="form-control" value="<%= fundInfoList.get(0).get("funDate") %>" readonly>
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
													<label class="pull-left">배송예정일</label>
													<input type="date" class="form-control" id="deliDate" name="deliDate">
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
				
				<!-- 계좌 인증 -->
					<div class="listBox">
						<div class="listTitle">
							<h2>입금 계좌</h2>
						</div>
						<div class="listContents">
							<div class="row">
								<p class="subtext">
									※ 후원금을 수령할 본인 계좌를 입력해 주세요.
								</p>
							</div>
							<div class="row">
							
								<table>
									<tr>
										<td>은행명</td>
										<td colspan="2">
											<select name="bankcode" id="bankcode">
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
									</tr>
									<tr>
										<td>예금주</td>
										<td colspan="2">
											<input type="text" class="form-control" name="accpnm" id="accpnm"
												   placeholder="계좌의 예금주명과 일치해야 합니다." readonly
												   value="<%= loginUser.getMemberName() %>">
										</td>
									</tr>
									<tr>
										<td>주민등록번호 앞자리</td>
										<td colspan="2">
											<input type="text" placeholder="주민등록번호 앞 6자리"
													name="birthDay" id="birthDay">
										</td>
									</tr>
									<tr>
										<td>계좌번호</td>
										<td>
											<input type="text" class="form-constrol" placeholder="'-'없이 입력해 주세요."
												   name="accnum" id="accnum">
										</td>
										<td>
											<button class="all-btn btn btn-primary btn-xs" id="confirmacc" onclick="fnSearchAccessToken()">계좌 인증</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				<!-- 계좌 인증 -->
				
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
				<!-- 협업여부 -->		
				<!-- <div class="listBox">
						<div class="listTitle">
							<h2>제작자 사전모집</h2>
						</div>
						<div class="listContents">
							<p class="subtext"> 
								※ 프로젝트 펀딩 공개 전 프로젝트에 함께 참여할 작가들을 모집할 수 있습니다. <br>
								신청 내역은 따로 볼 수 있으면 지원한 작가에 대해 수락, 거절이 가능합니다. <br>
								지원 시 필요한 자격 조건 또는 주의 사항에 대해 상세히 적어주세요.
							</p>
							<div class="listContents">
								<textarea id="projectComment" name="projectComment" placeholder="Comment" rows="10" cols="50"></textarea><br>
							</div>
						</div>
					</div> -->
				<!-- 협업여부 -->	
				
				<div align="center">
					<button class="all-btn"style="width: 150px;" type="submit" id="enrollFundingGoods2">추가정보 등록</button>
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
			
		});
	});

	function inputFcFinish() { //펀딩 종료일 지정
		console.log("시작일" + $("#fcStart").val());
		var term = parseInt(<%= fundInfoList.get(0).get("funDate") %> + "");
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
		}
	</script>
</body>
</html>