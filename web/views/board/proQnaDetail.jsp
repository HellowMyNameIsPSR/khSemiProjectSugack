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
<title>문의 내역 상세보기!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
	.outer{
		width:800px;
		
		background:lightblue;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:30px;
	}
	
	td{
		border:1px solid white;
	}
	
	.tableArea{
		border:1px solid white;
		width:800px;
		height:350px;
		margin:0 auto;
	}
	
	.replyArea{
		width:800px;
		color:white;
		background:lightblue;
		margin:0 auto;
	}
	
	
</style>
</head>
<body>

	<div class="outer">
		<br>
		<div align="float:left">
			<button onclick="location.href='<%=request.getContextPath()%>/selectProQna.bo'">메뉴로 돌아가기</button>
		</div>
		<h2 align="center">문의내역 상세보기!</h2>
		<div class="tableArea">
			<table align="center" width="800px">
				<tr>
					<td colspan="2">문의종류</td>
					<td><span><%=qna.getCategory() %></span></td>
					<%-- <td>제목</td>
					<td colspan="3"><span><%=qna.getbTitle() %></span></td> --%>
				</tr>
				
				<tr>
					<td>작성자</td>
					<td><span><%=qna.getWriter() %></span></td>
					
					<td>작성일</td>
					<td><span><%=qna.getWriteDate() %></span></td>
				</tr>
				
				<tr>
					<td colspan="6">내용</td>
				</tr>
				
				<tr>
					<td colspan="6" style="height:200px">
						<p id="content"><%= qna.getContent() %></p>
					</td>
				</tr>
			</table>
		</div>
		
		
	</div>
	<%-- <%if(loginUser.getMemberId()==0){ %> --%>
	<div class="replyArea">
		<div class="replyWriterArea">
			<table align="center">
				<tr>
					<td>댓글작성</td>
					<td>
						<textarea rows="3" cols="80" id="replyContent" name="reply"></textarea>
					</td>
					<td><button id="addReply">댓글 등록</button></td>
				</tr>
			</table>
		</div>
		<br>
		<div class="replySelectArea">
			<table id="replySelectTable" border="1" align="center" style="text-align:center">
			<tr>
					<td style="width:170px;">작성자</td>
					<td style="width:300px;">내용</td>
					<td style="width:200px;">작성날짜</td>
					
			</tr>
			 <% for(int i = 0; i < commentList.size(); i++) {%> 
				<!-- 이름 -->
				
				<tr>
					<td><%= commentList.get(i).getWriter() %></td>
					<td><%=commentList.get(i).getContent() %></td>
					<td><%=commentList.get(i).getWriteDate() %></td>
				</tr>
				
				<!-- 내용 -->
				<!-- <tr>
					
				</tr>
				
				작성 날짜
				<tr>
					
				</tr> -->
			<%} %> 
			</table>
		</div>
		
	</div>
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
</body>
</html>