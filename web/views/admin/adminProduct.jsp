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

		<h3>판매상품조회</h3>
		<table class="table table-bordered" style="border:2px solid gray; ">
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">상품분류</td>
				<td>
					<select name="productType">
						<option value="p1">가죽</option>
						<option value="p2">도자기</option>
						<option value="p3">직물</option>
						<option value="p4">목공</option>
						<option value="p5">기타</option>	
					</select>
				</td>
				<td colspan="2">
					<select name="category">
						<option value="c1">지갑</option>
						<option value="c2">옷</option>
						<option value="c3">기타</option>
						<option value="c4">목공</option>
						<option value="c5">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">작가명</td>
				<td colspan="3"><input type="text" name="authorName"/></td>
			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">상품명</td>
				<td colspan="3"><input type="text" name="productName" /></td>
			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">상품등록일</td>
					<td><input type="date" name="proStart" style="width:300px;"/></td>
						<td style="width:30px;"><label style="font-size:15px; text-align:center;">~</label></td>
						<td style="width:500px;">
						<input type="date" name="proLast" style="width:300px;"/>
					</td>
			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">판매가</td>
				<td><input type="text" name="productValLow" style="width:150px; align:center"></td>
				<td>~</td>				
				<td><input type="text" name="productValHigh" style="width:150px; align:center"></td>
				 
			</tr>
		</table>
		<button id="searchProduct" style="float:right">검색</button>
	
		<br>
		<hr>
		<h3>판매상품 조회 결과</h3>
		<table class="table table-bordered" id="proInfoTable" style="border:2px solid gray; text-align:center">
		<tr style="background:lightgray; width:150px">
			<td>번호</td>
			<td>공예유형</td>
			<td>상품유형</td>
			<td>상품명</td>
			<td>상품등록일</td>
			<td>판매자명</td>
			<td>판매가격</td>
		</tr>
		
		</table>
		<button style="float:right">삭제</button>
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
			var category = $("input[name='category']:selected").val();
			var productType = $("input[name='productType']:selected").val();
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
						var $memType = $("<td>").text(decodeURIComponent(value.memberType));
						var $nameTd = $("<td>").text(decodeURIComponent(value.memberName));
						var $emailTd = $("<td>").text(decodeURIComponent(value.memberEmail));
						var $joindayTd = $("<td>").text(value.memberJoinDay);
						var $birthDate = $("<td>").text(value.memberBirthDay);
						var $gender = $("<td>").text(decodeURIComponent(value.memberGender));
						
						
						$tr.append($noTd);
						$tr.append($memType);
						$tr.append($emailTd);
						$tr.append($nameTd);
						$tr.append($joindayTd);
						$tr.append($birthDate);
						$tr.append($gender);
						$tableBody.append($tr); 
						
						
					})
				}
			})
			
		})
	</script>
</body>
</html>


















