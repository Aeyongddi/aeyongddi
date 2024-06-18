package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z04_vo.Computer;
import a01_diexp.z04_vo.Cpu;
import a01_diexp.z04_vo.HPUser;
import a01_diexp.z04_vo.HandPhone;

public class DIExp19 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "a01_diexp\\di19.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		Cpu cpu = ctx.getBean("cpu", Cpu.class);
		cpu.setCompany("삼성");
		cpu.setName("odessay");
		Computer computer = ctx.getBean("computer",Computer.class);
		System.out.println("컨테이너 내부 객체:"+computer);
		computer.setMaker("삼성꺼");
		computer.useCpu();
		
		HandPhone handphone = ctx.getBean("hp1", HandPhone.class);
		handphone.setCompany("lg");
		handphone.setNumber("010-1111-2222");
		HPUser hpuser = ctx.getBean("hpu",HPUser.class);
		System.out.println("컨테 내부:"+hpuser);
		hpuser.setName("홍길동");
		hpuser.useMyPhone();
		/*
		HandPhone, HPUser autowiring 처리하여 출력
		 */
		ctx.close();
	}

}
