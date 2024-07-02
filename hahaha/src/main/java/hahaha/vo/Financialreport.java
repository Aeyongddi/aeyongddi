package hahaha.vo;

public class Financialreport {
	private int report_id;
	private String report_period;
	private int total_revenue;
	private int total_expense;
	private int net_profit;
	private int balance;
	public Financialreport() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Financialreport(int report_id, String report_period,
			int total_revenue, int total_expense, int net_profit) {
		super();
		this.report_id = report_id;
		this.report_period = report_period;
		this.total_revenue = total_revenue;
		this.total_expense = total_expense;
		this.net_profit = net_profit;
	}
	public Financialreport(int report_id, String report_period,
			int total_revenue, int total_expense, int net_profit, int balance) {
		super();
		this.report_id = report_id;
		this.report_period = report_period;
		this.total_revenue = total_revenue;
		this.total_expense = total_expense;
		this.net_profit = net_profit;
		this.balance = balance;
	}
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}
	public String getReport_period() {
		return report_period;
	}
	public void setReport_period(String report_period) {
		this.report_period = report_period;
	}
	public int getTotal_revenue() {
		return total_revenue;
	}
	public void setTotal_revenue(int total_revenue) {
		this.total_revenue = total_revenue;
	}
	public int getTotal_expense() {
		return total_expense;
	}
	public void setTotal_expense(int total_expense) {
		this.total_expense = total_expense;
	}
	public int getNet_profit() {
		return net_profit;
	}
	public void setNet_profit(int net_profit) {
		this.net_profit = net_profit;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
}
