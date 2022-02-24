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
	public List<Product> findAll(){
		List<Product> list = new ArrayList<>();
		
		try {
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement("select * from product");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product prod = new Product();
				prod.setProdID(rs.getInt("prodID"));
				prod.setFarmID(rs.getString("farmID"));
				prod.setProdName(rs.getString("prodName"));
				prod.setProdPrice(rs.getInt("prodPrice"));
				prod.setProdInven(rs.getInt("prodInven"));
				prod.setProdImg(rs.getString("prodImg"));
				prod.setProdInfo(rs.getString("prodInfo"));
				
				list.add(prod);
			}
		} catch (SQLException e) {
			System.out.println("SQL에러 - product findAll");
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return list;
	}
	
	public Product find(int id) {
		Product prod = null;
		
		try {
			conn = datasource.getConnection();
			pstmt = conn.prepareStatement("select * from product where prodID=?");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				prod = new Product();
				prod.setProdID(rs.getInt("prodID"));
				prod.setFarmID(rs.getString("farmID"));
				prod.setProdName(rs.getString("prodName"));
				prod.setProdPrice(rs.getInt("prodPrice"));
				prod.setProdInven(rs.getInt("prodInven"));
				prod.setProdImg(rs.getString("prodImg"));
				prod.setProdInfo(rs.getString("prodInfo"));
			}
			
		} catch (Exception e) {
			System.out.println("SQL에러 - product find");
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return prod;
	}
	
	public void closeAll() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			System.out.println("DB연결 닫는 과정에서 에러발생");
		}
	}
}
