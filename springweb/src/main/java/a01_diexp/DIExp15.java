package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.Computer;
import a01_diexp.z01_vo.HPUser;

public class DIExp15 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "a01_diexp\\di15.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		HPUser hu = ctx.getBean("hu",HPUser.class);
		System.out.println("컨테이너 내부 객체:"+hu);
		hu.useMyPhone();
		// ex) Computer, Cpu 연관관게 설정하고 호출하여 출력
		Computer cp = ctx.getBean("cp",Computer.class);
		System.out.println("컨테이너 내부 객체:"+cp);
		cp.useCpu();
		ctx.close();
	}

}
