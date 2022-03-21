package beans;

public class Product {
	private int prodID;
	private String farmID;
	private String farmTel;
	private String prodName;
	private int prodPrice;
	private String prodImg;
	private String prodInfo;
	
	public Product() {
	}


	public int getProdID() {
		return prodID;
	}

	public void setProdID(int prodID) {
		this.prodID = prodID;
	}

	public String getFarmID() {
		return farmID;
	}
	
	public void setFarmID(String farmID) {
		this.farmID = farmID;
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

	public String getProdImg() {
		return prodImg;
	}

	public void setProdImg(String prodImg) {
		this.prodImg = prodImg;
	}

	public String getProdInfo() {
		return prodInfo;
	}

	public void setProdInfo(String prodInfo) {
		this.prodInfo = prodInfo;
	}
	
	public String getFarmTel() {
		return farmTel;
	}


	public void setFarmTel(String farmTel) {
		this.farmTel = farmTel;
	}


	@Override
	public String toString() {
		return "Product [prodID=" + prodID + ", farmID=" + farmID + ", farmTel=" + farmTel + ", prodName=" + prodName
				+ ", prodPrice=" + prodPrice + ", prodImg=" + prodImg + ", prodInfo=" + prodInfo + "]";
	}
	
	
}
