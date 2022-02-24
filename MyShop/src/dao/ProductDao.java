package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import beans.Product;

public class ProductDao {
	private DataSource dataSource;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ProductDao(DataSource datasource) {
		this.dataSource = datasource;
	}

	// 모든 상품을 리스트로 리턴
	public List<Product> findAll() {
		List<Product> prodList = new ArrayList<>();

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select * from product");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Product product = new Product();
				
				product.setProdID(rs.getInt("prodID"));
				product.setFarmID(rs.getString("farmID"));
				product.setProdName(rs.getString("prodName"));
				product.setProdPrice(rs.getInt("prodPrice"));
				product.setProdInven(rs.getInt("prodInven"));
				product.setProdImg(rs.getString("prodImg"));
				product.setProdInfo(rs.getString("prodInfo"));

				prodList.add(product);
			}
			
		} catch (SQLException e) {
			System.out.println("농산품 전체 출력 SQL에러");
			e.printStackTrace();
		} finally {
			closeAll();
		}
		
		System.out.println("농산품 전체 출력 완료");
		return prodList;
	}

	public Product find(int prodId) {
		Product product = null;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("select * from product where prodID=?");
			pstmt.setInt(1, prodId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				product = new Product();
				
				product.setProdID(rs.getInt("prodID"));
				product.setFarmID(rs.getString("farmID"));
				product.setProdName(rs.getString("prodName"));
				product.setProdPrice(rs.getInt("prodPrice"));
				product.setProdInven(rs.getInt("prodInven"));
				product.setProdImg(rs.getString("prodImg"));
				product.setProdInfo(rs.getString("prodInfo"));
			}

		} catch (Exception e) {
			System.out.println("특정 농산품 출력 SQL에러");
			e.printStackTrace();
		} finally {
			closeAll();
		}
		
		System.out.println("특정 농산품 출력 완료");
		return product;
	}

	public void closeAll() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			System.out.println("DB연결 닫는 과정에서 에러발생");
		}
	}

	public boolean save(Product product) {
		boolean rowAffected = false;
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("insert into product (farmID, prodName, prodPrice, prodInven, prodImg, prodInfo) values (?, ?, ?, ?, ?, ?)");
			
			pstmt.setString(1, product.getFarmID());
			pstmt.setString(2, product.getProdName());
			pstmt.setInt(3, product.getProdPrice());
			pstmt.setInt(4, product.getProdInven());
			pstmt.setString(5, product.getProdImg());
			pstmt.setString(6, product.getProdInfo());

			rowAffected = pstmt.executeUpdate() > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("상품 등록 sql 오류");
		} finally {
			closeAll();
		}

		System.out.println("상품 등록 완료");
		return rowAffected;
	}
	
	public boolean update(Product product) {
		boolean rowAffected = false;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("update product set farmID = ?, prodName = ?, prodPrice = ?, prodInven = ?, prodImg = ?, prodInfo = ? where prodID = ?");
			
			pstmt.setString(1, product.getFarmID());
			pstmt.setString(2, product.getProdName());
			pstmt.setInt(3, product.getProdPrice());
			pstmt.setInt(4, product.getProdInven());
			pstmt.setString(5, product.getProdImg());
			pstmt.setString(6, product.getProdInfo());
			pstmt.setInt(7, product.getProdID());
			
			rowAffected = pstmt.executeUpdate() > 0;

		} catch (SQLException e) {
			System.out.println("상품 데이터 수정 sql 오류");
			e.printStackTrace();
		} finally {
			closeAll();
		}

		System.out.println("상품 데이터 수정 완료");
		return rowAffected;
	}

	public boolean delete(int prodId) {
		boolean rowDeleted = false;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement("delete from product where prodID = ?");
			pstmt.setInt(1, prodId);

			rowDeleted = pstmt.executeUpdate() > 0; // 실제 쿼리를 실행 -> 삭제되면 true

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		System.out.println("상품 삭제 완료");
		return rowDeleted;
	}
}
