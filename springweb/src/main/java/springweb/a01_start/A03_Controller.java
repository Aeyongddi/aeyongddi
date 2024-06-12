package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// springweb.a01_start.A01_Controller
@Controller
public class A03_Controller {
	// http://localhost:7080/springweb/third.do
	@RequestMapping("third.do")
	public String start() {
		return "a03_third.jsp";
	}

}
// A02_Controller.java
// http://localhost:7080/springweb/second.do
// webapp 하위에 a02_second.jsp 호출