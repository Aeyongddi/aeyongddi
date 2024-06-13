package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.Music;
import a01_diexp.z01_vo.Person;

public class DIExp12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "a01_diexp\\di12.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		Person ob = ctx.getBean("p01",Person.class);
		System.out.println("컨테이너 내부 객체:"+ob);
		System.out.println(ob.getName());
		System.out.println(ob.getAge());
		System.out.println(ob.getLoc());
		Music ms = ctx.getBean("m01", Music.class);
		System.out.println("내부 객체:"+ms);
		System.out.println(ms.getName());
		System.out.println(ms.getSinger());
		System.out.println(ms.getYear());
		ctx.close();
		
		// ex) Music class 음악명, 가수, 발매년도, 생성자로 컨테이너
		//		객체 생성 후 호출

	}

}
