package spring.practice.home.common.service.serviceImpl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import spring.practice.home.common.mapper.AtchFileMapper;
import spring.practice.home.common.service.AtchFileService;
import spring.practice.home.common.vo.AtchFileVO;

@Slf4j
@Service
public class AtchFileServiceImpl implements AtchFileService {
	
	@Resource
	String uploadFolder;
	
	@Resource
	AtchFileMapper atchFileMapper;

	@Override
	public int insertFile(AtchFileVO atchVO) {
		int result = atchFileMapper.insertFile(atchVO);
		return result;
	}

	@Override
	public List<AtchFileVO> selectFileList(AtchFileVO atchVO) {
		return atchFileMapper.selectFileList(atchVO);
	}

	@Override
	public List<AtchFileVO> detailFile(String ntbdAfId) {
		return atchFileMapper.detailFile(ntbdAfId);
	}

	@Override
	public int updateFile(AtchFileVO atchVO) {
		return atchFileMapper.insertFile(atchVO);
	}

	@Override
	public int deleteFile(String afId) {
		
	    int result = atchFileMapper.deleteFile(afId);

		return result;
	}

}
