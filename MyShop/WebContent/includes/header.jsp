<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- bootstrap, datatables, css, favicon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css" />
<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/images/icon.png" type="image/x-icon" />

<title>못난이 농산품</title>

</head>

<body>

	<% 
		// 로그인 한 경우에 세션에 저장된 유저아이디를 가지고 옴
		String manID = null;
		if(session.getAttribute("manID") != null){
			manID = (String)session.getAttribute("manID");
		}
	%>
	
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: gray">
			<a id="m-home" class="navbar-brand" href="<%=request.getContextPath()%>/home/managerMain.jsp">🥦못난이 농산품</a>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a id="m-product" class="nav-link" href="<%=request.getContextPath()%>/managerProduct?cmd=list">농산물</a> 
					<a id="m-review" class="nav-link" href="<%=request.getContextPath()%>/reviewController?cmd=list">리뷰</a> 
					<a id="m-member" class="nav-link" href="<%=request.getContextPath()%>/member?cmd=memberList">농민·회원 관리</a>
					<a id="m-order" class="nav-link" href="<%=request.getContextPath()%>/managerOrderlist?cmd=list">주문 내역 관리</a>
				</div>
				<%
					if(manID == null){
				%>
				<div class="navbar-nav ml-auto">
					<a class="btn btn-primary me-2" href="<%=request.getContextPath()%>/login/managerLogin.jsp" role="button">로그인</a>
				</div>
				<%
					}else{
				%>
				<div class="navbar-nav ml-auto">
					<a class="btn btn-primary me-2" href="<%=request.getContextPath()%>/login/logout.jsp" role="button">로그아웃</a>
				</div>
				<%
					}
				%>
			</div>
		</nav>
	</header>
</body>

</html>
