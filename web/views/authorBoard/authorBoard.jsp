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
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<%-- <%@ include file="../assets/css/allCss.html" %> --%>
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
    /* .navdiv{
    	height:200px;
    	background:black;
    } */
    /* .container{
    	background:gray;
    	
    	
    } */
    /* .row{
    margin-left:70px;
    	/* height:400px; */
   /*  	padding:10px;
    } */ */
    select{
    	margin-top:10px;
    	height:70%;
    }
    
    /* .col-sm-4{ */
    	/* margin-left:30px;
    	margin-right:30px;
    	margin-bottom:23px; */
    	/* height:100%; */
    	
    	
    }
    
   /*  .row{
    	background:yellow;
    	/* margin:10px; */ 
    	
    }
    .content{
    	margin:auto;
    	margin-top:10px;
    }
    
  </style>

</head>
<body>
<div class="navdiv">
 
 
 <%@ include file="../main/mainMenubar.jsp"%>


</div> 
<div class="container">

  <!-- <div class="select" style="width:100%; height:50px; background:beige;">
    
   
    <select style="width:100%; height:30px; margin-top:10px;">
		<option value="pop">가죽</option>
		<option value="new">천</option>
		<option value="new">목공</option>
		<option value="low">도자기</option>
		<option value="high">귀금속</option>
	</select>
 	</div> -->
  <div class="row">
  
               

     <%if(loginUser != null && loginUser.getMemberType().equals("W")){ %> 
     
     <div><a href="views/tour/authorpageProEdit.jsp">프로필 작성하기</a></div>
     <div><a href="views/tour/authorPageDetail.jsp">스토리 작성하기</a></div>
     
     
     <%} %>
  
  	<!-- <div class="col-sm-1"></div> -->
  	<% for(int i=0; i<list.size(); i++){
   				HashMap<String,Object> hmap = list.get(i);
   				System.out.println("hmap: "+hmap);
   				%>
    
    <div style="text-align:center; border: 1px solid black;">
  
    <h1>작가 스토리</h1>
    <p>수작에 작가들을  만나보세요</p>
    
    </div>
    
    
    
    <br> 
    <br> 
    <div class="col-sm-3 product" style="background-color:lavender; height:50%;">
   		<div class="content" style="background-color:#FFFFFF; height:300px; width:100%">
   			
   			
   			<div class="mainImg" style="height:200px;">
   				<input type="hidden" value=<%=hmap.get("MemberID") %>>
   				<input type="hidden" value=<%=hmap.get("BNO")%>>
   				<img src="uploadSalesImage/<%=hmap.get("ProChangename")%>" name="pic" style="width:100%; height:200px; align:center" class="thumbImg" >
   			</div>
   			
   			<div class="proName" style="height:40px;">
   				<p name="titleName"style="text-align:center; font-size:15px; margin-top:5px;"><%=hmap.get("ProTitle")%></p>
   			</div>
   			<div class="heartprice" style="height:60px; margin-right:10px; margin-top:5px;">
   			<p name="Content" style="float:right; font-size:15px;"><%=hmap.get("ProContent") %></p>
   			</div>
   			
   			
   		</div>
    	
    </div>
    <%} %>
    </div>
    
    

</div>

<script>
	$(".mainImg").click(function(){
		//해당 상세 페이지로 가기!
	  
	
		
		 var memberId = $(this).children().eq(0).val();
		 var Bno =$(this).children().eq(1).val();
		 console.log(memberId)
		 location.href="<%=request.getContextPath()%>/selectAuthorStory.au?memberId="+memberId+"&bno="+Bno;
		
	});
	
	
	
	
</script>

</body>
</html>
