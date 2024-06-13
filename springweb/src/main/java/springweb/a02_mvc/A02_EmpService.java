package springweb.a02_mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class A02_EmpService {
	// service단: controller에서 필요로 하는 조건/반복문 데이터 엑세스 객체를	
	//		가져오는 역할		
	
		@Autowired	// 자동으로 컨테이너에 있는 객체를 할당해주는 역할
		private A03_EmpDaoinf dao;
		
		List<Emp> getEmpList(Emp sch){
			return dao.getEmpList(sch);
		}
}
