<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.author.model.vo.*, java.util.*"%>
<%
	ArrayList<ProType> pTypeList = (ArrayList<ProType>) request.getAttribute("pTypeList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>입점신청</title>
	<!-- 부트스트랩 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>    
    <%@ include file="../assets/css/allCss.html" %>
    <%@ include file="stylesheet/appIntroduce.html" %>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
	<!-- 메뉴 -->
	<%@ include file="../main/mainMenubar.jsp" %>
	
	<!-- 부트스트랩 -->
	<!-- 홈페이지 소개 -->
	<div id="about" class="container-fluid">
	  <div class="row">
	    <div class="col-sm-8">
	      <h2><strong>手作 | 秀作 </strong></h2>: 수작<br>
	      <h4>
	      	<strong>수작은 손으로 지은 작품</strong>(手作), <strong>빼어난 작품</strong>(秀作)이라는 뜻입니다. <br>
	      	저희는 상품보다 만드는 작가를 조명하는 플랫폼을 만드는 것을 목표로 합니다. <br>
	      </h4><br>
	      <p>
	      	작가가 규모에 제약 받지 않고 작품활동에 집중할 수 있도록 만들 것이며 독창적인 작품을 생산하고 소비할 수 있는 판매장을 만들어 갈 것입니다.
	      </p>
	    </div>
	    <!-- img -->
	    <div class="col-sm-4">
	      <span class="logo">
	      	<img src="<%= request.getContextPath() %>/views/application/image/logo.png">
	      </span>
	    </div>
	  </div>
	</div>
	
	<!-- Container (Services Section) -->
	<div id="services" class="container-fluid text-center bg-grey">
	  <div class="row slideanim">
	    <div class="col-sm-6">
	      <span class="glyphicon glyphicon-eur logo-small"></span>
	      <h4>펀딩 작품 출시</h4>
	      <p>
	      	자본이 없어 상품화 할 수 없는 좋은 작품을 출시 할 수 있는 기회를 마련해 드립니다.<br>
	      	펀딩 작품을 등록함으로써 규모에 제약받지 않고 작품활동에 집중할 수 있습니다.
	      </p>
	    </div>
	    <div class="col-sm-6">
	      <span class="glyphicon glyphicon-signal logo-small"></span>
	      <h4>편리한 운영 시스템</h4>
	      <p>
	      	작품관리 DB로부터 판매 작품부터 펀딩 작품까지 직접 관리할 수 있습니다. <br>
	      	그 밖에 편리한 정산과 다양한 통계 자료를 손쉽게 확인 할 수 있습니다.
		  </p>
	    </div>
	  </div>
	  <br><br>
	  <div class="row slideanim">
	    <div class="col-sm-6">
	      <span class="glyphicon glyphicon-user logo-small"></span>
	      <h4>작가들 간의 펀딩 프로젝트 협업</h4>
	      <p>
	      	펀딩 작품 출시 전에 협업할 작가를 모집할 수 있고 신처할 수 있습니다.<br>
	      	다재다능한 작가들과 공동작업에 참여해 보세요.
	      </p>
	    </div>
	    <div class="col-sm-6">
	      <span class="glyphicon glyphicon-heart logo-small"></span>
	      <h4>작가 이야기</h4>
	      <p>
	      	자신의 스토리를 노출함으로써 홍보효과를 높일 수 있습니다. <br>
	      	자신의 이야기로 자신의 경쟁력을 향상시켜 보세요.
	      </p>
	    </div>
	  </div>
	</div><!-- end Container (Services Section) -->
	
	<div class="container-fluid">
	  <div class="text-center">
	    <h3>입점신청 절차</h3>
	  </div>
	  <div class="row">
	      <img class="img-responsive center-block" 
	      		src="<%= request.getContextPath() %>/views/application/image/applyProcess.png" 
	      		style="width:60%;">
	  </div>
	</div><!-- end Container (About Section) -->

	

	<!-- Container (Pricing Section) -->
	<div id="pricing" class="container-fluid bg-grey">
	  <div class="text-center">
	    <h2>입점 신청 제출 서류</h2>
	    <h4>당사는 신속하고 공정한 거래를 위해 온라인 접수를 통한 입점 신청만 접수합니다.</h4>
	    <p>
	    	- 심사 시 최대 7일이 소요됩니다. <br>
	    		(7일 이후에도 승인여부가 되지 않는다면 15일 이후 다시 신청해 주세요.) <br>
	    	- 퀄리티가 좋은 사진을 첨부해 주세요. <br>
	    	- 탈락 사유를 별도로 발송하지 않습니다.
	    </p>
	  </div>
	  <div class="row slideanim">
	    <div class="col-sm-6 col-xs-12">
	      <div class="panel panel-default">
	        <div class="panel-heading text-center">
	          <h1>1차 신청</h1>
	        </div>
	        <div class="panel-body">
	          <p><strong>한 작품당 포함해야 할 내용</strong></p>
	          <p>작품명</p>
	          <p>작품 설명</p>
	          <p>작품 가격</p>
	          <p>작품 사진 최소 5장</p>
	          <p>제작과정</p>
	        </div>
	        <div class="panel-footer">
	          <h5>참고 사항</h5>
	          <p>
	          	- 상표권, 캐릭터 라이센스, 저작권 등에 문제의 소지가 있는 작품이 포함되어 있을 경우 입점에 제한됩니다. <br>
	          	- 악세사리, 의류 등의 착용이 가능한 작품은 <strong style="color:red;">착용 사진이 필수</strong> 입니다. <br>
	          	- 사진에 텍스트 삽입은 금지합니다.
	          </p>
<!-- 입점신청양식 다운 버튼 -->
	          <button class="all-btn btn-lg text-center" id="applyFormDownload">수작 - 1차 입점 신청 양식 다운</button>
	        </div>
	      </div>      
	    </div>     
	    <div class="col-sm-6 col-xs-12">
	      <div class="panel panel-default text-center">
	        <div class="panel-heading">
	          <h1>2차 신청</h1>
	        </div>
	        <div class="panel-body">
	          <p><strong>사업자 등록증</strong></p>
	          <p><strong>구매 안전 서비스 관리 이용 확인증</strong></p>
	          <p><strong>통신판매업 신고증</strong></p>
	        </div>
	      </div>      
	    </div>     
	  </div>
	</div><!-- end Container (Pricing Section) -->

	<!-- Container (Contact Section) - 입점신청 부분 -->
	<div id="contact" class="container-fluid bg-lg">
	  <h2 class="text-center">입점 신청하기</h2>
	  <div class="row">
	    <div class="col-sm-5">
	       <p>문의 시 전화 상담은 받지 않습니다.</p>
	      <p><span class="glyphicon glyphicon-map-marker"></span> 서울특별시 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층</p>
	      <p><span class="glyphicon glyphicon-user"></span> 담장자 김진환</p>
	      <p><span class="glyphicon glyphicon-envelope"></span> admin@sg.com</p>
	    </div>
	    <form action="<%= request.getContextPath() %>/insertAuthor.at" 
	    	  method="post"
	    	  encType="multiport/forn-data">
	    <div class="col-sm-7 slideanim">
	      
	      <div class="row">
	      	<div class="col-sm-5 form-group">
	          <input class="form-control" id="brandName" name="brandName" placeholder="Brand Name" type="text" required>
	        </div>
	        <div class="col-sm-1 form-group">
	          <button id="brandNameCheck" class="btn pull-right btn-default">
	          	중복확인
	          </button>
	        </div>
	        <div class="col-sm-6 form-group">
	        	<input type="text" value="브랜드 이미지 첨부" class="form-control" id="brandFileArea" readonly>
	        	
	        	<input type="file" name="attachBrandFile" onchange="uploadBrandImg(this);"
	        		   id="attachBrandFile" style="overflow:hidden;opacity: 0;">
	        </div>
	      </div>
	      <textarea class="form-control" id="comments" name="comments" placeholder="작가 페이지의 프로필에 사용됩니다. 소개글을 작성해 주세요." rows="5"></textarea><br>
       	  <input type="text" value="1차 입점 서류 첨부" class="form-control" id="applyFileArea" readonly>
       	  <input type="file" name="attachApplyFile" onchange="uploadApplyFile(this);"
       	  	 	 id="attachApplyFile" style="overflow:hidden;opacity: 0;">
       	  <select class="form-control" id="selectPType" name="selectPType">
       	  	<option value="">공예 유형</option>
       	  	<% for(int i = 0; i < pTypeList.size(); i++) { %>
       	  		<option value="<%= pTypeList.get(i).getMaterial() %>">
       	  			<%= pTypeList.get(i).getMaterial() %>
       	  		</option>
       	  	<% } %>
       	  </select> <br>
	        
	      <div class="row">
	        <div class="col-sm-12 form-group">
	          <button class=" pull-right all-btn all-btn-hover" type="submit" id="sendBtn">신청하기</button>
	        </div>
	      </div>
	    </div>
	    </form>
	  </div>
	</div><!-- end Container (Contact Section) -->
	<!-- footer -->
	<footer class="container-fluid text-center bg-grey">
	  <a href="#myPage" title="To Top">
	    <span class="glyphicon glyphicon-chevron-up"></span>
	  </a>
	</footer>	
	
	<!-- script -->
	<script src="<%= request.getContextPath() %>/views/application/js/appIntroduce.js"></script>
	<script>
	$(function(){
		var brandNameCheck = false;
		$("#brandNameCheck").click(function(){ //브랜드명 중복확인 눌렀을 때
			var brandName = $("#brandName").val();
			$.ajax({
				url : "<%=request.getContextPath() %>/selectBName.at",
				type : "get",
				data : {brandName : brandName},
				success : function(data) {
					if(data > 0) { //이미 브랜드 명이 존재 한다는 것
						brandNameCheck = false;		
						alert("이미 존재하는 브랜드 명입니다.");
						$("#brandName").select();
					} else if(data < 0) { //로그인이 되어 있지 않다는 것
						brandNameCheck = false;
						alert("로그인 후 이용해 주세요.");
					} else{ //브랜드 명이 존재하지 않는다는 것
						brandNameCheck = true;
						alert("사용 가능한 브랜드 명입니다.");
					} // ens if					
				},
				error : function(data) {
					console.log("실패!");
				}
			}); //end ajax		
			return false; //새로고침 안되게 한다.
		}); //end btn
		
		$("#sendBtn").click(function(){ //신청하기 버튼 눌렀을 때
			//데이터 유효성 검사
			var dataCheck = true;
			var comments = $("#comments").val();
			var proType= $("#selectPType option:selected").val();
			if(brandNameCheck == false){
				dataCheck = false;
				alert("브랜드명을 다시 확인해 주세요.");
				return false;
			}
			
			if(comments == null || comments == "" || comments == "&nbsp;"){
				dataCheck = false;
				alert("소개글을 작성해 주세요.");
				return false;
			}
			
			$("#selectPType option").each(function(){
				if((proType.equals != $(this).val()) && (proType == "") ){
					dataCheck = false;
					alert("공예유형을 선택해 주세요.");
					return false;
				}
			});
			
			if(dataCheck == false) {
				//유효성 검사 실패시 서블릿 요청 안함
				return false;
			}
		});
		
		$("#brandFileArea").click(function(){ //브랜드 이미지 파일 버튼 클릭
   	  		console.log("브랜드 이미지 파일 버튼 클릭");
   	  		$("#attachBrandFile").click();
   	  	});
		
   	  	$("#applyFileArea").click(function(){ //1차 입점 서류 버튼 클릭
   	  		console.log("1차 입점 서류 버튼 클릭");
   	  		$("#attachApplyFile").click();
   	  	});
   	  	
	});//end func
	function uploadApplyFile(value){
	  		if(value.files && value.files[0]){
	  			var reader = new FileReader();
	  			reader.onload = function(e) {
	  				$("#applyFileArea").val($("#attachApplyFile").val());
	  			}
	  			reader.readAsDataURL(value.files[0]);
	  		} //end if
	  	}//end method
	  	function uploadBrandImg(value) { //브랜드 이미지
	  		if(value.files && value.files[0]) {
	  			var reader = new FileReader();
	  			reader.onload = function(e) {
	  				$("#brandFileArea").val($("#attachBrandFile").val());
	  				console.log(e);
	  				console.log($("#attachBrandFile").val());
	  			} //end func(e)
	  			reader.readAsDataURL(value.files[0]);
	  		} //end if
	  	} //end func
	</script>
</body>
</html>