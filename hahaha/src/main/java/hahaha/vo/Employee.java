package hahaha.vo;
public class Employee {
	private int user_employee_id;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String username;
	private String password;
	private String role;
	private String position;
	private String department;
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Employee(int user_employee_id, String name, String email,
			String phone, String address, String username, String password,
			String role, String position, String department) {
		super();
		this.user_employee_id = user_employee_id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.username = username;
		this.password = password;
		this.role = role;
		this.position = position;
		this.department = department;
	}
	public int getUser_employee_id() {
		return user_employee_id;
	}
	public void setUser_employee_id(int user_employee_id) {
		this.user_employee_id = user_employee_id;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
}
