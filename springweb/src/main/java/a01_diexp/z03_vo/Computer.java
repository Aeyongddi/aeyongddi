package a01_diexp.z03_vo;

import org.springframework.stereotype.Component;

@Component // 아이디값 변경 처리
public class Computer {
	private String maker;
	Cpu cpu;
	public Computer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void useCpu() {
		System.out.println(maker+"의 cpu 유무?");
		if(cpu!=null) {	// handPhone 객체가 할당되어 있을 때 
			System.out.println("소유한 시퓨 정보");
			System.out.println("시퓨성능명:"+cpu.getName());
			System.out.println("시퓨회사:"+cpu.getCompany());
		}else {	// handPhone==null
			System.out.println("시퓨가 없네요..~");
		}
	}
	public Computer(String maker) {
		super();
		this.maker = maker;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public Cpu getCpu() {
		return cpu;
	}
	public void setCpu(Cpu cpu) {
		this.cpu = cpu;
	}


}
