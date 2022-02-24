package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import beans.User;

public class UserDao {
	private DataSource dataSource; // jdbc/demo 커넥션 풀 연결 객체
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// userDAO 객체를 이용할 때 connection pool인 datasource를 사용할 수 있도록 기본생성자 생성
	public UserDao(DataSource dataSource) {
		this.dataSource = dataSource; 
	}
	
	private void closeAll() {
		// DB 연결 객체들을 닫는 과정은 필요함(용량문제로 인해) - 모든 메소드에 DB연결할 때마다 닫아줘야함
		try {
			// 나중에 생성한 순서부터 닫음 rs => pstmt => conn(풀로 되돌아감)
			// (!= null??) 아무 값이 없는데 닫으면 에러가 나기 때문
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			System.out.println("DB연결 닫을 때 에러발생");
		}
	}
	
	public List<User> findAllUser() throws SQLException{
		List<User> userList = new ArrayList<User>();
		
		try {
		conn = dataSource.getConnection(); // DB연결
		pstmt = conn.prepareStatement("SELECT * FROM user"); // sql문
		rs = pstmt.executeQuery();
		
		while (rs.next()) { // 반복문으로 orders 리스트 저장
			User user = new User();
			
			user.setUserID(rs.getString("userID"));
			user.setUserPassword(rs.getString("userPassword"));
			user.setUserName(rs.getString("userName"));
			user.setUserAdd(rs.getString("userAdd"));
			user.setUserTel(rs.getString("userTel"));
			
			userList.add(user);
		}
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("전체 고객 리스트 출력 SQL에러");
		}
		
		System.out.println("고객 리스트 전체 출력 성공");
		return userList;
	}
	
	public boolean deleteUser(String userID) {
		boolean rowDeleted = false;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("delete from user where userID = ?");
			pstmt.setString(1, userID);

			rowDeleted = pstmt.executeUpdate() > 0; // 실제 쿼리를 실행 -> 삭제되면 true

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		System.out.println("고객 삭제 성공");
		return rowDeleted;
	}

	
}
