<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
	.buyArea{
		
		width:100%;
		height:50px;
		display:inline-block;
		margin:0 auto;
		text-align:center;
		
	}
	.buyBtn{
		
	}
	.name{
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
					<div class="name">장바구니</div>
					
					
					
				</header>
				
				<section id="contents">
					<header class="main">
						<table>
							<!-- <tr>
								<td c1solspan="5" style="height:100px; background:gray; color:white; font-size:20px;"><div class="name">장바구니</div></td>
							</tr> -->
							<tr style="height:50px; font-size:18px;">
								<th>전체선택</th>
								<th>이미지</th>
								<th>상품정보</th>
								<th>수량</th>
								<th>가격</th>
							</tr>
							<tr>
								<td><input type="checkbox" id="select"><label for="select"></label></td>
								<td><img src="../images/tvxq.jpg" style="width:50px; height:50px;"></td>
								<td><div class="explain">상품정보&옵션선택한것</div></td>
								<td><input type="number"></td>
								<td><div class="price">5,000</div></td>
							</tr>
							
						</table>
						<br>
						<table>
							<tr>
								<td>총 주문금액</td>
								<td></td>
								<td>배송비</td>
								<td></td>
								<td>결제예정금액</td>
							</tr>
							<tr>
								<td>15,000</td>
								<td>+</td>
								<td>3,000</td>
								<td>=</td>
								<td>18,000</td>
							</tr>
							
							
						</table>
						<div class="buyArea">
						<input type="submit" value="구매하기" class="buyBtn" style="width:300px; height:50px; ">
						</div>
					</header>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="../common/userMenuBar.jsp" %>
	</div>
			
</body>
</html>