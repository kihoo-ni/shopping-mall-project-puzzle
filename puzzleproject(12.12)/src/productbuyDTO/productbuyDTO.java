package productbuyDTO;


public class productbuyDTO {
	private String id; //유저 아이디
	private String productId; //상품코드
	private String productName; //상품명
	private int productUnitPrice; //상품가격
	private int productNumber; //구입수량
	private String name; //주문자이름
	private String address; //배송 주소
	private String phone; //주문자 핸드폰번호
	private String postmessage; //배송 메시지
	private int orderNumber; //주문번호
	private int paymentNumber; // 결제번호
	private int orderSetNumber; // 결제번호
	private int productInStock; //상품수량
	private String productImage; // 상품이미지
	private String status; // 배송상태
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPostmessage() {
		return postmessage;
	}
	public void setPostmessage(String postmessage) {
		this.postmessage = postmessage;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductUnitPrice() {
		return productUnitPrice;
	}
	public void setProductUnitPrice(int productUnitPrice) {
		this.productUnitPrice = productUnitPrice;
	}
	public int getProductNumber() {
		return productNumber;
	}
	public void setProductNumber(int productNumber) {
		this.productNumber = productNumber;
	}
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public int getPaymentNumber() {
		return paymentNumber;
	}
	public void setPaymentNumber(int paymentNumber) {
		this.paymentNumber = paymentNumber;
	}
	public int getOrderSetNumber() {
		return orderSetNumber;
	}
	public void setOrderSetNumber(int orderSetNumber) {
		this.orderSetNumber = orderSetNumber;
	}
	public int getProductInStock() {
		return productInStock;
	}
	public void setProductInStock(int productInStock) {
		this.productInStock = productInStock;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
}
