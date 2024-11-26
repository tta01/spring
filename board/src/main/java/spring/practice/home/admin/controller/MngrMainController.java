package spring.practice.home.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mngr")
@Controller
public class MngrMainController {
	
	
//	@RequestMapping("/")
//	public String main1() {
//		// redirect로 아래 메소드로 이동
//		return "mngr/main";
//	}

	@RequestMapping("/main")
	public String main() {

		return "mngr/main";
	}
}
