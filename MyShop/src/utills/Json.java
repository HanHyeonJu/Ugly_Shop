package utills;
// 패키지 utills = 뭔가 하는데 도움을 주는 내용 -> 제이슨으로 만들어서 요청이 오면 응답을 제이슨으로 해줌
// 응답을 JSON으로 바꿔주는 라이브러리 -> gson 라이브러리
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Product;


public class Json {
	// 제이슨 라이브러리 가져오기 -> JSON 타입으로 자바 객체를 변경시켜줌 -> 구글에 gson maven 검색
	private ProductJson productJson;	// 보낼 객체
	private Gson gson;					// 제이슨 라이브러리 객체 가져오기
	private PrintWriter out;			// 출력 객체
	private HttpServletResponse response; // 응답 객체
	
	public Json(HttpServletResponse response) { // 생성자(response(응답)가 입력됨) => 응답으로 제이슨 출력
		// 모든 객체들 생성
		productJson = new ProductJson(); // 객체 생성
		gson = new Gson();				 // 객체 생성
		
		this.response = response;
		this.response.setContentType("application/json; charset=utf-8"); // 응답 타입을 제이슨으로 설정
		
		try {
			out = response.getWriter(); // 응답 out 객체 생성 (response.getWriter() => 문자열로 출력 => 제이슨으로 설정됨)
		}
		catch (IOException e) { // 예외 처리
			e.printStackTrace();
		}
	}
	// 1. 상품을 응답으로 보낼때 (수정 요청시 => 그 수정 상품의 내용을 응답으로 보내준다.)
	public void sendContact(Product product) {
		productJson.setStatus(true);	 // 상태 양호
		productJson.setProduct(product); // 연락처 객체를 입력
		
		sendResponse(gson.toJson(productJson)); // 입력된 상태와 연락처를 모두 제이슨으로 변환해서 출력
	}
	// 2. 메세지만 응답으로 보낼때 (삭제 등은 메세지로 성공 여부만 보낸다.)
	public void sendMessage(boolean status, String message) { 
		productJson.setStatus(status); 	 // 상태 입력
		productJson.setMessage(message); // 메세지 입력
		
		sendResponse(gson.toJson(productJson)); // 입력된 상태와 메세지를 제이슨으로 변환해서 출력
	}
	// 공통적으로 사용하는 출력 메소드
	private void sendResponse(String jsonData) { // jsonData = gson.toJson(productJson) => 제이슨으로 변환된 product(상품)
		out.print(jsonData); // 출력 
		out.flush(); // 혹시 남아있는 데이터가 있으면 모두 출력(출력되지않고 남아있는 내용이 없도록)
	}

}
