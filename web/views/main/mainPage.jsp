<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>

		<%@ include file="mainMenubar.jsp" %>
		
		<div class="container">
	
		
		
		<!-- 메인페이지 사진 -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			style="width: 100%;">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>

			<div class="carousel-inner" align="center">
				<div class="item active">
					<img src="images/test1.png" alt="가죽">
				</div>
				<div class="item">
					<img src="images/test1.png" alt="직물">
				</div>
				<div class="item">
					<img src="images/test1.png" alt="가죽">
				</div>
				<div class="item">
					<img src="images/test1.png" alt="직물">
				</div>
			</div>

			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div><!-- 메인페이지 사진 -->
		
		<br><br><br>
	
		<h2 align="center">인기상품</h2>
		<div class="container-fluid bg-3 text-center">
			<div class="row">
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
			</div>
		</div>
		<br>

		<div class="container-fluid bg-3 text-center">
			<div class="row">
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
			</div>
		</div>
		<br><br><br>
		
		
		<h2 align="center">인기펀딩</h2>
		<div class="container-fluid bg-3 text-center">
			<div class="row">
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
			</div>
		</div>
		<br>

		<div class="container-fluid bg-3 text-center">
			<div class="row">
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
				<div class="col-sm-3">
					<p>Some text..</p>
					<img src="https://placehold.it/150x80?text=IMAGE"
						class="img-responsive" style="width: 100%" alt="Image">
				</div>
			</div>
		</div>
		
		
		
		
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>