package h.vo;

public class Customer {
	private String customer_id;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String ssn;
	private String passport_number;
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Customer(String customer_id, String name, String email, String phone,
			String address, String ssn, String passport_number) {
		super();
		this.customer_id = customer_id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.ssn = ssn;
		this.passport_number = passport_number;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getPassport_number() {
		return passport_number;
	}
	public void setPassport_number(String passport_number) {
		this.passport_number = passport_number;
	}
}
