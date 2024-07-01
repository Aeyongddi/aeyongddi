package springweb.a04_mvc.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {

	@RequestMapping("products.do")
	public String products(@RequestParam(value="pid", defaultValue="")String pid, Model d) {
		d.addAttribute("plist", service.getProductsByCategoryList(pid));
		return "WEB-INF\\views\\a05_mvcexp\\a12_productList.jsp";
	}
}
