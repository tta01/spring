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
	public MngrMenuVO createMenu(MngrMenuVO menuVO) {
		
		menuVO = menuMapper.createMenu(menuVO);

		return menuVO;
	}

	@Override
	public MngrMenuVO updateMenu(MngrMenuVO menuVO) {
		
		menuVO = menuMapper.updateMenu(menuVO);

		return menuVO;
	}

	@Override
	public int deleteMenu(String menuCd) {
		int result = menuMapper.deleteMenu(menuCd);
		return result;
	}

}
