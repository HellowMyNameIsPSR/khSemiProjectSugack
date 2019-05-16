<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응원하기</title>
<style>
.name {
	width: 100%;
	font-size: 30px;
}

#test1 {
	border: 1px solid black;
}

.test2 {
	background-color: red;
}
</style>
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">

			<div class="inner">

				<!-- Header -->

				<header id="header"> <h2>작가 응원하기</h2> </header>

				<section id="contents">



					<div class="container">
						

						<div>
							<p>관심 가는 작가 들에게 응원에 메세지를 남겨 주세요</p>
							<p>Tip: 관련작가들이 성실이 댓글에 성실히 답해드려요</p>

						</div>

						<div class="row"
							style="border: 1px solid black; width: 1100px; height: 200px;">

							<div class="nick"
								style="width: 100%; height: 50px; padding: 5px;">
								<p>닉네임</p>
							</div>
							<div class="content"
								style="border: 5px solid black; width: 900px; height: 100px; padding: 5px; margin-left: 20px;">
								<textarea style="margin-top: 10px; width: 880px;"
									placeholder="작가에게 응원하세요"></textarea>
							</div>
							<div class="btn"
								style="float: right; width: 150px; height: 100px; margin-left: 10px;">
								<button style="width: 80px; height: 60px;">수정</button><br>
								<button style="width: 80px; height: 60px;">삭제</button>
							</div>
						</div>

						<br>

						<div class="row"
							style="border: 1px solid black; width: 1100px; height: 200px;">

							<div class="nick"
								style="width: 100%; height: 50px; padding: 5px;">
								<p>a1234</p>
							</div>
							<div class="content"
								style="/* border: 5px solid black; */ width: 900px; height: 100px; padding: 5px; margin-left: 20px;">
								<textarea style="margin-top: 10px; width: 880px;"
									placeholder="작품너무 예쁘네요 많이 파세요"></textarea>
							</div>
							<div class="btn"
								style="float: right; width: 120px; height: 100px; margin-left: 10px;">

							</div>
						</div>


						<br>
						<div class="row"
							style="border: 1px solid black; width: 1100px; height: 200px;">

							<div class="nick"
								style="width: 100%; height: 50px; padding: 5px;">
								<p>abc12345</p>
							</div>
							<div class="content"
								style="/* border: 5px solid black; */ width: 900px; height: 100px; padding: 5px; margin-left: 20px;">
								<textarea style="margin-top: 10px; width: 880px;"
									placeholder="요번 작품도 괜찬네요"></textarea>
							</div>
							<div class="btn"
								style="float: right; width: 120px; height: 100px; margin-left: 10px;">

							</div>
						</div>
						<br>

						<!-- <div class="order">
							<ul  class="pagination" style="text-align:center;">
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
							</ul>
							
							</div>
							 -->


						<div class="row">
							<div class="col" style="margin:0 auto;">

								<ul class="pagination" >
									<li class="page-item"><a class="page-link" href="#"><</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">4</a></li>
									<li class="page-item"><a class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#">></a></li>
								</ul>
							</div>
						</div>




						<!-- Left-aligned media object -->
						<!-- <div id=test1>
								<div class="media">
									<div class="media-left">
										<img src=" " class="media-object" style="width: 60px">
									</div>
									<div class="media-body">
										<h4 class="media-heading">닉네임 1</h4>
										<p>요번 제품들도 잘쓰고 있어요 ㅋㅋ 작품이 정말 이쁘네여 다음 작품도 기대 합니다</p>
										<div>
											<div class="container">
												<button type="button" class="btn">수정하기</button>
												<button type="button" class="btn btn-default test2">삭제하기</button>
											</div>
										</div>
									</div>
								</div>
							</div> -->
						<hr>

						<!-- Right-aligned media object -->
						<!-- <div id=test2>
								<div class="media">
									<div class="media-body">
										<h4 class="media-heading">닉네임 2</h4>
										<p>이번 작품은 정말 이쁘네요 다음작품도 기대되네요 언제 다시 만드나요 ㅋㅋ</p>
									</div>
									<div class="media-right">
										<img src=" " class="media-object" style="width: 60px">
									</div>
								</div>
								<div class="container">
									<button type="button" class="btn">수정하기</button>

									<button type="button" class="btn btn-default test2">삭제하기</button>






								</div>
							</div> -->

						<!-- <div class="container">
								
								<ul class="pagination">
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
								</ul>
							</div> -->


					</div>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="../common/tourMenuBar.jsp"%>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>