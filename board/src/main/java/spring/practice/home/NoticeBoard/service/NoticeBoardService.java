package spring.practice.home.NoticeBoard.service;

import org.springframework.ui.Model;

import spring.practice.home.NoticeBoard.vo.NoticeBoardVO;

public interface NoticeBoardService {
	
	public String selectBoardList(NoticeBoardVO noticeBoardVO, Model model);

	public int createForm(NoticeBoardVO noticeBoardVO);

	public NoticeBoardVO detail(String boardId);

	public int updatePost(NoticeBoardVO noticeBoardVO);

	public int deletePost(String boardId);


}
