package spring.practice.home.admin.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.practice.home.admin.service.MngrMenuService;
import spring.practice.home.admin.vo.MngrMenuVO;

@RequestMapping("/mngr")
@Controller
public class MngrMainController {
	
	@Resource
	MngrMenuService	mngrMenuService;
	
	@RequestMapping(value="/main")
	public String main(MngrMenuVO nemuVO , Model model) {
		
		List<MngrMenuVO> menuVOList = mngrMenuService.selectMenuList(nemuVO);
		model.addAttribute("menuVOList",menuVOList);
		
		// redirect로 아래 메소드로 이동
		return "mngr/main";
//		return "redirect:/mngr/menu";
	}

	@RequestMapping(value="/menu", method=RequestMethod.POST)
	public String menuMain(Model model) {
		
//		List<MngrMenuVO> menuVOList = mngrMenuService.selectMenuList();
//		model.addAttribute("menuVO",menuVOList);
//		
		return "mngr/main";
	}
}
