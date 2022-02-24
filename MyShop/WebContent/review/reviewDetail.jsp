<%@page import="dao.ReplyDao"%>
<%@page import="beans.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/includes/header.jsp" />

<%
String prodID = request.getParameter("prodID");
if(prodID != null){
%>
<div class="container-fluid">
  <div class="font-weight-bold mt-3 shadow p-3 mb-4 bg-light rounded">리뷰 페이지</div>		
	<c:forEach var="review" items="${reviews}"> 	
	<div style="background-color: coral">
  		<p>리뷰글번호: <c:out value="${review.reviewID}" /></p>
 		<p>작성자: <c:out value="${review.userID}" /></p>
 		<p>작성일자: <c:out value="${review.reviewDate}" /></p>
 		<p>상품번호: <c:out value="${review.prodID}" /></p>
 		<p>제목: <c:out value="${review.reviewTitle}" /></p>
 		<hr>
		<p><c:out value="${review.reviewContent}" /></p>
		<a href="<%=request.getContextPath()%>/reviewController?cmd=view&reviewID=<c:out value='${review.reviewID}'/>" class="btn btn-success btn-action mt-3">덧글보기</a>
 		<a href="<%=request.getContextPath()%>/reviewController?cmd=delete&reviewID=<c:out value='${review.reviewID}'/>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false" class="btn btn-success btn-action mt-3">리뷰삭제</a> 		
 	</div>
 	<br></br>	
 	</c:forEach>
 	</div>

<jsp:include page="/includes/footer.jsp" />

<script>
	$('.nav-link').removeClass('active');
	$('#m-product').addClass('active');
</script>
 		
<%} else { %>
 <div class="container-fluid">
  <div class="font-weight-bold mt-3 shadow p-3 mb-4 bg-light rounded">리뷰 상세페이지</div>
 	<div style="background-color: coral">
 		<p>리뷰글번호: <c:out value="${review.reviewID}" /></p>
		<p>작성자: <c:out value="${review.userID}" /></p>
		<p>작성일자: <c:out value="${review.reviewDate}" /></p>
		<p>상품번호: <c:out value="${review.prodID}" /></p>
		<hr>
		<p>제목: <c:out value="${review.reviewTitle}" /></p>
		<p><c:out value="${review.reviewContent}" /></p>
	</div>
	<hr />
	<div style="background-color: bisque">
		<p>답글번호: <c:out value="${reply.replyID}" /></p>
		<p>리뷰글번호: <c:out value="${reply.reviewID}" /></p>
		<p>판매자: <c:out value="${reply.farmID}" /></p>
		<hr>
		<p><c:out value="${reply.replyContent}" /></p>
		<a href="<%=request.getContextPath()%>/replyController?cmd=delete&replyID=<c:out value='${reply.replyID}'/>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false" class="btn btn-success btn-action">답글삭제</a>
	</div>
	
	<a href="<%=request.getContextPath()%>/reviewController?cmd=delete&reviewID=<c:out value='${review.reviewID}'/>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false" class="btn btn-success btn-action mt-3">전체삭제</a>
	<br></br>
	</div>

<jsp:include page="/includes/footer.jsp" />

<script>
	$('.nav-link').removeClass('active');
	$('#m-review').addClass('active');
</script>
<% } %>