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
		
		if(managerVOResult == null) {
			return 1;
		} else { // 로그인 성공시
			if(managerVO.getPswd().equals(managerVOResult.getPswd())) {
				session.setAttribute("managerVO", managerVOResult);
				return 0;
			} else {
				return 2;
			}
		}
	}
	

}
