<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.work.model.vo.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>)request.getAttribute("hmap");
	ArrayList<String> blist = (ArrayList<String>)hmap.get("blist");
	ArrayList<HashMap<String, Object>> orderList = (ArrayList<HashMap<String, Object>>)hmap.get("orderList");
	ArrayList<WorkOption> olist = (ArrayList<WorkOption>)hmap.get("olist");
	System.out.println(olist);
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
								<th style="height:50px;  font-size:15px; text-align:center;">취소/환불확인</th>
								<th style="height:50px;  font-size:15px; text-align:center;">펀딩투자내역</th>
							</tr>
							<tr>
								<td style="text-align:center;"><%=hmap.get("totalPoint") %>원</td>
								<td style=" text-align:center;"><%=blist.size() %>건</td>
								<td style="text-align:center;">_건</td>
								<td style=" text-align:center;">_건</td>
							</tr>
						</table>
					</div>
				</header>
				
				<section id="contents">
				<% for(int i = 0; i < blist.size(); i++) { %>
			<table>
				<tr style="height:50px; font-size:18px;">
					<th>주문번호</th>
					<th><%=blist.get(i)%></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<%for(int k = 0; k < orderList.size(); k++) {%>
				<tr>
					<%if(blist.get(i).equals((String)orderList.get(k).get("bundleCode"))){
						String ovalue = "";
						int oprice = 0;
				%>
					<td><input type="hidden" value="<%=orderList.get(k).get("bid")%>">
					<img src="uploadSalesImage/<%=orderList.get(k).get("changeName") %>" style="width:50px; height:50px;"></td>
					<% for(int j = 0; j < olist.size(); j++) {
						System.out.println((Integer)olist.get(j).getwId() + " + " + (Integer)orderList.get(k).get("bid"));
					%>
						<%if((Integer)olist.get(j).getwId() == (Integer)orderList.get(k).get("bid")) { 
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
					<td id="btn">
						<button>교환요청</button>
						<button type="button" data-toggle="modal" data-target="#myModal<%=k%>">환불요청</button>
						<!-- Modal -->
						<div id="myModal<%=k%>" class="modal fade" role="dialog">
						  <div class="modal-dialog">
						
						    <!-- Modal content-->
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal">&times;</button>
						        <h4 class="modal-title">환불요청</h4>
						      </div>
						      <div class="modal-body">
						        <textarea class="form-control" rows="5" id="comment"></textarea>
						      </div>
						      <div class="modal-footer">
						      	<input type="hidden" value="<%=orderList.get(k).get("odId")%>">
						        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-default refund" data-dismiss="modal">보내기</button>
						      </div>
						    </div>
						
						  </div>
						</div>

					</td>
				</tr>
				<% }
				} %> 
			</table>
				<% } %>
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
			$(".refund").click(function(){
				var bid = $(this).parent().children().eq(0).val();
				var text = $(this).
				console.log(bid);
			});
		</script>

 	
</body>
</html>