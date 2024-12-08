package spring.practice.home.admin.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.practice.home.admin.service.MngrMenuService;
import spring.practice.home.admin.vo.ManagerVO;
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
	public Map<String, Object> createMenu(HttpServletRequest req, ManagerVO memVO, MngrMenuVO menuVO) throws Exception	{
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute(memVO.getMngrId());
	
		Map<String, Object> resultMap = new HashMap<>();
		menuVO = mngrMenuService.createMenu(menuVO);
		menuVO.setFstmRgstrId(memId);

		resultMap.put("menuVO", menuVO);
	
		return resultMap;
	};
	
//	@RequestMapping(value = "/updateMenu", method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> updateMenu(MngrMenuVO menuVO) throws Exception {
//		
//		Map<String, Object> resultMap = new HashMap<>();
//		menuVO = mngrMenuService.updateMenu(menuVO);
//		
//		resultMap.put("menuVO", menuVO);
//		
//		return resultMap;
//	};
	
	@RequestMapping(value = "/deleteMenu", method = RequestMethod.POST)
	@ResponseBody
	public int deleteMenu(String menuCd) {
		
	    int result = mngrMenuService.deleteMenu(menuCd);
	    
	    return result;
	}
	
}
