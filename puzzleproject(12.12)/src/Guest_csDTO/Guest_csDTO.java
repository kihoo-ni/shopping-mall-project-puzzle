package Guest_csDTO;

import java.util.List;

import Seller_csDTO.Seller_csDTO;

public class Guest_csDTO {
				// 고객아이디, 문의제목, 문의내용, 상품아이디, 문의일시
	private String id, title, content, productId, created;
				//민원번호
	private int csnum;
	
	private List<Seller_csDTO> replylist;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public int getCsnum() {
		return csnum;
	}

	public void setCsnum(int csnum) {
		this.csnum = csnum;
	}

	public List<Seller_csDTO> getReplylist() {
		return replylist;
	}

	public void setReplylist(List<Seller_csDTO> replylist) {
		this.replylist = replylist;
	}
	
	

}
