package spring.practice.home.member.service.serviceImpl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import spring.practice.home.member.mapper.UserLoginMapper;
import spring.practice.home.member.service.UserLoginService;
import spring.practice.home.member.vo.MemberVO;

@Service
public class UserLoginServiceImpl implements UserLoginService {

	@Resource
	UserLoginMapper loginMapper;
	
	@Override
	public int actionLogin(HttpServletRequest req, MemberVO memberVO) {
	    HttpSession session = req.getSession();

	    MemberVO memberVOResult = loginMapper.actionLogin(memberVO);

	    if (memberVOResult == null) { // 아이디가 존재하지 않는 경우
	        return 1; 
	    } else { // 아이디는 맞고, 비밀번호 확인
	        if (memberVO.getPswd().equals(memberVOResult.getPswd())) {
	            session.setAttribute("memberVO", memberVOResult);
	            return 0;  // 로그인 성공
	        } else { // 비밀번호 불일치
	            return 2;  
	        }
	    }
	}

}
