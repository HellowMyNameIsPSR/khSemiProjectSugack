<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*, com.kh.semi.board.model.vo.*, java.text.SimpleDateFormat, com.kh.semi.work.model.vo.*"%>
<%	
    ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	ArrayList<WorkOption> olist = (ArrayList<WorkOption>)request.getAttribute("olist");
	System.out.println("product detail에서 olist" + olist);
    System.out.println("product detail에서" + list);
    ProQna qna = (ProQna)request.getAttribute("qna"); 
    
    HashMap<String, Object> work = (HashMap<String, Object>)list.get(0); 
    System.out.println("work: "+work);
    
    ArrayList<Review> reviewList = (ArrayList<Review>)request.getAttribute("reviewList");
    System.out.println("review: " + reviewList);
    
    
    
    SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 자세히 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
<style>
 
   .proArea{
      background:yellow;
   }
   
   .productDiv{
     
      padding:15px;
      background:white;
    
      
   }
   .img{
      float:left;
      padding:20px;
      width:430px;
      background:green;
   }
   img{
      width:400px;
   }
  
   .qnaTitle {
      border-bottom:1px solid lightgray;
      margin: 20px 0px 20px 0px;
      margin-left:150px;
   }
   .qnaContents {
      margin: 20px 15px 20px 15px;
      padding-left:20px;
      padding-right:20px;
      border:2px solid lightgray;
      
   }
   .qnaContents div{
      margin: 20px 0px 20px 0px;
   }
   
   .qna{
      height:40px;
   }
   
   #qnaBtn{
      width:20%;
      padding:5px;
      color:white;
      border:2px solid gray; 
      background:gray;
      height:30%;
      
      
   }
   
  


hr{
   border:1px solid gray;
}

.totalPrice{
  
   width:100%;
   height:50px;
   border:1px solid black;
   margin-top:40px;
   margin-bottom:15px;
  
   }
.totalPrice>h4{
   
   margin-top:15px;
}

.information{
   padding:30px;
}

#purchase{
	background:white;
	
}

#purchase:hover{
	background:#80A8E8;
}

#btn:hover{
	background:blue;
}
</style>
</head>
<body>



  <!-- Page Content -->
 <%@ include file="../main/mainMenubar.jsp" %>
 <%@ include file="../assets/css/allCss.html" %>
  <div class="container ">
    <!-- Heading Row -->
    <div class="align-items-center my-5">
      <div class="col-sm-6" >
		  <div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		    <% for(int i = 0; i < list.size(); i++) { 
		    	if(i == 0) {%>
			      <li data-target="#myCarousel" data-slide-to="<%=i%>" class="active"></li>
		    	<% } else { %>
		      <li data-target="#myCarousel" data-slide-to="<%=i%>"></li>
		      <% } %>
		    <%} %>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner" style="margin-top:30px">
		    <% for(int i=0; i<list.size(); i++){
   				HashMap<String,Object> hmap = list.get(i);
   				if(i == 0) {
	   		%>
	        <div class="item active">
		        <img src="uploadSalesImage/<%=hmap.get("changeName")%>" style="width:100%; height:450px;">
		    </div>
	   		
	   			<%} else { %>
			      <div class="item">
			        <img src="uploadSalesImage/<%=hmap.get("changeName")%>" style="width:100%; height:450px;">
			      </div>
	   		
	   			<%} %>
	   		<%} %>
		    </div>
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
		  </div>
		</div>

      </div>
      <!-- /.col-lg-8 !-->
      <div class="col-sm-6 productDiv" style="height:450px; margin-top:30px">
       
      
        <h2><%=work.get("workName") %></h2>
			
			<hr>
			<h4>판매가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="price"><%=work.get("price") %>원</label></h4>
			<h4>배송비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label id="deliPrice"><%=work.get("deliPrice") %>원</label>  </h4>
			
	
			<hr>
		<form method="post" id="buy">
			  <input type="hidden" id="workId" name="workId" value="<%=work.get("workId")%>">
   		  <%if((Integer)work.get("opId") != 0) {%>
			<label>옵션선택</label>
			<br>
				<% for(int i = 0; i < olist.size(); i++) { %>
					<select style="width:50%" class="option" name="option">
						<option value="0"><%=olist.get(i).getoName() %></option>
						<% for(int j = 0; j < list.size(); j++) { 
							if(olist.get(i).getoName().equals(list.get(j).get("oname")) && list.get(j).get("picType").equals("0")) {
								System.out.println(list.get(j).get("opId"));
						%>		
							<option value="<%=list.get(j).get("opId")%>"><%=list.get(j).get("ovalue")%>(+<%=list.get(j).get("oprice") %>원)</option>
						<% 
							}
						} %>
					</select>
				<%} %>
				
				
				<div style= "float:right;" id="countArea"  >
				
				<label style=" margin-left:-130px;">수량</label>
				<button type="button" onclick="plus();">+</button>
				<input type="number" style="width:50px;" id="ea" name="ea" value="1" readonly>
				<button type="button" onclick="minus();">-</button>
			</div>
				
			<hr>
			
			<%} else { %>
			<label>옵션이 없습니다.</label>
			<div id="countArea">	
				<label>수량</label>
				<button type="button" onclick="plus();">+</button>
				<input type="number" style="width:50px;" id="ea" name="ea" value="1" readonly>
				<button type="button" onclick="minus();">-</button>
			</div>
			<hr>
			<%} %>
			<div class="totalPrice" style="border:1px solid lightgray">
				<p style="float:left; margin-top:10px; font-size:20px;">총 작품 금액 </p>
				<p style="float:right; margin-top:10px; font-size:20px;" id='sum'></p><p style="float:right"></p>
			</div>
			<div class="btns" style="margin-top:5px;">
			 <button type="submit" style="float:left; font-size:16px;width:30%; height:60px; color:white;border:2px solid black; background:black;"id="purchase">구매하기</button>
         	 <button onclick="likeBtn()" id="btn" style="color:black;border:2px solid lightgray; background:white;margin-right:15px;float:right;width:30%; height:60px;  font-size:16px;">관심상품 담기</button>
         <!-- <input type="image" src="../images/heart.png" style="width:80px; height:50px; border:2px solid pink; background:pink; border-radius:7px;"> -->
         <button id="goBasket" class="btn" style="width:30%; margin-left:15px;height:60px; color:black;background:white;border:2px solid lightgray;font-size:16px;text-align:center">장바구니 담기</button>
         
       </div>
			</form>
		</div>
		<script>
			var optionPrice = 0;
			$(function(){
				$(".option:last").change(function(){
					var opId = new Array();
					var optionValue = "";
					optionPrice = 0;
					$(".option").each(function(){
						<%for(int i = 0; i < list.size(); i++) {%>
							if($(this).val() == <%=list.get(i).get("opId")%>) {
								optionValue +=  '<%=list.get(i).get("oname") + "=" + list.get(i).get("ovalue")%> , ';
								optionPrice += <%=(Integer)list.get(i).get("oprice")%>;
							}
						<%}%>
					});
					console.log(opId);
					var deliPrice = parseInt($("#deliPrice").text());
					var price = parseInt($("#price").text());
					var ea = parseInt($("#ea").val());
					var sum = $("#sum").text();
					
					
					$("#sum").text(parseInt(sum) + (parseInt(optionPrice) * parseInt(ea)));
					$("#sum").append("원");

				});
				
				var workId = <%=work.get("workId")%>;
				$.ajax({
					url:"<%=request.getContextPath()%>/selectAllReview.bo",
					data:{workId:workId},
					type:"post",
					success:function(data){

		              	
		              	 $('#replySelectTable').html(data).trigger("create");
		                  console.log(data);
		              
		                  console.log("성공");
		                  var $replySelectTable = $("#replySelectTable");
		                  $replySelectTable.html('');
		                  
		                 var $tr0 = $("<tr>");
		                 // $tr0.css('width','300px');
		                  var $td0 = $("<td>").text("작성자").css({"height":"50px", "width":"100px", "background":"black", "color": "white"});
		              	//var $td1 = $("<td>").text("후기내용").css("height", "50px");
		              	var $td1 = $("<td>").text("후기내용").css({"height":"50px", "width":"300px" , "background":"black", "color": "white"});
		              	var $td2 = $("<td>").text("별점").css({"height":"50px", "width":"200px", "background":"black", "color": "white"});
		              	var $td3 = $("<td>").text("작성날짜").css({"height":"50px", "width":"200px", "background":"black", "color": "white"});
		              	
		           		$tr0.append($td0);
		   				$tr0.append($td1);
		   				$tr0.append($td2);
		   				$tr0.append($td3);
		   				
		   				$replySelectTable.append($tr0);
		   				
		   				
		   				//ArrayList에 리뷰들이 등록되어있어서 each를 통해 반복문을 돌려서 값을 가져온다!
		   				//HashMap은 key를 통해서 값을 가져온다!
		   				  $.each(data, function(index, value){
		   		               var $tr = $("<tr>").css("height","50px");
		   		              
		   		               var $writer = $("<td>").text(decodeURIComponent(value.writer));
		   		               var $content = $("<td>").text(decodeURIComponent(value.content));
		   		               var $starPoint= $("<td>").text(decodeURIComponent(value.starPoint));
		   		             
		   		               var $writeDate = $("<td>").text(decodeURIComponent(value.writeDate));
		   		            
		   		               
		   		               $tr.append($writer);
		   		               $tr.append($content);
		   		               $tr.append($starPoint);
		   		               $tr.append($writeDate);
		   		               $replySelectTable.append($tr)
		   		               
		   		               //등록과 동시에 작성 내용 지우기
		   		               $('#reviewCon').val("");
		   		               
		   		            
		   		               console.log(localStorage);
		   				  })
		   		        
		                  
						
						
					},error:function(){
						alert("실패");
					}
				})
			
			
			});
		
			$("#goBasket").click(function(){
				var option = new Array();
				$(".option").each(function(){
					<%for(int i = 0; i < list.size(); i++) {%>
						if($(this).val() == <%=list.get(i).get("opId")%> && <%=list.get(i).get("picType").equals("0")%>) {
							option.push($(this).val());
						}
					<%}%>
				});
				var workId = $("#workId").val();
				var ea = parseInt($("#ea").val());
				var text = "ajax";
				console.log(option);
				
				$.ajaxSettings.traditional = true;
				$.ajax({
					url:"<%=request.getContextPath()%>/purchase.pro",
					data:{workId:workId, ea:ea, text:text, option:option},
					type:"post",
					success:function(data){
						if(data == "ok"){
						alert("장바구니에 작품이 담겼습니다.");							
						}
					},
					error:function(data){
						alert("로그인후 이용하세요");
					}
				});
			});
		
			function plus(){
				document.getElementById("ea").value = (parseInt(document.getElementById("ea").value)+1);
				var deliPrice = parseInt($("#deliPrice").text());
				var price = parseInt($("#price").text());
				var ea = parseInt($("#ea").val());
				var sum = deliPrice + (price * ea);
				
				$("#sum").text(sum + (parseInt(optionPrice) * parseInt(ea)));
				$("#sum").append("원");
			}
			function minus(){
				document.getElementById("ea").value = (parseInt(document.getElementById("ea").value)-1);	
				var deliPrice = parseInt($("#deliPrice").text());
				var price = parseInt($("#price").text());
				var ea = parseInt($("#ea").val());
				var sum = deliPrice + (price * ea);
				
				$("#sum").text(sum + (parseInt(optionPrice) * parseInt(ea)));
				$("#sum").append("원");
			}
			
			<% if (("#delPrice")!=null){ %>
				var deliPrice = parseInt($("#deliPrice").text());
				var price = parseInt($("#price").text());
				var ea = parseInt($("#ea").val());
				var sum = deliPrice + (price * ea);
				
				$("#sum").text(sum);
				$("#sum").append("원");
				
			<% } %>
			$("#purchase").click(function(){
					$("#buy").attr("action", "<%=request.getContextPath()%>/purchase.pro");
					
			});
        function likeBtn(){
        	<%if(loginUser != null ){%>
        	 var memberId = <%=loginUser.getMemberId()%>;
        	 var workId = <%=work.get("workId")%>;
        	
        	 
        	 $.ajax({
        		 url:"<%=request.getContextPath()%>/insertLike.me?<%=work.get("workId")%>",
        		 data:{memberId:memberId, workId:workId},
        		 type:"post",
        		 success:function(data){
        			 alert("관심상품 추가!");
        		 },error:function(){
        			 alert("실패");1
        		 }
        	 })
        	 <%}else{%>
        	 	alert("로그인 후, 이용해 주세요!");
        	 <%}%>
         }
        
        $("#menu2").click(function(){
        
          
           $.ajax({
               url:"<%=request.getContextPath()%>/selectAllReview.bo?workId=<%=work.get("workId")%>",
               data:{workId:workId},
               type:"post",
               success:function(data){
              	
              	 $('#replySelectTable').html(data).trigger("create");
                  console.log(data);
              
                  console.log("성공");
                  var $replySelectTable = $("#replySelectTable");
                  $replySelectTable.html('');
                  
                 var $tr0 = $("<tr>");
                 
                  var $td0 = $("<td>").text("작성자").css({"height":"50px", "width":"100px", "background":"lightblue", "color": "gray"});
         
              	var $td1 = $("<td>").text("후기내용").css({"height":"50px", "width":"300px" , "background":"lightblue", "color": "gray"});
              	var $td2 = $("<td>").text("별점").css({"height":"50px", "width":"200px", "background":"lightblue", "color": "gray"});
              	var $td3 = $("<td>").text("작성날짜").css({"height":"50px", "width":"200px", "background":"lightblue", "color": "gray"});
              	
           	 $tr0.append($td0);
   				$tr0.append($td1);
   				$tr0.append($td2);
   				$tr0.append($td3);
   				
   				$replySelectTable.append($tr0);
   				
   				
   				//ArrayList에 리뷰들이 등록되어있어서 each를 통해 반복문을 돌려서 값을 가져온다!
   				//HashMap은 key를 통해서 값을 가져온다!
   				  $.each(data, function(index, value){
   		               var $tr = $("<tr>").css("height","50px");
   		              
   		               var $writer = $("<td>").text(value.writer);
   		               var $content = $("<td>").text(value.content);
   		               var $starPoint= $("<td>").text(value.starPoint);
   		             
   		               var $writeDate = $("<td>").text(value.writeDate);
   		            
   		               
   		               $tr.append($writer);
   		               $tr.append($content);
   		               $tr.append($starPoint);
   		               $tr.append($writeDate);
   		               $replySelectTable.append($tr)
   		               
   		               //등록과 동시에 작성 내용 지우기
   		               $('#reviewCon').val("");
   		             
   		               console.log(localStorage);
   				  })
   		        
                
                  
               },
               error:function(){
                  console.log("실패");
               }
              
           });
         
        })
        
      	  
     	 
          function addReview() {
        	  <%if(loginUser != null ){%>
    	  var writer = <%=loginUser.getMemberId()%>;
          var workId = <%=work.get("workId") %>;
          var content = $("#reviewCon").val();
          var star = $(".star option:selected").text();
          
          console.log(content);
          console.log(workId);
        
         $.ajax({
             url:"<%=request.getContextPath()%>/insertReview.bo?workId=<%=work.get("workId")%>",
             data:{writer:writer, workId:workId, content:content, star:star},
             type:"post",
             success:function(data){
            	
            	 $('#replySelectTable').html(data).trigger("create");
                console.log(data);
            
                console.log("성공");
                var $replySelectTable = $("#replySelectTable");
                $replySelectTable.html('');
                
               var $tr0 = $("<tr>");
             
                var $td0 = $("<td>").text("작성자").css({"height":"50px", "width":"100px", "background":"lightblue", "color": "gray"});
            	
            	var $td1 = $("<td>").text("후기내용").css({"height":"50px", "width":"300px" , "background":"lightblue", "color": "gray"});
            	var $td2 = $("<td>").text("별점").css({"height":"50px", "width":"200px", "background":"lightblue", "color": "gray"});
            	var $td3 = $("<td>").text("작성날짜").css({"height":"50px", "width":"200px", "background":"lightblue", "color": "gray"});
            	
          $tr0.append($td0);
 				$tr0.append($td1);
 				$tr0.append($td2);
 				$tr0.append($td3);
 				
 				$replySelectTable.append($tr0);
 				
 				
 				//ArrayList에 리뷰들이 등록되어있어서 each를 통해 반복문을 돌려서 값을 가져온다!
 				//HashMap은 key를 통해서 값을 가져온다!
 				  $.each(data, function(index, value){
 		               var $tr = $("<tr>").css("height","50px");
 		              
 		               var $writer = $("<td>").text(decodeURIComponent(value.writer));
 		               var $content = $("<td>").text(decodeURIComponent(value.content));
 		               var $starPoint= $("<td>").text(decodeURIComponent(value.starPoint));
 		             
 		               var $writeDate = $("<td>").text(decodeURIComponent(value.writeDate));
 		             
 		               
 		               $tr.append($writer);
 		               $tr.append($content);
 		               $tr.append($starPoint);
 		               $tr.append($writeDate);
 		               $replySelectTable.append($tr)
 		               
 		               //등록과 동시에 작성 내용 지우기
 		               $('#reviewCon').val("");
 		             
 		               console.log(localStorage);
 				  })
 		        
             
                
                
             },
             error:function(){
                console.log("실패");
             }
         });
         <%}%>
          }
		</script>
	 
	 <hr>
	<div class="row information" >
	<ul class="nav nav-tabs" >

    <li class="active" style="margin-top:50px"><a data-toggle="tab" href="#menu0">기본정보</a></li>
    <li><a data-toggle="tab" href="#menu1" style="margin-top:50px">배송/판매/교환/환불</a></li>
    <li><a data-toggle="tab" href="#menu2" style="margin-top:50px">별점 및 리뷰</a></li>
    <li><a data-toggle="tab" href="#menu3" style="margin-top:50px">문의</a></li>
     </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>기본정보</h3>
      <p><%=work.get("workContent") %></p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3 style=" margin-top:50px">배송/판매/교환/환불</h3>
     <img src="views/images/delinfo.PNG" style="width:100%;">
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>별점 및 응원글</h3>
      
       <div class="star" style="  padding:10px; width:100%; height:150px; border:2px solid lightgray">
      <div id="review">
         <textarea id="reviewCon"style="width:100%; height:80px;" name="content"></textarea>
         <select name="star" style="float:left; width:200px; height:40px;">
            <option value="★★★★★">★★★★★ 아주좋아요</option>
            <option value="★★★★☆">★★★★☆ 마음에 들어요</option>
            <option value="★★★☆☆ ">★★★☆☆ 보통이에요</option>
            <option value="★★☆☆☆">★★☆☆☆ 그냥그래요</option>
            <option value="★★☆☆☆">★★☆☆☆ 별로에요</option>
         </select>
         <button onclick="addReview()" id="addReview" value="리뷰등록하기" style=" float:right; width:150px; height:40px; background:gray; color:white; border:1px solid gray;">리뷰등록하기</button> 
      
      </div>
      </div>
<br>
	<div id="replySelectArea">
         <table id="replySelectTable" border="3"align="center" style="width:100%; text-align:center; border:3px solid lightgray;">
         	
         </table>
     </div>

    </div>
    
    <div id="menu3" class="tab-pane fade">
    
             <form id="qna" action="<%=request.getContextPath() %>/insertProQna.bo?workId=<%=work.get("workId")%>" method="post">
     		<h3>문의하기</h3>
                   <div class="qnaArea">
                    
                     <div class="qnaContents" style="height:280px;padding:25px">
                           <table class="searchBox" style="width:100%;" >
                              <tr class="qna">
                                 <td><label style="font-size:14px;">문의 종류:</label></td>
                                 
                               
                                 <td >
                                    <select name="category" style="width:100%;">
                                       <option value="상품문의" id="product">상품문의</option>
                                       <option value="배송문의" id="delivery">배송문의</option>
                                       <option value="교환/환불문의" id="change">교환/환불문의</option>
                                       <option value="기타문의" id="etc">기타문의</option>
                                    </select>
                                 </td>
                                 
                              </tr>
                             
                              <tr class="qna">
                                 <td><label style="font-size:16px;">내용:</label></td>
                                 <td><textarea name="content" style="width:100%;" rows="7"></textarea></td>
                              </tr>
                              <tr class="qna">
                                 <td colspan="2"> <input type="submit" class="writeBtn"value="작성하기" id="qnaBtn" style="width:100%; font-size:17px;margin-top:15px"></td>
                              </tr>
                           </table>
                        
                        </div>
                     </div>
                   
                  </form>
   
  </div>
  
  </div>
  </div>
    
      <!-- /.col-md-4 -->
 
</div>
	    
   <%@ include file="/views/main/footer.jsp" %>

</body>
</html>