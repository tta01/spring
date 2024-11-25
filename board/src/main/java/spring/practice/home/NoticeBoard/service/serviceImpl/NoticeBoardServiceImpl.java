package spring.practice.home.NoticeBoard.service.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.practice.home.NoticeBoard.mapper.NoticeBoardMapper;
import spring.practice.home.NoticeBoard.service.NoticeBoardService;
import spring.practice.home.NoticeBoard.vo.NoticeBoardVO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Autowired
	NoticeBoardMapper brdMapper;

	@Override
	public String selectBoardList(NoticeBoardVO noticeBoardVO, Model model) {
		
		// 1. 페이지 네이션 생성
		int totalCnt = brdMapper.selectBoardListCnt(noticeBoardVO);
		double tmp = totalCnt/(double)noticeBoardVO.getPagenationCnt();
		int maxPage = (int) Math.ceil(tmp);
		noticeBoardVO.setMaxPage(maxPage);
		
		tmp = noticeBoardVO.getPage()/(double)noticeBoardVO.getPagenationCnt();
		int startPage = (int) (((Math.ceil(tmp)-1)*noticeBoardVO.getPagenationCnt())+1);
		noticeBoardVO.setStartPage(startPage);
		
		tmp = noticeBoardVO.getPage()/(double)noticeBoardVO.getPagenationCnt();
		int endPage = (int) ((Math.ceil(tmp))*noticeBoardVO.getPagenationCnt());
		noticeBoardVO.setEndPage(endPage);
		
		// 2. 리스트 호출
		List<NoticeBoardVO> noticeVOList = brdMapper.selectBoardList(noticeBoardVO);
		
		// 3. 리스트 담기
		model.addAttribute("noticeVO", noticeVOList);
		
		return "noticeBoard/list";
	}

	@Override
	public int createForm(NoticeBoardVO noticeBoardVO) {
	    int result = brdMapper.createForm(noticeBoardVO);
		return result;
	}

	@Override
	public NoticeBoardVO detail(String boardId) {
		return brdMapper.detail(boardId);
	}

	@Override
	public NoticeBoardVO updatePost(NoticeBoardVO noticeBoardVO) {
		return brdMapper.updatePost(noticeBoardVO);
	}

	@Override
	public int deletePost(NoticeBoardVO noticeBoardVO) {
		int result = brdMapper.deletePost(noticeBoardVO);
		return result;
	}

}
