package spring.practice.home.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.practice.home.member.service.UserLoginService;
import spring.practice.home.member.vo.MemberVO;

@Controller
public class UserLoginController {
	
	@Resource
	UserLoginService UserLoginService;

	@RequestMapping("/login")
	public String actionLogin() {
		
		return "login/login";
	}
	
	@RequestMapping(value="/login.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> loginAjax(MemberVO memberVO, HttpServletRequest req, HttpServletResponse res) {
		
		Map<String, Object> resultMap = new HashMap<>();
		int result = UserLoginService.actionLogin(req, memberVO);
		resultMap.put("result", result);
		
		return resultMap;
	}
	

}
