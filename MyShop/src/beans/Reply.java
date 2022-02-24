package beans;

public class Reply {
	private int replyID;
	private String farmID;
	private String replyContent;
	private int reviewID;
	private int prodID;

	public int getReplyID() {
		return replyID;
	}

	public void setReplyID(int replyID) {
		this.replyID = replyID;
	}

	public String getFarmID() {
		return farmID;
	}

	public void setFarmID(String farmID) {
		this.farmID = farmID;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getReviewID() {
		return reviewID;
	}

	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}

	public int getProdID() {
		return prodID;
	}

	public void setProdID(int prodID) {
		this.prodID = prodID;
	}

	@Override
	public String toString() {
		return "Reply [replyID=" + replyID + ", farmID=" + farmID + ", replyContent=" + replyContent + ", reviewID="
				+ reviewID + ", prodID=" + prodID + "]";
	}

}
