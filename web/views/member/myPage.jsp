<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.work.model.vo.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>)request.getAttribute("hmap");
	ArrayList<String> blist = (ArrayList<String>)hmap.get("blist");
	ArrayList<HashMap<String, Object>> orderList = (ArrayList<HashMap<String, Object>>)hmap.get("orderList");
	ArrayList<WorkOption> olist = (ArrayList<WorkOption>)hmap.get("olist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지!!</title>
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
								<td style="text-align:center;">_P</td>
								<td style=" text-align:center;"><%=blist.size() %>건</td>
								<td style="text-align:center;">_건</td>
								<td style=" text-align:center;">_건</td>
							</tr>
						</table>
					</div>
				</header>
				
				<section id="contents">
					<header class="main">
						<table>
							<tr style="text-align:center">
								<td style="border:1px solid gray;">주문번호</td>
								<td style="border:1px solid gray;">상품사진</td>
								<td style="border:1px solid gray;">주문일</td>
								<td style="border:1px solid gray;">상품명</td>
								<td style="border:1px solid gray;">수량</td>
							</tr>
							<%for(int i = 0; i < orderList.size(); i++) {
								String ovalue = "";
								int oprice = 0;
							%>
								<% for(int j = 0; j < olist.size(); j++) {
									if((Integer)olist.get(j).getwId() == (Integer)orderList.get(i).get("bid")) { 
										 ovalue += (String)olist.get(j).getoName() + " : " + (String)olist.get(j).getoValue() + "/";
										 oprice += (Integer)olist.get(j).getoPrice();
										 System.out.println("ovalue = " + ovalue);
									}else { 
										ovalue += "";	
									} 
								} %>
							<tr>
								<td style="border:1px solid gray;"><%=orderList.get(i).get("bundleCode") %></td>
								<td style="border:1px solid gray;"><img src="uploadSalesImage/<%=orderList.get(i).get("changeName")%>" style="width:50px; height:50px;"></td>
								<td style="border:1px solid gray;"><%=orderList.get(i).get("payDate") %></td>
								<td style="border:1px solid gray;"><%=orderList.get(i).get("workName") + "/" + ovalue %></td>
								<td style="border:1px solid gray;"><%=orderList.get(i).get("count") %></td>
							</tr>
							<%} %>
						</table>
					</header>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		
	</div>
 	
</body>
</html>