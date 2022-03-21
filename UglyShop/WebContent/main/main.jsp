<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/includes/headerUser.jsp" />

<style>
  .container2 {
    /* background-color: bisque; */
    display: flex;
  }
  img {
    width: 400px;
  }
  .container3 {
    margin-left: 10px;
    padding: 20px;
  }
  .slogan {
    margin-bottom: 50px;
  }
</style>

<div class="container mt-4">
<h2>못난이 농산품</h2>
<div class="container2">
  <img src="https://images.unsplash.com/photo-1551649001-7a2482d98d05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80" style = "height: 300px;" alt="농민사진" />
  <div class="container3">
    <h3 class="slogan">기획의도</h3>
    <p>
      정상적으로 판매되는 농산물과 다를바 없지만  다른 이유로 상품가치가 떨어지는, 예를들어 크기가 작거나 모양이 신기하게 자란
	  못난이 농산물 들을 싸게 팔수있도록 농인들을 사이트에 입점시켜 고객들이 간편하게 온라인으로 구매할 수 있도록
	  시장 경제를 살리는 쇼핑몰
	  	<p class="lead mt-3">
			JSP, Servlet, JDBC, MySQL, DataTables, Modal <small
				class="text-muted">(plugin jQuery)</small>.
		</p>
    </p>
  </div>
</div>
</div>

<jsp:include page="/includes/footer.jsp" />
