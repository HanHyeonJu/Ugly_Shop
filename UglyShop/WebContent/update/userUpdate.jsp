<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<title>못난이 농산품(고객)</title>
</head>
<body>
 <%
		// 로그인 한 경우에 세션에 저장된 유저아이디를 가지고 옴
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		out.println("<script>");
		out.println("alert('권한이 없습니다.')");
		out.println("location.href = '../login/login.jsp'");
		out.println("</script>");
	}
	%>

    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: gray">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/main/main.jsp">홈페이지</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/ProdController?cmd=list">농산품</a></li>
          <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/reviewController?cmd=list">리뷰</a></li>
        </ul>
        <form class="d-flex mb-2 mb-auto">
          <input class="form-control" type="search" placeholder="Search" aria-label="Search" />
          <button class="btn btn-secondary me-2" type="submit">Search</button>
        </form>
        <% if (userID == null) { %>
        <ul class="navbar-nav mb-2 mb-lg-0">
          <li class="nav-item me-2"><a class="btn btn-primary" href="<%=request.getContextPath()%>/login/loginUser.jsp" role="button">로그인</a></li>
          <li class="nav-item me-2"><a class="btn btn-success" href="<%=request.getContextPath()%>/join/joinUser.jsp" role="button">회원가입</a></li>
        </ul>
        <% } else { %>
        <ul class="navbar-nav mb-2 mb-lg-0">
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-bs-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
            >
              마이 페이지</a
            >
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a></li>
              <li><a class="dropdown-item" href="#">장바구니</a></li>
              <li><a class="dropdown-item" href="#">주문조회</a></li>
              <li><a class="dropdown-item" href="<%=request.getContextPath()%>/update/userUpdate.jsp">고객정보수정</a></li>
            </ul>
          </li>
        </ul>
        <% } %>
      </div>
    </nav>
    
    <div class="container">
      <div class="row">
        <div class="col-lg-5 col-md-7 mx-auto">
          <div class="bg-light p-5 mt-5">
            <form action="<%=request.getContextPath()%>/userUpdate?action=doupdate" method="post">
              <h3 class="text-center mb-3"> 고객정보수정</h3>
              <input type="text" class="form-control mb-3" name="userID" placeholder="아이디"  value="${userID}" maxlength="20" required />
              <input type="password" class="form-control mb-3" name="userPassword" placeholder="패스워드"  maxlength="20" required />
              <input type="text" class="form-control mb-3" name="userName" placeholder="이름"  maxlength="20" required />
              <input type="text" class="form-control mb-3" name="userAdd" placeholder="주소"  maxlength="50" required />
              <input type="text" class="form-control mb-3 mt-3" name="userTel" placeholder="전화번호" maxlength="20" required />
              <input type="submit" class="btn btn-dark form-control mb-3" value="수정하기" />
            </form>
          </div>
        </div>
      </div>
    </div>

    <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>