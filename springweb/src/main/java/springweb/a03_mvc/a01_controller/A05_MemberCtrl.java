package springweb.a03_mvc.a01_controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import springweb.a03_mvc.a02_service.A05_MemberService;
import springweb.z01_vo.Member;

@Controller
public class A05_MemberCtrl {
	@Autowired(required=false)
	private A05_MemberService service;

	
	// http://localhost:7080/springweb/login.do
	/*
	 * @RequestMapping("Login.do") public String Login(Member mem, Model d) {
	 * mem.setAuth((String)session.getAttribute("auth"));
	 * mem.setId((String)session.getAttribute("auth"));
	 * mem.setName((String)session.getAttribute("name"));
	 * mem.setPoint((Integer)session.getAttribute("point"));
	 * mem.setPwd((String)session.getAttribute("pwd")); return
	 * "WEB-INF\\views\\a03_mvc\\a08_login.jsp"; }
	 */
	@GetMapping("login.do")
	public String loginFrm() {
		return "WEB-INF\\views\\a03_mvc\\a08_login.jsp";
	}
	
	@PostMapping("login.do")
	public String login(Member mem, HttpSession session, Model d) {
		String msg = "로그인 실패";
		Member logMem = service.login(mem);
		if(logMem!=null) {
			msg = "로그인 성공";
			session.setAttribute("mem", logMem);
		}
		d.addAttribute("msg", msg);
		return "WEB-INF\\views\\a03_mvc\\a08_login.jsp";
	}
	// http://localhost:7080/springweb/LoginFrm.do
	/*
	@RequestMapping("LoginFrm.do")
	public String LoginFrm(Member mem, Model d) {
		if(service.login(mem)!=null) {
			Member info = service.login(mem);
			session.setAttribute("id", info.getId());
			session.setAttribute("pwd", info.getPwd());
			session.setAttribute("name", info.getName());
			session.setAttribute("auth", info.getAuth());
			session.setAttribute("point", info.getPoint());
			return "Login.do";
		}
		else {
			session.invalidate();
			return "WEB-INF\\views\\a03_mvc\\a08_login.jsp";
		}
		*/
	}
	
