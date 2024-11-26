package spring.practice.home.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMainController {
	
	
	@RequestMapping("/main")
	public String main() {
		return "/index";
	}

//	@RequestMapping("/main")
//	public String main2() {
//
//		return "mngr/main";
//	}
}
