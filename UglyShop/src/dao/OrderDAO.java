package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import beans.Order;

public class OrderDAO {
	private DataSource dataSource; // jdbc/shop 커넥션 풀 연결 객체
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public OrderDAO(DataSource dataSource) {
		this.dataSource = dataSource; // 객체 생성시 커넥션 풀 daraSource를 입력
	}


	public List<Order> findAll(String userID) {
		List<Order> orderList = new ArrayList<Order>(); // 빈 리스트 생성

		try {
			conn = dataSource.getConnection(); // DB연결
			pstmt = conn.prepareStatement("select * from orders where userID=? order by orderNum desc"); // sql문
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery(); // 쿼리문 실행

			while (rs.next()) { // 반복문으로 orders 리스트 저장			
				Order order = new Order();
				
				order.setOrderID(rs.getInt("orderID"));
				order.setOrderNum(rs.getInt("orderNum"));
				order.setUserID(rs.getString("userID"));
				order.setUserAdd(rs.getString("userAdd"));
				order.setUserTel(rs.getString("userTel"));
				order.setProdID(rs.getInt("prodID"));
				order.setProdName(rs.getString("prodName"));
				order.setProdPrice(rs.getInt("prodPrice"));
				order.setOrderQuantity(rs.getInt("orderQuantity"));
				order.setFarmID(rs.getString("farmID"));
				order.setFarmTel(rs.getString("farmTel"));
				order.setIs_status( rs.getString("is_status"));
				
				orderList.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("주문 내역 전체 출력 SQL에러");
		} finally { // 에러에 상관없이 무조건 실행
			closeAll(); // 여러 사람이 사용할 때를 대비하여 DB연결 객체들을 닫는 과정
		}

		System.out.println("전체 주문 내역 검색 완료");
		return orderList;
	}
	
	
	// userID로 검색하기. 리퀘에 없는 나머지 정보들을.
	public Order findByUserId(String userID) {
		Order order = null;
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select userName,userAdd,userTel from orders where userID=?");
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				order = new Order();
				order.setUserName(rs.getString("userName"));
				order.setUserAdd(rs.getString("userAdd"));
				order.setUserTel(rs.getString("userTel"));
			}
			
			}catch (SQLException e) {
				e.printStackTrace();
				System.out.println("userId select SQL 에러");
			} finally { //에러에 상관없이 무조건 실행
				//DB연결 객체들을 닫는 과정이 필요하다.
				closeAll();	
			}
			
			return order;
			
		}
	
	
	public boolean save(Order order) {
		boolean rowAffected = false;
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("insert into orders (userID, prodID, prodName, prodPrice, orderQuantity, orderNum, farmID, farmTel, trackNum, is_status) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			pstmt.setString(1, order.getUserID());
			pstmt.setInt(2, order.getProdID());
			pstmt.setString(3, order.getProdName());
			pstmt.setInt(4, order.getProdPrice());
			pstmt.setInt(5, order.getOrderQuantity());
			pstmt.setInt(6, order.getOrderNum());
			pstmt.setString(7, order.getFarmID());
			pstmt.setString(8, order.getFarmTel());
			pstmt.setString(9, order.getTrackNum());
			pstmt.setString(10, order.getIs_status());

			rowAffected = pstmt.executeUpdate() > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("order sql 오류");
		} finally {
			closeAll();
		}

		System.out.println("order테이블 등록 완료");
		return rowAffected;
	}
	
	
	public boolean userSave(Order order) {
		boolean update = false;
		
		try {
			conn = dataSource.getConnection();
				pstmt = conn.prepareStatement("set sql_safe_updates=0");
				pstmt.executeQuery();
				pstmt.close();
				
				conn = dataSource.getConnection();
				pstmt = 
				conn.prepareStatement
				("update orders o inner join user u on u.userID = o.userID set o.userName = u.userName, o.userAdd = u.userAdd, o.userTel = u.userTel where o.userID = ?");
				pstmt.setString(1, order.getUserID());
				
				update = pstmt.executeUpdate() > 0; // update가 0보다 크면 true
			
		} catch (SQLException e) {
			System.out.println("SQL 에러" + e.getMessage());
		}finally {
			closeAll();
		}
		
		return update;
		
	}
	
	public int findOrderNum() {
		int num = 1;
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select max(orderNum) from orders");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			}catch (SQLException e) {
				e.printStackTrace();
				System.out.println("select SQL 에러");
			} finally { //에러에 상관없이 무조건 실행
				//DB연결 객체들을 닫는 과정이 필요하다.
				closeAll();	
			}
	
		return num;
	}
	
	public boolean shipping(Order order) {
		boolean change = false;
		
		try {
			conn = dataSource.getConnection();
				pstmt = conn.prepareStatement("set sql_safe_updates=0");
				pstmt.executeQuery();
				pstmt.close();
				
				conn = dataSource.getConnection();
				pstmt = conn.prepareStatement("update orders set userName = ?, userAdd = ?, userTel =? where orderNum= ?");
				pstmt.setString(1, order.getUserName());
				pstmt.setString(2, order.getUserAdd());
				pstmt.setString(3, order.getUserTel());
				pstmt.setInt(4, order.getOrderNum());
				
				change = pstmt.executeUpdate() > 0; // update가 0보다 크면 true
			
		} catch (SQLException e) {
			System.out.println("SQL 에러" + e.getMessage());
		}finally {
			closeAll();
		}
		
		return change;
	}
	
	public Order findByOrderId(int orderID) {
		Order order = null;
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select * from orders where orderID= ?");
			pstmt.setInt(1, orderID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				order = new Order();
				order.setOrderID(rs.getInt("orderID"));
				order.setFarmID(rs.getString("farmID"));
				order.setOrderNum(rs.getInt("orderNum"));
				order.setProdID(rs.getInt("prodID"));
				order.setProdName(rs.getString("prodName"));
				order.setProdPrice(rs.getInt("prodPrice"));
				order.setUserID(rs.getString("userID"));
				order.setUserName(rs.getString("userName"));
				order.setUserAdd(rs.getString("userAdd"));
				order.setUserTel(rs.getString("userTel"));
				order.setOrderQuantity(rs.getInt("orderQuantity"));
				order.setIs_status(rs.getString("is_status"));
				order.setTrackNum(rs.getString("trackNum"));
				
			}
			
			}catch (SQLException e) {
				e.printStackTrace();
				System.out.println("select SQL 에러");
			} finally { //에러에 상관없이 무조건 실행
				//DB연결 객체들을 닫는 과정이 필요하다.
				closeAll();	
			}
			
			return order;
			
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
