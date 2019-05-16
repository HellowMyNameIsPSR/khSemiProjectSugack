<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 개인정보수정</title>
<style>
	.authorInfo {
		border:2px solid lightgray;
		margin: 20px 0px 20px 0px;
		box-shadow:2px 2px lightgray;
	}
	.authorInfo tr{
		/* border:none; */
		padding:0 auto;
	}
	
	.authorInfo tr>td{
		background:white;
		height:80px;
		
	}

</style>
</head>
<body class="is-preload">
<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="authorHome.jsp" class="logo">
						<span class="glyphicon glyphicon-home"></span>
						&nbsp;
						<strong style="font-size:20px;">HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<h1>판매자 정보수정</h1>
					</header>
					<!-- Contents area -->

					<form id="updateAuthor" action="" method="post">

						<table class="authorInfo">
							<tr>
								<td colspan="2"><h2
										style="margin: 0 auto; padding-left: 20px">판매자 정보</h2></td>
							</tr>
							<tr>
								<td style="width: 200px;">판매자 유형</td>
								<td><input style="width: 100px;" type="text" maxlength="13"
									name="userId" id="userId" value=""></td>
							</tr>
							<tr>
								<td>판매자 이름</td>
								<td><input style="width: 100px; display: inline;"
									type="text" maxlength="13" name="userId" id="userId" value=""
									readonly>
									<button style="display: inline; margin-left: 20px;">수정</button>
								</td>
							</tr>
							<tr>
								<td rowspan="2">사업장 위치</td>
								<td>
									<button>주소수정</button> <br> <br> ※주소 들어갈곳
								</td>
							</tr>
						</table>
						
						
						
						
						

						<table class="authorInfo">
							<tr>
								<td colspan="2"><h2
										style="margin: 0 auto; padding-left: 20px">정산관리</h2></td>
							</tr>
							<tr>
								<td style="width: 200px;">대금입금계좌</td>
								<td>
									<input style="display:inline;width: 100px;" type="text" maxlength="13"name="userId" id="userId" value="">
									&nbsp;&nbsp;
									<button>계좌수정</button>
								</td>
							</tr>
							
						</table>
						
						
						
						

						<table class="authorInfo">
							<tr>
								<td colspan="2"><h2
										style="margin: 0 auto; padding-left: 20px">배송 정보</h2></td>
							</tr>
							<tr>

								<td style="width: 200px;">출고지 주소</td>
								<td>
									<button>주소수정</button> <br> <br>※주소 들어갈곳
								</td>
							</tr>
							<tr>
								<td>반품/교환지 주소</td>
								<td><button>주소수정</button> <br> <br>※주소 들어갈곳</td>
							</tr>
							<tr>
								<td>사업장 위치</td>
								<td><button>주소수정</button> <br> <br>※주소 들어갈곳</td>
							</tr>
						</table>

						<div align="center">
							<button style="width: 150px;">취소</button>
							<button style="width: 150px;">등록하기</button>
						</div>

					</form>








				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp" %>
	</div>
			
</body>
</html>