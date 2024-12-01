package spring.practice.home.admin.service.serviceImpl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import spring.practice.home.admin.mapper.MngrMenuMapper;
import spring.practice.home.admin.service.MngrMenuService;
import spring.practice.home.admin.vo.ManagerVO;
import spring.practice.home.admin.vo.MngrMenuVO;

@Service
public class MngrMenuServiceImpl implements MngrMenuService {

	@Resource
	MngrMenuMapper menuMapper;


	@Override
	public List<MngrMenuVO> selectMenuVOList(HttpServletRequest req, MngrMenuVO menuVO) {

		List<MngrMenuVO> menuVOList = menuMapper.selectMenuVOList(menuVO);
		
		return menuVOList;
	}
	
}
