<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.semi.board.model.vo.* ,com.kh.semi.member.model.vo.Member"%>
<%
/* String member_Id = (String)request.getAttribute("memberId"); */
	String bno =(String)request.getAttribute("bno");
%>
<%
	Member loginUser2 = (Member)request.getSession().getAttribute("loginUser");
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
</style>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<%-- <%@ include file="/views/main/mainMenubar.jsp"%>  --%>

			<div class="inner">

				<!-- Header -->

				<header id="header"> </header>

				<section id="contents">



					<div class="container">


						<div>
							<p>관심 가는 작가 들에게 응원에 메세지를 남겨 주세요</p>
							<p>Tip: 관련작가들이 성실이 댓글에 성실히 답해드려요</p>
							<p>
								가져온 멤버 bno : <%=bno %>
								</p>


						</div>

						<div>
							<div class="row"
								style="border: 1px solid black; width: 1100px; height: 200px;">

								<div class="nick"
									style="width: 100%; height: 50px; padding: 5px;"> <P></P></div> <!--작성자  -->
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
						</div>


						<br>


                             

						<div  class="row">
							<div class="col" style="margin: 0 auto;">

								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#"><</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">4</a></li>
									<li class="page-item"><a class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#">></a></li>
								</ul>
							</div>
						</div>








					</div>
					<!-- Contents area -->
				</section>
			</div>
		</div>

		
	</div> 
	
	<script>
		$(function(){
			$("#addReply").click(function(){
				
				
				var writer = <%=loginUser2.getMemberId()%>;
				var bno = <%=bno%>;
				var content = $("#Content").val();
				console.log(bno);
				$.ajax({
					url:"<%=request.getContextPath()%>/insertComment.as?num=<%=bno%>",
					data:{writer:writer, bno:bno, content:content}, 
					type:"post", 
					success:function(data){
						
					}
					
				}) 
				
				
			})
			
			
		})
	
	
	
	</script>
	




</body>
</html>