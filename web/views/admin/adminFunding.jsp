<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>

 
 .container {
 	width: 80%;
 }
</style>
</head>
<body>
	<div class="container">
	
		<h3>펀딩상품조회</h3>
		<table class="table table-bordered" style="border:2px solid gray; ">
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">재료별검색</td>
				<td>
				<select name="material">
					<option value="귀금속">귀금속</option>
					<option value="목공예">목공예</option>
					<option value="천공예">천공예</option>
					<option value="도공예">도공예</option>
					<option value="가죽공예">가죽공예</option>	
					<option value="기타">기타</option>
				</select>
				</td>
				<td>
					<select name="category">
					<option value="케이스">케이스</option>
						<option value="인테리어소품">인테리어소품</option>
						<option value="의류">의류</option>
						<option value="육아,아동">육아,아동</option>
						<option value="가구">가구</option>
						<option value="여성수제화">여성수제화</option>
						<option value="속옷, 양말류">속옷, 양말류</option>
						<option value="주방, 생활">주방, 생활</option>
						<option value="귀걸이">귀걸이</option>
						<option value="남성수제화">남성수제화</option>
						<option value="기타섬유, 퀼트">기타섬유, 퀼트</option>
						<option value="반려동물 용품">반려동물 용품</option>
						<option value="반지">반지</option>
						<option value="도자기">도자기</option>
						<option value="가방, 파우치">가방, 파우치</option>
						<option value="문구, 팬시">문구, 팬시</option>
						<option value="목걸이">목걸이</option>
						<option value="전자기기 관련">전자기기 관련</option>
						<option value="패션잡화">패션잡화</option>
						<option value="시계">시계</option>
						<option value="팔찌">팔찌</option>	
						<option value="지갑">지갑</option>
						<option value="그외 악세서리">그외 악세서리</option>
						<option value="인형, 장난감">인형, 장난감</option>
						<option value="공예">공예</option>
						<option value="기타섬유퀼트">기타섬유퀼트</option>	
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">검색</td>
				<td>
				<select name="sell" style="width: 60%;">
				     <option value="fund">펀딩명</option>
				     <option value="sellMember">작가명</option>
				</select>
				<td>
				<input type="text" name="name" style="width: 40%;">
				</td>				

			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">펀딩등록일</td>
				<td colspan="3"><input type="date" name="fundDate" value=""> ~ <input type="date" name="funddate" value=""></td>
			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">펀딩마감일</td>
				<td colspan="3"><input type="date" name="fundLastDate" value=""> ~ <input type="date" name="fundLastDate" value=""></td>
			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">펀딩진행률</td>
				<td> <input type="text"; style="width: 40%;"></td>
				<td> <input type="text";  style="width: 40%;"></td>
			</tr>
		</table>
		<button id="searchFunding" style="float:right">검색</button>
		
		<br>
		<hr>
		<h3>펀딩 조회 결과</h3>
		<table class="table table-bordered" style="border:2px solid gray; text-align:center">
			<tr style="background:lightgray;">
				<td>선택</td>
				<td>번호</td>
				<td>분류</td>
				<td>펀딩명</td>
				<td>펀딩코드</td>
				<td>펀딩등록일</td>
				<td>펀딩마감일</td>
				<td>펀딩진행률</td>
				<td>작가명</td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td>1</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td>2</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td>4</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td>5</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<button onclick=delete();>삭제</button>
		<br>
			<div class="row" style="padding-left:400px">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
	</div>
	
	
</body>
</html>