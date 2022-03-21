<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../includes/headerFarm.jsp" />
<style>
  h4 {
    margin-bottom: 20px;
  }
  .review {
    background-color: rgb(243, 243, 243);
    padding: 10px 20px;
  }
  /* .title {
    display: flex;
    align-items: baseline;
  } */
  .info {
    display: flex;
    /* margin-top: 40px; */
  }
  .info > p {
    justify-content: right;
    margin-right: 25px;
  }
  .reply {
    /* background-color: bisque; */
    padding: 10px 20px;
  }
  .reply > .info {
    margin-bottom: 20px;
  }
  .replyEdit {
    /* background-color: grey; */
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
  #replySubmit {
    margin-top: 20px;
  }
</style>

<div class="col-md-8 mx-auto mt-3">
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
  <!-- reply.farmID에 값이 있을때만 출력(ne가 !=와 같음) -->
  <c:if test="${reply.farmID ne null }">
    <hr />
    <div class="reply">
      <div class="info">
        <p>덧글번호: <c:out value="${reply.replyID}" /></p>
        <p>판매자ID: <c:out value="${reply.farmID}" /></p>
        <p>상품번호: <c:out value="${reply.prodID}" /></p>
      </div>
      <p><c:out value="${reply.replyContent}" /></p>
    </div>
  </c:if>
  <!-- 아래 두 줄은 확인용이므로 완성본에는 삭제예정 -->
  <%--
  <p>현재 접속한 농민의 아이디: <%=session.getAttribute("farmID") %></p>
  <p>지금농민: ${farmID}</p>
  --%>
  <!-- review테이블에 farmID더한 후 세션에 저장된 farmID와 review.farmID가 똑같을때만 출력하도록 수정. -->
  <div class="replyEdit">
    <c:if test="${farmID eq review.farmID }">
      <!-- reply.replyID에 값이 있으면 덧글삭제버튼을 출력 -->
       <c:if test="${reply.replyID ne null }">
        <form name="replyDel" action="<%= request.getContextPath() %>/replyController" method="get">
          <input type="hidden" name="cmd" value="delete" />
          <input type="hidden" name="replyID" value='<c:out value="${reply.replyID}" />' />
          <input type="hidden" name="id" value="${review.reviewID}" />
          <button type="submit" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false" class="btn btn-danger btn-action">덧글삭제</button>
        </form>
      </c:if>
      <!-- reply.replyID에 값이 없으면 덧글작성창을 출력 -->
      <c:if test="${reply.replyID eq null }">
        <form id="replyWrite" name="replyEdit" action="<%= request.getContextPath() %>/replyController?cmd=save" method="post">
          <input type="hidden" name="cmd" value="edit" />
          <!-- <h4>덧글달기</h4> -->
          <textarea name="replyContent" id="commnet" cols="100" rows="10" placeholder="덧글을 입력해주세요." required></textarea><br />
          <input type="hidden" name="prodID" value="${review.prodID}" />
          <input type="hidden" name="reviewID" value='<c:out value="${review.reviewID}"/>' />
          <input type="hidden" name="farmID" value="<%=session.getAttribute("farmID") %>" />
          <input type="hidden" name="id" value="${review.reviewID}" />
          <button type="submit" id="replySubmit" class="btn btn-success btn-action">작성완료</button>
        </form>
      </c:if>
    </c:if>
    <!-- required: submit하기 전 무조건 빈칸을 채우도록하는 속성 -->
  </div>
</div>

<jsp:include page="../includes/footer.jsp" />
<script>
  $('.nav-link').removeClass('active'); // 모든 메뉴의 액티브클래스를 삭제
  $('#m-reviewFar').addClass('active'); // 네브바에서 메뉴중 m-home에 active 클래스를 주는 스크립트
</script>

