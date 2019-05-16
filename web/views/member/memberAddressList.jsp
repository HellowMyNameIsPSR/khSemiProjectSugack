<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.*, java.util.*"%>
<%
	ArrayList<Address> list = (ArrayList<Address>)request.getAttribute("list");
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<!-- <link rel="stylesheet" href="../assets/css/main.css" /> -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<style>
		<%@ include file="../assets/css/main.html" %>
	</style>

<body>
<!-- Wrapper -->
	<div id="wrapper">
	
		<!-- Main -->
		<div id="main">
				
			<div class="inner">
				
				<!-- Header -->
				
				<header id="header">
					<div class="name">주소 관리</div>
				</header>
				
				<section id="contents">
					<div class="container">
						<div class="addressArea">
							<table class="memberAddress">
								<tr>
									<th>주소지명</th>
									<th>주소</th>
									<th>연락처</th>
									<th>수정/삭제</th>
								</tr>
								<% if(list.size() > 0) {
									int num = 1;
								for(Address add : list) {
									String []address = add.getAddress().split("#");
								%>
								<tr>
									<td style="display:none"><%= add.getAddressId() %></td>
									<td><%= add.getAddressName() %></td>
									<td><%= address[0] %> <br>
										<%= address[1] %> <br>
										<%= address[2] %> <br>
										<%= address[3] %>
									</td> 
									<td><%= add.getPhone1() %> <br> 
										<% if(add.getPhone2() != null) {%>
										<%= add.getPhone2() %>
										<%} %>
									</td>
									<td>
										<button id="modify<%=num%>">수정</button> &nbsp;
										<button id="delete<%=num%>">삭제</button>
									</td>
								</tr>
								<%		num++;
									}
								} %>
							</table>
							
							<button onclick="popup()">주소추가</button>
						</div>
						
	
					</div>
					<!-- Contents area -->
				</section>
			</div>
	<script>
		function popup(){
			window.open("views/member/inputAddress.jsp", "주소입력", "width=500, height=600, left=200, top=100");
		}
		$(function(){
			var addressId1 = $("#modify1").parent().parent().children().eq(0).text();
			var addressId2 = $("#modify2").parent().parent().children().eq(0).text();
			var addressId3 = $("#modify3").parent().parent().children().eq(0).text();
			
			$("#modify1").click(function(){
				<%-- location.href="<%=request.getContextPath()%>/selectAddress.me?addressId=" + addressId1; --%>
				$.ajax({
					url:"<%=request.getContextPath()%>/selectAddress.me?addressId=" + addressId1,
					data:{addressId:addressId1},
					success:function(data){
						var url = "";
						var address = data.address.split("#");
						var zipCode = address[0];
						var mainAddress = address[1].split(" ");
						var detailAddress = address[2];
						var extraAddress = address[3];
						console.log(zipCode);
						console.log(mainAddress);
						var add = "";
						for(var i = 0; i < mainAddress.length; i++) {
							add += (mainAddress[i] + "L");
						}
						console.log(add);
						
						
						if(data != null) {
							console.log(data.address);
							var winObj = window.open("views/member/modifyAddress.jsp?address=" + add + "&zipCode=" + zipCode + "&detailAddress=" + detailAddress + "&extraAddress=" + extraAddress +"&addressName=" + data.addressName + "&addressId=" + data.addressId + "&phone1=" + data.phone1 + "&phone2=" + data.phone2 + "&memberId=" + data.memberId, 
									"주소입력", "width=500, height=600, left=200, top=100");
							/* winObj.document.getElementById("addressName").value = data.addressName;	 */						
						}else{
							alert("실패했습니다.");
						}
					}
				});
			});
			$("#delete1").click(function(){
				<%-- location.href="<%=request.getContextPath()%>/deleteAddress.me?addressId=" + addressId; --%>
				$.ajax({
					url:"<%=request.getContextPath()%>/deleteAddress.me",
					data:{addressId:addressId1},
					success:function(data){
						if(data == "ok") {
							alert("삭제가 완료되었습니다.");
							location.reload();								
						}else{
							alert("삭제에 실패했습니다.");
						}
					}
				});
				
			});
			$("#modify2").click(function(){
				$.ajax({
					url:"<%=request.getContextPath()%>/selectAddress.me?addressId=" + addressId2,
					data:{addressId:addressId2},
					success:function(data){
						var url = "";
						var address = data.address.split("#");
						var zipCode = address[0];
						var mainAddress = address[1].split(" ");
						var detailAddress = address[2];
						var extraAddress = address[3];
						console.log(zipCode);
						console.log(mainAddress);
						var add = "";
						for(var i = 0; i < mainAddress.length; i++) {
							add += (mainAddress[i] + "L");
						}
						console.log(add);
						if(data != null) {
							console.log(data.address);
							var winObj = window.open("views/member/modifyAddress.jsp?address=" + add + "&zipCode=" + zipCode + "&detailAddress=" + detailAddress + "&extraAddress=" + extraAddress +"&addressName=" + data.addressName + "&addressId=" + data.addressId + "&phone1=" + data.phone1 + "&phone2=" + data.phone2 + "&memberId=" + data.memberId, 
									"주소입력", "width=500, height=600, left=200, top=100");				
						}else{
							alert("실패했습니다.");
						}
					}
				});
			});
			$("#delete2").click(function(){
				$.ajax({
					url:"<%=request.getContextPath()%>/deleteAddress.me",
					data:{addressId:addressId2},
					success:function(data){
						if(data == "ok") {
							alert("삭제가 완료되었습니다.");
							location.reload();								
						}else{
							alert("삭제에 실패했습니다.");
						}
					}
				});
			});
			$("#modify3").click(function(){
				$.ajax({
					url:"<%=request.getContextPath()%>/selectAddress.me?addressId=" + addressId3,
					data:{addressId:addressId3},
					success:function(data){
						var url = "";
						var address = data.address.split("#");
						var zipCode = address[0];
						var mainAddress = address[1].split(" ");
						var detailAddress = address[2];
						var extraAddress = address[3];
						console.log(zipCode);
						console.log(mainAddress);
						var add = "";
						for(var i = 0; i < mainAddress.length; i++) {
							add += (mainAddress[i] + "L");
						}
						console.log(add);
						if(data != null) {
							console.log(data.address);
							var winObj = window.open("views/member/modifyAddress.jsp?address=" + add + "&zipCode=" + zipCode + "&detailAddress=" + detailAddress + "&extraAddress=" + extraAddress +"&addressName=" + data.addressName + "&addressId=" + data.addressId + "&phone1=" + data.phone1 + "&phone2=" + data.phone2 + "&memberId=" + data.memberId, 
									"주소입력", "width=500, height=600, left=200, top=100");						
						}else{
							alert("실패했습니다.");
						}
					}
				});
			});
			$("#delete3").click(function(){
				$.ajax({
					url:"<%=request.getContextPath()%>/deleteAddress.me",
					data:{addressId:addressId3},
					success:function(data){
						if(data == "ok") {
							alert("삭제가 완료되었습니다.");
							location.reload();								
						}else{
							alert("삭제에 실패했습니다.");
						}
					}
				});
			});
		});
	</script>
	</div>
<div id="sidebar">
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
				<li><a href="views/member/myPage.jsp">주문내역</a></li>
				<li>
					<span class="opener">좋아요리스트</span>
					<ul>
						<li><a href="views/member/likeAuthor.jsp">관심작가</a>
						<li><a href="views/member/likeFundingPro.jsp">관심 펀딩 상품</a>
						<li><a href="likePro.jsp">관심 판매상품</a>
					</ul>
				</li>
				<li>
					<span class="opener">게시글관리</span>
					<ul>
						<li><a href="views/member/boardReview.jsp">응원글 및 리뷰</a>
						<li><a href="views/member/boardQna.jsp">문의</a>
					</ul>
				</li>
				<li><a href="views/member/boardPoint.jsp">적립금 사용 내역</a></li>
				<li>
					<span class="opener">개인정보</span>
					<ul>
						<li><a href="views/member/modifyMe.jsp">개인정보 수정</a>
						<li><a href="<%=request.getContextPath()%>/addressList.me?num=<%=loginUser.getMemberId()%>">내 주소 관리</a>
						<li><a href="views/member/withDrawal.jsp">회원 탈퇴</a>
					</ul>
				</li>
				<li><a href="#">고객센터</a>
			</ul>
		</nav>
		<!-- Footer -->
		<footer id="footer">
			<ul class="contact">
				<li class="fa-envelope-o">information@untitled.tld</li>
				<li class="fa-phone">(000)000-000</li>
				<li class="fa-home">1234 Somewhere Road #8524 <br>
				Nashville, TN 00000-0000</li>
			</ul>
			<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>
			.Design:<a href="https://html5up.net">HTML5 UP</a>.</p>
		</footer>
	</div>
</div>
	</div>
<!-- script -->
<script src="views/assets/js/jquery.min.js"></script>
<script src="views/assets/js/browser.min.js"></script>
<script src="views/assets/js/breakpoints.min.js"></script>
<script src="views/assets/js/util.js"></script>
<script src="views/assets/js/main.js"></script>
			
</body>
</html>
	
	



















	 
</body>
</html>