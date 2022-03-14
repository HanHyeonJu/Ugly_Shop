package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import beans.Farmer;
import beans.Order;
import beans.User;
import dao.OrderDao;
import dao.ProductDao;
import beans.Card;
import beans.Cart;
import beans.Product;
import utills.Json;

@WebServlet("/order")
public class OrderController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private OrderDao orderDao;

	@Resource(name = "jdbc/shop")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		orderDao = new OrderDao(dataSource);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("cmd");

		switch (action) {
		case "save": // order테이블에 주문 저장하기
			save(req, resp);
			break;
		case "list": // 주문 내역 전체 출력
			ordersList(req, resp);
			break;
		default: // 요청 주소가 기본 또는 잘못 되었을 경우 ordersList로 이동
			ordersList(req, resp);
			break;
		}

	}

	private void ordersList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Order> orders = orderDao.findAll(); // DB의 모든 주문내역 가져오기

		req.setAttribute("orders", orders);

		RequestDispatcher rd = req.getRequestDispatcher("orders/ordersList.jsp"); // !!!jsp이름 수정하기!!!
		rd.forward(req, resp); // 리퀘스트를 유지하면서 ordersList.jsp페이지로 이동

	}

	private void save(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		
//		Card card = new Card();
//		card.setCardNum(req.getParameter("cardNum"));
//		card.setCardPass(req.getParameter("cardPass"));
//
//		if (req.getParameter("cardNum") == null || req.getParameter("cardPass") == null) {
//			req.setAttribute("message", "164");
//			req.getRequestDispatcher("order/order.jsp").forward(req, resp);
//		} else {
																								
				HashMap<Integer, Cart> cartList = null;
				cartList = new HashMap<>();
		
				HttpSession session = req.getSession();
				cartList = (HashMap<Integer, Cart>) session.getAttribute("cartList");
	
				for (Cart cart : cartList.values()) {
					Order order = new Order();
					order.setUserID(cart.getUserID());
					order.setProdID(cart.getProdID());
					order.setProdName(cart.getProdName());
					order.setProdPrice(cart.getProdPrice());
					order.setOrderQuantity(cart.getOrderQuantity());
					order.setFarmID(cart.getFarmID());
	
					boolean isSaved = orderDao.save(order);
					
					boolean userSaved = orderDao.userSave(order);
	
					String userID = (String) session.getAttribute("userID");
					User user = orderDao.findByUserId(userID);
	
					if (user != null || isSaved) {
						//req.setAttribute("order", order);
						req.setAttribute("user", user);
						RequestDispatcher rd = req.getRequestDispatcher("order/orderCheck.jsp");
						rd.forward(req, resp);
				}
			}
		

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
