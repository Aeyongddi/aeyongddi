package springweb.a04_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import springweb.a04_mvc.a02_service.A01_ExpService;

@Controller
public class A01_ExpController {
	
	@Autowired(required=false)
	private A01_ExpService service;
	
	// http://localhost:7080/springweb/mvc_exp01.do
	@GetMapping("mvc_exp01.do")
	public String mvc_exp01() {
		service.daoExp01();
		return "";
	}
	// http://localhost:7080/springweb/mvc_exp02.do
	@GetMapping("mvc_exp02.do")
	public String mvc_exp02() {
		service.daoExp02();
		return "";
	}
	// http://localhost:7080/springweb/mvc_exp03.do
		@GetMapping("mvc_exp03.do")
		public String mvc_exp01(Model d) {
			// 
			d.addAttribute("job", service.getJob());
			d.addAttribute("empnos", service.getEmpnos());
			return "WEB-INF\\views\\a05_mvcexp\\a01_view.jsp";
		}
}
