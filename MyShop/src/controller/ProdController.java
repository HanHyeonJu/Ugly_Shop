package controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import beans.Product;
import dao.ProductDao;
import utills.Json;

@WebServlet("/managerProduct")
public class ProdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductDao productDao;

	@Resource(name = "jdbc/shop")
	private DataSource datasource;

	@Override
	public void init() throws ServletException {
		productDao = new ProductDao(datasource);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("cmd");

		try {
			switch (action) {
			case "find": // 상품 하나의 상세정보 출력
				find(request, response);
				break;
			case "delete": // 삭제
				delete(request, response);
				break;
			case "list": // 전체 상품을 화면에 테이블로 표시
				list(request, response);
				break;
			case "save": // 상품 저장
				save(request, response);
				break;
			case "edit": // 상품 수정
				edit(request, response);
				break;
			case "update": // 상품 수정
				update(request, response);
				break;
			default:
				list(request, response);
				break;
			}
		} finally {
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		int prodID = Integer.parseInt(request.getParameter("prodID")); //문자열 id를 정수 변환
		
		Product product = productDao.find(prodID); // id로 연락처 객체 찾기
		if(product != null) {
			System.out.println("찾기 완료!");
			new Json(response).sendContact(product); // 연락처를 상태와 제이슨으로 변환해서 출력
		}
		
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product product = new Product();
		
		product.setProdID(Integer.parseInt(request.getParameter("prodID")));
		product.setFarmID(request.getParameter("farmID"));
		product.setProdName(request.getParameter("prodName"));
		product.setProdPrice(Integer.parseInt(request.getParameter("prodPrice")));
		product.setProdInven(Integer.parseInt(request.getParameter("prodInven")));
		product.setProdImg(request.getParameter("prodImg"));
		product.setProdInfo(request.getParameter("prodInfo"));
		
		System.out.println(product.toString());
		
		boolean isUpdated = productDao.update(product);
		
		if (isUpdated) {
			System.out.println("상품 수정 완료!");
			new Json(response).sendMessage(true, "연락처 수정됨");
		}
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int prodID = Integer.parseInt(request.getParameter("prodID"));
		boolean isDeleted = productDao.delete(prodID);
		
		if(isDeleted) {
			System.out.println("삭제 완료!");
			new Json(response).sendMessage(true, "상품 삭제됨");
		}
	}

	private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product product = new Product();

		product.setFarmID(request.getParameter("farmID"));
		product.setProdName(request.getParameter("prodName"));
		product.setProdPrice(Integer.parseInt(request.getParameter("prodPrice")));
		product.setProdInven(Integer.parseInt(request.getParameter("prodInven")));
		product.setProdImg(request.getParameter("prodImg"));
		product.setProdInfo(request.getParameter("prodInfo"));

		boolean isSaved = productDao.save(product); // 참이면 저장완료

		if (isSaved) {
			System.out.println("상품 등록 완료!");
			
			request.setAttribute("product", product);
			RequestDispatcher rd = request.getRequestDispatcher("managerProduct?cmd=list");
			rd.forward(request, response);
		}
	}

	private void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한 상품의 상세정보를 출력
		int prodId = Integer.parseInt(request.getParameter("prodID"));

		Product product = productDao.find(prodId);

		if (product != null) {
			request.setAttribute("product", product);
			RequestDispatcher rd = request.getRequestDispatcher("product/productDetail.jsp");
			rd.forward(request, response);
		}

	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 상품 전체출력
		List<Product> prodList = productDao.findAll();
		request.setAttribute("prodList", prodList);
		RequestDispatcher rd = request.getRequestDispatcher("product/productList.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
