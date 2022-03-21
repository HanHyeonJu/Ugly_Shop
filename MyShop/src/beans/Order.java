package beans;

public class Order {
	private int orderID;
	private int orderNum;
	private String userID;
	private String userName;
	private String userAdd;
	private String userTel;
	private int prodID;
	private int prodPrice;
	private String prodName;
	private int orderQuantity;
	private String farmID;
	private String farmTel;
	private boolean farmCheck;
	private String trackNum;
	private String is_status;
	
	public Order() { }
	
	public Order(int orderID, int orderNum, String userID, String userName, String userAdd, String userTel, int prodID,
			int prodPrice, String prodName, int orderQuantity, String farmID, String farmTel,
			boolean farmCheck, String trackNum, String is_status) {
		this.orderID = orderID;
		this.orderNum = orderNum;
		this.userID = userID;
		this.userName = userName;
		this.userAdd = userAdd;
		this.userTel = userTel;
		this.prodID = prodID;
		this.prodPrice = prodPrice;
		this.prodName = prodName;
		this.farmID = farmID;
		this.farmTel = farmTel;
		this.farmCheck = farmCheck;
		this.trackNum = trackNum;
		this.is_status = is_status;
	}

	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAdd() {
		return userAdd;
	}
	public void setUserAdd(String userAdd) {
		this.userAdd = userAdd;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public int getProdID() {
		return prodID;
	}
	public void setProdID(int prodID) {
		this.prodID = prodID;
	}
	public int getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	public String getFarmID() {
		return farmID;
	}
	public void setFarmID(String farmID) {
		this.farmID = farmID;
	}
	public String getFarmTel() {
		return farmTel;
	}
	public void setFarmTel(String farmTel) {
		this.farmTel = farmTel;
	}
	public boolean isFarmCheck() {
		return farmCheck;
	}
	public void setFarmCheck(boolean farmCheck) {
		this.farmCheck = farmCheck;
	}
	public String getTrackNum() {
		return trackNum;
	}
	public void setTrackNum(String trackNum) {
		this.trackNum = trackNum;
	}
	public String getIs_status() {
		return is_status;
	}
	public void setIs_status(String is_status) {
		this.is_status = is_status;
	}
	@Override
	public String toString() {
		return "Order [orderID=" + orderID + ", orderNum=" + orderNum + ", userID=" + userID + ", userName=" + userName
				+ ", userAdd=" + userAdd + ", userTel=" + userTel + ", prodID=" + prodID + ", prodPrice=" + prodPrice
				+ ", prodName=" + prodName + ", orderQuantity=" + orderQuantity + ", farmID=" + farmID + ", farmTel="
				+ farmTel + ", farmCheck=" + farmCheck + ", trackNum=" + trackNum + ", is_status=" + is_status + "]";
	}
	
}
