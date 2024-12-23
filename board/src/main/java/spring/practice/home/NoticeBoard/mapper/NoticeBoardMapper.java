package spring.practice.home.NoticeBoard.mapper;

import java.util.List;

import spring.practice.home.NoticeBoard.vo.NoticeBoardVO;

public interface NoticeBoardMapper {
	
	public int selectBoardListCnt(NoticeBoardVO noticeBoardVO);
	
	public List<NoticeBoardVO> selectBoardList(NoticeBoardVO noticeBoardVO);

	public int createForm(NoticeBoardVO noticeBoardVO);

	public NoticeBoardVO detail(int boardId);

	public int updatePost(NoticeBoardVO noticeBoardVO);

	// 게시글 삭제
	public int deletePost(NoticeBoardVO boardVO);

}
