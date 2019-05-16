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

				<header id="header" style="border: 1px solid black;">
				<%-- <%@ include file="../main/mainMenubar.jsp" %> --%>  
					
				 </header>

				<form action="<%=request.getContextPath() %>/insert.to" method="post" encType="multipart/form-data">
				<section id="contents">
					<div class="container" style="border: 1px solid black;">
						<h4>작가프로필</h4>

						<div class="profilArea row">
							<div id="titleImgArea"
								style="border: 1px solid black; width: 200px; height: 200px; float: left;">
								<img id="titleImg" width="200" height="200">
								
								
								</div>
							<div class="text"
								style="border: 1px solid blue; width: 500px; height: 50px; float: right;">
								<textarea name="author_name"style="width: 500px" placeholder="활동명"></textarea>
							</div>
							
							
							<div class="text"
								style="border: 1px solid purple; width: 500px; height: 200px; float: right;">
								<textarea name="author_about" style="width: 500px; hight: 200px;"
									placeholder="자기소개글"></textarea>

							</div>
						</div>



						
						<div id="fileArea">
				<!-- 파일 요소를 같이 넘겨준다.value는 input type=file이 되는것! -->
					<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1)">
					
				</div>
				
				
				
				
				


					
                              
                        <div align="center">
							<button type="reset" style="width: 80px; height: 60px;"> 수정취소</button>
	                        <button type="submit" style="width: 80px; height: 60px;"> 저장하기</button>
						</div>
						
						
						
						
						
						

                             
                        
				

                            
				</div>
				</section>
				</form>
			</div>
		</div>
		<%-- <%@ include file="../common/tourMenuBar.jsp"%> --%>
	</div>
	
	
	<script type="text/javascript">
		
	$("#fileArea").hide();
	
	$("#titleImgArea").click(function(){
			$("#thumbnailImg1").click();
				});
		
		
		
		function loadImg(value, num){
				if(value.files && value.files[0]){
					var reader = new FileReader();
					reader.onload = function(e){
						switch(num){
						case 1: 
							$("#titleImg").attr("src", e.target.result);
							break;
					
						
						}
					}
					
					reader.readAsDataURL(value.files[0]);
				}
			}
	
	
	
	</script>
	
	

</body>
</html>
