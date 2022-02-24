<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/includes/header.jsp" />

<div class="container">
	<div class="font-weight-bold mt-3 shadow p-3 mb-4 bg-light rounded">상품 정보 수정</div>

	<form action="<%=request.getContextPath()%>/managerProduct?cmd=save"
		method="post">
		<div class="form-group">
			<label for="farmID">농민ID</label> 
			<input type="text" class="form-control" id="farmID" name="farmID" required />
		</div>

		<div class="form-group">
			<label for="prodName">상품명</label> 
			<input type="text" class="form-control" id="prodName" name="prodName" required />
		</div>
		
		<div class="form-group">
			<label for="prodPrice">상품가격</label> 
			<input type="text" class="form-control" id="prodPrice" name="prodPrice" required />
		</div>
		
		<div class="form-group">
			<label for="prodInven">재고</label> 
			<input type="text" class="form-control" id="prodInven" name="prodInven" required />
		</div>
		
		<div class="form-group">
			<label for="prodImg">이미지</label> 
			<input type="text" class="form-control" id="prodImg" name="prodImg" required />
		</div>
		
		<div class="form-group">
			<label for="prodInfo">상품정보</label> 
			<input type="text" class="form-control" id="prodInfo" name="prodInfo" required maxlength="20" />
		</div>
		
		<button type="submit" class="btn btn-success">저장</button>
        <button type="button" class="btn btn-secondary">취소</button>
	</form>
</div>

<jsp:include page="/includes/footer.jsp" />

<script src="https://cdn.datatables.net/v/bs4/dt-1.10.24/datatables.min.js"></script>

<script>
  $('.nav-link').removeClass('active');
  $('#m-order').addClass('active');
  var path = '<%=request.getContextPath()%> ';
</script>