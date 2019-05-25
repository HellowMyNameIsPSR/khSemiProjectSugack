<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.work.model.vo.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>)request.getAttribute("hmap");
	ArrayList<HashMap<String, Object>> blist = (ArrayList<HashMap<String, Object>>)hmap.get("blist");
	ArrayList<HashMap<String, Object>> orderList = (ArrayList<HashMap<String, Object>>)hmap.get("orderList");
	ArrayList<WorkOption> olist = (ArrayList<WorkOption>)hmap.get("olist");
	System.out.println(olist);
	int refundCount = 0;
	for(int i = 0; i < orderList.size(); i++) {
		if(orderList.get(i).get("refundStat") != null) {
			refundCount++;
		}
	}
	int salesCount = 0;
	int fundCount = 0;
	for(int i = 0; i < orderList.size(); i++) {
		if(orderList.get(i).get("workType").equals("SALES")){
			salesCount++;
		}else {
			fundCount++;
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지!!</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	.myPage{
		display:block;
	}
	.headerMe{
		border:1px solid black;
		display:block;
	}
	#table tr{
	
	border-bottom:1px solid black;
	}
</style>
</head>
<body>
<%@ include file="../common/userMenubarServlet.jsp" %>

<!-- Wrapper1e -->
	<div id="wrapper">
	
		<!-- Main -->
		<div id="main">
				
			<div class="inner">
				
				<!-- Header -->
				
				<header id="header">
				
					
					
					<div class="table">
						<table id="table">
							<tr>
							<th colspan="4" style="font-size:20px; text-align:center; background:#9DCAFF; color:white;">MY정보</th>
							</tr>
							<tr>
								<th style="height:50px; font-size:15px; text-align:center;">적립금</th>
								<th style="height:50px;  font-size:15px; text-align:center;" >주문내역</th>
								<th style="height:50px;  font-size:15px; text-align:center;">환불내역</th>
								<th style="height:50px;  font-size:15px; text-align:center;">펀딩투자내역</th>
							</tr>
							<tr>
								<td style="text-align:center;"><%=hmap.get("totalPoint") %>원</td>
								<td style=" text-align:center;"><%=salesCount %>건</td>
								<td style="text-align:center;"><%=refundCount %>건</td>
								<td style=" text-align:center;"><%=fundCount %>건</td>
							</tr>
						</table>
					</div>
				</header>
				<br><br>
				<section id="contents">
				<h2>주문내역</h2>
				<hr>
				<%if(blist.size() == 0)  {%>
					<br><br>
					<h2 align="center" style="color:gray">주문내역이 없습니다</h2>
					<div align="center"><button class="btn btn-info btn-lg" onclick="goPurchase();">구매하러 가기</button></div>
				<%}else { %>
				<% for(int i = 0; i < blist.size(); i++) { %>
			<table>
				<tr style="height:50px; font-size:18px;">
					<th>주문번호</th>
					<th><%=blist.get(i).get("bundleCode")%></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th colspan="2"><%=blist.get(i).get("payDate") %></th>
				</tr>
				<%for(int k = 0; k < orderList.size(); k++) {%>
				<tr>
					<%if(blist.get(i).get("bundleCode").equals((String)orderList.get(k).get("bundleCode"))){
						String ovalue = "";
						int oprice = 0;
					if(orderList.get(k).get("workType").equals("SALES")) {	%>
					<td><input type="hidden" value="<%=orderList.get(k).get("bid")%>">
					<img src="uploadSalesImage/<%=orderList.get(k).get("changeName") %>" style="width:50px; height:50px;"></td>
					<td>일반제품</td>
					<%}else { %>
					<td><input type="hidden" value="<%=orderList.get(k).get("bid")%>">
					<img src="uploadFundingGoodsImg/<%=orderList.get(k).get("changeName") %>" style="width:50px; height:50px;"></td>	
					<td>펀딩제품</td>
					<%} %>
					<% for(int j = 0; j < olist.size(); j++) {
					%>
						<%if((int)olist.get(j).getwId() == (int)orderList.get(k).get("bid")) { 
							 ovalue += (String)olist.get(j).getoName() + " : " + (String)olist.get(j).getoValue() + "/";
							 oprice += (Integer)olist.get(j).getoPrice();
						}else { 
							ovalue += "";
						} 
						
					} %>
						<%if(ovalue.equals("null")) {ovalue = "";}%>
						<td><%=orderList.get(k).get("authorName") %>작가님 작품</td>
						<td><div class="explain"><%=orderList.get(k).get("workName") %>/<%=ovalue %></div></td>
					<td>
						<%=orderList.get(k).get("count")%>
					</td>
					<td id="price"><%=((((int)orderList.get(k).get("price") + oprice)  * (int)orderList.get(k).get("count")) + (int)orderList.get(k).get("deliPrice"))%></td>
					
					<%if(orderList.get(k).get("refundStat") == null) {%>
					<td id="btn">
						<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal<%=k%>">환불요청</button>
						<!-- Modal -->
						<div id="myModal<%=k%>" class="modal fade" role="dialog">
						  <div class="modal-dialog">
						
						    <!-- Modal content-->
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal">&times;</button>
						        <h3 class="modal-title">환불요청</h3><br>
						        <label style="color:red">
						        	*수제품 특성상 불량품이 아니면 환불이 불가능할 수 있습니다. <br>
						        	환불사유를 거짓으로 작성시 불이익이 있을 수 있습니다.
						        </label>
						        
						      </div>
						      <div class="modal-body">
						        <textarea class="form-control" rows="5" id="comment"></textarea>
						      </div>
						      <div class="modal-footer">
						      	<input type="hidden" value="<%=orderList.get(k).get("odId")%>">
						        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						        <button type="button" class="btn btn-default refund" data-dismiss="modal">보내기</button>
						      </div>
						    </div>
						
						  </div>
						</div>

					</td>
					<%} else { %>
						<td style="color:yellowgreen">환불<%= orderList.get(k).get("refundStat") %></td>
					<%} %>
					
					<% String deliStatus = (String)orderList.get(k).get("deliStatus");
					if(orderList.get(k).get("deliStatus") != null) { %>
						<%if(!deliStatus.equals("배송완료")) {%>
						<td style="color:red"><%= orderList.get(k).get("deliStatus") %></td>
						<%}else { %>
						<td style="color:red">
							<input type="hidden" value="<%=orderList.get(k).get("odId")%>">
							<button class="confirm btn btn-primary btn-xs">배송완료</button>
						</td>
						<%} %> 
					<%}else { %>
						<td></td>
					<%} %>
				</tr>
				<% }
				} %> 
			</table>
				<% } %>
				<%} %>
					<!-- Contents area -->
				</section>
						
						<%-- <tr>
							<td style="border:1px solid gray;"><%=orderList.get(i).get("bundleCode") %></td>
							<td style="border:1px solid gray;"><img src="uploadSalesImage/<%=orderList.get(i).get("changeName")%>" style="width:50px; height:50px;"></td>
							<td style="border:1px solid gray;"><%=orderList.get(i).get("payDate") %></td>
							<td style="border:1px solid gray;"><%=orderList.get(i).get("workName") + "/" + ovalue %></td>
							<td style="border:1px solid gray;"><%=orderList.get(i).get("count") %></td>
						</tr> --%>
					</div>
			</div>
		</div>
		
		<script>
			function goPurchase(){
				location.href="<%=request.getContextPath()%>/selectProduct.pro";
			}
		
			$(".confirm").click(function(){
				if(confirm("구매확정을 하시겠습니까?")){
					var odId = $(this).parent().children().eq(0).val();
					$.ajax({
						url:"<%=request.getContextPath()%>/deleteOrder.me",
						type:"post",
						data:{odId:odId},
						success:function(data){
							if(data == "ok"){
								alert("구매가 확정되었습니다!");
							}else {
								alert("배송중이거나 환불요청중입니다!");
							}
						}
					});
				}else{
					alert("취소되었습니다");
				}
			});

			$(".refund").click(function(){
				var oid = $(this).parent().children().eq(0).val();
				var text = $(this).parent().parent().find(".modal-body").children().eq(0).val();
				console.log(oid);
				console.log(text);
				$.ajax({
					url:"<%=request.getContextPath()%>/inserRefund.me",
					type:"post",
					data:{oid:oid, text:text},
					success:function(data){
						if(data == "ok"){
							alert("환불요청이 완료되었습니다.");
							location.reload();
						}else{
							alert("환불요청에 실패했습니다");
						}
					}
				});
			});
		</script>

 	
</body>
</html>