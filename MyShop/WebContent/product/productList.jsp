<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/includes/header.jsp" />

<style>
  .container {
    background-color: darkseagreen;
  }
  .container2 {
    margin-top: 40px;
  }
  .card-img-top {
    width: 150;
  }
  .head{
    display: none;
    }
  .box{
    display: flex;
    justify-content: center;
    align-items: center;
  }
  td{
    display: block;
    text-align: center;
  }
  tbody, td, tfoot, th, thead, tr {
    border-style: none !important;
  }
  tbody{
    padding: 40px 0 60px 0;
  }
  .box{
    width: 100%;
  }
  .ProdImg{
    /* width: 25%; */
    width: 300px;
    height: 200px;
  }
  .col-sm-12{
    display: flex;
  }
  .dataTables_length{
    display: none;
  }
  .dataTables_filter{
    margin-left: auto;
  }
</style>

<div class="container-fluid">
  <div class="font-weight-bold mt-3 shadow p-3 mb-4 bg-light rounded">농산품 리스트
  <a href="<%=request.getContextPath()%>/product/saveProductForm.jsp" class="btn btn-info float-right">상품 등록</a>
  </div>

<div class="container px-4 px-lg-2 mt-5" style="background-color: rgb(255, 251, 251)">
<table class="table">
  <thead class="head">
    <tr>
      <th>상품사진</th>
      <th>상품명</th>
      <th>판매자</th>
      <th>가격</th>
      <th>자세히보기</th>
    </tr>
  </thead>
  <tbody class="box">
    <c:forEach var="products" items="${prodList}">
      <tr>
        <div style="background-color: khaki;">
        <td>
          <img class="ProdImg" src="<%= request.getContextPath() %>/assets/img/${products.prodImg}" alt="상품사진">
        </td>
        <td><h5><c:out value="${products.prodName}" /></h5></td>
        <td>판매자: <c:out value="${products.farmID}" /></td>
        <td><c:out value="${products.prodPrice}" />원</td>
        <td><a class="btn btn-secondary mt-auto" href="<%= request.getContextPath() %>/managerProduct?cmd=find&prodID=${products.prodID}">자세히 보기</a></td>
      </div>
      </tr>
    </c:forEach>
  </tbody>
</table>
</div>
</div>

<jsp:include page="/includes/footer.jsp" />

<script src="https://cdn.datatables.net/v/bs4/dt-1.10.24/datatables.min.js"></script>

<script>
	$('.nav-link').removeClass('active');
	$('#m-product').addClass('active');
	var path = '<%= request.getContextPath()%>';
</script>

<script src="assets/js/prodList.js"></script>