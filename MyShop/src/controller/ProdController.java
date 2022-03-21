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
//import dao.ReplyDao;
//import dao.ReviewDao;

@WebServlet("/managerProduct")
public class ProdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductDao prodDao;

	@Resource(name = "jdbc/shop")
	private DataSource datasource;

	@Override
	public void init() throws ServletException {
		prodDao = new ProductDao(datasource);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		prodDao.findProdNum();
//		List<Product> prod = prodDao.findAll();
//		prod.forEach(product -> System.out.println(product.toString()));	// 전체출력 테스트용
//		System.out.println(prodDao.find(1));

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("cmd");

		try {
			switch (action) {
			case "find": // 상품 하나의 상세정보 출력
				find(request, response);
				break;
			case "del": // 삭제
				delete(request, response);
				break;
			case "list": // 전체 상품을 화면에 테이블로 표시
				list(request, response);
				break;
			case "save": // 상품의 정보를 db에 저장
				save(request, response);
				break;
			case "update": // 상품의 정보를 db에 업데이트
				update(request, response);
				break;
			case "edit":  // 수정 시 해당 상품정보 가져오기
				edit(request, response);
			default:
				list(request, response);
				break;
			}
		} finally {
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 등록된 상품의 정보를 업데이트
		Product product = new Product();
		
		product.setProdID(Integer.parseInt(request.getParameter("prodID")));
		product.setFarmID(request.getParameter("farmID"));
		product.setFarmTel(request.getParameter("farmTel"));
		product.setProdName(request.getParameter("prodName"));
		product.setProdPrice(Integer.parseInt(request.getParameter("prodPrice")));
		product.setProdImg(request.getParameter("prodImg"));
		product.setProdInfo(request.getParameter("prodInfo"));
		
		boolean isUpdated = prodDao.update(product); //참이면 저장완료
		
		if(isUpdated) {
			System.out.println("수정 완료!");	
			request.setAttribute("product",product); 
			RequestDispatcher rd = request.getRequestDispatcher("product/productDetail.jsp");
			rd.forward(request, response);
			
		}
		
	}

	private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 새 상품을 db에 등록
		Product product = new Product();
		
		product.setFarmID(request.getParameter("farmID"));
		product.setFarmTel(request.getParameter("farmTel"));
		product.setProdName(request.getParameter("prodName"));
		product.setProdPrice(Integer.parseInt(request.getParameter("prodPrice")));
		product.setProdImg(request.getParameter("prodImg"));
		product.setProdInfo(request.getParameter("prodInfo"));
		
		boolean isSaved = prodDao.save(product); //db 저장시 id는 자동생성
		
		if(isSaved) {
			System.out.println("입력완료");
			
			// prodID의 최대값을 구해옴 (자동생성이라 방금 저장한 값이 최대값임) > 구한 번호로 find
//			product.setProdID(Integer.parseInt(prodDao.find(prodDao.findProdNum())));
//			product.setProdID(prodDao.findProdNum());
//			System.out.println(product.toString());
//			request.setAttribute("product", product);
//			find(request, response);
		
			list(request, response);
		}
		return;
	}
	
	
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한 상품의 상세정보를 출력 (수정용)
		int prodId = Integer.parseInt(request.getParameter("prodID"));

		Product product = prodDao.find(prodId);

		if (product != null) {
			request.setAttribute("product", product);
			RequestDispatcher rd = request.getRequestDispatcher("product/editProductForm.jsp");
			rd.forward(request, response);
		}

	}

	private void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한 상품의 상세정보를 출력
		int prodId = Integer.parseInt(request.getParameter("prodID"));

		Product product = prodDao.find(prodId);

		if (product != null) {
			request.setAttribute("product", product);
			RequestDispatcher rd = request.getRequestDispatcher("product/productDetail.jsp");
			rd.forward(request, response);
		}

	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 상품 전체출력
		List<Product> prodList = prodDao.findAll();
		request.setAttribute("prodList", prodList);
		RequestDispatcher rd = request.getRequestDispatcher("product/productList.jsp");
		rd.forward(request, response);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// 상품 삭제
		int prodID = Integer.parseInt(request.getParameter("id")); 
		
		boolean delete = prodDao.delete(prodID);
		
		if(delete) {
//			response.sendRedirect("managerProduct");	// 단순 페이지 이동
			list(request, response);
			
		}else {
			System.out.println("삭제실패");
		}
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
