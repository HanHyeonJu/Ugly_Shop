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
	private DataSource datasource;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ProductDao(DataSource datasource) {
		this.datasource = datasource;
	}

	// 모든 상품을 리스트로 리턴
	public List<Product> findAll() {
		List<Product> prodList = new ArrayList<>();

		try {
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement("select * from product");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Product product = new Product();
				product.setProdID(rs.getInt("prodID"));
				product.setFarmID(rs.getString("farmID"));
				product.setProdName(rs.getString("prodName"));
				product.setProdPrice(rs.getInt("prodPrice"));
				product.setProdImg(rs.getString("prodImg"));
				product.setProdInfo(rs.getString("prodInfo"));
				product.setProdID(rs.getInt("prodID"));

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
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement("select * from product where prodID=?");
			pstmt.setInt(1, prodId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				product = new Product();
				product.setProdID(rs.getInt("prodID"));
				product.setFarmID(rs.getString("farmID"));
				product.setFarmTel(rs.getString("farmTel"));
				product.setProdName(rs.getString("prodName"));
				product.setProdPrice(rs.getInt("prodPrice"));
				product.setProdImg(rs.getString("prodImg"));
				product.setProdInfo(rs.getString("prodInfo"));
				product.setProdID(rs.getInt("prodID"));
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
	
	
    public boolean save(Product prod) {
		boolean rowAffected = false;
		
		try {
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement("insert into product(farmID, prodName, prodPrice, farmTel, prodInfo) values(?,?,?,?,?)");
			pstmt.setString(1, prod.getFarmID());
			pstmt.setString(2, prod.getProdName());
			pstmt.setInt(3, prod.getProdPrice());
			pstmt.setString(4, prod.getFarmTel());
			pstmt.setString(5, prod.getProdInfo());
			
			rowAffected = pstmt.executeUpdate() > 0;
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL에러 - save");
		} finally {
			closeAll();
		}
		return rowAffected;
	}
	
	
	public boolean update(Product prod) {
		boolean rowAffected = false;
		
		try {
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement("update product set farmID =?, farmTel =?, prodName =?, prodImg=?, prodPrice =?, prodInfo =? where prodID =? ");
			pstmt.setString(1, prod.getFarmID());
			pstmt.setString(2, prod.getFarmTel());
			pstmt.setString(3, prod.getProdName());
			pstmt.setString(4, prod.getProdImg());
			pstmt.setInt(5, prod.getProdPrice());
			pstmt.setString(6, prod.getProdInfo());
			pstmt.setInt(7, prod.getProdID());
			
			rowAffected = pstmt.executeUpdate() > 0;
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL에러 - save");
		} finally {
			closeAll();
		}
		return rowAffected;
	}
	
	
	public int findProdNum() {
		int num = 1;
		
		try {
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement("select max(prodID) from product");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			}catch (SQLException e) {
				e.printStackTrace();
				System.out.println("select SQL 에러");
			} finally { 
				closeAll();	
			}
		System.out.println(num);
		return num;
	}
	
	

	public boolean delete(int prodID) {
		boolean rowDeleted = false;
				
		try {
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(" DELETE FROM product WHERE prodID = ? ");
			pstmt.setInt(1, prodID);
			rowDeleted = pstmt.executeUpdate() > 0;
			
		} catch (SQLException e) {
			System.out.println("product 삭제 SQL 에러");
			return false;
		}finally {
			closeAll();
		}
		System.out.println("product 삭제성공!");
		
		return rowDeleted;
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

}
