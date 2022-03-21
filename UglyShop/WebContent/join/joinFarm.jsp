<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<jsp:include page="../includes/headerFarm2.jsp" />

	<%
		String message = (String) request.getAttribute("message");

	if (message == "e1") {
		out.println("<script>");
		out.println("alert('존재하는 아이디입니다')");
		out.println("</script>");
	} else if (message == "p") {
		out.println("<script>");
		out.println("alert('비밀번호가 다르게 입력되었습니다')");
		out.println("</script>");
	} else if (message == "r-1") {
		out.println("<script>");
		out.println("alert('회원가입에 실패했습니다')");
		out.println("</script>");
	}
	%>

	<div class="container">
		<div class="row">
			<div class="col-lg-5 col-md-7 mx-auto">
				<div class="bg-light p-5 mt-2">
					<form action="<%=request.getContextPath()%>/joinFarmer"
						method="post">
						<h3 class="text-center mb-3">회원가입</h3>
						<input type="text" class="form-control mb-3" name="farmID"
							placeholder="아이디" maxlength="20" required> 
						<input type="password" class="form-control mb-3" name="farmPassword"
							placeholder="패스워드" maxlength="20" required>
						<input type="password" class="form-control mb-3" name="farmPassword2"
							placeholder="패스워드 확인" maxlength="20" required> 
						<input type="text" class="form-control mb-3" name="farmName"
							placeholder="이름" maxlength="20" required> 
						<input type="text" class="form-control mb-3" name="farmAdd"
							placeholder="주소" maxlength="50" required> 
						<input type="text" class="form-control mb-3 mt-3" name="farmTel"
							placeholder="전화번호" maxlength="20" required> 
						<div class="form-group mt-3">
			              <button type="submit" class="btn btn-dark" style= "width:271pt">농민 가입하기</button>
			              <a class="btn btn-primary me-2 mt-3" style= "width:271pt" href="joinUser.jsp" role="button"> 고객 회원가입</a>
			            </div>
								
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>