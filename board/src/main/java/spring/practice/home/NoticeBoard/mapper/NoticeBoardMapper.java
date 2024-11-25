package spring.practice.home.NoticeBoard.mapper;

import java.util.List;
import java.util.Map;

import spring.practice.home.NoticeBoard.vo.NoticeBoardVO;

public interface NoticeBoardMapper {
	
	public int selectBoardListCnt(NoticeBoardVO noticeBoardVO);
	
	public List<NoticeBoardVO> selectBoardList(NoticeBoardVO noticeBoardVO);

	public int createForm(NoticeBoardVO noticeBoardVO);

	public NoticeBoardVO detail(String boardId);

	public NoticeBoardVO updatePost(NoticeBoardVO noticeBoardVO);

	public int deletePost(NoticeBoardVO noticeBoardVO);

	public int getTotal(Map<String, Object> map);

}
