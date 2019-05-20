<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.board.model.vo.*, java.util.*"%>
<% ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list"); 
	System.out.println("boardReview.jsp에서 : " + list);
%>
<!-- r객체가 여러개있는 list인데,  r객체에있는 정보들을 가지고있다!(DAO에서 채워준 rset) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응원 및 리뷰</title>
<style>
	.outer{
		border:1px solid lightgray;
		width:80%;
		height:250px;
		background:#AEE0FF;
	}
	.img{
		width:100px;
		height:100px;
		/* background:red; */
		margin-left:20px;
		margin-top:10px;
	}
	.textarea{
		/* background:black; */
		margin-left:20px;
		margin-top:10px;	
		width:95%;
		height:80px;
	}
	
	.proName{
		margin-left:20px;
		margin-top:10px;	
	}
	.btn{
		float:right;
	}
	.name{
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
				
					<div class="name">응원 및 리뷰</div>
					
					
				</header>
				
				<section id="contents">
				<% for(Review review : list){ %>
					<div class="outer">
					
						<div class="row">
						<!-- <div class="img">
							<img src="../images/tvxq.jpg" style="width:100px; height:100px;">
						</div> -->
						<div class="proName">
							<label onclick="proName()">작품명 &nbsp;&nbsp;&nbsp;&nbsp;| &nbsp; <%=review.getWorkName()%></label>
							<label>작성날짜 ㅣ <%=review.getWriteDate() %></label>
							<label>별점 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| <%=review.getStarPoint() %></label>
						</div>
						</div>
						<div class="row">
							<div class="textarea">
							<%-- <%int num = 0; for(Review review :list){ %> --%>
								<textarea> <%=review.getContent()%></textarea>
							<%-- <%} %> --%>	
							</div>
						</div>
						<!-- <div class="btn">
							<input type="submit" value="수정하기">
							
						</div> -->
						
					</div>
							<br><br><br>
		<script>
			function proName(){
				//alert("배고파");
				 location.href="<%=request.getContextPath()%>/selectProDetail.pro?workId=<%=review.getWorkId()%>";
			}
		</script>		
					<%} %>
			
				
				
					<!-- <div class="outer">
						<div class="row">
						<div class="img">
							<img src="../images/tvxq.jpg" style="width:100px; height:100px;">
						</div>
						<div class="proName">
							<label>작가명</label><br>
							<label>상품명</label>
						</div>
						</div>
						<div class="row">
							<div class="textarea">
								<textarea></textarea>
								
							</div>
						</div>
						<div class="btn">
							<input type="reset" value="취소하기">
							<input type="submit" value="저장하기">
							
						</div>
					</div> -->
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="../common/userMenubarServlet.jsp" %>
	</div>
		
</body>
</html>