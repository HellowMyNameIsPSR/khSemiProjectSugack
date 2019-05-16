<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.nav{
		margin-left: 250px;
		font-size: 30px;
		width: 50%;
	}
	.tab-content{
		margin-left: 250px;
		font-size: 20px;
		width: 50%;
	}
	a{
	text-decoration: none;
	color: black;
	}
	p{
	margin: 5px 0px 10px;
	text-align:center;
	}
</style>
</head>
<body>
	<div class="Topper" style="height:100px; background: lightgray; align: center">
			<div style="text-align:center; float:left; height: 100px; width: 300px;">
				<h2 style="color:white;">고객센터</h2>
			</div>
			<div style="float:left; height: 100px; width: 450px;">
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="검색어 입력">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>

		</div>
	</div>
	<div class="tabbable">
		<ul class="nav nav-tabs">
			<li><a href="#tab1" data-toggle="tab">문의하기</a></li>
			<li><a href="#tab2" data-toggle="tab">자주묻는질문</a></li>
			<li><a href="#tab3" data-toggle="tab">공지사항</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="tab1">
				<p><a href="customerCenterQuest.jsp">문의하기</a></p>
			</div>
			<div class="tab-pane" id="tab2">
				<p>
					<a href="customerCenterFaqDeliv.jsp">배송문의</a>
					|
					<a href="customerCenterFaqCancel.jsp">교환/환불</a>
					|
					<a href="customerCenterFaqOrder.jsp">주문/결제</a>
					|
					<a href="customerCenterFaqGoods.jsp">상품문의</a>
				</p>
			</div>
			<div class="tab-pane" id="tab3">
				<p><a href="customerCenterNotice.jsp">공지사항</a>|<a href="customerCenterEvent.jsp">이벤트</a></p>
			</div>
		</div>
	</div>
</body>
</html>