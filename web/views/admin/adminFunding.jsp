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
		<h3>펀딩상품조회</h3>
		<table class="table table-bordered" style="border:2px solid gray; ">
			<tr>
				<td style="text-align:center; background: lightgray; border: 1px solid gray">재료별검색</td>
				<td>
				<select name="material">
					<option value="p1">가죽</option>
					<option value="p2">가죽</option>
					<option value="p3">가죽</option>
					<option value="p4">가죽</option>
					<option value="p5">가죽</option>
				</select>
				</td>
				<td>
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
				<td style="text-align:center; background: lightgray; border: 1px solid gray">검색</td>
				<td>
				<select name="sell" style="width: 60%;">
				     <option value="fund">펀딩명</option>
				     <option value="sellMember">작가명</option>
				</select>
				<td>
				<input type="text" name="name" style="width: 40%;">
				</td>				
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
				<td colspan="3"><input type="text"; style="width: 40%;"> ~ <input type="text";  style="width: 40%;"></td>
			</tr>
		</table>
		<input type="submit" value="검색">
		</form>
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
				<td>판매자</td>
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