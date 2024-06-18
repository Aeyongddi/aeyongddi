package a01_diexp.z05_vo;
// a01_diexp.z01_vo.Cpu

import org.springframework.stereotype.Component;

@Component
public class Cpu {
	private String name;
	private String company;
	public Cpu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cpu(String name, String company) {
		super();
		this.name = name;
		this.company = company;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
}
