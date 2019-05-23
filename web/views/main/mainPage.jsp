<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<% 
	ArrayList<HashMap<String, Object>> list = 
		(ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	System.out.println(list.isEmpty());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수작</title>
<style>
.leftMove {
	background-image: linear-gradient(to right, rgba(40, 242, 255, 0.57) 0,
		rgba(0, 0, 0, .0001) 100%) !important;
}

.carousel-control.right {
	background-image: linear-gradient(to right, rgba(0, 0, 0, .0001) 0,
		rgba(40, 242, 255, 0.57) 100%) !important;
}

.moveIcon {
	font-size: 30px;
	color: #0aafda;
}

.titleText {
	margin: 100px 0px 70px 0px;
	font-weight: bold;
}

.workList {
	cursor:pointer;
	border-radius: 100px 5px 5px 5px;
	border:1px solid #727272;
	width: 100%;
	height: 100%;
	background: radial-gradient(white, #E6F3FE) fixed;
}
.workList tr>td{
	padding:5px 5px 5px 5px;
}

.cFont {
	font-size: 12px;
	color: lightgray;
	text-align: left;
	padding-left: 10px;
}

.nFont {
	font-size:13px;
	border-top: 1px solid lightgray;
	text-align: left;
	height:50px;
}

.lFont {
	border-top: 1px solid lightgray;
	font-size: 12px;
	text-align: left;
	padding-left: 10px;
	color: lightgray;
}
#myCarousel{
	margin-top:10px;
}
</style>
</head>
<body>
	<%@ include file="mainMenubar.jsp" %>
	
		
	<div class="container">
		
	<!-- 메인페이지 사진 -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			style="width: 100%;">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
	
			<div class="carousel-inner" align="center">
				<div class="item active">
					<img src="/sg/views/main/images/test1.png" alt="가죽">
				</div>
				<div class="item">
					<img src="/sg/views/main/images/test1.png" alt="직물">
				</div>
				<div class="item">
					<img src="/sg/views/main/images/test1.png" alt="가죽">
				</div>
				<div class="item">
					<img src="/sg/views/main/images/test1.png" alt="직물">
				</div>
			</div>
	
			<a class="left carousel-control leftMove" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left moveIcon"></span> 
				<span class="sr-only">Previous</span>
			</a> 
			<a class="right carousel-control " href="#myCarousel" data-slide="next"> 
				<span class="glyphicon glyphicon-chevron-right moveIcon"></span> 
				<span class="sr-only">Next</span>
			</a>
		</div><!-- 메인페이지 사진 -->
		
		
		

		<% if(list.size() < 8){ %>
			<h1 align="center">상품이 없습니다</h1>
		<% }else{ %>
			<h2 class="titleText" align="center">인기상품</h2>
			<div class="container-fluid bg-3 text-center">
				<div class="row">
				<% for(int i = 0; i < 4; i++){ 
						HashMap<String, Object> hmap = list.get(i);
				%>
					<div class="col-sm-3 col-xs-6">
						<table class="workList">
							<tr><td class="workTd" colspan="2" style="widt:150px; height:150px;">
								<input type="hidden" value="<%= hmap.get("workId")%>">
								<img src="<%=request.getContextPath()%>/uploadSalesImage/<%=hmap.get("changeName")%>" style="width:100%;height:100%;">
							</td></tr>
							<tr><td colspan="2" class="cFont"><%=hmap.get("category")%></td></tr>
							<tr><td colspan="2" class="nFont"><%=hmap.get("workName")%></td></tr>
							<tr>
								<td class="lFont">좋아요</td>
								<td><%=hmap.get("wCount")%><span style="color:red; text-align:right;"class="glyphicon glyphicon-heart"></span></td></tr>
						</table>
						<br>
					</div>
				<% } %>
				</div>
			</div>
			<br>
			<div class="container-fluid bg-3">
				<div class="row">
				<% for(int i = 4; i < 8; i++){ 
						HashMap<String, Object> hmap = list.get(i);
				%>
					<div class="col-sm-3 col-xs-6 ">
						<table class="workList">
							<tr><td class="workTd" colspan="2" style="widt:150px; height:150px;">
								<input type="hidden" value="<%= hmap.get("workId")%>">
								<img src="<%=request.getContextPath()%>/uploadSalesImage/<%=hmap.get("changeName")%>" style="width:100%;height:100%;">
							</td></tr>
							<tr><td colspan="2" class="cFont"><%=hmap.get("category")%></td></tr>
							<tr><td colspan="2" class="nFont"><%=hmap.get("workName")%></td></tr>
							<tr>
								<td class="lFont">좋아요</td>
								<td><%=hmap.get("wCount")%><span style="color:red; text-align:right;"class="glyphicon glyphicon-heart"></span></td></tr>
						</table>
						<br>
					</div>
				<% } %>
				</div>
			</div>
		<% }%>
		
		<script>
			$(function(){
				$(".workTd").click(function(){
					var workId = $(this).children().eq(0).val();
					console.log(workId);
					 location.href="<%=request.getContextPath()%>/selectProDetail.pro?workId="+ workId;
				});
			});
		</script>
		
		
		
		
		<h2 class="titleText" align="center">인기펀딩</h2>
		<div class="container-fluid bg-3">
			<div class="row">
				<div class="col-sm-3 col-xs-6">
					<table class="workList">
						<tr><td>
							<img src="https://placehold.it/300x300?text=IMAGE"class="img-responsive" style="width: 100%" alt="Image">
						</td></tr>
						<tr><td class="cFont" style="font-size:15px;color:lightgray;text-align:left;"> 카테고리</td></tr>
						<tr><td class="nFont" style="font-size:20px;">상품명</td></tr>
						<tr><td class="lFont" style="font-size:16px;text-align:left;"> 좋아요수</td></tr>
					</table>
				</div>
				<div class="col-sm-3 col-xs-6">
					<table class="workList">
						<tr><td>
							<img src="https://placehold.it/300x300?text=IMAGE"class="img-responsive" style="width: 100%" alt="Image">
						</td></tr>
						<tr><td class="cFont" style="font-size:15px;color:lightgray;text-align:left;"> 카테고리</td></tr>
						<tr><td class="nFont" style="font-size:20px;">상품명</td></tr>
						<tr><td class="lFont" style="font-size:16px;text-align:left;"> 좋아요수</td></tr>
					</table>
				</div>
				<div class="col-sm-3 col-xs-6">
					<table class="workList">
						<tr><td>
							<img src="https://placehold.it/300x300?text=IMAGE"class="img-responsive" style="width: 100%" alt="Image">
						</td></tr>
						<tr><td class="cFont" style="font-size:15px;color:lightgray;text-align:left;"> 카테고리</td></tr>
						<tr><td class="nFont" style="font-size:20px;">상품명</td></tr>
						<tr><td class="lFont" style="font-size:16px;text-align:left;"> 좋아요수</td></tr>
					</table>
				</div>
				<div class="col-sm-3 col-xs-6">
					<table class="workList">
						<tr><td>
							<img src="https://placehold.it/300x300?text=IMAGE"class="img-responsive" style="width: 100%" alt="Image">
						</td></tr>
						<tr><td class="cFont" style="font-size:15px;color:lightgray;text-align:left;"> 카테고리</td></tr>
						<tr><td class="nFont" style="font-size:20px;">상품명</td></tr>
						<tr><td class="lFont" style="font-size:16px;text-align:left;"> 좋아요수</td></tr>
					</table>
				</div>
			</div>
		</div>
		<br>

		<div class="container-fluid bg-3 text-center">
			<div class="row">
				<div class="col-sm-3 col-xs-6">
					<table class="workList">
						<tr><td>
							<img src="https://placehold.it/300x300?text=IMAGE"class="img-responsive" style="width: 100%" alt="Image">
						</td></tr>
						<tr><td class="cFont" style="font-size:15px;color:lightgray;text-align:left;"> 카테고리</td></tr>
						<tr><td class="nFont" style="font-size:20px;">상품명</td></tr>
						<tr><td class="lFont" style="font-size:16px;text-align:left;"> 좋아요수</td></tr>
					</table>
				</div>
				<div class="col-sm-3 col-xs-6">
					<table class="workList">
						<tr><td>
							<img src="https://placehold.it/300x300?text=IMAGE"class="img-responsive" style="width: 100%" alt="Image">
						</td></tr>
						<tr><td class="cFont" style="font-size:15px;color:lightgray;text-align:left;"> 카테고리</td></tr>
						<tr><td class="nFont" style="font-size:20px;">상품명</td></tr>
						<tr><td class="lFont" style="font-size:16px;text-align:left;"> 좋아요수</td></tr>
					</table>
				</div>
				<div class="col-sm-3 col-xs-6">
					<table class="workList">
						<tr><td>
							<img src="https://placehold.it/300x300?text=IMAGE"class="img-responsive" style="width: 100%" alt="Image">
						</td></tr>
						<tr><td class="cFont" style="font-size:15px;color:lightgray;text-align:left;"> 카테고리</td></tr>
						<tr><td class="nFont" style="font-size:20px;">상품명</td></tr>
						<tr><td class="lFont" style="font-size:16px;text-align:left;"> 좋아요수</td></tr>
					</table>
				</div>
				<div class="col-sm-3 col-xs-6">
					<table class="workList">
						<tr><td>
							<img src="https://placehold.it/300x300?text=IMAGE"class="img-responsive" style="width: 100%" alt="Image">
						</td></tr>
						<tr><td class="cFont" style="font-size:15px;color:lightgray;text-align:left;"> 카테고리</td></tr>
						<tr><td class="nFont" style="font-size:20px;">상품명</td></tr>
						<tr><td class="lFont" style="font-size:16px;text-align:left;"> 좋아요수</td></tr>
					</table>
				</div>
			</div>
		</div>
		
		
		
		
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>