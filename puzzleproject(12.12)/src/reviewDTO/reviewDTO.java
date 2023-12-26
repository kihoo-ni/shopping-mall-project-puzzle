package reviewDTO;

import java.util.Date;

public class reviewDTO {
	private int reviewNumber; //리뷰 번호
	private String id; //유저 아이디
	private String nickName; //닉네임
	private String productId; //상품아이디
	private String reviewContent; //내용
	private String reviewImage; //이미지
	private String reviewcreated; //리뷰작성일
	public int getReviewNumber() {
		return reviewNumber;
	}
	public void setReviewNumber(int reviewNumber) {
		this.reviewNumber = reviewNumber;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewImage() {
		return reviewImage;
	}
	public void setReviewImage(String reviewImage) {
		this.reviewImage = reviewImage;
	}
	public String getReviewcreated() {
		return reviewcreated;
	}
	public void setReviewcreated(String reviewcreated) {
		this.reviewcreated = reviewcreated;
	}
	
	
}
