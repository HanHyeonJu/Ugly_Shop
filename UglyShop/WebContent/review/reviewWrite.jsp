<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.DataSource"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/v/bs4/dt-1.10.24/datatables.min.css">
<jsp:include page="../includes/headerUser.jsp" />
	
	<% 
	
			// 로그인 한 경우에 세션에 저장된 유저아이디를 가지고 옴
			int orderID = 0;
			if(session.getAttribute("orderID") != null){
				orderID = (Integer)session.getAttribute("orderID");
			}
		
	
	
			// JDBC 참조 변수 준비
			String url = "jdbc:mysql://localhost:3306/shop?useSSL=false";
			String user = "root", pw = "1234";

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			// 1) JDBC 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");

			// 2) DB연결(DB url, DB id, DB pw)
			con = DriverManager.getConnection(url, user, pw);

			// 3) SQL문 준비
			String sql = "select * from review where orderID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, orderID);
			
			// 4) 실행
			rs = pstmt.executeQuery();

			// 5) 결과를 form에 출력
			if (rs.next()) {
				out.println("<script>");	
				out.println("alert('해당 주문에 관한 리뷰가 이미 작성되었습니다')");		
				out.println("</script>");		
	%>
		<script> location.href = "<%= request.getContextPath() %>/order?cmd=list";</script>
	<%
		} else {
	%>
		
	
		<div class="container" style="width: 30rem; ">
			
			<div class="card" style="text-align: center; margin-top: 20px;">
				<div class="card-body">
					<h5 class="card-title">상품이름 [ ${param.prodName} ]</h5>
					<h6 class="card-subtitle mb-2 text-muted">농민ID [ ${param.farmID} ]</h6>
					
				</div>
			</div>
			<br><br>
				
			<div class="row" style="">
			<br><br>
			<form method="post" action="<%=request.getContextPath() %>/reviewController2?cmd=save"> <!-- DB저장 -->
				<input type="hidden" name="userID" value="${userID}" />
				<input type="hidden" name="orderID" value="${orderID}" />
				<input type="hidden" name="prodID" value ="${param.prodID}" />
				<input type="hidden" name="farmID" value ="${param.farmID}" />
				<!-- 적는 칸 -->
				<table class="table table-striped" style="text-align: center; border:1px solid #dddddd; width: 30rem;">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">리뷰 작성하기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height:350px"></textarea></td>
						</tr>
					</tbody>
				</table>
				
				<div  style="text-align:center; align-content: center; ">
					<button  onclick = "location.href = '<%=request.getContextPath()%>/order?cmd=view&id=${orderID }' " type="button" class="btn btn-primary mb-3">취소</button> <!-- 리스트로 이동  -->
					<input type="submit" class="btn btn-primary mb-3" value="등록">		
				</div>
				
			</form>
		</div>
	</div>
	<%	} %>
	
	
	<%
		//JDBC 닫기
		rs.close();
		pstmt.close();
		con.close();
	%>
	
<jsp:include page="../includes/footer.jsp" />
<script>
  $('.nav-link').removeClass('active'); // 모든 메뉴의 액티브클래스를 삭제
  $('#m-reviewFar').addClass('active'); // 네브바에서 메뉴중 m-home에 active 클래스를 주는 스크립트
</script>

</body>
</html>

