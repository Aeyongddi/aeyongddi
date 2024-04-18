package frontweb22.a01_test;

import java.util.Scanner;

public class A01_Eval {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1.1
		int javaPoint = 90;
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.print("성적을 입력하세요(0~100):");
			int point = sc.nextInt();
			if(point<0 && point>100) {
				System.out.println("입력한 성적:"+point);
				break;
			}else {
				System.out.println("성적은 0~100 입력가능합니다.(입력불가)\n다시 입력");
			}
		}
		// 저장 대상 데이터는 성명, 아이디, 자바점수, 데이터베이스 점수, 파이썬점수이다.
		//1.2
		/*
		char : 
		int  : 자바점수, 데이터베이스점수, 파이썬점수
		float : 
		boolean : 
		String : 성명, 아이디
		1.3 현행 시스템을 분석하여, 개발하고자 하는 응용소프트웨어가 이후 적용될 목표시스템을 명확하고 구체적으로 기술할 수 있다.

		String name="홍길동“;
		String id="hm001";
		int a=90;
		int b=80;
		int c=100;

		2.1 최고점 산출

		 * */
		int[] point = {90,100,90,85,80,70,75};
		int max = 0;
		for(int idx=0;idx<point.length;idx++) {
			if(max>point[idx]) {
				max = point[idx];
			}
		}
		System.out.println("최고 점수:"+max);
		/*
		2.2 현재점수보다 높은 점수 갯수
		*/
		int[] point2 = {90,100,90,85,80,70,75};
		int cnt = 0;
		int nowPoint = 80;
		for(int idx=0;idx<point2.length;idx++) {
			if(nowPoint>point[idx]) {
				cnt++;
			}
		}		
		System.out.println(nowPoint+"보다 높은 데이터 건수:"+cnt);
		/*
	2.3 업무 분석가가 수집하고 분석한 요구사항이 개발하고자 하는 응용소프트웨어에 미칠 영향에 대해서 검토하고 확인할 수 있다.
	 	int nowPoint=89;
		nowPoint 값에 따라 수우미양가를 판별하는 코드를 작성하시오.
		 */
		int nowPoint2 = 89;
		if(nowPoint2>=90) {
			System.out.println("수");
		}else if(nowPoint2>=80) {
			System.out.println("우");
		}else if(nowPoint2>=70) {
			System.out.println("미");
		}else if(nowPoint2>=60) {
			System.out.println("양");
		}else  {
			System.out.println("가");
		}
	/*
	3.1 점수의 총합을 구하는 방법이다.  다음 브레인스토밍 토의 결과를 토대로 분석된 결과를 코드로 작성하시오
		배열에 숫자가 70 90 100 80 점이 저장되어 있다.
		총합을 저장하기 위한 변수를 선언한다.
		마지막 점수부터 차례대로 역으로 더하여 저장한다. <반복문>

	 * */	
		int[]arry = {70,90,100,80};
		int tot=0;
		for(int idx=arry.length-1;idx>=0;idx--) {
			tot += arry[idx];
		}
		System.out.println("총합:"+tot);

	/*
	3.2
	 * */
		int[] points = {90,100,90,85,80,70,75};
		int minValue = 100;
		// 배열의 길이
		System.out.println("배열의 길이:"+points.length);
		System.out.println("배열의 index 범위");
		System.out.println("시작 index:"+0);
		System.out.println("마지막 index:"+(points.length-1));
		
		int min = 100;
		for(int idx=0;idx<point.length;idx++) {
			if(min<points[idx]) {
				min = points[idx];
			}
		}
		System.out.println("최저 점수:"+max);		
		
	}	
		
	

}
