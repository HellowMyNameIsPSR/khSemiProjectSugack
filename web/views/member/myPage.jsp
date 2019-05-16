<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지!!</title>
<style>
	.myPage{
		display:block;
	}
	.headerMe{
		border:1px solid black;
		display:block;
	}
	#table tr{
	
	border-bottom:1px solid black;
	}
</style>
</head>
<body>
<%@ include file="../common/userMenuBar.jsp" %>

<!-- Wrapper1e -->
	<div id="wrapper">
	
		<!-- Main -->
		<div id="main">
				
			<div class="inner">
				
				<!-- Header -->
				
				<header id="header">
				
					
					
					<div class="table">
						<table id="table">
							<tr>
							<th colspan="4" style="font-size:20px; text-align:center; background:#9DCAFF; color:white;">MY정보</th>
							</tr>
							<tr>
								<th style="height:50px; font-size:15px; text-align:center;">적립금</th>
								<th style="height:50px;  font-size:15px; text-align:center;" >주문내역</th>
								<th style="height:50px;  font-size:15px; text-align:center;">취소/환불확인</th>
								<th style="height:50px;  font-size:15px; text-align:center;">펀딩투자내역</th>
							</tr>
							<tr>
								<td style="text-align:center;">_P</td>
								<td style=" text-align:center;">_건</td>
								<td style="text-align:center;">_건</td>
								<td style=" text-align:center;">_건</td>
							</tr>
						</table>
					</div>
				</header>
				
				<section id="contents">
					<header class="main">
						<table>
							<tr style="text-align:center">
								<td style="border:1px solid gray;">No</td>
								<td style="border:1px solid gray;">주문일</td>
								<td style="border:1px solid gray;">상품명</td>
								<td style="border:1px solid gray;">수량</td>
							</tr>
							<tr>
								<td style="border:1px solid gray;"></td>
								<td style="border:1px solid gray;"></td>
								<td style="border:1px solid gray;"></td>
								<td style="border:1px solid gray;"></td>
							</tr>
						</table>
					</header>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		
	</div>
 	
</body>
</html>