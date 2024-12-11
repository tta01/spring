package spring.practice.home.admin.mapper;

import java.util.List;

import spring.practice.home.admin.vo.MngrMenuVO;

public interface MngrMenuMapper {

	public List<MngrMenuVO> selectMenuVOList(MngrMenuVO menuVO);

	public MngrMenuVO menuDetail(MngrMenuVO menuVO);

	public int createMenu(MngrMenuVO menuVO);

	public int updateMenu(MngrMenuVO menuVO);

	public int deleteMenu(String menuCd);

	// 일반 main 
	public List<MngrMenuVO> selectMenuList(MngrMenuVO menuVO);

	// 계층형 쿼리
	public List<MngrMenuVO> selectMenu(MngrMenuVO menuVO);
	
	
}
