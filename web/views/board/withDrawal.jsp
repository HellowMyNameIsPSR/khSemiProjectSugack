<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.name{
		width:100%;
		font-size:30px;
	}
	
	.outer{
		border:1px solid gray;
		height:250px;
	}
</style>
</head>
<body>
	
<!-- Wrapper -->
	<div id="wrapper">
	
		<!-- Main -->
		<div id="main">
				
			<div class="inner">
				
				<!-- Header -->
				
				<header id="header">
					<div class="name">회원탈퇴</div>
				</header>
				
				<section id="contents">
					<div class="container">
						<div class="outer">
						
							<table>
								<tr>
									<td>
										<select>
											<option selected>탈퇴사유</option>
											<option>유용한 정보가 없어서</option>
											<option>더이상 이용하지 않거나 이용하지 못하게 되어서</option>
											<option>탈퇴</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>
										<textarea></textarea>
									</td>
								</tr>
								
							</table>
							
							<button class="withDrawl" style="width:30%; height:50px; float:right; font-size:15px;  background:gray; color:white">탈퇴하기</button>
							<br>
							
						</div>
						
					</div>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		

			<%@ include file="../common/userMenuBar.jsp" %>
	</div>
	
			
<script>
		
		$(function(){
			
			$(".withDrawl").click(function(){
				
				 var mid = <%=loginUser.getMemberId()%>;
				 
				$.ajax({
					
					url:"<%=request.getContextPath()%>/deleteMember.me",
					data:{mid:mid},
					type:"post",
					success:function(data){
						if(data == "ok") {
							alert("탈퇴 완료 되었습니다.");
							location.href="index.jsp";
						}
							console.log("뭐야");
					}, 
					error:function(){
						console.log("통신 실패!");
					}
				}); 
				 
			});
		});
		</script>
</body>
</html>