<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%
    	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list"); 
    	System.out.println("list : " + list);
    	
    	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>판매상품목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
 <style>
	
    
    /* Set black background color, white text and some padding */!
    footer {
      width:100%;
      background-color: #555;
      color: black;
  	  position:absolute; bottom:0;
    }
    
 
    .navdiv{
    	height:200px;
    	background:black;
    }
    
  
    select{
    	margin-top:10px;
    	height:70%;
    }
    
   
    
    .row{
    	
    	margin-top:30px;
    	
    }
    .content{
    	margin:auto;
    	margin-top:10px;
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
  </style>

</head>
<body>

  <%@ include file="../main/mainMenubar.jsp" %>
 

<div class="container">
    <select id="order"style="width:100%; height:30px; margin-top:10px;">
    	<option value="not" disabled selected></option>
		<option value="pop">인기순</option>
		<option value="new">최신순</option>
		<option value="low">낮은가격순</option>
		<option value="high">높은가격순</option>
	</select>
  <div class="row">

  	<% for(int i=0; i<list.size(); i++){
   			HashMap<String,Object> hmap = list.get(i);
 
   	%>

	   
   		<div class="col-sm-3 col-xs-6 mainImg">
   			<input type="hidden" value="<%=hmap.get("workId")%>">
					<table class="workList">
						<tr><td class="workTd" colspan="2" style="widt:150px; height:150px;">
							<img src="<%=request.getContextPath()%>/uploadSalesImage/<%=hmap.get("changeName")%>" style="width:100%;height:100%;">
						</td></tr>
						<tr><td colspan="2" class="cFont"><%=hmap.get("category")%></td></tr>
						<tr><td colspan="2" class="nFont"><%=hmap.get("workName")%></td></tr>
						<tr>
							<td class="lFont">조회수</td>
							<td><span style="margin-left:-130px; color:red; text-align:right;"class="glyphicon glyphicon-heart"><%=hmap.get("wcount")%></span></td></tr>
					</table>
					<br>
				</div>
    	

    <%} %>
    </div>
    </div>


<script>

 
	$("#order").change(function(){
		console.log($("#order option:selected").val());
		
		var order = ($("#order option:selected").val());
		console.log(order); 
		
		if($("#order").val()=='pop'){
			
					
				location.href="<%=request.getContextPath()%>/selectProListPop.pro";
			
				
		
		}else if($("#order").val()=='low'){
			    location.href="<%=request.getContextPath()%>/selectProListLow.pro";
		}else if($("#order").val()=='new'){
				location.href="<%=request.getContextPath()%>/selectProListNew.pro";
		}else if($("#order").val()=='high'){
				location.href="<%=request.getContextPath()%>/selectProListHigh.pro";
		}
	
		
		
		
	 }); 
	
	$(".mainImg").click(function(){
		//해당 상세 페이지로 가기!

		
		
		 var workId = $(this).children().eq(0).val();
		 location.href="<%=request.getContextPath()%>/selectProDetail.pro?workId="+ workId;
		
	});
	
	
	


</script>	
<%@ include file="/views/main/footer.jsp" %>
</body>
</html>
