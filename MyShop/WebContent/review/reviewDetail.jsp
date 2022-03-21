<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/includes/header.jsp" />
<style>
  h4 {
    margin-bottom: 20px;
  }
  .review {
    background-color: rgb(243, 243, 243);
    padding: 10px 20px;
  }
  .info {
    display: flex;
  }
  .info > p {
    justify-content: right;
    margin-right: 25px;
  }
  .reply {
    /* background-color: rgb(236, 248, 255); */
    margin-top: 30px;
    padding: 10px 20px;
  }
  .reply > .info {
    margin-bottom: 20px;
  }
  .replyEdit {
    padding: 10px 20px;
  }
  .content {
    margin-top: 30px;
  }
  .replyEdit {
    margin-top: 30px;
  }
  textarea {
    margin-top: 20px;
  }
  </style>
<div class="col-md-8 mx-auto">
  <div class="font-weight-bold mt-3 shadow p-3 mb-4 bg-light rounded">리뷰 상세보기 페이지</div>
  <div class="review rounded">
    <h4><c:out value="${review.reviewTitle}" /></h4>

    <div class="info">
      <p>글번호: <c:out value="${review.reviewID}" /></p>
      <p>상품번호: <c:out value="${review.prodID}" /></p>
      <p>작성자: <c:out value="${review.userID}" /></p>
    </div>
    <p class="date">작성일: <c:out value="${review.reviewDate}" /></p>
    <!-- <p>판매자: <c:out value="${review.farmID}" /></p> -->
    <p class="content"><c:out value="${review.reviewContent}" /></p>
  </div>
  <!-- reply.replyID에 값이 있을때만 출력(ne가 !=와 같음) -->
  <c:if test="${reply.replyID ne null }">
    <div class="reply">
      <div class="info">
        <p>덧글번호: <c:out value="${reply.replyID}" /></p>
        <p>판매자ID: <c:out value="${reply.farmID}" /></p>
      </div>
      <p><c:out value="${reply.replyContent}" /></p>
    </div>
      <a href="<%=request.getContextPath()%>/replyController?cmd=delete&replyID=<c:out value='${reply.replyID}'/>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false" class="btn btn-success btn-action mt-3">답글삭제</a>
    <br>
  </c:if>
 <a href="<%=request.getContextPath()%>/reviewController?cmd=delete&reviewID=<c:out value='${review.reviewID}'/>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false" class="btn btn-success btn-action mt-3">전체삭제</a>

<jsp:include page="/includes/footer.jsp" />

<script>
	$('.nav-link').removeClass('active');
	$('#m-review').addClass('active');
</script>
