package springweb.a04_mvc.a02_service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a04_mvc.a03_dao.A01_ExpDao;
import springweb.a04_mvc.z01_vo.Dept01;
import springweb.a04_mvc.z01_vo.Dept11;
import springweb.a04_mvc.z01_vo.Ed01;
import springweb.a04_mvc.z01_vo.Ed02;
import springweb.a04_mvc.z01_vo.Emp02;
import springweb.a04_mvc.z01_vo.Emp03;
import springweb.a04_mvc.z01_vo.Emp11;
import springweb.a04_mvc.z01_vo.Employee01;
import springweb.a04_mvc.z01_vo.Sal01;
import springweb.a04_mvc.z01_vo.Sal2000;

@Service
public class A01_ExpService {
   @Autowired(required=false)
   private A01_ExpDao dao; 
   // dao = new A01_ExpDaoImp();(mybatis가 만들어준 실제 객체) 처리해 주는 Autowired
   public void daoExp02() {
	   System.out.println("매개변수1개 전송(사원번호 => 직책):"
			   +dao.getJob(7369));
	   System.out.println(dao.getEmpnos22(getCount()));
		/* System.out.println(dao.getEnames22(getHiSal(), getCount())); */
   }
   
   public void daoExp01() {
      System.out.println("1. 단일 데이터 가져오기:"+
               dao.getCount());
      //  앞으로 추가할 메서드 여기서 호출 처리..
      System.out.println("2. 직책 이름 가져오기:"+dao.getJob());
		/* System.out.println("3. 최고 급여:"+dao.getHiSal()); */
      System.out.println("4. 급여:"+dao.getSal());
      System.out.println("5. 부서위치:"+dao.getLoc());
      System.out.println("# 단일 열, 다중행 처리 ");
      for(int empno:dao.getEmpnos()) {
         System.out.println(empno);
      }
      System.out.println("# 사원명 들 ##");
      for(String ename:dao.getEnames()) {
         System.out.println(ename);
      }
      System.out.println("# 단일 객체 호출 #");
      Emp02 e = dao.getEmp02();
      System.out.println("사원명: "+e.getEname());
      System.out.println("급여:"+e.getSal());
      
      System.out.println("단일 객체 호출2");
      Emp03 ee = dao.getEmp03();
      System.out.println("이름:"+ee.getEname());
      System.out.println("직책:"+ee.getJob());
      System.out.println("급여:"+ee.getSal());
      
      System.out.println("단일 객체 호출3");
      Dept01 d = dao.getDept01();
      System.out.println("부서이름:"+d.getDname());
      System.out.println("위치:"+d.getLoc());
      
      Ed01 ed = dao.getEd01();
      System.out.println("이름:"+ed.getEname());
      System.out.println("부서명:"+ed.getDname());
      
      Sal01 s = dao.getSal01();
      System.out.println("이름:"+s.getEname());
      System.out.println("급여:"+s.getSal());
      
      Ed02 ez = dao.getEd02();
      System.out.println("이름:"+ez.getEname());
      System.out.println("날짜:"+ez.getHiredate());
      
      System.out.println("다중행 다중열 리스트");
      for(Employee01 emp: dao.getEmployee01()) {
    	  System.out.print(emp.getDepartment_id()+"\t");
    	  System.out.print(emp.getEmployee_id()+"\t");
    	  System.out.print(emp.getFirst_name()+"\t");
    	  System.out.println(emp.getSalary());
      }
      for(Emp03 emp111: dao.getEmp111()) {
    	  System.out.print(emp111.getEname()+"\t");
    	  System.out.print(emp111.getJob()+"\t");
    	  System.out.println(emp111.getSal());
      }
      for(Emp11 emp11: dao.getEmp11()) {
    	  System.out.print(emp11.getEname()+"\t");
    	  System.out.print(emp11.getHiredate()+"\t");
    	  System.out.println(emp11.getDeptno());
      }
      for(Ed01 ed011: dao.getEd011()) {
    	  System.out.print(ed011.getDname()+"\t");
    	  System.out.println(ed011.getEname());
      }
      for(Sal2000 ss:dao.getSal2000()) {
    	  System.out.print(ss.getEname()+"\t");
    	  System.out.print(ss.getJob()+"\t");
    	  System.out.println(ss.getDname());
      }
      for(Dept11 dd:dao.getDept11()) {
    	  System.out.print(dd.getEname()+"\t");
    	  System.out.print(dd.getSal()+"\t");
    	  System.out.println(dd.getComm());
      }
   }
   public int getCount() {
      return dao.getCount();
   }
   public String getJob() {
      return dao.getJob();
   }
	/*
	 * public int getHiSal(){ return dao.getHiSal(); }
	 */
   public double getSal() {
      return dao.getSal();
   }
   public String getLoc() {
      return dao.getLoc();
   }
   public List<Integer> getEmpnos(){
      return dao.getEmpnos();
   }
   public List<String> getEnames(){
      return dao.getEnames();
   }
   public List<Date> getHiredate(){
      return dao.getHiredate();
   }
   public List<Double> getSals(){
      return dao.getSals();
   }
   public List<Integer> getEmpnos2(){
      return dao.getEmpnos2();
   }
   public   List<String> getEnames2(){
      return dao.getEnames2();
   }
   

      
   
   
}
