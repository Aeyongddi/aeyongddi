package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.Computer;
import a01_diexp.z01_vo.Cpu;

public class DIExp14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "a01_diexp\\di14.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		Cpu cp01 = ctx.getBean("cp01",Cpu.class);
		Cpu cp02 = ctx.getBean("cp02",Cpu.class);		
		Computer com00 = ctx.getBean("com00",Computer.class);
		Computer com01 = ctx.getBean("com01",Computer.class);
		Computer com02 = ctx.getBean("com02",Computer.class);
		System.out.println("컨테이너 내부 객체:"+cp01);
		System.out.println("컨테이너 내부 객체:"+cp02);
		com00.useCpu();
		com01.useCpu();
		com02.useCpu();
		ctx.close();
	}

}
