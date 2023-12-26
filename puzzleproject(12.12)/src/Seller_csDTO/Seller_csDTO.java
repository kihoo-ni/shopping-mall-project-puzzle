package Seller_csDTO;

import java.util.Date;

public class Seller_csDTO {
	
	private String sel_id, sel_title, content, sel_created;
	
	private int guest_csnum, sel_csnum;

	
	public String getSel_title() {
		return sel_title;
	}

	public void setSel_title(String sel_title) {
		this.sel_title = sel_title;
	}

	public int getGuest_csnum() {
		return guest_csnum;
	}

	public void setGuest_csnum(int guest_csnum) {
		this.guest_csnum = guest_csnum;
	}

	public String getSel_id() {
		return sel_id;
	}

	public void setSel_id(String sel_id) {
		this.sel_id = sel_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSel_created() {
		return sel_created;
	}

	public void setSel_created(String sel_created) {
		this.sel_created = sel_created;
	}

	public int getSel_csnum() {
		return sel_csnum;
	}

	public void setSel_csnum(int sel_csnum) {
		this.sel_csnum = sel_csnum;
	}
	
	
	
	

}
