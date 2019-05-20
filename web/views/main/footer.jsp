<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#flogo{
		margin:0px 0px 0px 0px;
		width:150px;
	}
	footer{
		height:200px;
		background: radial-gradient(white, #E7F3FE);
		margin-top:100px;
		border:2px solid lightgray;
		min-width:1000px;
	}
	.footer{
		height:100%;
		width:100%;
		color:gray;
		font-size:10px;
	}
	.footer tr>td{
		padding:0px 0px 0px 0px;
		text-align:left;
		height:20px;
	}
	
</style>
</head>
<body>
	<footer class="container-fluid text-center">
		<table class="footer">
			<tr>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td rowspan="4" style="width:200px;text-align:center;">
					<img id="flogo"src="/sg/views/main/images/logo.png">
				</td>
				<td style="width:300px;">(주)수작</td>
				<td style="width:50px;">고객센터</td><td>(주 6일,오전 10시 ~ 저녁 10시 까지)</td>
			</tr>
			<tr>
				<td>대표이사 : 가그침</td>
				<td>카카오톡</td><td style="font-size:8px;">수작</td>
			</tr>
			<tr>
				<td>서울 특별시 갱남 KH정보교육원</td>
				<td>대표번호</td><td style="font-size:8px;">010-0123-4567</td>
			</tr>
			<tr>
				<td></td>
				<td>이메일</td><td style="font-size:8px;">sugack@sg.kr</td>
			</tr>
			<tr>
				<td></td>
				<td>수작은 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
					따라서 수작 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.</td>
				<td colspan="2">수작 이용 중 궁금하신 점이 있으신가요?<br>
								메일 또는 플러스친구 `수작`로 연락해주세요.<br>
								최선을 다해 도와드리겠습니다.</td>
			</tr>
			<tr>
				<td colspan="4"></td>
			</tr>
		</table>
	</footer>
</body>
</html>