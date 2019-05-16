<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>펀딩상품목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

 <style>
	
    
    /* Set black background color, white text and some padding */
    footer {
      width:100%;
      background-color: #555;
      color: black;
  	  position:absolute; bottom:0;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    /* @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    } */
    .navdiv{
    	height:200px;
    	background:black;
    }
    .container{
    	background:gray;
    	
    	
    }
    /* .row{
    margin-left:70px;
    	/* height:400px; */
    	padding:10px;
    } */
    select{
    	margin-top:10px;
    	height:70%;
    }
    
    .col-sm-4{
    	/* margin-left:30px;
    	margin-right:30px;
    	margin-bottom:23px; */
    	/* height:100%; */
    	
    	
    }
    
    .row{
    	background:yellow;
    	/* margin:10px; */
    	
    }
    .content{
    	margin:auto;
    	margin-top:10px;
    }
    
    
    .information{
    	padding:70px;
    }
  </style>

</head>
<body>
<div class="navdiv">
 
</div> 
<div class="container">

  <div class="select" style="width:100%; height:50px; background:beige;">
    
   
    <select style="width:100%; height:30px; margin-top:10px;">
		<option value="pop">인기순</option>
		<option value="new">최신순</option>
		<option value="low">낮은가격순</option>
		<option value="high">높은가격순</option>
	</select>
 	</div>
  <div class="row">
  	<!-- <div class="col-sm-1"></div> -->
    <div class="col-sm-3 product" style="background-color:lavender; height:50%;">
   		<div class="content" style="background-color:green; height:300px; width:100%">
   			<img src="../images/heart.png" style="float:right;width:30px; height:30px; ">
   			<div class="img" style="height:200px;">
   			
   			<img src="../images/tvxq.jpg" style="width:100%; height:80%; align:center" >
   			
   			</div>
   			<div class="proName" style="height:40px;">
   				<p style="text-align:center; font-size:15px; margin-top:5px;">품명</p>
   			</div>
   			<div class="heart" style="padding:7px; height:50px; width:40px; float:right; " >
   				<!-- <img src="../images/heart.png" style="width:30px; height:30px; "> -->
   			</div>
   			<div class="orderPrice">
   			<div class="order" style="height:60px; margin-top:-10px; float:left;">
   				<p style="font-size:15px;  margin-left:10px;">주문량  <br>&nbsp;: 70%</p>
   			</div>
   				
   				<div class="price"style="height:60px; margin-top:-10px;  float:right; ">
   				<p style="font-size:15px; margin-right:-25px;">5000원</p>
   				</div>
   			
   			</div>	
   			
   			
   		</div>
    	
    </div>
    <div class="col-sm-3 product" style="background-color:lavenderblush; height:50%;">
    	<div class="content" style="background-color:green; height:300px; width:100%"></div>
    </div>
    <div class="col-sm-3 product" style="background-color:lavender; height:50%;">
    	<div class="content" style="background-color:green; height:300px; width:100%"></div>
    </div>
    <div class="col-sm-3 product" style="background-color:lavenderblush; height:50%;">
    	<div class="content" style="background-color:green; height:300px; width:100%"></div>
    </div>
    <!-- <div class="col-sm-1"></div> -->
  </div>
  <div class="row">
    <!-- <div class="col-sm-1"></div> -->
    <div class="col-sm-3 product" style="background-color:lavender; height:50%;">
    	<div class="content" style="background-color:green; height:300px; width:100%"></div>
    </div>
    <div class="col-sm-3 product" style="background-color:lavenderblush; height:50%;">
    	<div class="content" style="background-color:green; height:300px; width:100%"></div>
    </div>
    <div class="col-sm-3 product" style="background-color:lavender; height:50%;">
    	<div class="content" style="background-color:green; height:300px; width:100%"></div>
    </div>
    <div class="col-sm-3 product" style="background-color:lavenderblush; height:50%;">
    	<div class="content" style="background-color:green; height:300px; width:100%"></div>
    </div>
    <!-- <div class="col-sm-1"></div> -->
  </div>
  <div class="row">
   <!--  <div class="col-sm-4" style="background-color:lavender;width:420px; height:380px;">.col-sm-4</div>
    <div class="col-sm-4" style="background-color:lavenderblush;width:420px; height:380px;">.col-sm-4</div>
    <div class="col-sm-4" style="background-color:lavender;width:420px; height:380px;">.col-sm-4</div>  -->
    <!--  <div class="col-sm-1"></div> -->
    <div class="col-sm-3 product" style="background-color:lavender; height:50%;">
    	<div class="content" style="background-color:green; height:300px; width:100%"></div>
    </div>
    <div class="col-sm-3 product" style="background-color:lavenderblush; height:50%;">
    	<div class="content" style="background-color:green; height:300px; width:100%"></div>
    </div>
    <div class="col-sm-3 product" style="background-color:lavender; height:50%;">
    	<div class="content" style="background-color:green; height:300px; width:100%"></div>
    </div>
    <div class="col-sm-3 product" style="background-color:lavenderblush; height:50%;">
    	<div class="content" style="background-color:green; height:300px; width:100%"></div>
    </div>
    <!-- <div class="col-sm-1"></div> --> 
  </div>	
 
</div>
<script>
	$(".product").click(function(){
		//해당 상세 페이지로 가기
		location.href="fundingProductDetail.jsp";
	});
</script>

</body>
</html>
