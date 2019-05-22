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
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
 <style>
	
    
    /* Set black background color, white text and some padding */
    footer {
      width:100%;
      background-color: #555;
      color: black;
  	  position:absolute; bottom:0;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    /* @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    } */
    .navdiv{
    	height:200px;
    	background:black;
    }
    .container{
    	/* background:gray; */
    	
    	
    }
    /* .row{
    margin-left:70px;
    	/* height:400px; */
    	padding:10px;
    } */
    select{
    	margin-top:10px;
    	height:70%;
    }
    
    .col-sm-4{
    	/* margin-left:30px;
    	margin-right:30px;
    	margin-bottom:23px; */
    	/* height:100%; */
    	
    	
    }
    
    .row{
    	/* background:yellow; */
    	/* margin:10px; */
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
    <select style="width:100%; height:30px; margin-top:10px;">
		<option value="pop">인기순</option>
		<option value="new">최신순</option>
		<option value="low">낮은가격순</option>
		<option value="high">높은가격순</option>
	</select>
  <div class="row">
  	<!-- <div class="col-sm-1"></div> -->
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
							<td class="lFont">좋아요</td>
							<td><span style="margin-left:-160px; color:red; text-align:right;"class="glyphicon glyphicon-heart"></span></td></tr>
					</table>
					<br>
				</div>
    	

    <%} %>
    </div>
    </div>


<script>
	$(".mainImg").click(function(){
		//해당 상세 페이지로 가기!
	/*  location.href="views/product/productDetail.jsp";  */
		<%-- <% HashMap<String, Object> hmap = null; %>
		 
		  
		<% for(int i = 0; i < list.size(); i++){ 
			 
			hmap = list.get(i);
         %>
        
		
		
		<%}%>   --%>
		
		 var workId = $(this).children().eq(0).val();
		 location.href="<%=request.getContextPath()%>/selectProDetail.pro?workId="+ workId;
		
	});
	
	
	
	 function heartyn(){
		
		/* var ctn = 2;
		
			if(ctn%2==0){
				
				heart.src="../images/emptyheart.png";
				alert("관심상품 취소");
			
			}else{
				
				heart.src="../images/fullheart.png";
				
				
			}
			
			ctn++; */
		<% HashMap<String, Object> work = (HashMap<String, Object>)list.get(0); %>
		<%if(loginUser != null ){%>
   		 var memberId = <%=loginUser.getMemberId()%>;
   	 	 var workId = <%=work.get("workId")%>;
   	 <%--  var price = <%=work.get("price")%>;
   	 var deliPrice =<%=work.get("deliPrice")%>; --%>
   	 
   	 $.ajax({
   		 url:"<%=request.getContextPath()%>/insertLike.me?<%=work.get("workId")%>",
   		 data:{memberId:memberId, workId:workId/* , price:price, deliPrice:deliPrice */},
   		 type:"post",
   		 success:function(data){
   			 alert("관심상품 추가!");
   		 },error:function(){
   			 alert("실패");
   		 }
   	 })
   	 <%}%>
			
		
	}  
</script>	

</body>
</html>
