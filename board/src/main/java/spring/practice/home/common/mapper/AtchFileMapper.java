package spring.practice.home.common.mapper;

import java.util.List;

import spring.practice.home.common.vo.AtchFileVO;

public interface AtchFileMapper {
	
	public List<AtchFileVO> selectFileList(AtchFileVO atchVO);

	public int insertFile(AtchFileVO atchVO);

	public List<AtchFileVO> detailFile(String ntbdAfId);

	public int updateFile(AtchFileVO atchVO);

	public int deleteFile(String afId);


}
