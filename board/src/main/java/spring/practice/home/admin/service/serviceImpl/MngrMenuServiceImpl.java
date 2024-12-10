package spring.practice.home.admin.service.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import spring.practice.home.admin.mapper.MngrMenuMapper;
import spring.practice.home.admin.service.MngrMenuService;
import spring.practice.home.admin.vo.MngrMenuVO;

@Service
public class MngrMenuServiceImpl implements MngrMenuService {

	@Resource
	MngrMenuMapper menuMapper;

	@Override
	public List<MngrMenuVO> selectMenuVOList(MngrMenuVO menuVO) {

		Map<String, Object> resultMap = new HashMap<>();
		List<MngrMenuVO> menuVOList = menuMapper.selectMenuVOList(menuVO);
		
		resultMap.put("menuVOList", menuVOList);
		
		return menuVOList;
	}
	
	@Override
	public MngrMenuVO menuDetail(MngrMenuVO menuVO) {
		
		return menuMapper.menuDetail(menuVO);
	}

	@Override
	public int createMenu(MngrMenuVO menuVO) {
		
		int result = menuMapper.createMenu(menuVO);
		
		return result;
	}

	@Override
	public int updateMenu(MngrMenuVO menuVO) {
		
		int result = menuMapper.updateMenu(menuVO);

		return result;
	}

	@Override
	public int deleteMenu(String menuCd) {
		int result = menuMapper.deleteMenu(menuCd);
		return result;
	}

	@Override
	public List<MngrMenuVO> selectMenuList(MngrMenuVO menuVO) {
		return menuMapper.selectMenuList(menuVO);
	}

}
