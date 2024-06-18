package a01_diexp.z04_vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Computer {
	private String maker;
	// 코드상 자동으로 객체 할당 처리(컨테이너 안에 있는 경우)
	@Autowired
	private Cpu cpu;
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
