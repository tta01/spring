package spring.practice.home.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import spring.practice.home.admin.vo.MngrMenuVO;

public interface MngrMenuService {

	public List<MngrMenuVO>  selectMenuVOList(HttpServletRequest req, MngrMenuVO menuVO);

}
