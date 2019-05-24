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
 
 #proInfoTable th{
 	background: skyblue;
 	text-align: center;
 	}
</style>
</head>
<body>

	<div class="container">

		<h3>판매상품조회</h3>
		<table class="table table-bordered" style="border:1px solid gray; ">
			<tr>
				<td style="text-align:center; background: skyblue; border: 1px solid white; width: 300px;">상품분류</td>
				<td>
					<select id="productType">
						<option value="귀금속">귀금속</option>
						<option value="목공예">목공예</option>
						<option value="천공예">천공예</option>
						<option value="도공예">도공예</option>
						<option value="가죽공예">가죽공예</option>	
						<option value="기타">기타</option>
					</select>
				</td>
				<td colspan="2">
					<select id="category">
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
				<td style="text-align:center; background: skyblue; border: 1px solid white;; width: 300px">작가명</td>
				<td colspan="3"><input type="text" name="authorName"/></td>
			</tr>
			<tr>
				<td style="text-align:center; background: skyblue; border: 1px solid white; width: 250px">상품명</td>
				<td colspan="3"><input type="text" name="productName" /></td>
			</tr>
			<tr>
				<td style="text-align:center; background: skyblue; border: 1px solid white; width: 250px">상품등록일</td>
					<td><input type="date" name="proStart" style="width:300px;"/></td>
						<td style="width:30px;"><label style="font-size:15px; text-align:center;">~</label></td>
						<td style="width:500px;">
						<input type="date" name="proLast" style="width:300px;"/>
					</td>
			</tr>
			<tr>
				<td style="text-align:center; background: skyblue; border: 1px solid white; width: 250px">판매가</td>
				<td><input type="text" name="productValLow" style="width:150px; align:center"></td>
				<td>~</td>				
				<td><input type="text" name="productValHigh" style="width:150px; align:center"></td>
				 
			</tr>
		</table>
		<button id="searchProduct" class="btn" style="float:right; background: skyblue; color: white;">검색</button>
	
		<br>
		<hr>
		<h3>판매상품 조회 결과</h3>
		<table class="table table-bordered" id="proInfoTable" style="border:2px solid white; text-align:center">
		<thead>
		<tr style="background:lightgray; width:150px">
			<th>번호</th>
			<th>공예유형</th>
			<th>상품유형</th>
			<th>상품명</th>
			<th>상품등록일</th>
			<th>판매자명</th>
			<th>판매가격</th>
		</tr>
		</thead>
		<tbody>
			
		</tbody>
		
		</table>
		
		<br>
			<div class="row" style="padding-left:270px">
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
		$("#searchProduct").click(function(){
			var category = $("#category option:selected").val();
			var productType = $("#productType option:selected").val();
			var authorName = $("input[name='authorName']").val();
			var productName = $("input[name='productName']").val();
			var productValLow = $("input[name='productValLow']").val();
			var productValHigh = $("input[name='productValHigh']").val();
			var proStart =  $("input[name='proStart']").val();
			var proLast =  $("input[name='proLast']").val();
			var searchProduct = {category:category, productType:productType, authorName:authorName, productName:productName,
					productValLow:productValLow, productValHigh:productValHigh, proStart:proStart, proLast:proLast}
			
			$.ajax({
				url:"<%= request.getContextPath() %>/productSearch.ad",
				data:searchProduct,
				type:"get",
				success:function(data){
					//console.log(data);
					$tableBody = $("#proInfoTable tbody");
					
					$tableBody.html('');
					
					$.each(data, function(index, value){
						var $tr = $("<tr>");
						var $noTd = $("<td>").text(index + 1);
						var $productName = $("<td>").text(decodeURIComponent(value.productName));
						var $authorName = $("<td>").text(decodeURIComponent(value.authorName));
						var $material = $("<td>").text(decodeURIComponent(value.material));
						var $productDate = $("<td>").text(value.productDate);
						var $price = $("<td>").text(value.price);
						var $category = $("<td>").text(decodeURIComponent(value.category));
						
						
						$tr.append($noTd);
						$tr.append($material);
						$tr.append($category);
						$tr.append($productName);
						$tr.append($productDate);
						$tr.append($authorName);
						$tr.append($price);
						$tableBody.append($tr); 
						
						
					})
				}
			})
			
		})
	</script>
</body>
</html>


















