<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.*, java.util.*"%>
<%
	ArrayList<Address> list = (ArrayList<Address>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
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
			</div>
	<%@ include file="../common/userMenubarServlet.jsp" %>
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
	
	
</body>
</html>
	
	
















