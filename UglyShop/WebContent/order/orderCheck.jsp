<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "dao.OrderDAO"%>   
<jsp:include page="../includes/headerUser3.jsp" />
	
	<%
			String message = (String) request.getAttribute("message");
	   		
	   		if(message == "success"){
	   			out.println("<script>");
				out.println("alert('구매가 성공적으로 완료되었습니다')");
				out.println("</script>");
	%>			<script> location.href = "main/main.jsp";</script>
	<% 		} else if(message == "fail"){
	  			out.println("<script>");
				out.println("alert('구매에 실패하였습니다')");
				out.println("</script>");
	%>			<script> location.href = "main/main.jsp"</script>
	<%  		}
	%>

	<div class="container">
      <div class="row">
        <div class="col-lg-5 col-md-7 mx-auto">
          <div class="bg-light p-5 mt-5">
            <form action="<%=request.getContextPath()%>/order?cmd=changeShip" method="post">
              <h3 class="text-center mb-3"> 배송지정보</h3>
              <p>고객 아이디</p>
              <input type="text" class="form-control mb-3" name="userID" value="${userID}" maxlength="20" readonly />
              <input type="hidden" class="form-control mb-3" name="orderNum" value=<c:out value="${order.orderNum}" /> required/>
              <p>받으시는 분</p>
              <input type="text" class="form-control mb-3" name="userName" placeholder="받으시는 분" value=<c:out value="${order.userName}" /> maxlength="20" required />
               <p>배송받을 주소</p>
              <input type="text" class="form-control mb-3" name="userAdd" placeholder="배송받을 주소" value='<c:out value="${order.userAdd}" />' maxlength="50" required />
               <p>전화번호</p>
              <input type="text" class="form-control mb-3 mt-3" name="userTel" placeholder="전화번호" value=<c:out value="${order.userTel}" /> maxlength="20" required />
              <input type="submit" class="btn btn-dark form-control mb-3 mt-3" value="확인" />
            </form>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="../includes/footer.jsp" />
</body>
</html> 