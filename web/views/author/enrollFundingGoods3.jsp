<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수작 - 펀딩 작품 등록3</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<%@ include file="stylesheet/eroll.html" %>
</head>
<body class="is-preload">
<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="authorHome.jsp" class="logo"> <span
						class="glyphicon glyphicon-home"></span> &nbsp; <strong
						style="font-size: 20px;">HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<h2>판매 작품등록</h2>
					</header>
					<!-- Contents area -->

					<form id="salesInsert" action="" method="post">

						
						<div class="listBox">
							<div class="listTitle">
								<h2>제작자 사전모집</h2>
							</div>
							<div class="listContents">
								<p class="subtext"> 
									※ 프로젝트 펀딩 공개 전 프로젝트에 함께 참여할 작가들을 모집할 수 있습니다. <br>
									신청 내역은 따로 볼 수 있으면 지원한 작가에 대해 수락, 거절이 가능합니다. <br>
									지원 시 필요한 자격 조건 또는 주의 사항에 대해 상세히 적어주세요.
								</p>
								<div class="listContents">
									<textarea id="projectComment" name="projectComment" placeholder="Comment" rows="10" cols="50"></textarea><br>
								</div>
							</div>
						</div>

						<div class="listBox">
							<div class="listTitle">
								<h2>연락처 인증</h2>
							</div>
							<div class="listContents">
							<div class="row">
								<p class="subtext">
									※ 프로젝트 진행 중 플랫폼에서의 연락이나 후원자들의 문의를 받을 연락처를 입력해 주세요.
								</p>
							</div>
								<div class="row">
									<table>
										<tr style="background:white;">
											<td colspan="3">
												<input type="email" placeholder="Email" class="form-control">
											</td>
											<td>
												<button class="all-btn">이메일 인증하기</button>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<input type="tel" placeholder="Phone" class="form-control">
											</td>
											<td>
												<button class="all-btn">휴대폰 인증하기</button>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>


						<div class="listBox">
							<div class="listTitle">
								<h2>입금 계좌</h2>
							</div>
							<div class="listContents">
								<div class="row">
									<p class="subtext">
										※ 후원금을 수령할 본인 계좌를 입력해 주세요.
									</p>
								</div>
								<div class="row">
									<table>
										<tr>
											<td>은행명</td>
											<td colspan="2">
												<select>
													<option>은행명</option>
													<option></option>
													<option></option>
												</select>
											</td>
										</tr>
										<tr>
											<td>예금주</td>
											<td colspan="2">
												<input type="text" class="form-control" placeholder="계좌의 예금주 명과 일치해야 합니다.">
											</td>
										</tr>
										<tr>
											<td>계좌번호</td>
											<td>
												<input type="text" class="form-constrol">
											</td>
											<td>
												<button class="all-btn">계좌 인증</button>
											</td>
										</tr>
										<tr>
											<td>계좌 종류</td>
											<td>
												<input type="radio" value="개인" id="indiv" name="accountType">
												<label for="indiv">개인</label>
											</td>
											<td>
												<input type="radio" value="사업자" id="company" name="accountType">
												<label for="company">사업자(개인 사업자)</label>
											</td>
										</tr>
										<tr>
											<td>예금주 생년월일</td>
											<td>
												<input type="date" placeholder="입금계좌 인증에 사용됩니다.">
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</form>
					<div align="center">
						<button style="width: 150px;" id="enrollFundingGoods2">Next > </button>
					</div>
				</section>
			</div>
		</div>
		<%@ include file="authorMenuBar.jsp"%>
	</div>
</body>
</html>