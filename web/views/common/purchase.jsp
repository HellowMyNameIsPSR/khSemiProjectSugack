<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매하기</title>

<!-- <link rel="stylesheet" href="assets/css/main.css" /> -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<style>
		<%@ include file="../assets/css/main.html" %>
	</style>
<style>
	.name{
		width:100%;
		font-size:30px;
	}
</style>
</head>
<body>

<!-- Wrapper -->
	<div id="wrapper">
	
		<!-- Main -->
		<div id="main">
				
			<div class="inner">
				
				<!-- Header -->
				
				<header id="header">
					<div class="name">구매하기</div>
				</header>
				
				<section id="contents">
				
					<div class="container" >
					<div class="row">
					<div class="col-sm-5 product" style="background-color:lavender; margin-left:30px; height:100%;">
				
					<table>
						<tr>
							<td colspan="3">구매자정보 및 배송지정보</td>
						</tr>
						<tr>
							<td>받는사람</td>
							<td colspan="2"><input type="text">
						</tr>
						
						<tr>
							<td>연락처</td>
							<td><input type="tel"></td>
							<td><button>변경하기</button></td>
						</tr>
						
						<tr>
							<td colspan="2">
								<select>
									<option>주소1</option>
									<option>주소2</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>우편번호</td>
							<td><input type="text"></td>
							<td><button>우편번호 찾기</button></td>
						</tr>
						
						<tr>
							<td>기본주소</td>
							<td colspan="2"><input type="text">
						</tr>
						
						<tr>
							<td>상세주소</td>
							<td colspan="2"><input type="text">
						</tr>
					</table>
					</div>
					
					
				
					<div class="col-sm-2 product"></div>
					
					
					
					<br>
					<br>
						<div class="col-sm-5 product" style="background-color:lavenderblush; height:100%;">
						<div class="outer">
					<table style="width:423px; height:420px;">
						<tr>
							<td colspan="3">**님의 작품입니다</td>
						</tr>
						<tr>
							<td><label style="font-size:20px;">품명 및 모델명</label></td>
						
						</tr>
						
						<tr>
							<td colspan="2">내용</td>
							
							<td ><label>가격</label></td>
							
						</tr>
						
						<tr>
							<td colspan="2">내용</td>
							
							<td ><label>가격</label></td>
							
						</tr>
						
						
						<tr>
							<td colspan="2">배송비</td>
							
							<td ><label>가격</label></td>
							
						</tr>
						
						<tr>
							<td colspan="2" style="font-size:20px;">최종 결제금액</td>
							
							<td ><label style="font-size:20px; color:red;">가격</label></td>
							
						</tr>
						
					</table>
					
					
					</div>
				</div>
					
					</div>
				
					
					<hr>
					
					
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
					
					<div class="buyArea" style="text-align:center;">
					<br><br>
					<input type="submit" value="구매하기" style="width:200px; height:50px;" class="purchase">
					</div>
				</div>	
					
					<!-- Contents area -->
				</section>
			</div>
		</div>
		
	</div>
		<script>
		$(window).load(function() {
			//var IMP = window.IMP; // 생략가능
			IMP.init("imp36844858"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			
			$(".purchase").attr("disabled","true");
			
			$("input:checkbox").change(function(){
				console.log("test")
				test();
			});
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
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트2',
			    amount : 1000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        console.log(rsp.success);
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		})
		
		
		</script>	
		
		
</body>
</html>