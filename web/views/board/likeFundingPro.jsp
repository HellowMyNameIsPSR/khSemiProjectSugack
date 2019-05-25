<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.member.model.vo.*"%>
<%
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>) request.getAttribute("list");
	HashMap<String, Object> work = (HashMap<String, Object>)list.get(0); 
	System.out.println(work);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심펀딩상품</title>
<link href="https://fonts.googleapis.com/css?family=Poor+Story&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
					<div class="name">관심펀딩상품</div>
				</header>
				
				<section id="contents">
					<div class="container">
						<div class="row">
						
							 	<%for(int i=0; i<list.size(); i++){
							 			HashMap<String,Object> hmap = list.get(i);
							 	%>
							   <div class="col-sm-2 product" style="background-color:white; border:2px solid lightgray; height:400px; margin-bottom:30px;margin-left:50px;margin-right:20px;">
							 	<div class="outer" onclick="location.href = '<%=request.getContextPath()%>/selectProDetail.pro?workId=<%= list.get(i).get("workId") %>'">

							 		
							 		<input type="hidden" id="wid" value="<%=hmap.get("workId") %>">
							 		<div class="img" style="width:280px; margin-top:20px; margin-left:5px;">
							 			<img src="uploadFundingGoodsImg/<%=hmap.get("changeName") %>" style="width:250px; height:200px; border:2px solid lightgray">
							 		</div>
							 
							 		<div class="productName">
							 			<label style="margin-left:20%; margin-top:10px; font-family: 'Poor Story', cursive; font-size:25px"><%=hmap.get("workName") %></label>
							 		</div>
							 		
							 		<div class="heart">
							 			<input type="hidden" value="<%=hmap.get("workId") %>">
							 			<img src="views/images/heart.png" class="delLike" style="width:30px; height:30px; float:left;">
							 		</div>
							 		<div>
							 			<label id="price" style="margin-left:65%; font-size:15px"><%=hmap.get("price") %>원</label>
							 		</div>
							 		
							 		<br><br><br>
							 		
							 		<br><br>
							 	</div>
							 </div>
							 	<%} %>
							 	
							
					</div>
					
					
					<br><br>
					<%
						Member loginUser2 = (Member)request.getSession().getAttribute("loginUser");
					 %>
					 <script>
					 
					 $(function(){
							$(".delLike").click(function(){
							
							var memberId = <%=loginUser2.getMemberId()%>;
							var workId =  $(this).parent().children().eq(0).val();
							console.log(workId);
						   
							$.ajax({
								url:"<%=request.getContextPath()%>/deleteFundLike.fund",
								data:{memberId:memberId, workId:workId},
								type:"post",
								success:function(data){
									alert("관심상품 취소!");
									location.reload();
									//alert(data);
									
								},error:function(){
									alert("실패!");
								}
							})
							console.log(workId);
							});
						});
					</script> 
					
					</div>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<!-- 여기 메뉴바 -->	<%@ include file="../common/userMenubarServlet.jsp" %>
	</div>
		
</body>
</html>