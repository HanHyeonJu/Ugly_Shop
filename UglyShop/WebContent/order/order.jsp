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
	
	
	<%
		String message = (String) request.getAttribute("message");

	if (message == "164") {
		out.println("<script>");
		out.println("alert('카드번호와 카드비밀번호를 작성해주세요')");
		out.println("</script>");
	} 
	%>

	<div class="row mt-5">
		<div class="col-md-8 mx-auto">
		 <form action="<%=request.getContextPath()%>/order" method="get">
		 	<input type="hidden" name="cmd" value="save">
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
			<div class="payment">
				<h6>저희 못난이 쇼핑몰은 카드결제만 가능합니다</h6>
				<select id="bank" style="height: 30px;">
					<option value="1">농협</option>
					<option value="2">우리</option>
					<option value="3">국민</option>
					<option value="4">신한</option>
				</select> 
				<input class="cardNum" type="text" pattern="[0-9]{16}" style="margin-left: 3px;"
					placeholder="카드번호( - 제외)" /> 
				<input class="cardPass" type="password" pattern="[1-9]{4}"
					style="margin-left: -25px;" size="5" placeholder="비밀번호" />
			</div>
			<span style="float: right;">
			<input type="submit" class="btn btn-dark form-control mb-3 mt-3" value="결제하기" />
			</span>
			</form>
		</div>
	</div>
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
