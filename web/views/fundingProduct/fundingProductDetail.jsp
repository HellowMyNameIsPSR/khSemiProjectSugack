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
   
  .qnaTitle {
      border-bottom:1px solid lightgray;
      margin: 20px 0px 20px 0px;
      margin-left:150px;
   }
   .qnaContents {
      
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
   
  .container{
     width:100%;
     
     min-height:100%;

  }


hr{
   border:1px solid gray;
}

.totalPrice{
   /* margin-top:10px;
   
   float:right; */
   width:100%;
   height:50px;
   border:1px solid lightgray;
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
<%@ include file="../main/mainMenubar.jsp" %>
  <!-- Page Content -->
  <div class="container">
   
    <!-- Heading Row -->
    <% for(int i=0; i<1; i++){
               HashMap<String,Object> hmap = list.get(i);
               
      %>
     <div class="align-items-center my-5">
     
      <div class="col-sm-6" style="height:540px; margin-top:30px" >
        <img class="img-fluid rounded mb-4 mb-lg-0" src="uploadFundingGoodsImg/<%=hmap.get("changeName") %>" style="width:100%; height:540px; margin-top:30px">
      </div>
   
      <!-- /.col-lg-8 -->
      <div class="col-sm-6 productDiv" style="height:480px; margin-top:30px">
      <h2 class="twodays" style="color:green"></h2><hr style="background-color:yellowgreen; height:5px">
        <!-- <h1 class="font-weight-light">Business Name or Tagline!</h1>
        <p>This is a template that is great for small businesses. It doesn't have too much fancy flare to it, but it makes a great use of the standard Bootstrap core components. Feel free to use this template for any project you want!</p>
        <a class="btn btn-primary" href="#">Call to Action!</a> -->
         <h4><%=hmap.get("workName") %></h4>
         
         
         <h4>판매가격: <label id="price"><%=hmap.get("price") %></label>원</h4>
         
         <h4>~<%=hmap.get("fcFinish") %>까지 </h4>
         <hr>
         <h3 style="font-weight:bold"><%=hmap.get("fundPrice") %>원<label style="font-size:15px">&nbsp;펀딩 ~ing</label></h3>
         <input type="hidden" class="input" value="<%=hmap.get("fcStart")%>">
         <input type="hidden" class="input2" value="<%=hmap.get("fcFinish")%>">

         <h7>발송예정일은 <%=hmap.get("deliDate") %>&nbsp;입니다. <br> 배송비:&nbsp;<label id="deliPrice"><%=hmap.get("deliPrice") %></label>원</h7>
        
         <form method="post" id="buy">
             <input type="hidden" id="workId" name="workId" value="<%=work.get("workId")%>">
         <div id="countArea">   
               <label>수량</label>
               <button type="button" onclick="plus();">+</button>
               <input type="number" style="width:50px;" id="ea" name="ea" value="1" readonly>
               <button type="button" onclick="minus();">-</button>
         </div>
        
            <hr>
            
            <div class="totalPrice" style="margin-top:20px;">
               <p style="float:left; margin-top:10px; font-size:20px;">총 펀딩금액 </p>
               <p style="float:right; margin-top:10px; font-size:20px;" id="sum"></p>
            </div>
            <div class="btns" style="margin-top:5px; width:100%; height:50px;">
           
           
            <button style="float:right; font-size:16px;width:100%; height:50px; color:white; font-size:20px; background:yellowgreen;"id="purchase">펀딩하기</button>
            <button type="button" id="goBasket" class="btn" style="width:30%; margin-top:10px; margin-left:155px;height:60px; color:black; background:white;border:2px solid lightgray;font-size:16px;">장바구니 담기</button>
             <button type="button"  class="btn" onclick="addLike()"style="color:black; margin-top:10px; float:right;width:30%; height:60px; background:white; border:2px solid lightgray; font-size:16px;">관심펀딩 담기</button>
            </div>
        </form>
     
    
    
    </div>
    
     </div>
      
     </div>
    
    <div class="row information">
    <ul class="nav nav-tabs">
    <li class="active" style="margin-top:70px"><a data-toggle="tab" href="#menu0">기본정보</a></li>
    <li><a data-toggle="tab" href="#menu1"style="margin-top:70px">배송/판매/환불</a></li>
    <li><a data-toggle="tab" href="#menu2"style="margin-top:70px">별점 및 리뷰</a></li>
    <li><a data-toggle="tab" href="#menu3"style="margin-top:70px">문의</a></li>
     </ul>

  <div class="tab-content">
    <div id="menu0" class="tab-pane fade in active">
      <h3>기본정보</h3>
      <p><%=hmap.get("workContent") %></p>
      <div style=" width:300px; height:100%; margin:0 auto;" class="detailImgs">
            
      </div>
    </div>
    <div id="menu1" class="tab-pane fade" >
      <h3>배송/판매/환불</h3>
      <img src="views/images/delinfo.PNG" style="width:100%;">
    </div>
     <%} %>
    
    <div id="menu2" class="tab-pane fade">
      <h3>별점 및 리뷰</h3>
       <div class="star" style="  padding:10px; width:100%; height:150px; border:2px solid lightgray">
      <div id="review">
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
         <table id="replySelectTable" border="3"align="center" style="width:100%; text-align:center; border:2px solid lightgray; margin-top:30px;">
            
         </table>
     </div>
     </div>
    <script>
   
    
    
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
    
    $(function(){
       
       //남은 일 수 구하기
       
 
       //년월일을 분리한 후,  Date 의 생성자 함수에 인수로 각각 넣게 되면 해당 날짜의 Date 객체가 만들어 집니다.
       
       var d1= $(".input").val();
       console.log(d1);
       
       var d2= $(".input2").val();
       console.log(d2);

       var d3 = d2-d1;
       console.log(d3);
       
       var arr1 = d1.split('-');
       var arr2 = d2.split('-');
       console.log(arr2[0].substring(2,4))
       var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
       var dat2 = new Date(arr2[0].substring(2,4), arr2[1], arr2[2]);
      // var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
      
       var diff = dat2 - dat1;
       var currDay = 24 * 60 * 60 * 1000;   //시 * 분 * 초 * 밀리세컨

      var result =  parseInt(diff/currDay);
       
       console.log(result);
       
       $(".twodays").text(result);
       $(".twodays").append("일 남음");
       
       
       <% if (("#deliPrice")!=null){ %>
      var deliPrice = parseInt($("#deliPrice").text());
      var price = parseInt($("#price").text());
      var ea = parseInt($("#ea").val());
      var sum = deliPrice + (price * ea);
      
      $("#sum").text(sum);
      $("#sum").append("원");
      
      <% } %>
       
       $("#goBasket").click(function(){
         var workId = $("#workId").val();
         var ea = parseInt($("#ea").val());
         var text = "ajax";
         
         $.ajaxSettings.traditional = true;
         $.ajax({
            url:"<%=request.getContextPath()%>/fundingPurchase.fund",
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
   
      
      
      
      $("#purchase").click(function(){
            $("#buy").attr("action", "<%=request.getContextPath()%>/fundingPurchase.fund");
            
      });
       
       

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
            }   
            
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
                 
                  var $td0 = $("<td>").text("작성자").css({"height":"50px", "width":"100px", "background":"yellowgreen", "color": "black"});
              
                 var $td1 = $("<td>").text("후기내용").css({"height":"50px", "width":"300px" , "background":"yellowgreen", "color": "black"});
                 var $td2 = $("<td>").text("별점").css({"height":"50px", "width":"200px", "background":"yellowgreen", "color": "black"});
                 var $td3 = $("<td>").text("작성날짜").css({"height":"50px", "width":"200px", "background":"yellowgreen", "color": "black"});
                 
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
        
          var $td0 = $("<td>").text("작성자").css({"height":"50px", "width":"100px", "background":"yellowgreen", "color": "black"});
    

      	  var $td1 = $("<td>").text("후기내용").css({"height":"50px", "width":"300px" , "background":"yellowgreen", "color": "black"});
      	  var $td2 = $("<td>").text("별점").css({"height":"50px", "width":"200px", "background":"yellowgreen", "color": "black"});
      	  var $td3 = $("<td>").text("작성날짜").css({"height":"50px", "width":"200px", "background":"yellowgreen", "color": "black"});
      	
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
    
    
    
    <div id="menu3" class="tab-pane fade">
    
             <form id="qna" action="<%=request.getContextPath() %>/insertFundProQna.bo?workId=<%=work.get("workId")%>" method="post">
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
   <%@ include file="/views/main/footer.jsp" %>
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