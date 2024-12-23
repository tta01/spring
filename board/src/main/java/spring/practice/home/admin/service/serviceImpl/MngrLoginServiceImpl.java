package spring.practice.home.admin.service.serviceImpl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import spring.practice.home.admin.mapper.MngrLoginMapper;
import spring.practice.home.admin.service.MngrLoginService;
import spring.practice.home.admin.vo.ManagerVO;

@Service
public class MngrLoginServiceImpl implements MngrLoginService {
	
	@Resource
	MngrLoginMapper loginMapper;

	@Override
	public int actionLogin(HttpServletRequest req, ManagerVO managerVO) {
	    HttpSession session = req.getSession();
	    
	    ManagerVO managerVOResult = loginMapper.actionLogin(managerVO);
	    
	    if (managerVOResult == null) {
	        return 1; 
	    } else {
	        if (managerVO.getPswd().equals(managerVOResult.getPswd())) {
	            session.setAttribute("managerVO", managerVOResult);
	            System.out.println("로그인 성공: " + managerVOResult);  // 세션에 저장된 managerVO 출력
	            return 0;  // 로그인 성공
	        } else {
	            return 2;  // 비밀번호 불일치
	        }
	    }
	}


}
