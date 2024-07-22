package com.web.tracerProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test_con {
	// http://localhost:5656/testOpen
	@RequestMapping("/testOpen")
	private String testOpen() {
		return "templates/signup";
	}
}
// 컨트롤러를 만들때 패키지명 앞에 꼭 com.web.을 붙여주세요 제발~