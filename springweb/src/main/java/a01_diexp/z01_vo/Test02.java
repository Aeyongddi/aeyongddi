package a01_diexp.z01_vo;

public class Test02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Cpu cp01 = new Cpu("i7","인텔");
		Cpu cp02 = new Cpu();
		cp02.setName("a80");
		cp02.setCompany("AMD");
		
		Computer cm01 = new Computer("삼성");
		cm01.useCpu();
		
		cm01.setCpu(cp01);
		cm01.useCpu();
		System.out.println("바꿈");
		cm01.setCpu(cp02);
		cm01.useCpu();
	}

}
