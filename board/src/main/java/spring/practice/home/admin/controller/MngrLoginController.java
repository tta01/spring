package spring.practice.home.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String login(HttpSession session, Model model) {
		Map<String, String> response = new HashMap<>();

		Object managerVO = session.getAttribute("managerVO");
		// 로그인시 로그인페이지로 가는거 방지하는데, redirect가 무한으로 걸림..
		 // 이미 리다이렉트된 상태라면 다시 리다이렉트하지 않게
	    if (managerVO != null) {
	        if (session.getAttribute("isRedirect") != null) {
	            // 리다이렉트 플래그가 있으면 리다이렉트하지 않음
	        	session.removeAttribute("isRedirect");  
	            return "redirect:/mngr/main"; // 이미 로그인되어 있으면 메인 페이지로 이동하게!!
	        }
	        // 리다이렉트 플래그를 설정 => 로그인되어 있다는걸로 보면 됨
	        session.setAttribute("isRedirect", true);
	        return "redirect:/mngr/mngrLogin"; 
	    }
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
