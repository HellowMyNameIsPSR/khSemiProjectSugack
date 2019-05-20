<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.author.model.vo.*"%>
    
    <%
    	Author a = (Author) request.getAttribute("author");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수작 - 관리자홈</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body class="is-preload">
<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="/views/admin/adminHome.jsp" class="logo">
						Admin<strong>HOME</strong>
					</a>
				</header>
				<section id="contents">
					<header class="main">
						<div class="reqDetail">
						<table>
							<tr>
								<td><h4><%= a.getApplyContent() %></h4></td>
								<td style="text-align: right"><h4>신청일자 : <%= a.getApplyDate() %></h4></td>

							</tr>
						
							<tr>
								<td>점포명: <%= a.getBrandName() %></td>
								<td style="text-align: right">
								<a href="filedown.jsp">해당 작품의 신청서 다운받기</a>
								</td>
							</tr>
						</table>
						<textarea id="reqDetailText" cols="30" rows="10" style="resize: none;"><%= a.getApplyContent() %></textarea>						
						</div>

							<button id="accept">승인</button>
							<button id="deny">거부</button>
					</header>
				</section>
			</div>
		</div>
		<%@ include file= "/views/admin/adminMenubar.jsp" %>
	</div>
	<script>
	$(function(){
		$("#accept").click(function(){
			var apply1Stat = $("성공");

			 if(confirm("정말 승인하시겠습니까 ?") == true){
					$.ajax({
						url:"<%= request.getContextPath() %>/reqDeny.ad",
						date:{apply1Stat:apply1Stat},
						type:"get",
						success:function(data){
							alert("승인 되었습니다");
						}
					})
				       
			        alert("등록되었습니다");
			    }
			    else{
			        return ;
			    }

			var authorName = $(this).parent().children().eq(1).text();
			console.log(authorName);
			
		});
		
		$("#deny").click(function(){
			var apply1Stat = $("거부");

			if(confirm("정말 거부하시겠습니까 ?") == true){
				$.ajax({
					url:"<%= request.getContextPath() %>/reqDeny.ad",
					date:{apply1Stat:apply1Stat},
					type:"get",
					success:function(data){
						alert("거부처리 되었습니다");
					}
				})
			       
			    }
			    else{
			        return ;
			    }
		})
	})
	
	</script>
			
</body>
</html>