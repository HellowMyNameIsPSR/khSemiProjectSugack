<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<form action="" method="get">
		<h3>판매상품조회</h3>
		<table class="table table-bordered" style="border:2px solid gray; ">
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">상품분류</td>
				<td>
					<select name="product">
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
				<td colspan="3"><input type="text" /></td>
			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">상품명</td>
				<td colspan="3"><input type="text" /></td>
			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">상품등록일</td>
				<td colspan="3"><input type="date" name="userdate" value=""> ~ <input type="date" name="userdate" value=""></td>
			</tr>
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">판매가</td>
				<td><input type="text" style="width:150px; align:center"></td>
				<td>~</td>				
				<td><input type="text" style="width:150px; align:center"></td>
				 
			</tr>
		</table>
		<input type="submit" value="검색" style="float:right">
		</form>
		<br>
		<hr>
		<h3>판매상품 조회 결과</h3>
		<table class="table table-bordered" style="border:2px solid gray; text-align:center">
		<tr style="background:lightgray;">
			<td>선택</td>
			<td>번호</td>
			<td>분류</td>
			<td>재료</td>
			<td>상품코드</td>
			<td>상품명</td>
			<td>상품등록일</td>
			<td>판매자명</td>
			<td>판매가격</td>
		</tr>
		<tr>
			<td><input type="checkbox" id="check"><label for="check"></label></td>
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
			<td><input type="checkbox" id="check1"><label for="check1"></label></td>
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
			<td><input type="checkbox" id="check2"><label for="check2"></label></td>
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
			<td><input type="checkbox" id="check3"><label for="check3"></label></td>
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
			<td><input type="checkbox" id="check4"><label for="check4"></label></td>
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
		<button onclick=delete(); style="float:right">삭제</button>
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
		$(function(){
			
		})
	</script>
</body>
</html>


















