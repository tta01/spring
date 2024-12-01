package spring.practice.home.admin.mapper;

import java.util.List;

import spring.practice.home.admin.vo.MngrMenuVO;

public interface MngrMenuMapper {

	public List<MngrMenuVO> selectMenuVOList(MngrMenuVO menuVO);
	
}
