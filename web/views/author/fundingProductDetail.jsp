<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>펀딩상품 자세히 보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(function(){
		$("#applyProject").click(function(){
			alert("프로젝트 신청서 모달 띄워짐");
		});
	});
</script>
<style>
	.navdiv{
		height:200px;
		background:black;
	}
	
	.container{
		background:yellow;
	}
	
	.productDiv{
		background:beige;
		padding:15px;
	}
	.img{
		float:left;
		padding:20px;
		width:430px;
		background:green;
	}
	img{
		width:400px;
	}

/* .shortInfo{
	margin-left:40px;
	width:400px;
	height:550px;
	padding:25px;
	margin-right:100px;
	background:white;
	margin-top:23px;
} */

hr{
	border:1px solid gray;
}

.totalPrice{
	/* margin-top:10px;
	
	float:right; */
	width:100%;
	height:50px;
	background:orange;
	}
.totalPrice>h4{
	
	margin-top:15px;
}
input[type:image]{
	border:1px solid black;
} 

.information{
	padding:30px;
}


.qnaArea {
		border:2px solid lightgray;
		margin: 20px 0px 20px 0px;
		box-shadow:2px 2px lightgray;
		width:80%;
		height:100%;
		background:beige;
		margin:0 auto;
		margin-top:20px;
	}
	.qnaTitle {
		border-bottom:1px solid lightgray;
		margin: 20px 0px 20px 0px;
		padding-left:20px;
	}
	.qnaContents {
		margin: 20px 0px 20px 0px;
		padding-left:20px;
		padding-right:20px;
		
	}
	.qnaContents div{
		margin: 20px 0px 20px 0px;
	}
	
	.qna{
		height:40px;
	}
	
	#qnaBtn{
		width:30%;
		padding:5px;
		color:white;
		border:2px solid gray; 
		background:gray;
		
		
	}
</style>
</head>
<body class="is-preload">
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
					</header>
  <!-- Page Content -->
  <div class="container">

    <!-- Heading Row -->
    <div class="row align-items-center my-5">
      <div class="col-sm-6 " >
        <img class="img-fluid rounded mb-4 mb-lg-0" src="../images/tvxq.jpg" style="width:100%;">
      </div>
      <!-- /.col-lg-8 -->
      <div class="col-sm-6 productDiv">
        <h5>품명 및 모델명</h5>
			<h5>기본가격</h5>
			<hr>
			<h5>주문D-Day</h5>
			<h5>현재주문량(%)</h5>
			<h5>최소주문수량</h5>
			<h5>최대주문수량</h5>
			<h5>배송예정일은 2019년 12월 24일 | 배송비:3000원</h5>
			<hr>
			<h5>옵션선택</h5>
			<select id="sel1"style="width:350px; height:20px;">
				<option value="op1">옵션1</option>
				<option value="op2">옵션2</option>
			</select>
			
			<hr>
			<div class="selectOpt" style="width:100%; height:100px; background:black; margin-top:70px;">	
			</div>
			<div class="totalPrice">
				<p style="float:left; margin-top:10px; font-size:20px;">총가격: </p>
				<p style="float:right; margin-top:10px; font-size:20px;">10000원</p>
			</div>
			<div class="btns" style="margin-top:5px; width:100%; height:50px;">
			<button class="pull-right all-btn" id="applyProject"
				    >
				참여신청하기
			</button>
			</div>
      </div>
      <!-- /.col-md-4 -->
    </div>
    <hr>
    	<div class="row information">
	<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#menu0">기본정보</a></li>
    <li><a data-toggle="tab" href="#menu1">배송/판매/교환/환불</a></li>
    <li><a data-toggle="tab" href="#menu2">별점 및 응원글</a></li>
    <li><a data-toggle="tab" href="#menu3">문의</a></li>
 	 </ul>

  <div class="tab-content">
    <div id="menu0" class="tab-pane fade in active">
      <h3>기본정보</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>배송/판매/교환/환불</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>별점 및 응원글</h3>
      <div class="star"; style="background:beige;  padding:10px; width:100%; height:150px;">
      	<textarea style="width:100%; height:80px;"></textarea>
      	<select style="float:left; width:200px; height:40px;">
      		<option>★★★★★ 아주좋아요</option>
      		<option>★★★★☆ 마음에 들어요</option>
      		<option>★★★☆☆ 보통이에요</option>
      		<option>★★☆☆☆ 별로에요</option>
      	</select>
        <button style=" float:right; width:150px; height:40px; background:gray; color:white; border:1px solid gray;">리뷰등록하기</button>
      </div>
      
    
    </div>
    
    <div id="menu3" class="tab-pane fade">
    
    
    			<form id="salesInsert" action="" method="post">
   					 <div class="qnaArea">
							<div class="qnaTitle">
								<h2>문의하기</h2>
							</div>
							<div class="qnaContents">
									<table class="searchBox" style="width:100%;" >
										<tr class="qna">
											<td><label >문의 제목:</label></td>
											
											<td><input type="text" style="width:100%;"></td>
											
										</tr>
										<tr class="qna">
											<td><label >작성자:</label></td>
											<td><input type="text"
												style="width: 100%;"></td>
										</tr>
										<tr class="qna">
											<td><label>작성일:</label></td>
											<td><input type="text"
												style="width: 100%;"></td>
										</tr>
										<tr class="qna">
											<td><label>내용:</label></td>
											<td><textarea name="content" style="width:100%;"></textarea></td>
										</tr>
										<tr class="qna">
											<td colspan="2"><input type="submit" value="작성하기" id="qnaBtn" style="float:right;"></td>
										</tr>
									</table>
								
								</div>
							</div>
							
						</form>
					</div>
					</div>
					</div>
					</section>
					</div>
					</div>
					</div>
					<%@ include file="authorMenuBar.jsp" %>
					</div>
					

<script>
	$(function(){
		$("#sel1").click(function(){
			var value = $('option:selected',this).text();
			
		})		
	});
	

	$("#purchase").click(function(){
		console.log("test");
		location.href="../common/purchase.jsp";
	});

</script>


</body>
</html>