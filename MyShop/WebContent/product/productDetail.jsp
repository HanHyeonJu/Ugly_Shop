<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/includes/header.jsp" />

<style>
  .container {
    display: flex;
  }
  .container2 {
    padding: 20px;
    margin-left: 40px;
  }
  .ProdImg {
    width: 550px;
    height: 400px;
  }
  .info {
    word-break: break-all;
  }
  h3 {
    margin-bottom: 30px;
  }
  .btn:first-child {
    margin-right: 60px;
  }
</style>

<div class="container mt-5">
  <img class="ProdImg" src="<%= request.getContextPath() %>/assets/img/<c:out value='${product.prodImg}' />.jpg" alt="상품사진" />
  <div class="container2">
    <h3>상품명: <c:out value="${product.prodName}" /></h3>
    <p>상품번호: <c:out value="${product.prodID}" /></p>
    <p>판매자ID: <c:out value="${product.farmID}" /></p>
    <p>가격: <c:out value="${product.prodPrice}" />원</p>
    <a class="btn btn-secondary mt-auto" href="<%= request.getContextPath() %>/reviewController?cmd=find&prodID=<c:out value='${product.prodID}'/>">리뷰보기</a>
    <a class="btn btn-info" href="<%= request.getContextPath() %>/managerProduct?cmd=edit&prodID=${product.prodID}">수정</a>
    <!-- <button type="button" class="btn btn-info btn-edit" data-id="<c:out value='${product.prodID}' />">수정</button> -->
    <button type="button" class="btn btn-danger mt-auto btn-delete" data-id="<c:out value='${product.prodID}' />" data-toggle="modal" data-target="#modal-delete">삭제</button>
  </div>
</div>
<br />
<div class="container">
  <div class="info">
    <h3>상품설명</h3>
    <p><c:out value="${product.prodInfo}" /></p>
  </div>
</div>

<%-- 아래는 모달(팝업창) html : 안보이다가 특정 이벤트가 발생하면 알림창으로 뜸 --%>
<!-- <div class="modal fade" id="modal-update" tabindex="-1" aria-labelledby="updateLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 id="title-upd" class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="update" autocomplete="off">
        <div class="modal-body">
          <div class="form-group">
            <label for="farmID">농민ID</label>
            <input type="text" class="form-control" id="farmID" name="farmID" required />
          </div>

          <div class="form-group">
            <label for="prodName">상품명</label>
            <input type="text" class="form-control" id="prodName" name="prodName" required />
          </div>

          <div class="form-group">
            <label for="prodImg">이미지</label>
            <input type="text" class="form-control" id="prodImg" name="prodImg" required />
          </div>

          <div class="form-group">
            <label for="prodInfo">상품정보</label>
            <input type="text" class="form-control" id="prodInfo" name="prodInfo" required maxlength="15" />
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">저장</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        </div>
      </form>
    </div>
  </div>
</div> -->

<%-- 삭제 모달 창 --%>
<div class="modal fade" id="modal-delete" tabindex="-1" aria-labelledby="deleteLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">delete</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>정말로 삭제할까요?</p>
      </div>
      <div class="modal-footer">
        <form id="frm-delete">
          <input type="hidden" name="cmd" value="del" />
          <input type="hidden" name="id" value="<c:out value='${product.prodID}' />" />
          <button type="submit" class="btn btn-danger btn-action">삭제</button>
        </form>
        <button type="button" class="btn btn-secondary btn-action" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/includes/footer.jsp" />

<script>
  $('.nav-link').removeClass('active');
  $('#m-product').addClass('active');
</script>
