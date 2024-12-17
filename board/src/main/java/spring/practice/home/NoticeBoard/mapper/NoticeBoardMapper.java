package spring.practice.home.NoticeBoard.mapper;

import java.util.List;

import spring.practice.home.NoticeBoard.vo.NoticeBoardVO;
import spring.practice.home.common.vo.AtchFileVO;

public interface NoticeBoardMapper {
	
	public int selectBoardListCnt(NoticeBoardVO noticeBoardVO);
	
	public List<NoticeBoardVO> selectBoardList(NoticeBoardVO noticeBoardVO);

	public int createForm(NoticeBoardVO noticeBoardVO);

	public List<NoticeBoardVO> detail(String boardId);

	public int updatePost(NoticeBoardVO noticeBoardVO);

	public int deletePost(String boardId);

	public int insertFile(AtchFileVO atchVO);

}
