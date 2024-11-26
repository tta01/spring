package spring.practice.home.admin.service;

import javax.servlet.http.HttpServletRequest;

import spring.practice.home.admin.vo.ManagerVO;

public interface MngrLoginService {

	public int actionLogin(HttpServletRequest req, ManagerVO managerVO);
	
}
