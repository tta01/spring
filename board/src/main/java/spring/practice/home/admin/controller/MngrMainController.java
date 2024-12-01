package spring.practice.home.admin.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.practice.home.admin.service.MngrMenuService;
import spring.practice.home.admin.vo.MngrMenuVO;

@RequestMapping("/mngr")
@Controller
public class MngrMainController {
	
	@Resource
	MngrMenuService	mngrMenuService;
	
	@RequestMapping(value="/main")
	public String main() {
		
		return "mngr/main";
	}
	
	@RequestMapping(value="/menuAjax" )
	@ResponseBody
	public Map<String, Object> menu(MngrMenuVO menuVO, HttpServletRequest req, HttpServletResponse res) {

		Map<String, Object> resultMap = new HashMap<>();
		List<MngrMenuVO> menuVOList = mngrMenuService.selectMenuVOList(req, menuVO);
		
		resultMap.put("menuVOList", menuVOList);
	    
	    return resultMap;
	}
	
	
	
}
