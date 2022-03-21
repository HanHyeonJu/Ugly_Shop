<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/includes/header.jsp" />

<div class="container">
	<div class="font-weight-bold mt-3 shadow p-3 mb-4 bg-light rounded">상품 정보 수정</div>
		<form action="<%=request.getContextPath()%>/managerProduct?cmd=update" method="post">
		<div class="form-group">
			<label for="farmID">농민ID</label> 
			<input type="text" class="form-control" id="farmID" name="farmID" value="${product.farmID}" required />
		</div>
		
		<div class="form-group">
			<label for="farmID">농민Tel</label> 
			<input type="text" class="form-control" id="farmTel" name="farmTel" value="${product.farmTel}" required />
		</div>
		
		<div class="form-group">
			<label for="prodName">상품명</label> 
			<input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" required />
		</div>
		
		<div class="form-group">
			<label for="prodPrice">상품가격</label> 
			<input type="text" class="form-control" id="prodPrice" name="prodPrice" value="${product.prodPrice}" required />
		</div>
		
		<div class="form-group">
			<label for="prodImg">이미지(변경 원할 시 해당 관리자에게 문의)</label> 
			<input type="text" class="form-control" id="prodImg" name="prodImg" value="${product.prodImg}" required readonly />
		</div>
		
		<div class="form-group">
			<label for="prodInfo">상품정보</label> 
			<input type="text" class="form-control" id="prodInfo" name="prodInfo" value="${product.prodInfo}" required maxlength="50" />
		</div>
		
		<div class="form-group">
			<input type="hidden" class="form-control" id="prodID" name="prodID" value="${product.prodID}"/>
		</div>
			<button type="submit" class="btn btn-success">수정하기</button>
			<a class="btn btn-secondary" href="<%= request.getContextPath() %>/managerProduct?cmd=list">취소</a>
	</form>
</div>

<jsp:include page="/includes/footer.jsp" />

<script src="https://cdn.datatables.net/v/bs4/dt-1.10.24/datatables.min.js"></script>

<script>
  $('.nav-link').removeClass('active');
  $('#m-order').addClass('active');
  var path = '<%=request.getContextPath()%> ';
</script>