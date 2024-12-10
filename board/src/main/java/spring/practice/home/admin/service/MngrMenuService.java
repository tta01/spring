package spring.practice.home.admin.service;

import java.util.List;
import java.util.Map;

import spring.practice.home.admin.vo.MngrMenuVO;

public interface MngrMenuService {

	public List<MngrMenuVO> selectMenuVOList(MngrMenuVO menuVO);

	public MngrMenuVO menuDetail(MngrMenuVO menuVO);
	
	public int createMenu(MngrMenuVO menuVO);

	public int updateMenu(MngrMenuVO menuVO);

	public int deleteMenu(String menuCd);

	// 일반 main
	public List<MngrMenuVO> selectMenuList(MngrMenuVO menuVO);


}
