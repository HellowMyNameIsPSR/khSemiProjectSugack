<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴!</title>
<style>
	.name{
		width:100%;
		font-size:30px;
	}
	
	.outer{
		border:1px solid gray;
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
											<option>탈퇴사유1</option>
											<option>탈퇴사유2</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>
										<textarea></textarea>
									</td>
								</tr>
							</table>
							<br>
							<input type="submit"value="탈퇴를 진행하시겠습니까?" style="float:right; margin-top:10px; background:gray; color:white; width:30%; height:50px">
						</div>
						
					</div>
					<!-- Contents area -->
				</section>
			</div>
		</div>
		<%@ include file="../common/userMenuBar.jsp" %>
	</div>
			
</body>
</html>