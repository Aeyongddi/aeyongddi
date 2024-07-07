package hahaha.vo;
	
public class Board {
	private int inquiry_id;
	private String customer_id; 
	private String Content;
	private String response;
	private String status;
	private String title;
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int inquiry_id, String customer_id, String content,
			String response, String status, String title) {
		super();
		this.inquiry_id = inquiry_id;
		this.customer_id = customer_id;
		Content = content;
		this.response = response;
		this.status = status;
		this.title = title;
	}
	public int getInquiry_id() {
		return inquiry_id;
	}
	public void setInquiry_id(int inquiry_id) {
		this.inquiry_id = inquiry_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
