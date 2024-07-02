package springweb.z01_util;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DownLoadCtrl {
	// http://localhost:7080/springweb/downLoad.do?fname=a04_mybatis.txt
	@GetMapping("downLoad.do")
	public String downLoad(@RequestParam("fname") String fname, Model d	) {
		d.addAttribute("downloadFile", fname);
		return "downloadView"; 
	}
}
