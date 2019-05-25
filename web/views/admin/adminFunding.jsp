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
				<td style="text-align:center; background: lightgray; border: 1px solid gray">검색키워드</td>
				<td>
				<select name="sellKeyword" style="width: 60%;">
				     <option value="fund">펀딩명</option>
				     <option value="sellMember">작가명</option>
				</select>
				<td>
				<input type="text" name="searchName" style="width: 40%;">
				</td>				

			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">펀딩등록일</td>
				<td colspan="3"><input type="date" name="fundSetDateStart" value=""> ~ <input type="date" name="fundSetDateLast" value=""></td>
			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">펀딩마감일</td>
				<td colspan="3"><input type="date" name="fundLastDateStart" value=""> ~ <input type="date" name="fundLastDateLast" value=""></td>
			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">펀딩진행률</td>
				<td>최소 <input type="number"; name= "minNum" style="width: 40%;"> %</td>
				<td>최대 <input type="number"; name= "maxNum" style="width: 40%;"> %</td>
			</tr>
		</table>
		<button id="searchFunding" style="float:right">검색</button>
		
		<br>
		<hr>
		<h3>펀딩 조회 결과</h3>
		<table class="table table-bordered" id="fundInfoTable" style="border:2px solid gray; text-align:center">
			<thead>
				<tr style="background:lightgray;">
					<td>번호</td>
					<td>공예분류</td>
					<td>작품유형</td>
					<td>작가명</td>
					<td>펀딩명</td>
					<td>펀딩등록일</td>
					<td>펀딩마감일</td>
					<td>펀딩진행률</td>			
				</tr>
			</thead>
			
			<tbody>
			
			</tbody>
		</table>
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
	<script>
	$(function(){
		$("#searchFunding").click(function(){
			//검색할 조건값을 변수에 담아서 가져감
			var material = $("select[name='material'] option:selected").val();
			var category = $("select[name='category'] option:selected").val();
			var sellKeyword = $("select[name='sellKeyword'] option:selected").val();
			var searchName = $("input[name='searchName']").val();
			var minNum = $("input[name='minNum']").val();
			var maxNum = $("input[name='maxNum']").val();
			var fundSetDateStart = $("input[name='fundSetDateStart']").val();
			var fundSetDateLast = $("input[name='fundSetDateLast']").val();
			var fundLastDateStart = $("input[name='fundLastDateStart']").val();
			var fundLastDateLast = $("input[name='fundLastDateLast']").val();
			var searchFunding = {category:category, material:material, sellKeyword:sellKeyword, searchName:searchName,
					minNum:minNum, maxNum:maxNum, fundSetDateStart:fundSetDateStart, fundSetDateLast:fundSetDateLast, fundLastDateStart:fundLastDateStart
					, fundLastDateLast:fundLastDateLast}
			
			$.ajax({
				url:"<%= request.getContextPath() %>/fundingSearch.ad",
				data:searchFunding,
				type:"get",
				success:function(data){
					//console.log(data);
					$tableBody = $("#fundInfoTable tbody");
					
					$tableBody.html('');
					
					$.each(data, function(index, value){
						var $tr = $("<tr>");
						var $noTd = $("<td>").text(index + 1);
						var $material = $("<td>").text(decodeURIComponent(value.material));
						var $category = $("<td>").text(decodeURIComponent(value.category));
						var $fundName = $("<td>").text(decodeURIComponent(value.workName));
						var $authorName = $("<td>").text(decodeURIComponent(value.authorName));
						var $fundStarDay = $("<td>").text(value.fundStarDay);
						var $fundLastDay = $("<td>").text(value.fundLastDay);
						var $process = $("<td>").text(value.process);
						
						
						$tr.append($noTd);
						$tr.append($material);
						$tr.append($category);
						$tr.append($authorName);
						$tr.append($fundName);
						$tr.append($fundStarDay);
						$tr.append($fundLastDay);
						$tr.append($process);
						$tableBody.append($tr); 
						
						
					})
				}
			})
			
			
			//form안에 없기 때문에 페이를 통쨰로 넘긴다
			
		});
	})
	</script>
	
</body>
</html>