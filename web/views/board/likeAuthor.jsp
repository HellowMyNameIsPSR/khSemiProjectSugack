<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심작가!</title>
<style>
	.name{
		width:100%;
		font-size:30px;
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
				
				<header id="header">
					<div class="name">관심작가</div>
				</header>
				
				<section id="contents">
					<div class="container" style="margin-left:20px;">
						<div class="row">
							 <div class="col-sm-4 author" style="background-color:lavender; height:50%;">
							 	<div class="outer">
							 		<div class="img" style="width:230px;">
							 			<img src="../images/tvxq.jpg" style="width:200px; height:200px;">
							 		</div>
							 		<div class="authorName">
							 			<label style="margin-left:80px;">작가명</label>
							 		</div>
							 		<div class="heart">
							 			<img src="../images/fullheart.png" name="heart"style="width:50px; height:50px; float:right;" onclick="heartyn();">
							 		</div>
							 	</div>
							 	
							 </div>
							 <div class="col-sm-4"></div>
							  <div class="col-sm-4 author" style="background-color:lavenderblush; height:50%;">
							  	<div class="outer">
							 		<div class="img" style="width:230px;">
							 			<img src="../images/tvxq.jpg" style="width:200px; height:200px;">
							 		</div>
							 		<div class="authorName">
							 			<label style="margin-left:80px;">작가명</label>
							 		</div>
							 		<div class="heart">
							 			<img src="../images/heart.png" style="width:50px; height:50px; float:right;">
							 		</div>
							  </div>
							  
							  
						</div>
					
					</div>
					
					
					<br><br>
					
					<div class="row">
							 <div class="col-sm-4 author" style="background-color:lavender; height:50%;">
							 	<div class="outer">
							 		<div class="img" style="width:230px;">
							 			<img src="../images/tvxq.jpg" style="width:200px; height:200px;">
							 		</div>
							 		<div class="authorName">
							 			<label style="margin-left:80px;">작가명</label>
							 		</div>
							 		<div class="heart">
							 			<img src="../images/heart.png" style="width:50px; height:50px; float:right;">
							 		</div>
							 	</div>
							 	
							 </div>
							 <div class="col-sm-4"></div>
							  <div class="col-sm-4 author" style="background-color:lavenderblush; height:50%;">
							  	<div class="outer">
							 		<div class="img" style="width:230px;">
							 			<img src="../images/tvxq.jpg" style="width:200px; height:200px;">
							 		</div>
							 		<div class="authorName">
							 			<label style="margin-left:80px;">작가명</label>
							 		</div>
							 		<div class="heart">
							 			<img src="../images/heart.png" style="width:50px; height:50px; float:right;">
							 		</div>
							  </div>
							  
							  
						</div>
					
					</div>
					</div>
					<!-- Contents area 1s-->
				</section>
			</div>
		</div>
		<%@ include file="../common/userMenuBar.jsp" %>
	</div>
		<script>
		
			function heartyn(){
				
				
				
					heart.src="../images/emptyheart.png";
					alert("관심작가 취소");
					
					//$(this).removeChild(".outer");
				
			} 
		</script>	
</body>
</html>