package spring.practice.home.member.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.practice.home.admin.service.MngrMenuService;
import spring.practice.home.admin.vo.MngrMenuVO;

@Controller
public class UserMainController {
	
	@Resource
	MngrMenuService menuService;
	
	@RequestMapping("/main")
	public String main() {
		return "/index";
	}

}
