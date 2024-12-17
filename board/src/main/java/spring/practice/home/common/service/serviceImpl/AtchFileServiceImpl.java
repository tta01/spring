package spring.practice.home.common.service.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import spring.practice.home.common.mapper.AtchFileMapper;
import spring.practice.home.common.service.AtchFileService;
import spring.practice.home.common.vo.AtchFileVO;

@Service
public class AtchFileServiceImpl implements AtchFileService {
	
	@Resource
	AtchFileMapper atchFileMapper;

	@Override
	public int insertFile(AtchFileVO atchVO) {
		int result = atchFileMapper.insertFile(atchVO);
		return result;
	}

}
