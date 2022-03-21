<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../includes/headerUser.jsp" />

<div class="container">
  <div class="row">
    <div class="col-lg-5 col-md-7 mx-auto">
      <div class="bg-light p-5 mt-5">
        <h6 class="text-center mb-3">${userID }님의 품목별 주문 상세 정보</h6>
        <p>고객아이디: <c:out value="${order.userName}" /></p>
        <p>배송주소: <c:out value="${order.userAdd}" /></p>
        <p>수신자전화번호: <c:out value="${order.userTel}" /></p>
        <p>주문자: <c:out value="${order.userName}" /></p>
        <p>상품명: <c:out value="${order.prodName}" /></p>
        <p>상품가격: <c:out value="${order.prodPrice}" /></p>
        <p>주문갯수: <c:out value="${order.orderQuantity}" /></p>
        <p>처리상태: <c:out value="${order.is_status}" /></p>
        <p>송장번호: <c:out value="${order.trackNum}" /></p>
        <div class= "btns" style="text-align:center;">
        <a class="btn btn-outline-success me-2" href="<%=request.getContextPath()%>/order?cmd=list" role="button"> 확인</a>
        <a class="btn btn-outline-primary me-2" href="<%=request.getContextPath()%>/ProdController2?cmd=find&id=<c:out value="${order.prodID}" />" role="button"> 상품보기</a>
        <a class="btn btn-outline-secondary mt-auto" href="<%= request.getContextPath() %>/review/reviewWrite.jsp?prodID=<c:out value="${order.prodID}" />&prodName=<c:out value="${order.prodName}" />&farmID=<c:out value="${order.farmID}" />">리뷰쓰기</a>
      	</div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="../includes/footer.jsp" />
<script>
  $('.nav-link').removeClass('active'); // 모든 메뉴의 액티브클래스를 삭제
  $('#m-reviewFar').addClass('active'); // 네브바에서 메뉴중 m-home에 active 클래스를 주는 스크립트
</script>
