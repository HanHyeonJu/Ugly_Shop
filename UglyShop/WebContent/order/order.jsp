<%@page import="beans.Cart"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

<jsp:include page="../includes/headerUser.jsp" />
<title>못난이농산물 판매사이트</title>
<style>
/* .col-md-8 {
        display: flex;
      } */
/* .pay {
        display: inline-block;
        justify-content: flex-end;
      } */

/* tbody, td, tfoot, th, thead, tr {
    border-style: none !important;
  } */
.bank {
	width: 80px;
	height: 40px;
}

.cardNum {
	width: 350px;
	margin: 10px 30px;
}

.cardPass {
	width: 100px;
	margin: 10px 30px;
}
</style>
</head>
<body>

	<%
		if (session.getAttribute("cartList") != null) {
		HashMap<Integer, Cart> cartList = (HashMap<Integer, Cart>) session.getAttribute("cartList");
	}
	%>

	<div class="row mt-5">
		<div class="col-md-8 mx-auto">
			<div class="font-weight-bold mt-3 shadow p-3 mb-4 bg-light rounded">
				주문하기</div>
			<hr />
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th scope="col">상품명</th>
						<!-- <th scope="col">판매자</th> -->
						<th scope="col">수량</th>
						<th scope="col">금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="carList" items="${cartList.values()}">
						<c:set var="prodPrice" value="${carList.prodPrice}" />
						<c:set var="orderQuantity" value="${carList.orderQuantity}" />
						<c:set var="row_sum" value="${row_sum + prodPrice*orderQuantity}" />
						<tr>
							<td scope="row"><c:out value="${carList.prodName}" /></td>
							<!-- <td>Mark</td> -->
							<td><c:out value="${carList.orderQuantity}" /></td>
							<td><c:out value="${prodPrice*orderQuantity}" /></td>
						</tr>
					</c:forEach>
				</tbody>



			</table>
			<div>
				<b> 총 결제금액 : <c:out value="${row_sum}" /></b>
			</div>
			<hr />
			<div class="pay">
				<!-- 은행선택 -->
				<select name="bank" id="bank" style = "height : 30px;">
					<option value="1">농협</option>
					<option value="1">우리</option>
					<option value="1">국민</option>
					<option value="1">신한</option>
				</select> 
				<input class="cardNum" type="text" style = "margin-left : 5px;" placeholder="카드번호를 입력해주세요" /> 
				<input class="cardPass" type="text" style = "margin-left : -25px;"size="5" placeholder="비밀번호" /> 
				<span style="float:right;">
				<a class="btn btn-primary mt-auto"
					href="<%=request.getContextPath()%>/orderController?cmd=save&cartID=<c:out value='${cartList.cartID}'/>"
					class="btn btn-success btn-action mt-3">결제하기</a>
				</span>
				
				<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
				<script
					src="https://cdn.datatables.net/v/bs4/dt-1.10.24/datatables.min.js"></script>
				<script src="../assets/order.js"></script>
				<jsp:include page="../includes/footer.jsp" />
</body>
</html>
