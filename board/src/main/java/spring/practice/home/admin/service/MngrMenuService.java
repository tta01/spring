package spring.practice.home.admin.service;

import java.util.List;

import spring.practice.home.admin.vo.MngrMenuVO;

public interface MngrMenuService {

	public List<MngrMenuVO> selectMenuVOList(MngrMenuVO menuVO);

	public MngrMenuVO menuDetail(MngrMenuVO menuVO);
	
	public MngrMenuVO createMenu(MngrMenuVO menuVO);

	public MngrMenuVO updateMenu(MngrMenuVO menuVO);

	public int deleteMenu(String menuCd);


}
