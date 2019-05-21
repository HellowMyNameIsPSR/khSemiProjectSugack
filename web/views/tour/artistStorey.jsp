<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.board.model.vo.* ,java.util.*"%>
<%
	Board b = (Board) request.getAttribute("board");
	ArrayList<AuthorPageAttachmrnt> fileList = (ArrayList<AuthorPageAttachmrnt>) request
			.getAttribute("fileList");

	AuthorPageAttachmrnt detailImg1 = fileList.get(0);
	AuthorPageAttachmrnt detailImg2 = fileList.get(1);
	AuthorPageAttachmrnt detailImg3 = fileList.get(2);
%>
<!DOCTYPE html>

<html lang="ko">
<head>
<title>작가 이야기 메인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<style>
#text1 {
	border: 1px solid black;
	margin-left: 300px;
	margin-right: 300px;
}

<%@ include file="../assets/css/main.html" %>
<%@ include file="../assets/css/allCss.html"%>

</style>


</head>

<body>


	<br>






	<nav></nav>
	<div id="wrapper">
		<div id=main>

			<header id="header"> </header>

			<section>




				<aside>

					<%-- <%@ include file="../common/userMenuBar.jsp"%> --%>

				</aside>


				<div style="width: 200px height: 200;" align="center">
					<div class="container">
						<br>
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<img
										src="<%=request.getContextPath()%>/uploadSalesImage/<%=detailImg1.getChangeName()%>"
										alt="Los Angeles" style="width: 200px;">
								</div>

								<div class="item">
									<img
										src="<%=request.getContextPath()%>/uploadSalesImage/<%=detailImg2.getChangeName()%>"
										alt="Chicago" style="width: 200px;">
								</div>

								<div class="item">
									<img
										src="<%=request.getContextPath()%>/uploadSalesImage/<%=detailImg3.getChangeName()%>"
										alt="New york" style="width: 200px;">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>

						<div class="row">
							<h2>
								<%=b.getTitle()%>
							</h2>
						</div>

						<div class="text"
							style="border: 1px solid red; width: 100%; height: 500px;">
							<p>
								<%=b.getContent()%>
							</p>
						</div>



					</div>


				</div>






			</section>

		</div>
		 <jsp:include page="/views/common/tourMenuBarServlet.jsp">
		 	<jsp:param name="memberId" value="<%= b.getMemberId() %>" />
		 </jsp:include>
	</div>
	
</body>
</html>
