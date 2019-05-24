<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.board.model.vo.*, com.kh.semi.funding.model.vo.WorkPic,java.text.SimpleDateFormat, com.kh.semi.work.model.vo.*, com.kh.semi.funding.model.vo.*"%>
    
 <%
    ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>) request.getAttribute("list");
 	//ProQna qna = (ProQna)request.getAttribute("qna"); 
 
 	HashMap<String, Object> work = (HashMap<String, Object>)list.get(0); 
 	System.out.println("work: "+work);
 	
 	ArrayList<WorkPic> imglist = (ArrayList<WorkPic>) request.getAttribute("imglist");
 	System.out.println("imglist: " + imglist);

    
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>펀딩상품 자세히 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
   .proArea{
      background:yellow;
   }
   
   .productDiv{
      background:#D4ECFF;
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
      border-right:2px solid lightgray;
      border-bottom:2px solid lightgray;
      width:100%;
      height:100%;
      /* background:#F6F476; */
      background:beige;
      margin-right:10px;
      margin-bottom:10px;
    
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

#purchase{
   background:white;
   
}

#purchase:hover{
   background:#80A8E8;
}
</style>
</head>
<body>
<%@ include file="../main/mainMenubar.jsp" %>
  <!-- Page Content -->
  <div class="container">
   
    <!-- Heading Row -->
    <% for(int i=0; i<list.size(); i++){
               HashMap<String,Object> hmap = list.get(i);
               
      %>
     <div class="align-items-center my-5">
     
      <div class="col-sm-6" >
        <img class="img-fluid rounded mb-4 mb-lg-0" src="uploadFundingGoodsImg/<%=hmap.get("changeName") %>" style="width:100%; height:480px; margin-top:30px">
      </div>
   
      <!-- /.col-lg-8 -->
      <div class="col-sm-6 productDiv" style="height:480px; margin-top:30px">
        <!-- <h1 class="font-weight-light">Business Name or Tagline!</h1>
        <p>This is a template that is great for small businesses. It doesn't have too much fancy flare to it, but it makes a great use of the standard Bootstrap core components. Feel free to use this template for any project you want!</p>
        <a class="btn btn-primary" href="#">Call to Action!</a> -->
        <h5><%=hmap.get("workName") %></h5>
         <h5>기본가격: <%=hmap.get("price") %>원</h5>
         <hr>
         <h4>주문D-Day</h4>
         <h4>모금액(원)</h4>
         <h4>최소주문수량</h4>
         <h4>최대주문수량</h4>
         <h4>발송예정일은 2019년 12월 24일 | 배송비:3000원</h4>
         <hr>
         <!-- <h5>옵션선택</h5>
         <select id="sel1"style="width:350px; height:20px;">
            <option value="op1">옵션1</option>
            <option value="op2">옵션2</option>
         </select> -->
         
         <hr>
         
         <div class="totalPrice" style="margin-top:20px;">
            <p style="float:left; margin-top:10px; font-size:20px;">총가격: </p>
            <p style="float:right; margin-top:10px; font-size:20px;">10000원</p>
         </div>
         <div class="btns" style="margin-top:5px; width:100%; height:50px;">
         <button onclick="addLike()"style="color:white; margin-left:55%; float:left;width:20%; height:50px; border:2px solid lightblue; background:lightblue; border-radius:7px; font-size:16px;">관심상품</button>
         <!-- <input type="image" src="../images/heart.png" style="width:80px; height:50px; border:2px solid pink; background:pink; border-radius:7px;"> -->
         <button style="float:right; font-size:16px;width:20%; height:50px; color:white;border:2px solid gray; background:gray; border-radius:7px;"id="purchase">구매하기</button>
         </div>
     
    
      <!-- /.col-md-4 -->
    </div>
    
     </div>
      
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
    <div id="menu0" class="tab-pane fade in active">
      <h3>기본정보</h3>
      <p><%=hmap.get("workContent") %></p>
      <div style=" width:300px; height:300px; margin:0 auto;" class="detailImgs">
      		
      </div>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>배송/판매/교환/환불</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
     <%} %>
    
    <div id="menu2" class="tab-pane fade">
      <h3>별점 및 응원글</h3>
       <div class="star" style="background:beige;  padding:10px; width:100%; height:150px;">
      <div id="review" <%-- action="<%=request.getContextPath() %>/insertReview.bo?workId=<%=work.get("workId")%>" method="post" --%>>
         <textarea id="reviewCon"style="width:100%; height:80px;" name="content"></textarea>
         <select style="float:left; width:200px; height:40px;">
            <option>★★★★★ 아주좋아요</option>
            <option>★★★★☆ 마음에 들어요</option>
            <option>★★★☆☆ 보통이에요</option>
            <option>★★☆☆☆ 별로에요</option>
         </select>
        <button onclick="addReview()" id="addReview" value="리뷰등록하기" style=" float:right; width:150px; height:40px; background:gray; color:white; border:1px solid gray;">리뷰등록하기</button> 
      </div>
      
    
    </div>
    
    <div id="replySelectArea">
         <table id="replySelectTable" border="3"align="center" style="width:100%; text-align:center; border:3px dashed gray; margin-top:30px;">
         	
         </table>
     </div>
     </div>
    <script>
    
    $(function(){
    	
    	
    	var workId = <%=work.get("workId")%>;
    	
		$.ajax({
			url:"<%=request.getContextPath()%>/selectDetailServlet.fund",
			data:{workId:workId},
			type:"post",
			success:function(data){
				
				$div = $(".detailImgs");
				for(var key in data){
					var imgList = data[key];
					//var $h2 = $("<h2>").text("TEST");
					var $h2 = $("<h2>").text(imgList.workId);
					var $changeName = $("<h2>").text(imgList.changeName);
					var $img = $("<img>").attr("src", '<%= request.getContextPath() %>/uploadFundingGoodsImg/' + imgList.changeName);
					$div.append($img);
					/* $div.append($h2);
					$div.append($changeName); */
				}
					//$img = $("<img>").attr("src", imgList.workId);
					<%-- <img src='<%=request.getContextPath()%>/uploadFundingGoodsImg/<%=hmap.get("changeName")%>'>") --%>
				/* 
				$.each(data, function(index, value){
					
					var $workId = $(".detailImgs").text(value.workId);
					console.log("시도해보자: "+ $workId);
					
				}) */
				
				
			},error:function(){
				alert("상세 사진 가져오기 실패");
			}
		});
			
        
    	var workId = <%=work.get("workId")%>;
		$.ajax({
			url:"<%=request.getContextPath()%>/selectAllFundReview.bo",
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
   		               
   		            
   		               console.log(localStorage);
   				  })
   		        
                  
				
				
			},error:function(){
				alert("실패");
			}
		})
      
     
    
    }); //function의 끝
    
    
    function addLike(){
    	<%if(loginUser != null ){%>
    	 var memberId = <%=loginUser.getMemberId()%>;
    	 var workId = <%=work.get("workId")%>; 
    	 
    	 $.ajax({
    		 url:"<%=request.getContextPath()%>/insertFundLike.fund",
    		 data:{memberId:memberId, workId:workId},
    		 type:"post",
    		 success:function(data){
    			 alert("관심펀딩 상품 추가!");
    		 },error:function(){
    			 alert("실패");
    		 }
    	 })<%}else{%>
 	 		alert("로그인 후, 이용해 주세요!");
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
       url:"<%=request.getContextPath()%>/insertFundReview.bo?workId=<%=work.get("workId")%>",
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
    
    
    
    <div id="menu3" class="tab-pane fade">
    
             <form id="qna" action="<%=request.getContextPath() %>/insertFundProQna.bo?workId=<%=work.get("workId")%>" method="post">
     		<h3>문의하기</h3>
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
  <!--   <div id="menu31f" class="tab-pane fade">
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

<script>
   $(function(){
      $("#sel1").click(function(){
         var value = $('option:selected',this).text();
         
      })      
   });
   

   $("#purchase").click(function(){
      console.log("test");
      location.href="../common/purchase.jsp";
   });

</script>


</body>
</html>