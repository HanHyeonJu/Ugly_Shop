package utills;

import beans.Product;

//패키지 utills = 뭔가 하는데 도움을 주는 내용 -> 제이슨으로 만들어서 요청이 오면 응답을 제이슨으로 해줌
//응답을 JSON으로 바꿔주는 라이브러리 -> gson 라이브러리

// 제이슨 형태로 보낼 클래스
public class ProductJson { 
	
	private boolean status;  // 상태 (성공/실패)
	private String message;	 // 메세지 입력
	private Product product; // 상품 객체 하나 입력
	
	public boolean getStatus() {
		return status;
	}
	
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}

}
