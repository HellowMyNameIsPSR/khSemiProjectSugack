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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
					<div class="outer" style="margin-bottom:10px;">
					
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
								<textarea style="margin-left:-5px"> <%=review.getContent()%></textarea>
							<%-- <%} %> --%>	
							</div>
							
						</div>
						<div class="Btn" style="float:right; background:yellow; margin-right:30px;" >
								<input type="hidden" value="<%=review.getWorkId()%>">
								<button onclick="eidt();">수정하기</button>
								
								<button class="delete">삭제하기</button>
								
						</div>
						<!-- <div class="btn">
							<input type="submit" value="수정하기">
							
						</div> -->
						
					</div>
				<%} %>
					 
		<%
			Member loginUser2 = (Member)request.getSession().getAttribute("loginUser");
		 %>	
		 <%--<% for(Review review : list){ --%> 
		<%-- <!-- <% for(int i = 0; i < list.size(); i++) { %>   -->  --%>			
		<script>
			<%-- function proName(){
				//alert("배고파");
				 location.href="<%=request.getContextPath()%>/selectProDetail.pro?workId=<%=review.getWorkId()%>";
			} --%>
			

			
			$(function(){
				$(".delete").click(function(){
					var memberId = <%=loginUser2.getMemberId()%>;
					 var workId = $(this).parent().children().eq(0).val();
						console.log(workId);
						if(confirm("정말 삭제하시겠습니까 ?") == true){
						 	$.ajax({
								url:"<%=request.getContextPath()%>/deleteReview.bo", <%-- <%=list.get(i).getWorkId()%> --%>
								data:{memberId:memberId, workId:workId},
								type:"post",
								success:function(data){
									alert("삭제되었습니다.");
									location.reload();
								}
								
							});
						
						}else{return ;}
					
				});
			});
			
				
				
			
				
			
			
			 
			

			
	
		</script>		
				
			
				
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="../common/userMenubarServlet.jsp" %>
	</div>
		
</body>
</html>