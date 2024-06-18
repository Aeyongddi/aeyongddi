package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z03_vo.Computer;
import a01_diexp.z03_vo.Cpu;

public class DIExp18 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "a01_diexp\\di18.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		Computer computer = ctx.getBean("computer",Computer.class);
		Cpu cpu = ctx.getBean("cp",Cpu.class);
		System.out.println("컨테이너 내부 객체:"+computer);
		cpu.setName("사과");
		cpu.setCompany("apple");
		System.out.println(cpu.getName());
		System.out.println(cpu.getCompany());
		System.out.println("컨테이너 내부 객체:"+cpu);
		ctx.close();
	}

}
