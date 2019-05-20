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
   /* .navdiv{
      height:200px;
      background:black;
   }
    */
   .proArea{
      background:yellow;
   }
   
   .productDiv{
      background:beige;
      padding:15px;
      
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
   .qnaArea {
      border-left:2px solid lightgray;
      margin: 20px 0px 20px 0px;
      box-shadow:2px 2px lightgray;
      width:100%;
      height:100%;
      /* background:#F6F476; */
      background:beige;
    
   }
   .qnaTitle {
      border-bottom:1px solid lightgray;
      margin: 20px 0px 20px 0px;
      padding-left:20px;
   }
   .qnaContents {
      margin: 20px 15px 20px 15px;
      padding-left:20px;
      padding-right:20px;
      border:1px solid lightgray;
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
   
  
/* .shortInfo{
   margin-left:40px;
   width:400px;
   height:550px;
   padding:25px;
   margin-right:100px;
   background:white;
   margin-top:23px;
} */

hr{
   border:1px solid gray;
}

.totalPrice{
   /* margin-top:10px;
   
   float:right; */
   width:100%;
   height:50px;
   border:1px solid black;
   margin-top:15px;
   margin-bottom:15px;
   /* background:orange; */
   }
.totalPrice>h4{
   
   margin-top:15px;
}

.information{
   padding:30px;
}
</style>
</head>
<body>
<!-- <div class="navdiv">

</div>  -->
  <!-- Page Content -->
 <%@ include file="../main/mainMenubar.jsp" %>
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
		    <div class="carousel-inner">
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
      <!-- /.col-lg-8 -->
      <div class="col-sm-6 productDiv" style="height:450px">
        <!-- <h1 class="font-weight-light">Business Name or Tagline</h1>
        <p>This is a template that is great for small businesses. It doesn't have too much fancy flare to it, but it makes a great use of the standard Bootstrap core components. Feel free to use this template for any project you want!</p>
        <a class="btn btn-primary" href="#">Call to Action!</a> -->
      
        <h3><%=work.get("workName") %></h3>
			<h5 id="price"><%=work.get("price") %>원</h5>
			<hr>
		
			<p>배송비</p>
			<p id="deliPrice"><%=work.get("deliPrice") %>원</p>

			<hr>
		<form method="post" id="buy">
			  <input type="hidden" id="workId" name="workId" value="<%=work.get("workId")%>">
   		  <%if((Integer)work.get("opId") != 0) {%>
			<label>옵션선택</label>
			<br>
				<% for(int i = 0; i < olist.size(); i++) { %>
					<select style="width:100%" class="option" name="option">
						<option value="0"><%=olist.get(i).getoName() %></option>
						<% for(int j = 0; j < list.size(); j++) { 
							if(olist.get(i).getoName().equals(list.get(j).get("oname"))) {
						%>		
							<option value="<%=list.get(j).get("opId")%>"><%=list.get(j).get("ovalue")%>(+<%=list.get(j).get("oprice") %>원)</option>
						<% 
							}
						} %>
					</select><br>
				<%} %>
			<hr>
			
			<%} else { %>
			<div style="background:lightgray;">
				
				<label>수량</label>
				<button type="button" onclick="plus();">+</button>
				<input type="number" style="width:50px;" id="ea" name="ea" value="1" readonly>
				<button type="button" onclick="minus();">-</button>
			</div>
			<%} %>
			<div class="totalPrice">
				<p style="float:left; margin-top:10px; font-size:20px;">총가격: </p>
				<p style="float:right; margin-top:10px; font-size:20px;" id='sum'></p><p style="float:right"></p>
			</div>
			<div class="btns" style="margin-top:5px;">
         <button onclick="likeBtn()" style="color:white; float:left;width:70px; height:50px; border:2px solid pink; background:pink; border-radius:7px; font-size:33px;">♡</button>
         <!-- <input type="image" src="../images/heart.png" style="width:80px; height:50px; border:2px solid pink; background:pink; border-radius:7px;"> -->
         <input type="image" src="views/images/shopping-basket.png" id="goBasket" style="width:70px; margin-left:5px;height:50px; border:2px solid lightblue; background:lightblue; border-radius:7px;">
         <!-- <input type="submit" value="구매하기" style="float:right; font-size:15px;width:170px; height:50px; color:white;border:2px solid gray; background:gray; border-radius:7px;"> -->
         <button type="submit" class="all-btn"style="float:right; font-size:15px;width:170px; height:50px;/*  color:white;border:2px solid gray; background:gray; */ border-radius:7px;"
               id="purchase">구매하기</button>
       </div>
			</form>
		</div>
		<script>
			$(function(){
				$(".option:last").change(function(){
					$(".option").each(function(){
						var optionValue = "";
						<%for(int i = 0; i < list.size(); i++) {%>
							
						<%}%>
					});
				});
			});
		
			$("#goBasket").click(function(){
				var workId = $("#workId").val();
				var ea = parseInt($("#ea").val());
				var text = "ajax";
				
				$.ajax({
					url:"<%=request.getContextPath()%>/purchase.pro",
					data:{workId:workId, ea:ea, text:text},
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
				
				$("#sum").text(sum);
				$("#sum").append("원");
			}
			function minus(){
				document.getElementById("ea").value = (parseInt(document.getElementById("ea").value)-1);	
				var deliPrice = parseInt($("#deliPrice").text());
				var price = parseInt($("#price").text());
				var ea = parseInt($("#ea").val());
				var sum = deliPrice + (price * ea);
				
				$("#sum").text(sum);
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
					<%-- location.href="<%=request.getContextPath()%>/purchase.pro?ea=" + ea + "&workId=<%=work.get("workId")%>"; --%>
			});
        function likeBtn(){
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
        			 alert("실패");1
        		 }
        	 })
        	 <%}%>
         }
      	  
     	 
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
               // $tr0.css('width','300px');
                var $td0 = $("<td>").text("작성자").css({"height":"50px", "width":"100px", "background":"lightblue", "color": "gray"});
            	//var $td1 = $("<td>").text("후기내용").css("height", "50px");
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
 		              //var $writeDate = $("<td>").text(date.format(value.writeDate));
 		              // var $writeDate2 = (date.format(value.writeDate));
 		               
 		               $tr.append($writer);
 		               $tr.append($content);
 		               $tr.append($starPoint);
 		               $tr.append($writeDate);
 		               $replySelectTable.append($tr)
 		               
 		               //등록과 동시에 작성 내용 지우기
 		               $('#reviewCon').val("");
 		               
 		              /*  localStorage.setItem('writer', $writer);
 		               localStorage.getItem('writer'); */
 		               console.log(localStorage);
 				  })
 		        
                /* for(var key in data){
                	
                	
                	var $tr = $("<tr>").css("width", "300px");
                	var $writerTd = $("<td>")
                    .text(data[key].writer)
                    .css("width", "100px");
                	
                	
     				var $contentTd = $("<td>")
                    .text(data[key].content)
                    .css("width", "400px");
     				
     				
     				var $starTd = $("<td>")
                    .text(data[key].starPoint)
                    .css("width", "200px");
    				
     				var $datdTd = $("<td>").text(data[key].writeDate).css("width", "200px");
     				//$tr0.append($tr);
     				
     				
     			
     				$tr.append($writerTd);
     				$tr.append($contentTd);
     				$tr.append($starTd);
     				$tr.append($dateTd);
    				
    				$replySelectTable.append($tr);
    			    
                } */
                
                
             },
             error:function(){
                console.log("실패");
             }
         });
         <%}%>
          }
		</script>
	  <!--</div>-->
	 </div>
	 
	 <hr>
	<div class="row information">
	<ul class="nav nav-tabs">

    <li class="active"><a data-toggle="tab" href="#menu0">기본정보</a></li>
    <li><a data-toggle="tab" href="#menu1">배송/판매/교환/환불</a></li>
    <li><a data-toggle="tab" href="#menu2">별점 및 응원글</a></li>
    <li><a data-toggle="tab" href="#menu3">문의</a></li>
     </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>기본정보</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>배송/판매/교환/환불</h3>
      <p>Ut enim minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>별점 및 응원글</h3>
      
       <div class="star" style="background:beige;  padding:10px; width:100%; height:150px;">
      <div id="review" <%-- action="<%=request.getContextPath() %>/insertReview.bo?workId=<%=work.get("workId")%>" method="post" --%>>
         <textarea id="reviewCon"style="width:100%; height:80px;" name="content"></textarea>
         <select name="star" style="float:left; width:200px; height:40px;">
            <option value="★★★★★">★★★★★ 아주좋아요</option>
            <option value="★★★★☆">★★★★☆ 마음에 들어요</option>
            <option value="★★★☆☆ ">★★★☆☆ 보통이에요</option>
            <option value="★★☆☆☆">★★☆☆☆ 그냥그래요</option>
            <option value="★★☆☆☆">★★☆☆☆ 별로에요</option>
         </select>
         <button onclick="addReview()" id="addReview" value="리뷰등록하기" style=" float:right; width:150px; height:40px; background:gray; color:white; border:1px solid gray;">리뷰등록하기</button> 
        <!-- <button id="addReview" style=" float:right; width:150px; height:40px; background:gray; color:white; border:1px solid gray;">리뷰등록하기</button>   -->
     <!--  <input type="submit" value="리뷰 등록하기" id="addReview" style=" float:right; width:150px; height:40px; background:gray; color:white; border:1px solid gray;"> -->
      </div>
      </div>
<br>
	<div id="replySelectArea">
         <table id="replySelectTable" border="3"align="center" style="width:100%; text-align:center; border:3px dashed gray;">
         	
         </table>
     </div>
      <!-- <div class="row">
         <div class="outer" style="border:1px solid black;">
         <div class="nick">
           <label>닉네임</label>
         </div>
         <div class="date">
            <label>2019년 4월 5일</label>
         </div>
         <div>내용</div>
         </div>
      </div> -->
    </div>
    
    <div id="menu3" class="tab-pane fade">
    
             <form id="qna" action="<%=request.getContextPath() %>/insertProQna.bo" method="post">
     		<h2>문의하기</h2>
                   <div class="qnaArea">
                     <div class="qnaTitle">
                       
                     </div>
                     <div class="qnaContents">
                           <table class="searchBox" style="width:100%;" >
                              <tr class="qna">
                                 <td><label>문의 종류:</label></td>
                                 
                                 <!-- <td><input type="text" name="title" style="width:100%;"></td> -->
                                 <td>
                                    <select name="category" style="width:100%;">
                                       <!-- <option value="10" id="product">상품문의</option>
                                       <option value="20" id="delivery">배송문의</option>
                                       <option value="30" id="change">교환/환불문의</option>
                                       <option value="40" id="etc">기타문의</option> -->
                                       
                                       <option value="상품문의" id="product">상품문의</option>
                                       <option value="배송문의" id="delivery">배송문의</option>
                                       <option value="교환/환불문의" id="change">교환/환불문의</option>
                                       <option value="기타문의" id="etc">기타문의</option>
                                    </select>
                                 </td>
                                 
                              </tr>
                              <!-- <tr class="qna">
                                 <td><label >작성자:</label></td>
                                 <td><input type="text" name="writer"
                                    style="width: 100%;"></td>
                              </tr> -->
                              <!-- <tr class="qna">
                                 <td><label>작성일:</label></td>
                                 <td><input type="text" name="writeDate"
                                    style="width: 100%;"></td>
                              </tr> -->
                              <tr class="qna">
                                 <td><label>내용:</label></td>
                                 <td><textarea name="content" style="width:100%;" rows="7"></textarea></td>
                              </tr>
                              <tr class="qna">
                                 <td colspan="2"><input type="submit" class="writeBtn"value="작성하기" id="qnaBtn" style="float:right;"></td>
                              </tr>
                           </table>
                        
                        </div>
                     </div>
                     
                  </form>
   
  </div>
  <!--   <div id="menu3" class="tab-pane fade">
      <h3>문의</h3>
         <form id="question" method="post">
      <div class="quest" style="border:1px solid black;background:beige;padding:20px; width:60%; height:200px";>
            <table align="center">
               <tr>
                  <td>제목 </td>
                  <td colspan="3">
                    <input type="text" size="50" name="title">
                  </td>
               </tr>
           
               <tr>
                  <td>작성자 </td>
                  <td>
                    <input type="text" size="50" name="writer" >
                  </td>
               </tr>
               <tr>
                  <td>작성일</td>
                  <td>
                     <input type="date" name="date"  style="width:395px;">
                   </td>
               </tr>
               <tr>
                  <td>내용 </td>
                  <td>
                    <textarea name="content" style="width:395px;"></textarea>
                    
                  </td>
               </tr>
               
            </table>
            <br>
            <div align="center">
               <button onclick="complet();">작성완료</button>
               <button onclick="deleteNotice();">삭제하기</button>
            </div>
         </form>
      </div>
     -->
  </div>
  </div>
    
      <!-- /.col-md-4 -->
    
</div>
   
<!-- <script>
   $(function(){
      
       
       //최선
          $("#sel1").change(function(){
            $(".selectOpt").append($("#sel1 option:selected").text());
       });
      
          $("#sel2").change(function(){
            $(".selectOpt").append($("#sel2 option:selected").text());
       });
             
       //최선12
        /* $("#sel1").change(function(){
            $(".selectOpt").append($("#sel1 option:selected").text());
       })   */
      
       
      
       
   });
</script> -->
<!-- <div class="container">
  <div class="row">
   <div class="proDiv">
      <div class="img col-sm-5">
         <img src="../images/tvxq.jpg">
      </div>
      <div class="col-sm-2"></div>
      <div class="shortInfo col-sm-5">
         <h5>품명 및 모델명</h5>
         <h5>기본가격</h5>
         <hr>
         <h5>배송비:3000원</h5>
         <hr>
         <h5>옵션선택</h5>
         <select style="width:350px; height:20px;">
            <option value="op1">옵션1</option>
            <option value="op2">옵션2</option>
         </select>
         <select style="width:350px; height:20px;">
            <option value="op1">옵션1</option>
            <option value="op2">옵션2</option>
         </select>
         <hr>
         <div class="selectOpt" style="width:350px; height:100px; background:black; margin-top:70px;">   
         </div>
         <div class="totalPrice">
            <h4>총가격:</h4>
            <p style="float:right; margin-top:-30px; font-size:15px;">10000원</p>
         </div>
      </div>
     </div>
   </div>
  </div> -->

</body>
</html>