<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	

</head>
<style>
.container {
	margin-top: 50px;
}

#col-sm-3 {
	
}
</style>
<body>
		<%@ include file="../main/mainMenubar.jsp" %>
	<div id="wrapper">
              
		<!-- Main -->
		<div id="main">
						
			<div class="inner">
					
				<!-- Header -->

				<%-- <header id="header" style="border: 1px solid black;">
				<%@ include file="../main/mainMenubar.jsp" %>  
					
				 </header>
 --%>
				<%-- <form action="<%=request.getContextPath()%>/insert.to"  method="post" encType="multipart/form-data"> --%>
				<form action="<%=request.getContextPath()%>/insertDet.tn" method="post" encType="multipart/form-data">
				<section id="contents" class="tableArea">
				   
				
					<div class="container" style="border: 1px solid black;">
											


						 <div class="photoArea row" style="border: 1px solid black;">

							<div class="col-sm-12">
								<h4>작가 사진 수정</h4>
							</div>

							<div class="col-sm-3">
								<div class="photo" id="contentImgArea1" 
									style="height: 200px; border: 1px solid black;">
									
									<img id="contentImg1" width="260" height="200">
									
									</div>
							</div>
							<div class="col-sm-3">
								<div class="photo"  id="contentImgArea2" 
									style="height: 200px; border: 1px solid black;">
									
									<img id="contentImg2" width="260" height="200">
									</div>
							</div>
							<div class="col-sm-3">
								<div class="photo"  id="contentImgArea3" 
									style="height: 200px; border: 1px solid black;">
									
									<img id="contentImg3" width="260" height="200">
									</div>
							</div>
							<div class="col-sm-3">
								<div class="photo"  id="contentImgArea4" 
									style="height: 200px; border: 1px solid black;">
									<img id="contentImg4" width="260" height="200">
									</div>
							</div>





						</div>
						<br>


					<!-- <div class="text row" id="cent" style="border: 1px solid red;"> -->
						<h3>작가 이야기 스토리</h3>
						<textarea  name="author_Title" style="width:1000px" placeholder="제목명"></textarea>
							
						<div class="textArea" style="border: 1px solid  black; width: 1100px; height: 700px;">
						
								
							<textarea name="author_content"  style= "width:1100px"  placeholder="내용을 입력하세요"></textarea>
						
						</div>	
						
						          
                        <div id="fileArea">
				
					<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1)">
					<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this,2)">
					<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this,3)">
					<input type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="loadImg(this,4)">
				  </div>
                        
                        
                        
                        <div align="center">
							<button type="reset" style="width: 80px; height: 60px;"> 수정취소</button>
	                        <button type="submit" style="width: 80px; height: 60px;"> 저장하기</button>
						</div>
						
						

                             
                <!--         
					</div> -->

                            
				</div> 
				</section>
				<!-- </form> --> 
				</form>
			</div>
		</div>
		<%-- <%@ include file="../common/tourMenuBar.jsp"%> --%>
	</div>
	
	<script>
			$(function(){
				
				//파일영역(파일선택 버튼)을 숨긴다. div클릭시에 사진선택할 수 있는 창만 보여지게!
					$("#fileArea").hide();
					
					
					
					$("#contentImgArea1").click(function(){
						$("#thumbnailImg1").click();
					});
					$("#contentImgArea2").click(function(){
						$("#thumbnailImg2").click();
					});
					$("#contentImgArea3").click(function(){
						$("#thumbnailImg3").click();
					});
					$("#contentImgArea4").click(function(){
						$("#thumbnailImg4").click();
					});
					
			});
			//위에있는 thumbnailImg1에서
			/* <!-- 파일 요소를 같이 넘겨준다.value는 input type=file이 되는것! --> */
			/* function loadImg1(value){
				if(value.files && value.files[0]){
					var reader = new FileReader();
					//reader가 동작할때, 실행할 함수
					reader.onload = function(e){
						//이벤트가 발생한 요소의 파일경로를(result) 가져와서 src속성에 담아준다.
						$("#titleImg").attr("src", e.target.result);
					}
					
					reader.readAsDataURL(value.files[0]);
				}
			} */
				
			
			function loadImg(value, num){
				if(value.files && value.files[0]){
					var reader = new FileReader();
					reader.onload = function(e){
						switch(num){
						case 1: 
							$("#contentImg1").attr("src", e.target.result);
							break;
						case 2: 
							$("#contentImg2").attr("src", e.target.result);
							break;
						case 3: 
							$("#contentImg3").attr("src", e.target.result);
							break;
						case 4: 
							$("#contentImg4").attr("src", e.target.result);
							break;
						}
					}
					
					reader.readAsDataURL(value.files[0]);
				}
			}
		</script>
	
	
	

</body>
</html>
