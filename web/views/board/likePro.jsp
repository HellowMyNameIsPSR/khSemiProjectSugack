<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.member.model.vo.*"%>
<%
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심판매상품!</title>
<style>
	.name{
		width:100%;
		font-size:30px;
	}
	.progress{
		width:100%;
		
		height:30px;
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
					<div class="name">관심판매상품</div>
				</header>
				
				<section id="contents">
					<div class="container">
						<div class="row">
							 <div class="col-sm-4 product" style="background-color:lavender; height:50%;">
							 	<div class="outer">
							 		<%for(int i=0; i<list.size(); i++){
							 			HashMap<String,Object> hmap = list.get(i);
							 		%>
							 		
							 		<div class="img" style="width:230px;">
							 			<img src="uploadSalesImage/<%=hmap.get("changeName") %>" style="width:200px; height:200px;">
							 		</div>
							 		<div class="productName">
							 			<label style="margin-left:80px;"><%=hmap.get("workName") %></label>
							 		</div>
							 		
							 		<div class="heart">
							 			<img src="views/images/heart.png" style="width:50px; height:50px; float:left;">
							 		</div>
							 		<div>
							 			<label id="price" style="margin-left:160px;"><%=hmap.get("price") %>원</label>
							 		</div>
							 		<%} %>
							 	</div>
							 	
							 </div>
							
							 <div class="col-sm-4"></div>
							 
							  	<div class="col-sm-4 product" style="background-color:lavender; height:50%;">
							 	<div class="outer">
							 		<div class="img" style="width:230px;">
							 			<img src="../images/tvxq.jpg" style="width:200px; height:200px;">
							 		</div>
							 		<div class="productName">
							 			<label style="margin-left:80px;">상품명</label>
							 		</div>
							 		
							 		<div class="heart">
							 			<img src="../images/heart.png" style="width:50px; height:50px; float:left;">
							 		</div>
							 		<div>
							 			<label style="margin-left:160px;">가격</label>
							 		</div>
							 	</div>
							 	
							 </div>
					
					</div>
					
					
					<br><br>
					
					<div class="row">
							 		 <div class="col-sm-4 product" style="background-color:lavender; height:50%;">
							 	<div class="outer">
							 		<div class="img" style="width:230px;">
							 			<img src="../images/tvxq.jpg" style="width:200px; height:200px;">
							 		</div>
							 		<div class="productName">
							 			<label style="margin-left:80px;">상품명</label>
							 		</div>
							 		
							 		<div class="heart">
							 			<img src="../images/heart.png" style="width:50px; height:50px; float:left;">
							 		</div>
							 		<div>
							 			<label style="margin-left:160px;">가격</label>
							 		</div>
							 	</div>
							 	
							 </div>
							 <div class="col-sm-4"></div>
							  		 <div class="col-sm-4 product" style="background-color:lavender; height:50%;">
							 	<div class="outer">
							 		<div class="img" style="width:230px;">
							 			<img src="../images/tvxq.jpg" style="width:200px; height:200px;">
							 		</div>
							 		<div class="productName">
							 			<label style="margin-left:80px;">상품명</label>
							 		</div>
							 		
							 		<div class="heart">
							 			<img src="../images/heart.png" style="width:50px; height:50px; float:left;">
							 		</div>
							 		<div>
							 			<label style="margin-left:160px;">가격</label>
							 		</div>
							 	</div>
							 	
							 </div>
					
					</div>
					</div>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="../common/userMenubarServlet.jsp" %>
	</div>
			
</body>
</html>