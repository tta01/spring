package spring.practice.home.admin.service;

import java.util.List;

import spring.practice.home.admin.vo.MngrMenuVO;

public interface MngrMenuService {

	public List<MngrMenuVO> selectMenuList(MngrMenuVO nemuVO);

}
