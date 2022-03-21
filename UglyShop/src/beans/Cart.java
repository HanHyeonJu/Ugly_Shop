package beans;

import java.io.Serializable;

public class Cart {
	private int prodID;
	private int cartID;
	private String prodName; //상품명
	private int prodPrice;
	private int orderQuantity;
	private String userID;
	private String farmID;
	private String farmTel;
	
	public Cart(int prodID, String prodName, int prodPrice, int orderQuantity, String userID,
			String farmID, String farmTel) {
		super();
		this.prodID = prodID;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.orderQuantity = orderQuantity;
		this.setUserID(userID);
		this.setFarmID(farmID);
		this.farmTel = farmTel;
	}
	
	public int getProdID() {
		return prodID;
	}

	public void setProdId(int prodID) {
		this.prodID = prodID;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public int getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getFarmID() {
		return farmID;
	}

	public void setFarmID(String farmID) {
		this.farmID = farmID;
	}
	
	public int getCartID() {
		return cartID;
	}

	public void setCartID(int cartID) {
		this.cartID = cartID;
	} 

	public String getFarmTel() {
		return farmTel;
	}

	public void setFarmTel(String farmTel) {
		this.farmTel = farmTel;
	}

	@Override
	public String toString() {
		return "Cart [prodID=" + prodID + ", cartID=" + cartID + ", prodName=" + prodName + ", prodPrice=" + prodPrice
				+ ", orderQuantity=" + orderQuantity + ", userID=" + userID + ", farmID=" + farmID + ", farmTel="
				+ farmTel + "]";
	}

	
}
