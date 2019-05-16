<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 관리자홈</title>
</head>
<body class="is-preload">
<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="adminHome.jsp" class="logo">
						Admin<strong>HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<div class="reqDetail">
						<table>
							<tr>
								<td><h4>입접신청 했습니다.</h4></td>
								<td style="text-align: right"><h4>2019/05/05</h4></td>

							</tr>
							<tr>
								<td>점포명: 다락방</td>
								<td style="text-align: right">
								 <p>이메일 :불러올 이메일 값</p>
								</td>
							</tr>
						</table>
						<textarea id="reqDetailText" cols="30" rows="10">여기에는 내용</textarea>						
						</div>
						<form action="">
							<select name="withdrawType" style="width:150px">
								<option value="내용부실">내용부실</option>
								<option value="저작권">저작권관련</option>
							</select>
							<textarea name="" id="withdrawText" cols="30" rows="10"></textarea>
							<input type="submit" value="거부">
							<button id="accept">승인</button>
						</form>
					</header>
				</section>
			</div>
		</div>
		<%@ include file="adminMenubar.jsp" %>
	</div>
			
</body>
</html>