<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../includes/headerUser.jsp" />
<style>
.input-group {
	background-color: bisque;
}

.col-sm-12 {
	display: flex;
}

.dataTables_filter {
	margin-left: auto;
}
</style>
	
	<div class="row mt-5">
		<div class="col-md-8 mx-auto">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>ID</th>
						<th>상품명</th>
						<th>주문가격</th>
						<th>주문수량</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="orders" items="${orders}">
						<tr>
							<td><c:out value="${orders.orderNum}" /></td>
							<td><c:out value="${orders.userID}" /></td>
							<td><c:out value="${orders.prodName}" /></td>
							<td><c:out value="${orders.prodPrice * orders.orderQuantity}" /></td>
							<td><c:out value="${orders.orderQuantity}" /></td>
							<td><a href="<%= request.getContextPath() %>/order?cmd=view&id=<c:out value='${orders.orderID}'/>">상세보기</a></td>
						</tr>
	
					</c:forEach>
	
				</tbody>
	
			</table>
	
		</div>
	</div>
	
	
<jsp:include page="../includes/footer.jsp" />
<script
	src="https://cdn.datatables.net/v/bs4/dt-1.10.24/datatables.min.js"></script>
<script src="<%=request.getContextPath()%>/js/reviewList.js"></script>

<script>
	$('.nav-link').removeClass('active'); // 모든 메뉴의 액티브클래스를 삭제
	$('#m-reviewFar').addClass('active'); // 네브바에서 메뉴중 m-home에 active 클래스를 주는 스크립트
</script>