package spring.practice.home.NoticeBoard.service;


import java.util.List;

import org.springframework.ui.Model;

import spring.practice.home.NoticeBoard.vo.NoticeBoardVO;
import spring.practice.home.common.vo.AtchFileVO;

public interface NoticeBoardService {
	
	// 게시판 목록
	public String selectBoardList(NoticeBoardVO noticeBoardVO, Model model);

	// 게시글 등록
	public int createForm(NoticeBoardVO noticeBoardVO);

	// 게시글 상세보기
	public NoticeBoardVO detail(int boardId);

	// 게시글 수정
	public int updatePost(NoticeBoardVO noticeBoardVO);

	// 게시글 삭제
	public int deletePost(NoticeBoardVO boardVO);

}
