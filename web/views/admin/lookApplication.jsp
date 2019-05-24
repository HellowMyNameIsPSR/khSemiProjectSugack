<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.admin.model.vo.*"%>
    
     <%
    	RequestMember rm = (RequestMember) request.getAttribute("author");
     	String picPath = (String) request.getAttribute("picPath");
     	ArrayList<String> picPath2 = (ArrayList<String>) request.getAttribute("picPath2");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>입점 신청 서류 확인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <%@ include file="../assets/css/allCss.html" %>
	<style>
		h2{
			text-align:center;
		}
    	.readTable {
    		margin-left:auto; 
    		margin-right:auto; 
    		text-align:center;
    		border-spacing:5px;
    		border-collapse:separate;
    		max-width:100%;
    		bakcground-color:transparent;
    	}
    </style>
</head>
<body>
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="/sg/views/admin/adminHome.jsp" class="logo">
						Admins<strong>HOME</strong>
					</a>
				</header>
				<section id="contents">
			<header class="main">
				<div class="allArea" style="width:100%">
				 
	<div class="container-fluid bg-grey">
	
		<div class="row" >
			<div class="pic">
			
			<table class="readTable" style="width:50%;">
			<tr>
				<td colspan="3">
					<label class="form-control" style="background:#ccd9ff;">1차 입점 신청 내역</label>
				</td>
			</tr>
			<tr>
				<td rowspan="6">
					<img src="<%= request.getContextPath() %>/uploadApply/<%= picPath %>" style="width:400px; height:300px">
				</td>
			</tr>
			</table>
			</div>
			<div class="text">
			
			<table class="readTable" style="width:100%;">
			<tr>
				<td> <!--작가 이름 -->
					<input type="hidden" id="memberId" value="<%= rm.getMemberId()%>"/>
					<input class="form-control" type="text" readonly id="memberName" name="memberName" value="작가명 : <%= rm.getName() %>">
				</td>
				<td> <!--브랜드 명-->
					<input class="form-control" id="brandName" name="brandName" type="text" value="브랜드명 : <%= rm.getBrandName() %>" readonly>
				</td>
			</tr>	
			<tr>
				<td colspan="2"> <!-- 이메일 -->
					<input class="form-control" id="email" name="email" type="email" value="이메일 : <%= rm.getEmail()%>"readonly>
				</td>
			</tr>
			<tr>
				<td><!-- 작가 공예 유형 -->
					<input class="form-control" id="authorType" name="authorType" type="text" value="공예유형 : <%= rm.getMaterial() %>" readonly>
				</td>
				<td><!-- 가입일 -->
					<input class="form-control" id="authorDate" name="authorDate" type="text" value="신청일 : <%= rm.getApplyDate() %>"readonly>
				</td>
			</tr>
			<tr>
				<td colspan="2"> <!-- 가입내용 -->
					<textarea class="form-control" id="comments" name="comments" rows="5" readonly><%= rm.getApplyContent() %></textarea>
				</td>
			</tr> 
			</table>
			</div>
			
				<td colspan="2">
					<table class="readTable" style="border:1px solid #b3b3cc; text-align:center; width:100%;">
						<tr>
							<th><label class="form-control" style="text-align:center;">차수</label></th>
							<th><label class="form-control" style="text-align:center;">상태</label></th>
						</tr>
						<tr>
							<td>1차</td>
							<td><%= rm.getApply1() %></td>
						</tr>
						<tr>
							<td>2차</td>
							<td><%= rm.getApply2() %></td>
							
						</tr>
						
					</table>
			</table>
			
			
		
		</div>
		<div class="btns" style="align:center;text-align:center; margin-top:15px;">
				<button class="btn" id="accept" style="width:60px; height:40px; background: skyblue"value="승인">승인</button>
				<button class="btn" id="deny" style="width:60px; height:40px; background: skyblue" value="거부">거부</button>
			</div>
			<% if(rm.getApply1().equals("승인")) { %>
			<% for(int j = 0; j < picPath2.size(); j++){ %>
			<% System.out.println("picPath2 size : " + picPath2.size()); %>
		<div class="row">
				<table class="readTable" style="width:100%;">
			      		<tr style="margin-left:30px;">
			      			<td colspan="5"><label class="form-control" style="background:#ccd9ff;">2차 신청 서류 첨부</label></td>
			      		</tr>
			      		
			      		
			      		<tr>
			      			<td colspan="2">
			      				<label class="form-control" >사업자 등록증</label>
			      				<div style="width:400px; height:400px; margin-left:17px; margin-bottom:40px;">
			      					<img src="<%= request.getContextPath() %>/uploadApply2/<%= picPath2.get(1) %>" style="width:400px; height:400px">
			      				</div>
			      			</td>
			      			
			      			<td></td>
			      			
			      			<td colspan="2">
			      				<label class="form-control">구매 안전 서비스 관리 이용 확인증</label>
			      				<div style="width:400px; height:400px; margin-bottom:40px;">
			      				<img src="<%= request.getContextPath() %>/uploadApply2/<%= picPath2.get(2) %>" style="width:400px; height:400px">
			      				</div>
			      			</td>
			      		</tr>
			      		
			      		
			      		<tr>
			      			<td colspan="2">
			      				<label class="form-control">통신판매업 신고증</label>
			      					<div style="width:400px; height:400px; margin-left:17px;">
			      					<img src="<%= request.getContextPath() %>/uploadApply2/<%= picPath2.get(0) %>" style="width:400px; height:400px">
			      					<%= j = j + picPath2.size() %>
			      				</div>
			      			</td>

			      		</tr>
			      	</table>
			      	
		</div>
		<div class="btns" style="align:center;text-align:center; margin-top:15px;">
				<button id="accept2" class="btn" style="background: skyblue;" value="승인">승인</button>
				<button id="deny2" class="btn"  style="background: skyblue;" value="거부">거부</button>
			</div>
						<% } %>
						<% } %>
			      		<!-- 메뉴바 자리 -->
		
	</div>
				
				
				
				</div>
			
				</header>
				</section>
				</div>
			</div>
		<%@ include file= "/views/admin/adminMenubarServlet.jsp" %>
	</div>


	<script>
	$(function(){
		$("#accept").click(function(){
			var apply1Stat =$(this).val();
			console.log(apply1Stat);
			var memberId = $("#memberId").val();
			console.log(brandName);
			 if(confirm("정말 승인하시겠습니까 ?") == true){
					$.ajax({
						url:"<%= request.getContextPath() %>/reqDeny.ad",
						data:{apply1Stat:apply1Stat, memberId:memberId},
						type:"get",
						success:function(data){
							alert("승인 되었습니다");
							location.href= "views/admin/adminHome.jsp";

						}
					})
				       
			    }
			    else{
			        return ;
			    }

			var authorName = $(this).parent().children().eq(1).text();
			console.log(authorName);
			
		});
		
		$("#deny").click(function(){
			var apply1Stat = $(this).val();
			var memberId = $("#memberId").val();
			if(confirm("정말 거부하시겠습니까 ?") == true){
				$.ajax({
					url:"<%= request.getContextPath() %>/reqDeny.ad",
					data:{apply1Stat:apply1Stat, memberId:memberId},
					type:"get",
					success:function(data){
						alert("거부처리 되었습니다");
						//location.reload("views/admin/viewReqMemList.jsp");
						//location.href= "views/admin/adminHome.jsp";
						location.href= "views/admin/adminHome.jsp";

						
					}
				})
			       
			    }
			    else{
			        return ;
			    }
		})
		$("#accept2").click(function(){
			var apply2Stat =$(this).val();
			var memberId = $("#memberId").val();
			 if(confirm("정말 승인하시겠습니까 ?") == true){
					$.ajax({
						url:"<%= request.getContextPath() %>/reqDeny.ad",
						data:{apply2Stat:apply2Stat, memberId:memberId},
						type:"get",
						success:function(data){
							alert("승인 되었습니다");
							location.reload();
							//location.href= "views/admin/adminHome.jsp";


						}
					})
				       
			    }
			    else{
			        return ;
			    }

			var authorName = $(this).parent().children().eq(1).text();
			console.log(authorName);
			
		});
		
		$("#deny2").click(function(){
			var apply2Stat = $(this).val();
			var memberId = $("#memberId").val();
			if(confirm("정말 거부하시겠습니까 ?") == true){
				$.ajax({
					url:"<%= request.getContextPath() %>/reqDeny.ad",
					data:{apply2Stat:apply2Stat, memberId:memberId},
					type:"get",
					success:function(data){
						alert("거부처리 되었습니다");
						location.reload();
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