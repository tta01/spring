package spring.practice.home.member.service;

import javax.servlet.http.HttpServletRequest;

import spring.practice.home.member.vo.MemberVO;

public interface UserLoginService {

	public int actionLogin(HttpServletRequest req, MemberVO memberVO);
	
	

}
