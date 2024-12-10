package spring.practice.home.admin.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
		
		return "mngr/common/main";
	}
	
	@RequestMapping(value="/menuAjax" )
	@ResponseBody
	public Map<String, Object> menu(MngrMenuVO menuVO) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<>();
		List<MngrMenuVO> menuVOList = mngrMenuService.selectMenuVOList(menuVO);
		menuVO = mngrMenuService.menuDetail(menuVO);
		
		resultMap.put("menuVOList", menuVOList);
		resultMap.put("menuVO", menuVO);
	    
	    return resultMap;
	}
	
	@RequestMapping(value = "/createMenu", method = RequestMethod.POST)
	@ResponseBody
	public int createMenu(MngrMenuVO menuVO) throws Exception	{

	    int result = mngrMenuService.createMenu(menuVO);
	    
		return result;
	};
	
	@RequestMapping(value = "/updateMenu", method = RequestMethod.POST)
	@ResponseBody
	public int updateMenu(MngrMenuVO menuVO) throws Exception {
		
		int result = mngrMenuService.updateMenu(menuVO);
		
		return result;
	};
	
	@RequestMapping(value = "/deleteMenu", method = RequestMethod.POST)
	@ResponseBody
	public int deleteMenu(String menuCd) {
		
	    int result = mngrMenuService.deleteMenu(menuCd);
	    
	    return result;
	}
	
}
