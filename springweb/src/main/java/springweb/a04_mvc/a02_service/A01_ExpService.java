package springweb.a04_mvc.a02_service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a04_mvc.a03_dao.A01_ExpDao;

@Service
public class A01_ExpService {
	@Autowired(required=false)
	private A01_ExpDao dao;	
	// dao = new A01_ExpDaoImp(); (mybatis가 만들어준 실제 객체) 처리해 주는 Autowired
	
	public void daoExp01() {
		System.out.println("1. 단일 데이터 가져오기"+dao.getCount());
		System.out.println("1. 부서정보:"+dao.getDeptCount());
		System.out.println("2. job:"+dao.schJob());
		System.out.println("3. hisal:"+dao.getHiSal());
		System.out.println("4. sal:"+dao.getSchSal());
		System.out.println("5. loc:"+dao.locName());
		System.out.println("1-1. 사원명:"+dao.getEname());
		System.out.println("1-2. 입사일:"+dao.getHiredate());
		System.out.println("1-3. 급여:"+dao.getSal());
		System.out.println("1-4. 보너스:"+dao.getEmpno());
		System.out.println("1-5. 사원명:"+dao.getEnamee());
	}
	public int getCount() {
	      return dao.getCount();
	   }
	   public int getCountDept() {
	      return dao.getDeptCount();
	   }
	   public String schJob() {
	      return dao.schJob();
	   }
	   public int getHiSal() {
	      return dao.getHiSal();
	   }
	   public int getSchSal() {
	      return dao.getSchSal();
	   }
	   public String locName() {
	      return dao.locName();
	   }
	   public List<String> getEname() {
	      return dao.getEname();
	   }
	   public List<Date> getHiredate() {
	      return dao.getHiredate();
	   }
	   public List<Integer> getSal() {
	      return dao.getSal();
	   }
	   public List<Integer> getEmpno() {
	      return dao.getEmpno();
	   }
	   public List<String> getEnamee() {
	      return dao.getEnamee();
	   }
}

