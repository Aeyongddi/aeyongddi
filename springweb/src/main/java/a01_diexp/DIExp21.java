package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z05_vo.Computer;
import a01_diexp.z05_vo.Cpu;
import a01_diexp.z05_vo.HPUser;
import a01_diexp.z05_vo.HandPhone;
import a01_diexp.z06_mvc.A01_Controller;

public class DIExp21 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "a01_diexp\\di21.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		A01_Controller ob = ctx.getBean("a01_Controller", A01_Controller.class);
		System.out.println("컨테이너 안 객체:"+ob);
		ob.getEmpLIst("사원명(홍길동)", null);
		ctx.close();
	}

}
