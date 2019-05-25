<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
	
 <%
    	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list"); 
    	System.out.println("list : " + list);
    	
    	
    	
    	
    	
    	
   
    %>	
	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매상품</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<style>
.name {
	width: 100%;
	font-size: 30px;
}
</style>
</head>
<body>






	<div id="wrapper">

		<!-- Main -->
		<div id="main">

			<div class="inner">

				<!-- Header -->

				<header id="header">
					<div class="name">출시 상품페이지</div>
					<div class="navdiv"></div>
					<div class="select"
						style="width: 100%; height: 50px; background: beige;">


						<select style="width: 100%; height: 30px; margin-top: 10px;">
							<option value="pop"></option>
							<option value="new">인기순</option>
							<option value="new">낮은가격순</option>
							<option value="low">높은가격순</option>
							<option value="high">최신 출시순</option>

						</select>
					</div>

					<div class="select"
						style="width: 100%; height: 50px; background: beige;">


						<select style="width: 100%; height: 30px; margin-top: 10px;">
							<option value="pop"></option>
							<option value="new">판매중 상품</option>
							<option value="new">판매종료 상품</option>


						</select>
					</div>

				</header>

				<section id="contents">
					<div class="container">
					
					
					<div class="row">
					
					<%for(int i=0; i<list.size(); i++) {
							    
							   HashMap<String,Object> hamp = list.get(i);   
							   
							   %>
						
<%-- 							<div class="col-sm-4 author"
								style="background-color: lavender; height: 50%;">
								<div class="outer">
									<div class="img" style="width: 230px;">
										<img src="uploadSalesImage/<%= %> 
											style="width: 200px; height: 200px;">
									</div>
									<div class="authorName">
										<label style="margin-left: 80px;">상품1</label>
									</div>
									<div class="heart">
										<img src="<%= request.getContextPath()%>/views/images/heart.png"
											style="width: 50px; height: 50px; float: right;">
									</div>
								</div>

							</div> --%>
						
							
							<div class="col-sm-3 author"
								style="background-color: lavenderblush; height: 50%; border-right 1px; solid red    ">
						
                           <img src="<%=request.getContextPath()%>/uploadSalesImage/<%=hamp.get("ChangeName")%>" style=" height:200px;">
                              
                              <div class="workName" style="height:40px"> 
                              
                                 <p name="titleName" style="text-align:center; font-sie:15px; margin-top:5px;"><%=hamp.get("WorkName") %></p> 
                              </div>
                              
                              <div class="heartprice" style="height:60px; margin-right:10px; margin-top:5px;">
                              <p name="Content" style="text-align:center; font-size:15px;">   
                                                                           판매 가격 : <%=hamp.get("Price") %>
                              </p>
                              </div>
                              
                               

							</div>
							 <%} %>

                               </div>
                               </div>




							<%-- <div class="col-sm-4 author"
								style="background-color: lavender; height: 50%;">
								<div class="outer">
									<div class="img" style="width: 230px;">
										<img src="<%= request.getContextPath()%>/views/images/artist.jpg"
											style="width: 200px; height: 200px;">
									</div>
									<div class="authorName">
										<label style="margin-left: 80px;">상품3</label>
									</div>
									<div class="heart">
										<img src="<%= request.getContextPath()%>/views/images/heart.png"
											style="width: 50px; height: 50px; float: right;">
									</div>
								</div>

							</div>

							<div class="col-sm-4 author"
								style="background-color: lavenderblush; height: 50%;">
								<div class="outer">
									<div class="img" style="width: 230px;">
										<img src="<%= request.getContextPath()%>/views/images/artist.jpg"
											style="width: 200px; height: 200px;">
									</div>
									<div class="authorName">
										<label style="margin-left: 80px;">상품4</label>
									</div>
									<div class="heart">
										<img src="<%= request.getContextPath()%>/views/images/heart.png"
											style="width: 50px; height: 50px; float: right;">
									</div>
								</div>


							</div>
						</div>
						<div class="row">
							<div class="col-sm-4 author"
								style="background-color: lavender; height: 50%;">
								<div class="outer">
									<div class="img" style="width: 230px;">
										<img src="<%= request.getContextPath()%>/views/images/artist.jpg"
											style="width: 200px; height: 200px;">
									</div>
									<div class="authorName">
										<label style="margin-left: 80px;">상품1</label>
									</div>
									<div class="heart">
										<img src="<%= request.getContextPath()%>/views/images/heart.png"
											style="width: 50px; height: 50px; float: right;">
									</div>
								</div>

							</div>
							<div class="col-sm-4"></div>
							<div class="col-sm-4 author"
								style="background-color: lavenderblush; height: 50%;">
								<div class="outer">
									<div class="img" style="width: 230px;">
										<img src="<%= request.getContextPath()%>/views/images/artist.jpg"
											style="width: 200px; height: 200px;">
									</div>
									<div class="authorName">
										<label style="margin-left: 80px;">상품2</label>
									</div>
									<div class="heart">
										<img src="<%= request.getContextPath()%>/views/images/heart.png"
											style="width: 50px; height: 50px; float: right;">
									</div>
								</div>


							</div>






							<div class="col-sm-4 author"
								style="background-color: lavender; height: 50%;">
								<div class="outer">
									<div class="img" style="width: 230px;">
										<img src="<%= request.getContextPath()%>/views/images/artist.jpg"
											style="width: 200px; height: 200px;">
									</div>
									<div class="authorName">
										<label style="margin-left: 80px;">상품3</label>
									</div>
									<div class="heart">
										<img src="<%= request.getContextPath()%>/views/images/heart.png"
											style="width: 50px; height: 50px; float: right;">
									</div>
								</div>

							</div>

							<div class="col-sm-4 author"
								style="background-color: lavenderblush; height: 50%;">
								<div class="outer">
									<div class="img" style="width: 230px;">
										<img src="<%= request.getContextPath()%>/views/images/artist.jpg"
											style="width: 200px; height: 200px;">
									</div>
									<div class="authorName">
										<label style="margin-left: 80px;">상품4</label>
									</div>
									<div class="heart">
										<img src="<%= request.getContextPath()%>/views/images/heart.png"
											style="width: 50px; height: 50px; float: right;">
									</div>
								</div>


							</div>
						</div> --%>
						


					
					<!-- Contents area -->
				</section>
			</div>
		</div>
				
	</div>

</body>
</html>