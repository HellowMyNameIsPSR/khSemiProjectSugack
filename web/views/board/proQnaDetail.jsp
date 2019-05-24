<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.board.model.vo.*,java.util.*,com.kh.semi.member.model.vo.*, com.kh.semi.board.model.vo.*"%>
    
<%
		ProQna qna =(ProQna) request.getAttribute("qna");
		System.out.println("proQnaDetail : "+qna);
		
		
		
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		ArrayList<ProQnaComment> commentList = (ArrayList<ProQnaComment>)request.getAttribute("list");
		System.out.println("ProQnaDetail commentList: "+commentList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
	.outer{
		width:800px;
		margin-left:auto;
		margin-right:auto;
		margin-top:30px;
	}
	.table1{
		background: radial-gradient(white, #F6FFFF) fixed;
		border:2px solid lightgray;
		box-shadow:2px 2px lightgray;
		padding:20px 20px 20px 20px;
	}
	.table1 tr>td{
		border:1px solid gray;
		text-align:center;
	}
	.table2{
		background: radial-gradient(white, #F6FFFF) fixed;
		border:2px solid lightgray;
		box-shadow:2px 2px lightgray;
		padding:20px 20px 20px 20px;
	}
	.table2 tr>td{
		border:1px solid gray;
		text-align:center;
	}
	#addReply{
		color:gray; 
		background:lightgray; 
		width:90px; height:50px;
	}
	
	
</style>
</head>
<body>
	<div class="outer">
		<br>
		<div>
		<%if( loginUser.getMemberType().equals("N")) {%>
			<img src="views/images/left-arrow.png" style="width:50px; height:50px;" onclick="location.href='<%=request.getContextPath()%>/selectProQna.bo'">
		<%}else if(loginUser.getMemberType().equals("W")) {%>
			<img src="views/images/left-arrow.png" style="width:50px; height:50px;" onClick = "location.href='<%=request.getContextPath()%>/selectQnaList.wo'">
		<%} %>
		<%-- 	<button style="background:#bcd5e8;  border-radius:15px;height:50px; color:white" onclick="location.href='<%=request.getContextPath()%>/selectProQna.bo'">메뉴로 돌아가기</button> --%>
		</div>
		<table class="table1"style="width:800px;">
			<tr>
				<td colspan="5"><h2 align="center">문의내역 상세보기</h2></td>
			</tr>
			<tr>
				<td style="width:120px">상품명</td>
				<td style="width:250px;"><%=qna.getWorkName() %></td>
				
				<td style="width:120px;">문의종류</td>
				<td colspan="2" style="width:200px;"><%=qna.getCategory() %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><span><%=qna.getWriter() %></span></td>
				<td>작성일</td>
				<td colspan="2"><span><%=qna.getWriteDate() %></span></td>
			</tr>
			<tr align="center" style="height:300px;">
				<td colspan="5" ><%= qna.getContent() %></td>
			</tr>
			
			
		</table>
		<br><br>
		<table class="table2"style="width:800px;">
			<tr align="center">
				<td style="width:100px;">댓글작성</td>
				<td><textarea style="width:99%; height:99%;"rows="3" cols="80" id="replyContent" name="reply"></textarea></td>
				<td><button id="addReply">댓글 등록</button></td>
			</tr>
			<tr>
				<td colspan="3" style="border:none; height:20px;"></td>
			</tr>
			<tr style="height:40px;">
				<td>작성자</td>
				<td>내용</td>
				<td>작성날짜</td>
			</tr>
			<% for(int i = 0; i < commentList.size(); i++) {%> 
			<!-- 이름 !-->
			
			<tr style="height:40px;">
				<td><%= commentList.get(i).getWriter() %></td>
				<td><%=commentList.get(i).getContent() %></td>
				<td><%=commentList.get(i).getWriteDate() %></td>
			</tr>
			<%} %> 
		</table>
		<br><br>
		
	</div>
	<%-- <%if(loginUser.getMemberId()==0){ %> --%>
	<%-- <%} %> --%>
	<script>
		$(function(){
			$("#addReply").click(function(){
				var writer =<%=loginUser.getMemberId()%>;
				var bno = <%=qna.getBno()%>;
				var content = $("#replyContent").val();
				console.log(bno);
				
				$.ajax({
					url:"<%=request.getContextPath()%>/insertProQnaComment.bo?num=<%=qna.getBno()%>",
					data:{writer:writer, bno:bno, content:content},
					type:"post",
					success:function(data){
						
						
						/* var s = "";
						for(var i=1; i<500; i++){
							s += data[i];
						}
						console.log(s); */
						//console.log("ajax까지 성공: "+data)
						if(data == "ok"){
							location.reload();
							//self.close();
							
						}else if(data =="fail") {
        					alert("다시..");
        				}
						/* var $replySelectTable = $("#replySelectTable");
						$replySelectTable.html('');
						
						//console.log(data[key].writer);
						for(var key in data){
							console.log(data[key].writer);
							var $tr = $("<tr>");
							var $writerTd = $("<td>").text(data[key].writer).css("width", "100px").css("height", "30px");
							var $contentTd = $("<td>").text(data[key].content).css("width", "400px");
							var $dateTd = $("<td>").text(data[key].writeDate).css("width", "200px");
							
							
							
							$tr.append($writerTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							$replySelectTable.append($tr);

							
							
						} */
					},
					error:function(){
						console.log("실패");
					}
					
				});
			})
		})
	</script>
	<div style="height:500px;"></div>
</body>
</html>