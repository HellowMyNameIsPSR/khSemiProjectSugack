<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.member.model.vo.*"%>
<% Member member = (Member)request.getSession().getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 개인정보수정</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<%@ include file="../assets/css/author.html" %>
<style>
	.authorInfo {
		border:2px solid lightgray;
		margin: 20px 0px 20px 0px;
		box-shadow:2px 2px lightgray;
	}
	.authorInfo tr{ 
		/* border:none; */
		padding:0 auto;
	}
	
	.authorInfo tr>td{
		background:white;
		height:80px;
		
	}
	.addressTable tr>td{
		background: radial-gradient(white, #F6FFFF) fixed;
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
					<a href="/sg/views/author/authorHome.jsp" class="logo"> <span
						class="glyphicon glyphicon-home"></span> &nbsp; <strong
						style="font-size: 20px;">HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main" style="border-bottom:50px;">
						<h2>판매자 정보/입력 수정</h2>
					</header>
					<!-- Contents area -->
						
					<div class="deleteDiv" style="margin-bottom:20px; padding:0px 20px 0px 20px;">
						<table class="deleteTable">
							<tr>
								<td colspan="2"style="border-right:none;border-left:none;border-top:none;font-size:20px;font-weight:bold;">
									판매자 정보
								</td>
							</tr>
							<tr>
								<td style="border-right:none;border-left:none;width:200px">
									이름
								</td>
								<td style="border-right:none;border-left:none;">
									<%= member.getMemberName() %>
								</td>
							</tr>
							<tr>
								<td style="border-right:none;border-left:none;width:200px">
									이메일
								</td>
								<td style="border-right:none;border-left:none;">
									<%= member.getEmail() %>
								</td>
							</tr>
							<tr>
								<td style="border-right:none;border-left:none;">
									사업장 이름
								</td>
								<td id="addName" style="border-right:none;border-left:none;">
									
								</td>
							</tr>
							<tr>
								<td style="border-right:none;border-left:none;">
									주소
								</td>
								<td id="addressN" style="border-right:none;border-left:none;">
									
								</td>
							</tr>
							<tr>
								<td style="border-right:none;border-left:none;">
									연락처 1
								</td>
								<td id="phone01" style="border-right:none;border-left:none;">
									
								</td>
							</tr>
							<tr>
								<td style="border-right:none;border-left:none;">
									연락처 2
								</td>
								<td id="phone02" style="border-right:none;border-left:none;">
									
								</td>
							</tr>
							<tr>
								<td colspan="2" style="border-right:none;border-left:none;border-bottom:none;text-align:center">
									<button type="button" style="width:150px;" class="all-btn" data-toggle="modal" data-target="#myModal" type="button" class="all-btn">새 주소입력</button>
								</td>
							</tr>
						</table>
					</div>
					
					
					
					
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h2 class="modal-title">주소 입력</h2>
								</div>
								<div class="modal-body">
									<table class="addressTable">
										<tr>
											<td>
												<label>사업장 명</label>
											</td>
											<td>
												<input type="text" name="addressName" id="addressName">
											</td>
											<td></td>
										</tr>
										<tr>
											<td>
												<label>우편번호</label>
											</td>
											<td>
												<input type="text" id="postCode" name="postCode" placeholder="우편번호">
											</td>
											<td>
												<input type="button" class="all-btn"onclick="searchAddress()" value="주소검색">
											</td>
										</tr>
										<tr>
											<td></td>
											<td>
												<input type="text" id="address" name="address" placeholder="주소">
											</td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td>
												<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
											</td>
											<td></td>
										</tr>
										<tr>
											<td>
												<label>연락처</label>
											</td>
											<td>
												<input type="tel" name="phone1" id="phone1" class="form-control">
											</td>
											<td></td>
										</tr>
										<tr>
											<td>
												<label>연락처2</label>
											</td>
											<td>
												<input type="tel" name="phone2" id="phone2" class="form-control">
											</td>
											<td></td>
										</tr>
									</table>									
								</div>
								<div class="modal-footer" style="text-align:center;">
									<button id="submit" class="all-btn" style="width:100px;">저장</button>
									<button id="close" class="all-btn" style="width:100px;">닫기</button> 
								</div>
							</div>
						</div>
					</div>
			
						
					<!-- <div class="deleteDiv" style="margin-bottom:20px;">
						<table class="deleteTable">
							<tr>
								<td colspan="2"><h2
										style="margin: 0 auto; padding-left: 20px">정산관리</h2></td>
							</tr>
							<tr>
								<td  style="font-weight:bold;vertical-align:middle;font-size:20px;width:180px;text-align:center;">대금입금계좌</td>
								<td>
									<input style="display:inline;width: 100px;" type="text" maxlength="13"name="userId" id="userId" value="">
									&nbsp;&nbsp;
									<button type="button">계좌수정</button>
								</td>
							</tr>
						</table>
					</div> -->


					<script>
			            function searchAddress() {
			                new daum.Postcode({
			                    oncomplete: function(data) {
			                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                        var addr = ''; // 주소 변수
			                        var extraAddr = ''; // 참고항목 변수
			
			                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                            addr = data.roadAddress;
			                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                            addr = data.jibunAddress;
			                        }
			
			                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                        if(data.userSelectedType === 'R'){
			                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                                extraAddr += data.bname;
			                            }
			                            // 건물명이 있고, 공동주택일 경우 추가한다.
			                            if(data.buildingName !== '' && data.apartment === 'Y'){
			                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                            }
			                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                            if(extraAddr !== ''){
			                                extraAddr = ' (' + extraAddr + ')';
			                            }
			                        }
			
			                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                        document.getElementById('postCode').value = data.zonecode;
			                        document.getElementById("address").value = addr;
			                        // 커서를 상세주소 필드로 이동한다.
			                        document.getElementById("detailAddress").focus();
			                    }
			                }).open();
			            }
			            
			           $(function(){
			        	   console.log($("#addressName").val());
		            		console.log($("#addressName").val());
			            	$("#submit").click(function(){
			            		var addressName = $("#addressName").val();
			            		var postCode = $("#postCode").val();
			            		var address = $("#address").val();
			            		var detailAddress = $("#detailAddress").val();
			            		var phone1 = $("#phone1").val();
			            		var phone2 = $("#phone2").val();
			            		
			            		$.ajax({
			            			url:"<%=request.getContextPath()%>/insertAddress.wo",
			            			data:{addressName:addressName, postCode:postCode, address:address, detailAddress:detailAddress,
			            				 phone1:phone1, phone2:phone2},
			            			type:"post",
			            			success:function(data){
			            				if(data == "ok"){
			            					opener.document.location.reload();
											self.close();            					
			            				}else if(data == "manyAddress"){
			            					alert("주소는 3개까지만 저장 가능합니다.");
			            				}else {
			            					alert("다시입력해 주세요");
			            				}
			            			},
			            			error:function(data){
			            				console.log("에러발생!");
			            			}
			            		});
			            	});
			            	$("#close").click(function(){
			            		window.close();
			            	});
			            });
			           $(document).ready(function() {
				           $.ajax({
								url:"<%=request.getContextPath()%>/selectWorkAddress.wo",
								type:"get",
								success:function(data){
									console.log(data.phone1);
									$("#addressN").append("( " + data.add1 + " ) " + data.add2 + " " + data.add3);
									$("#addName").append(data.addressName);
									$("#phone01").append(data.phone1);
									$("#phone02").append(data.phone2);
								}
							});
			           });
			        </script>





				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>
			
</body>
</html>