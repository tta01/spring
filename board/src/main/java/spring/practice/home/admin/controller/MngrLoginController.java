package spring.practice.home.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.practice.home.admin.service.MngrLoginService;
import spring.practice.home.admin.vo.ManagerVO;

@RequestMapping("/mngr")
@Controller
public class MngrLoginController {
	
	@Resource
	MngrLoginService MngrLoginService;
	
	@RequestMapping("/login")
	public String login() {
		
		return "mngr/mngrLogin";
	}

	@RequestMapping(value="/login.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> actionLogin(ManagerVO managerVO, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		int result = MngrLoginService.actionLogin(req, managerVO);
		
		resultMap.put("result", result);
		
		return resultMap;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public String mngrLogout(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		session.invalidate();
		
//		return "redirect:/mngr/login";
		return "/mngr/main";
		
	}
	
	
}