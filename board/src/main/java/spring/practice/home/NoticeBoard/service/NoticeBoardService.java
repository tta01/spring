package spring.practice.home.NoticeBoard.service;

import java.util.List;

import org.springframework.ui.Model;

import spring.practice.home.NoticeBoard.vo.NoticeBoardVO;
import spring.practice.home.common.vo.AtchFileVO;

public interface NoticeBoardService {
	
	public String selectBoardList(NoticeBoardVO noticeBoardVO, Model model);

	public int createForm(NoticeBoardVO noticeBoardVO);

	public List<NoticeBoardVO> detail(String boardId);

	public int updatePost(NoticeBoardVO noticeBoardVO);

	public int deletePost(String boardId);

}
