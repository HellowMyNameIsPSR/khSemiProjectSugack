<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String addressName = request.getParameter("addressName");
	String address = request.getParameter("address");
	String zipCode = request.getParameter("zipCode");
	String detailAddress = request.getParameter("detailAddress");
	String extraAddress = request.getParameter("extraAddress");
	String addressId = request.getParameter("addressId");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	if(phone1.equals("undefined")) {
		phone1 = "";
	}
	if(phone2.equals("undefined")) {
		phone2 = "";
	}
	
	String []add = address.split("L");
	String mainAddress = "";
	for(int i = 0; i < add.length; i++) {
		mainAddress += add[i] + " ";
	}
	
	String memberId = request.getParameter("memberId");
	System.out.println(address);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<div class="container" align="center">
		<div class="addressForm">
			<h3>주소수정</h3><br>
			
			<div class="form-horizontal" <%-- action="<%=request.getContextPath()%>/inputAddress.me" --%>>
				<div class="form-group" >
					<label class="control-label col-xs-3">배송지명</label>
					<div class="col-xs-6">
						<input type="hidden" name="addressId" id="addressId" value="<%=addressId%>">
						<input type="text" name="addressName" id="addressName" class="form-control" value="<%=addressName %>">
					</div>
				</div>
				<div class="form-group" >
					<label class="control-label col-xs-3">우편번호</label>
					<div class="col-xs-4">
						<input type="text" id="postCode" class="d_form mini form-control" name="postCode" placeholder="우편번호" value="<%=zipCode%>">
					</div>
					<input type="button" onclick="searchAddress()" value="주소검색" class="d_btn col-xs-2 btn btn-primary">
				</div> 
				<div class="form-group">
					<span class="col-xs-3"></span>
					<div class="col-xs-6">
						<input type="text" id="address" class="d_form large form-control" name="address" placeholder="주소" value="<%=mainAddress%>">
					</div>
				</div>
				<div class="form-group">
					<span class="col-xs-3"></span>
					<div class="col-xs-6">
						<input type="text" id="detailAddress" class="d_form form-control" name="detailAddress" placeholder="상세주소" value="<%=detailAddress%>">
					</div>
				</div>
				<div class="form-group">
					<span class="col-xs-3"></span>
					<div class="col-xs-6">
						 <input type="text" id="extraAddress" class="d_form form-control" name="extraAddress" placeholder="참고항목" value="<%=extraAddress%>">
					</div>
				</div>
				<div class="form-group" >
					<label class="control-label col-xs-3">연락처</label>
					<div class="col-xs-6">
						<input type="tel" name="phone1" id="phone1" class="form-control" value="<%=phone1%>">
					</div>
				</div>
				<div class="form-group" >
					<label class="control-label col-xs-3">연락처2</label>
					<div class="col-xs-6">
						<input type="tel" name="phone2" id="phone2" class="form-control" value="<%=phone2%>">
					</div>
				</div>
				<button class="btn btn-primary btn-md" id="submit">저장</button>
				<button id="close" class="btn btn-default btn-md">닫기</button>        
				       
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
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
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("extraAddress").value = extraAddr;
                        
                        } else {
                            document.getElementById("extraAddress").value = '';
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
            	$("#submit").click(function(){
            		var addressId = $("#addressId").val();
            		var addressName = $("#addressName").val();
            		var postCode = $("#postCode").val();
            		var address = $("#address").val();
            		var detailAddress = $("#detailAddress").val();
            		var extraAddress = $("#extraAddress").val();
            		var phone1 = $("#phone1").val();
            		var phone2 = $("#phone2").val();
            		$.ajax({
            			url:"<%=request.getContextPath()%>/updateAddress.me",
            			data:{addressId:addressId, addressName:addressName, postCode:postCode, address:address, detailAddress:detailAddress,
            				extraAddress:extraAddress, phone1:phone1, phone2:phone2},
            			type:"post",
            			success:function(data){
            				if(data == "ok"){
            					alert("수정이 완료되었습니다");
            					opener.document.location.reload();
								self.close();            					
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
           
            
        </script>
	</div>
</body>
</html>































