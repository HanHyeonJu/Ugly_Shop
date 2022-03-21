package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import beans.Order;

public class OrderListDao {
	private DataSource dataSource; // jdbc/shop 커넥션 풀 연결 객체
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public OrderListDao(DataSource dataSource) {
		this.dataSource = dataSource; // 객체 생성시 커넥션 풀 daraSource를 입력
	}

	// 모든 연락처를 리스트로 리턴
	public List<Order> findAll() {
		List<Order> ordersList = new ArrayList<Order>(); // 빈 리스트 생성

		try {
			conn = dataSource.getConnection(); // DB연결
			pstmt = conn.prepareStatement("SELECT * FROM orders"); // sql문
			rs = pstmt.executeQuery(); // 쿼리문 실행

			while (rs.next()) { // 반복문으로 orders 리스트 저장
				Order order = new Order();
				order.setOrderID(rs.getInt("orderID"));
				order.setOrderNum(rs.getInt("orderNum"));
				order.setUserID(rs.getString("userID"));
				order.setUserName(rs.getString("userName"));
				order.setUserAdd(rs.getString("userAdd"));
				order.setUserTel(rs.getString("userTel"));
				order.setProdID(rs.getInt("prodID"));
				order.setProdName(rs.getString("prodName"));
				order.setProdPrice(rs.getInt("prodPrice"));
				order.setOrderQuantity(rs.getInt("orderQuantity"));
				order.setFarmID(rs.getString("farmID"));
				order.setFarmTel(rs.getString("farmTel"));
				order.setFarmCheck(rs.getBoolean("farmCheck"));
				order.setTrackNum(rs.getString("trackNum"));
				order.setIs_status(rs.getString("is_status"));
				
				ordersList.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("주문 내역 전체 출력 SQL에러");
		} finally { // 에러에 상관없이 무조건 실행
			closeAll(); // 여러 사람이 사용할 때를 대비하여 DB연결 객체들을 닫는 과정
		}

		System.out.println("전체 주문 내역 검색 완료");
		return ordersList;
	}

	public Order findOrderById(int orderID) {
		Order order = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select * from orders where orderID = ?");
			pstmt.setInt(1, orderID);	
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				order = new Order();
				order.setOrderID(rs.getInt("orderID"));
				order.setOrderNum(rs.getInt("orderNum"));
				order.setUserID(rs.getString("userID"));
				order.setUserName(rs.getString("userName"));
				order.setUserAdd(rs.getString("userAdd"));
				order.setUserTel(rs.getString("userTel"));
				order.setProdID(rs.getInt("prodID"));
				order.setProdName(rs.getString("prodName"));
				order.setProdPrice(rs.getInt("prodPrice"));
				order.setOrderQuantity(rs.getInt("orderQuantity"));
				order.setFarmID(rs.getString("farmID"));
				order.setFarmTel(rs.getString("farmTel"));
				order.setFarmCheck(rs.getBoolean("farmCheck"));
				order.setTrackNum(rs.getString("trackNum"));
				order.setIs_status(rs.getString("is_status"));
				
			}
		} catch (Exception e) {
			System.out.println("특정 주문 내역 출력 SQL에러");
			e.printStackTrace();
		} finally {
			closeAll();
		}

		System.out.println("1개의 주문 내역 검색 완료");
		System.out.println(order.toString());
		return order;
	}
	

	public boolean update(Order order) {
		boolean rowAffected = false;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("update orders set farmCheck = ?, trackNum = ?, is_status =? where orderid = ?");
			pstmt.setBoolean(1, order.isFarmCheck());
			pstmt.setString(2, order.getTrackNum());
			pstmt.setString(3, order.getIs_status());
			pstmt.setInt(4, order.getOrderID());

			rowAffected = pstmt.executeUpdate() > 0;

		} catch (SQLException e) {
			System.out.println("주문 내역 업데이트 SQL에러");
			e.printStackTrace();
		} finally {
			closeAll();
		}

		System.out.println("주문 내역 수정 완료");
		return rowAffected;
	}

	public boolean delete(int orderId) {
		boolean rowDeleted = false;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("delete from orders where orderid = ?");
			pstmt.setInt(1, orderId);

			rowDeleted = pstmt.executeUpdate() > 0; // 실제 쿼리를 실행 -> 삭제되면 true

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		System.out.println("주문 내역 삭제 완료");
		return rowDeleted;
	}

	private void closeAll() {
		try {
			// 나중에 연 순서부터 닫음 rs => pstmt => conn(풀로 되돌아감)
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close(); // 실제로는 Connection Pool로 되돌아감
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB연결 닫기 에러");
		}
	}
}
