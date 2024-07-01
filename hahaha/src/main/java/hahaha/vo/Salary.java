package hahaha.vo;

import java.util.Date;


public class Salary {
	private int salary_id;
	private int employee_id;
	private Date salary_date;
	private String salary_dateStr;
	private Date payment_date;
	private String payment_dateStr;
	private int amount;
	public Salary() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Salary(int salary_id, int employee_id, Date salary_date,
			String salary_dateStr, Date payment_date, String payment_dateStr,
			int amount) {
		super();
		this.salary_id = salary_id;
		this.employee_id = employee_id;
		this.salary_date = salary_date;
		this.salary_dateStr = salary_dateStr;
		this.payment_date = payment_date;
		this.payment_dateStr = payment_dateStr;
		this.amount = amount;
	}
	public int getSalary_id() {
		return salary_id;
	}
	public void setSalary_id(int salary_id) {
		this.salary_id = salary_id;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public Date getSalary_date() {
		return salary_date;
	}
	public void setSalary_date(Date salary_date) {
		this.salary_date = salary_date;
	}
	public String getSalary_dateStr() {
		return salary_dateStr;
	}
	public void setSalary_dateStr(String salary_dateStr) {
		this.salary_dateStr = salary_dateStr;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_dateStr() {
		return payment_dateStr;
	}
	public void setPayment_dateStr(String payment_dateStr) {
		this.payment_dateStr = payment_dateStr;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}
