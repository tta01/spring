package spring.practice.home.common.service;

import java.util.List;

import spring.practice.home.common.vo.AtchFileVO;

public interface AtchFileService {
	
	public List<AtchFileVO> selectFileList(AtchFileVO fileVO);

	public int insertFile(AtchFileVO atchVO);

	public List<AtchFileVO> detailFile(String ntbdAfId);

	public int updateFile(AtchFileVO atchVO);
	
	public int deleteFile(String afId);

}
