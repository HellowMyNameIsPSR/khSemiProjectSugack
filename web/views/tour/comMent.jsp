<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.semi.board.model.vo.* ,com.kh.semi.member.model.vo.Member,java.util.* "%>

<%
   
    int bno = (int)request.getAttribute("bno");
    int memberId = (int)request.getAttribute("memberId");
    Member loginUser2 = (Member) request.getSession().getAttribute("loginUser");
	ArrayList<authorComent> list = (ArrayList<authorComent>) request.getAttribute("list");
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
#sidebar{

       

}


<%@ include file="../assets/css/main.html" %>
<%@ include file="../assets/css/allCss.html"%>
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<%-- <%@ include file="/views/main/mainMenubar.jsp"%>  --%>

			<div class="inner">

				<!-- Header -->

				
				
					
				
				<header id="header">  </header>

 				



				<section id="contents">



					<div class="container">
			
			

						<div>
							<p>관심 가는 작가 들에게 응원에 메세지를 남겨 주세요</p>
							<p>Tip: 관련작가들이 성실이 댓글에 성실히 답해드려요</p>
							<p>
							
							</p>


						</div>
						<%if(loginUser2!=null){ %>
						
						    <div class="row"
								style="border: 1px solid black; width: 1100px; height: 200px;">

								<div class="nick"
									style="width: 100%; height: 50px; padding: 5px;">
									<P><%=loginUser2.getMemberId() %></P> 
									
									
								</div>
								<div class="content"
									style="border: 5px solid black; width: 900px; height: 100px; padding: 5px; margin-left: 20px;">
									<textarea id="Content" style="margin-top: 10px; width: 880px;"
										placeholder="작가에게 응원하세요"></textarea>
								</div>
								<div class="btn"
									style="float: right; width: 120px; height: 100px; margin-left: 10px;">
									<button id="addReply" style="width: 100px; height: 100px;">등록</button>
								</div>

							</div>
						<%-- <%}else if(loginUser2==null || loginUser2!=null){ %>	 --%>
						    

						  
						   <%if(list.size() >0){ 
						      int num = 1;
						      for(authorComent ac : list){ 
						      %>
						      
						
                              
                              <div class="row"
								style="border: 1px solid black; width: 1100px; height: 200px;">

								<div class="nick"
									style="width: 100%; height: 50px; padding: 5px;">
									<P><%= ac.getEmail()%></P>
								</div>
								 
								<div class="content"
									style="border: 5px solid black; width: 900px; height: 100px; padding: 5px; margin-left: 20px;">
									<p><%=ac.getCntent() %></p>
								</div>
								<!-- <div class="btn"
									style="float: right; width: 120px; height: 100px; margin-left: 10px;">
									<button id="addReply" style="width: 100px; height: 100px;">등록</button>
								</div>

 -->							</div> 
							
							<%   num++;
							   }
						      	
							}%>
                              						
                        <%}else{ %>        
							
							  <%if(list.size() >0){ 
						      int num = 1;
						      for(authorComent ac : list){ 
						      %>
						      
						
                              
                              <div class="row"
								style="border: 1px solid black; width: 1100px; height: 200px;">

								<div class="nick"
									style="width: 100%; height: 50px; padding: 5px;">
									<P><%= ac.getEmail()%></P>
								</div>
								 
								<div class="content"
									style="border: 5px solid black; width: 900px; height: 100px; padding: 5px; margin-left: 20px;">
									<p><%=ac.getCntent() %></p>
								</div>
								<!-- <div class="btn"
									style="float: right; width: 120px; height: 100px; margin-left: 10px;">
									<button id="addReply" style="width: 100px; height: 100px;">등록</button>
								</div>

 -->							</div> 
							
							<%   num++;
							   }
						      	
							}%>
							
							
					
						<%} %>

					
						







					</div>
					<!-- Contents area -->
				</section>
				
			
	
		</div>


	</div> 
	
	
	<div id="sidebar" >
	<div class="inner">
		<!-- Logo -->
		<section class="alt">
			<a href="index.jsp">LOGO</a>
		</section>
		<!-- Menu -->
		<nav id="menu">
			<header class="major">
				<h2>Menu</h2>
			</header>
			<ul>
				<li><a href="<%=request.getContextPath()%>/selectAuthorStory.au?memberId=<%=memberId%>&bno=<%=bno%>">작가스토리</a></li>
				<li><a href="<%=request.getContextPath()%>/comMent.as?bno=<%=bno%>&memberId=<%=memberId%>"> 응원하기</a></li>
				
				<li>
					<span class="opener"> 핀메상품</span>
					<ul>
						<li><a href="views/member/likeAuthor.jsp">펀딩상품</a>
						<li><a href="views/member/likeFundingPro.jsp">판매상품</a>
						<li><a href="likePro.jsp">판매예정상품</a>
					</ul>
				</li>
				<!-- <li>
					<span class="opener">게시글관리</span>
					<ul>
						<li><a href="views/member/boardReview.jsp">응원글 및 리뷰</a>
						<li><a href="views/member/boardQna.jsp">문의</a>
					</ul>
				</li>
				<li><a href="views/member/boardPoint.jsp">적립금 사용 내역</a></li> -->
				<%-- <li>
					<span class="opener">개인정보</span>
					<ul>
						<li><a href="views/member/modifyMe.jsp">개인정보 수정</a>
						<li><a href="<%=request.getContextPath()%>/addressList.me?num=<%=loginUser.getMemberId()%>">내 주소 관리</a>
						<li><a href="views/member/withDrawal.jsp">회원 탈퇴</a>
					</ul>
				</li> --%>
				
			</ul>
		</nav>
		<!-- Footer -->
		
	</div>
</div>
	</div>
	<%-- <%}else{} %> --%>
	
<%if(loginUser2!=null){ %>
	<script>
		$(function(){
			$("#addReply").click(function(){
				
				
				var writer = <%=loginUser2.getMemberId()%>;
				var bno = <%=bno%>;
				var content = $("#Content").val();
				console.log(bno);
				$.ajax({
					url:"<%= request.getContextPath()%>/insertComment.as?bno=" + bno,
					data:{writer:writer, bno:bno, content:content}, 
					type:"post", 
					success:function(data){
						if(data == "ok") {
							alert("댓글 작성이 완료되었습니다");
							location.reload();
						}else {
							console.log("FAIL");
						}
					}
					
				}) 
				
				
			})
			
			
		})
	
	
	
	</script>
	<%}%>
	  
<script src="views/assets/js/jquery.min.js"></script>
<script src="views/assets/js/browser.min.js"></script>
<script src="views/assets/js/breakpoints.min.js"></script>
<script src="views/assets/js/util.js"></script>
<script src="views/assets/js/main.js"></script>




</body>
</html>