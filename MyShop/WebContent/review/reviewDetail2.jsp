<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/includes/header.jsp" />
<style>
  .review {
    background-color: rgb(243, 243, 243);
    padding: 10px 20px;
  }
  .reply {
    background-color: bisque;
  }
  h4 {
    margin-bottom: 20px;
  }
  .info {
    display: flex;
  }
  .info > p {
    justify-content: right;
    margin-right: 25px;
  }
  .content {
    margin-top: 30px;
  }
  </style>

<% String prodID = request.getParameter("prodID"); if(prodID != null){ %>
<div class="container-fluid">
  <div class="col-md-8 mx-auto">
    <div class="font-weight-bold mt-3 shadow p-3 mb-4 bg-light rounded">리뷰 페이지</div>
    <c:forEach var="review" items="${reviews}">
      <div class="review rounded">
        <h4><c:out value="${review.reviewTitle}" /></h4>
        <div class="info">
          <p>리뷰글번호: <c:out value="${review.reviewID}" /></p>
          <p>작성자: <c:out value="${review.userID}" /></p>
          <p>작성일자: <c:out value="${review.reviewDate}" /></p>
          <p>상품번호: <c:out value="${review.prodID}" /></p>
        </div>
        <p><c:out value="${review.reviewContent}" /></p>
        <a href="<%=request.getContextPath()%>/reviewController?cmd=view&id=<c:out value='${review.reviewID}'/>" class="btn btn-success btn-action mt-3">덧글보기</a>
      </div>
      <br />
    </c:forEach>
  </div>
</div>
<%} %>

<jsp:include page="/includes/footer.jsp" />

<script>
	$('.nav-link').removeClass('active');
	$('#m-review').addClass('active');
</script>
