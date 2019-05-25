<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.*, java.util.*, com.kh.semi.work.model.vo.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>)request.getAttribute("hmap");
	ArrayList<Address> addList = (ArrayList<Address>)hmap.get("addList");
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)hmap.get("list");
	ArrayList<WorkOption> olist = (ArrayList<WorkOption>)hmap.get("olist");
	HashMap<String, Object> work = list.get(0);
	
	Address add1 = null;
	Address add2 = null;
	Address add3 = null;
	int totalPrice = 0;
	int totalProductPrice = 0;
	int totalDeliPrice = 0;
	int totalOptionPrice = 0;
	String allWorkName = "";
	String allOptionName = "";
	
	
	for(int i = 0; i < addList.size(); i ++) {
		if(i == 0) {
			add1 = addList.get(i);
		}else if(i == 1){
			add2 = addList.get(i);
		}else {
			add3 = addList.get(i);
		}
	}
	for(int i = 0; i < list.size(); i++) {
		totalProductPrice += (Integer)list.get(i).get("price") * (Integer)list.get(i).get("count");
		totalDeliPrice += (Integer)list.get(i).get("deliPrice");
		allWorkName += (String)list.get(i).get("workName");
		 for(int j = 0; j < olist.size(); j++) {
			if((int)olist.get(j).getwId() == (int)list.get(i).get("basketId")) { 
				totalOptionPrice += (Integer)olist.get(j).getoPrice();

			}
		} 
	}
		totalPrice = (totalProductPrice + totalDeliPrice);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매하기</title>
<!-- <link rel="stylesheet" href="assets/css/main.css" /> -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
		<%@ include file="../assets/css/tableCss.html" %>
</style>
</head>
<body>
<%@ include file="../main/mainMenubar.jsp" %>
<!-- Wrapper -->
	<div id="wrapper">
	
		<!-- Main -->
		<div id="main">
				
			<div class="inner">
				
				<!-- Header -->
				
				<header id="header">
				</header>
				
				<section id="contents">
				
				<div class="container">
					<div class="name" align="center">
						<h2>구매하기</h2>
						<hr>
					</div>
					<div class="row">
					<!-- <div class="col-sm-1"></div> -->
					<div class="col-sm-6 product" style="background-color:lavender; height:100%;">
				
					<table style="width:100%; height:400px;">
						<tr>
							<td colspan="3">구매자정보 및 배송지정보</td>
						</tr>
						<tr>
							<td>받는사람</td>
							<td><input type="text" id="memberName" value="<%=loginUser.getMemberName()%>">
						</tr>
						
						<tr>
							<td>연락처</td>
							<td><input type="text" id="phone"></td>
						</tr>
						
						<tr>
							<td>주소 불러오기</td>
							<td colspan="2">
								<select id="addChoice">
									<option value="self">직접입력</option>
									<%for(int i = 0; i < addList.size(); i++) {%>
									<option value="addChoice<%=i%>"><%=(String)addList.get(i).getAddressName() %></option>
									<%} %> 
								</select>
							</td>
						</tr>
						
						<tr>
							<td>우편번호</td>
							<td><input type="text" id="postCode"></td>
							<td><button  class="btn btn-default" onclick="searchAddress();">우편번호 찾기</button></td>
						</tr>
						
						<tr>
							<td>기본주소</td>
							<td colspan="2"><input type="text" id="address"></td>
						</tr>						
						<tr>
							<td>상세주소</td>
							<td colspan="2"><input type="text" id="detailAddress"></td>
						</tr>
					</table>
					</div>
					
					
				
					<!-- <div class="col-sm-2 product"></div> -->
					
					
					
					<br>
					<br>
						<div class="col-sm-6 product" style="background-color:lavenderblush; height:100%;">
						<div class="outer">
					<table style="width:100%; height:400px;">
						<tr>
							<td colspan="3"><h4>결제정보</h4></td>
						</tr>
						<tr>
							<td colspan="2">
								<label>작품금액</label>
							</td>
							<td>
								<label><%=totalProductPrice +  totalOptionPrice%>원</label> <br>							
							</td>
						
						</tr>
						
						<tr>
							<td colspan="2">
								<label>배송비</label>
							</td>
							<td>
								<label><%=totalDeliPrice%>원</label><br>
							</td>
						
						</tr>
						<tr>
							<td colspan="2">
								<label>적립금</label><br>
								<label style="color:green"><%=hmap.get("point") %>원 사용가능</label>
							</td>
							<td>
								<input type="number" id="point" value="0" max="<%=hmap.get("point") %>">
							</td>
						</tr>
						<tr>
							<td colspan="2">주문수량</td>
							
							<td >
								
							
								<%for(int i = 0; i < list.size(); i++) { %>
								<label><%=list.get(i).get("workName") %> : <%=list.get(i).get("count") %>개</label><br>
								<%} %>
							</td>			
						</tr>
						
						<tr>
							<td colspan="2" style="font-size:20px;">최종 결제금액</td>
							
							<td ><label style="font-size:20px; color:red;" id="totalPrice"><%=totalPrice + totalOptionPrice%>원</label></td>
							
						</tr>
						
					</table>
					
					
					</div>
				</div>
				<div class="col-sm-1"></div>	
			</div>
			<br><br>
			<div class="panel-group col-sm-12">
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" href="#collapse1">주문 작품 정보</a>
			        </h4>
			      </div>
			      <div id="collapse1" class="panel-collapse collapse">
			        <ul class="list-group">
			        <%for(int i = 0; i < list.size(); i++) {
			        	String ovalue = "";
						int oprice = 0;
			        %>
			        
			        <% for(int j = 0; j < olist.size(); j++) {%>
						<%if((int)olist.get(j).getwId() == (int)list.get(i).get("basketId")) { 
							 ovalue += (String)olist.get(j).getoName() + " : " + (String)olist.get(j).getoValue() + "/";
							 oprice += (Integer)olist.get(j).getoPrice();
							 System.out.println("ovalue = " + ovalue);
						}else { 
							ovalue += "";	
						} 
					} %>
			          <li class="list-group-item">
			          	<div>
			          		<h5><%=list.get(i).get("authorName") %>작가님 작품</h5>
			          		<%if(list.get(i).get("workType").equals("SALES")) {%>
							<img src="uploadSalesImage/<%=list.get(i).get("changeName") %>" style="width:50px; height:50px;">
							<%}else { %>
							<img src="uploadFundingGoodsImg/<%=list.get(i).get("changeName") %>" style="width:50px; height:50px;">
							<%} %>
							<label><%=list.get(i).get("workName") %>/<%=ovalue %></label>
							<div>
								<label>수량 : <%=list.get(i).get("count") %>개</label>
								<label style="float:right;"><%=((Integer)list.get(i).get("price") + oprice) * (Integer)list.get(i).get("count") %>원</label><br>
								<label>배송비 : <%=list.get(i).get("deliPrice") %>원</label>
							</div>
						</div>
			          </li>
			         <%} %>
			        </ul>
			      </div>
			    </div>
			  </div>
							
					
					<hr>
					
				<div class="col-sm-12">
					<label>이용약관</label>
					<textarea readonly="readonly" style="overflow-y:scroll"></textarea>
					<div class="ok" style="float:right;" >
						<input name="agree1" type="checkbox" value="동의" id="agree1"><label for="agree1">동의합니다.</label>
					</div>
				
					<br><br>
					
				
					<label>이용약관</label>
					<textarea readonly="readonly" style="overflow-y:scroll"></textarea>
					<div class="ok" style="float:right;" >
						<input name="agree2" type="checkbox" value="동의" id="agree2"><label for="agree2">동의합니다.</label>
					</div>
				
					<br><br>
					
				
					<label>이용약관</label>
					<textarea readonly="readonly" style="overflow-y:scroll"></textarea>					
					<div class="ok" style="float:right;" >
					<input name="agree3"type="checkbox" value="동의" id="agree3"><label for="agree3">동의합니다.</label>
					</div> 
					<br><br>
				<div class="buyArea" style="text-align:center;" align="center">					
					<input type="submit" value="구매하기" style="width:200px; height:50px;" class="purchase">
					</div>
				</div>	
			</div>
				
					
					<!-- Contents area -->
				</section>
			</div>
		</div>
		
	</div>
	<%@ include file="../main/footer.jsp" %>
		<script>
			$("#point").change(function(){
				var point = $(this).val();
				if(point > <%=hmap.get("point") %>){
					$(this).val(0);
					$(this).focus();
					alert("적립금이 부족합니다!!");
				}else {
				$("#totalPrice").text((<%=totalPrice + totalOptionPrice%> - point) + "원");	
				}				
			});
		
			$("#addChoice").change(function(){
				var addChoice = $('#addChoice').val();
				console.log(addChoice);
				if(addChoice == "addChoice0") {
					<%if(add1 != null) {%>
					<%String[] address = add1.getAddress().split("#");%>
					$("#phone").val("<%=add1.getPhone1()%>");
					$("#zipCode").val("<%=address[0]%>");
					$("#address").val("<%=address[1] + address[3]%>");
					$("#detailAddress").val("<%=address[2]%>");
					<%}%>
				}else if(addChoice == "self") {
					$("#phone").val("");
					$("#zipCode").val("");
					$("#address").val("");
					$("#detailAddress").val("");
				}else if(addChoice == "addChoice1"){
					<%if(add2 != null) {%>
					<%String[] address2 = add2.getAddress().split("#");%>
					$("#phone").val("<%=add2.getPhone1()%>");
					$("#zipCode").val("<%=address2[0]%>");
					$("#address").val("<%=address2[1] + address2[3]%>");
					$("#detailAddress").val("<%=address2[2]%>");
					<%}%>
				}else {
					<%if(add3 != null) {%>
					<%String[] address3 = add3.getAddress().split("#");%>
					$("#phone").val("<%=add3.getPhone1()%>");
					$("#zipCode").val("<%=address3[0]%>");
					$("#address").val("<%=address3[1] + address3[3]%>");
					$("#detailAddress").val("<%=address3[2]%>");
					<%}%>
				}
				
			});
				
			//var IMP = window.IMP; // 생략가능
			IMP.init("imp60214973"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			
			$(".purchase").attr("disabled","true");
			
			$("input:checkbox").change(function(){
				console.log("test")
				test();
			});
		
		
		function test(){
			console.log('function call')
			if ($("input:checkbox[id='agree1']").is(":checked")&& $("input:checkbox[id='agree2']").is(":checked")
					&& $("input:checkbox[id='agree3']").is(":checked")){
				console.log("all checked");
				
				$(".purchase").removeAttr("disabled");
				
			}else{		
				$(".purchase").attr("disabled","true");
			}
		}
		
		$('.purchase').click(function(){
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원b
			    pay_method : 'card',
			    merchant_uid : '<%=(int)(Math.random()*1000)+1%>' + new Date().getTime(),
			    name : '<%=(String)work.get("workName") %>외 <%=(Integer)list.size() - 1%>개의 상품',
			    amount : (<%=totalPrice + totalOptionPrice%> - $("#point").val()),
			    buyer_email : '<%=loginUser.getEmail()%>',
			    buyer_name : '<%=loginUser.getMemberName()%>',
			    buyer_tel : '<%=loginUser.getPhone()%>',
			    buyer_addr : $("#address").val(),
			    buyer_postcode : $("#postCode").val(),
			    m_redirect_url : 'index.jsp'
			}, function(rsp) {
			    if ( rsp.success ) {
			    	
			        var msg = '결제가 완료되었습니다.';
			        
			        /* /* msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num; */ 	
			        
			    	
			    	<%-- $.ajax({
						url:"<%=request.getContextPath()%>/insertOrderList.pro",
						data:{},
						type:"post",
						success:function(data){
							console.log("입력성공");
						}
					)}; --%>
			        
					var bidArr = new Array();
					<%for(int j = 0; j < list.size(); j++) {%>
						bidArr.push(<%=(int)list.get(j).get("basketId")%>);
					<%}%>
					
					
					var point = $("#point").val();
					var bundleCode = (new Date().getTime() + '<%=(int)(Math.random()*100000)+1%>');
					
					$.ajaxSettings.traditional = true;
			        $.ajax({
			        	url:"<%=request.getContextPath()%>/insertPayment.pro",
			        	data:{pid:rsp.merchant_uid, payPrice:rsp.paid_amount, payMethod:rsp.pay_method, 
			        		payStatus:rsp.status, applyNum:rsp.apply_num, bidArr:bidArr, bundleCode:bundleCode, point:point},
			        	type:"post",
			        	success:function(data){
			        		alert(msg);
			        		window.location.href = "<%=request.getContextPath()%>/myPage.me";
			        	},
			        	error:function(data){
			        		alert("결제에 실패했습니다, 다시 시도해주세요");
			        	}
			        });
			    } else {
			        var msg = '결제에 실패하였습니다.\n';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		})
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
                        document.getElementById("detailAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("detailAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postCode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }
		
		</script>	
		
		
</body>
</html>