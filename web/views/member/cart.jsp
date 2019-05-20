<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list");
	System.out.println(list.size());
	
	int totalPrice = 0;
	int totalProductPrice = 0;
	int totalDeliPrice = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
	.buyArea{
		
		width:100%;
		height:50px;
		display:inline-block;
		margin:0 auto;
		text-align:center;
		
	}
	.buyBtn{
		
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
					<div class="name">장바구니</div>
					
					
					
				</header>
				
				<section id="contents">
					<header class="main">
					<form method="post" action="<%=request.getContextPath()%>/cartPurchaseServlet.pro">
						<table>
							<!-- <tr>
								<td c1solspan="5" style="height:100px; background:gray; color:white; font-size:20px;"><div class="name">장바구니</div></td>
							</tr> -->
							<tr style="height:50px; font-size:18px;">
								<th><input type="checkbox" id="selectAll"><label for="selectAll"></label></th>
								<th>이미지</th>
								<th>상품정보</th>
								<th>수량</th>
								<th>가격</th>
								<th>배송비</th>
							</tr>
							<% for(int i = 0; i < list.size(); i++) { 
								totalPrice += ((int)list.get(i).get("price") + (int)list.get(i).get("oprice")) * (int)list.get(i).get("count") + (int)list.get(i).get("deliPrice");
								totalProductPrice += ((int)list.get(i).get("price") + (int)list.get(i).get("oprice")) * (int)list.get(i).get("count");
								totalDeliPrice += (int)list.get(i).get("deliPrice");
							%>
							<tr>
								<td>
									<input type="checkbox" id="select<%=i%>" class="select" name="select" value="<%=list.get(i).get("bid")%>"><label for="select<%=i%>"></label>
								</td>
								<td><img src="uploadSalesImage/<%=list.get(i).get("changeName") %>" style="width:50px; height:50px;"></td>
								<%if(list.get(i).get("ovalue") != null) { %>
								<td><div class="explain"><%=list.get(i).get("workName") %>/<%=list.get(i).get("ovalue") %></div></td>
								<%}else { %>
								<td><div class="explain"><%=list.get(i).get("workName") %></div></td>
								<%} %>
								<td>
									<button type="button" class="plus">+</button>
									<input type="number" value="<%=list.get(i).get("count")%>" readonly style="width:30px;" id="count">
									<button type="button" class="minus">-</button>
								</td>
								<td id="price"><%=((int)list.get(i).get("price") + (int)list.get(i).get("oprice")) * (int)list.get(i).get("count")%></td>
								<td id="deliPrice"><%=(int)list.get(i).get("deliPrice") %></td>
							</tr>
							<% } %> 
							
						</table>
						<br>
						<table>
							<tr>
								<td>총 주문금액</td>
								<td></td>
								<td>배송비</td>
								<td></td>
								<td>결제예정금액</td>
							</tr>
							<tr>
								<td id="totalProductPrice">0</td>
								<td>+</td>
								<td id="totalDeliPrice">0</td>
								<td>=</td>
								<td id="totalPrice">0</td>
							</tr>
							
							
						</table>
						<div align="center">
							<input type="submit" value="선택 구매" class="buyBtn" style="width:300px; height:50px; ">
							<input type="button" value="선택 삭제" id="allDelete" style="width:300px; height:50px; ">
						</div>
						</form>
						<div class="buyArea">
						</div>
						
					</header>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="../common/userMenubarServlet.jsp" %>
	</div>
	
	<script>
		$(function(){
			$(".plus").click(function(){
				var count = $(this).siblings("#count").val();
				 $(this).siblings("#count").val(parseInt(count) + 1);
				 var cnt =  $(this).siblings("#count").val();
				 
				 var bid = $(this).parent().parent().children().children(".select").val();
				 
				 
				 $.ajax({
					url:"<%=request.getContextPath()%>/countUpdate.me",
					type:"post",
					data:{cnt:cnt, bid:bid},
					success:function(data){
						if(data == "ok"){
							location.reload();							
						}
					}
				 });
			})
			$(".minus").click(function(){
				var count = $(this).siblings("#count").val();
				 $(this).siblings("#count").val(parseInt(count) - 1);
				 var cnt =  $(this).siblings("#count").val();
				 
				 var bid = $(this).parent().parent().children().children(".select").val();
				 
				 $.ajax({
						url:"<%=request.getContextPath()%>/countUpdate.me",
						type:"post",
						data:{cnt:cnt, bid:bid},
						success:function(data){
							location.reload();
						}
					 });
			})
			
			$("#selectAll").click(function(){
				if($("#selectAll").prop("checked")) { 
					$("input[type=checkbox]").prop("checked",true); 
					$(".select").each(function(){
						var totalProductPrice = $("#totalProductPrice").text();
						var price = $(this).parent().parent().find("#price").text();
						var proPrice = parseInt(price) + parseInt(totalProductPrice);
						$("#totalProductPrice").text(proPrice);
						
						var totalDeliPrice = $("#totalDeliPrice").text();
						var deliPrice = $(this).parent().parent().find("#deliPrice").text();
						var deliProPrice = parseInt(deliPrice) + parseInt(totalDeliPrice);
						$("#totalDeliPrice").text(deliProPrice);
						
						var totalPrice = $("#totalPrice").text();
						$("#totalPrice").text(deliProPrice + proPrice);
					});
				}else { 
					$("input[type=checkbox]").prop("checked",false); 
					$("#totalProductPrice").text(0);
					$("#totalDeliPrice").text(0);
					$("#totalPrice").text(0);
				}

			});
			
			$(".select").click(function(){
					if($(this).is(":checked") == true){
						var totalProductPrice = $("#totalProductPrice").text();
						var price = $(this).parent().parent().find("#price").text();
						var proPrice = parseInt(price) + parseInt(totalProductPrice);
						$("#totalProductPrice").text(proPrice);
						
						var totalDeliPrice = $("#totalDeliPrice").text();
						var deliPrice = $(this).parent().parent().find("#deliPrice").text();
						var deliProPrice = parseInt(deliPrice) + parseInt(totalDeliPrice);
						$("#totalDeliPrice").text(deliProPrice);
						
						var totalPrice = $("#totalPrice").text();
						$("#totalPrice").text(deliProPrice + proPrice);
					}else {
						var totalProductPrice = $("#totalProductPrice").text();
						var price = $(this).parent().parent().find("#price").text();
						var proPrice = parseInt(totalProductPrice) - parseInt(price);
						$("#totalProductPrice").text(proPrice);
						
						var totalDeliPrice = $("#totalDeliPrice").text();
						var deliPrice = $(this).parent().parent().find("#deliPrice").text();
						var deliProPrice = parseInt(totalDeliPrice) - parseInt(deliPrice);
						$("#totalDeliPrice").text(deliProPrice);
						
						var totalPrice = $("#totalPrice").text();
						var total = parseInt(totalPrice);
						$("#totalPrice").text(total - (parseInt(price) + parseInt(deliPrice)));
					}
			});	
			
			$("#allDelete").click(function(){
				var bidArr = new Array();
				$(".select").each(function(){
					if($(this).is(":checked") == true) {
						bidArr.push($(this).val());	
					}
					console.log(bidArr);			
				})
				
				$.ajaxSettings.traditional = true;
				$.ajax({
					url:"<%=request.getContextPath()%>/deleteCart.me",
					type:"post",
					data:{bidArr:bidArr},
					success:function(data){
						if(data == "ok"){
							alert("삭제가 완료되었습니다.");
							location.reload();							
						}
					}
				})
			});
		});
	
	</script>		
			
			
			
			
			
			
			
			
			
			
			
			
			
</body>
</html>