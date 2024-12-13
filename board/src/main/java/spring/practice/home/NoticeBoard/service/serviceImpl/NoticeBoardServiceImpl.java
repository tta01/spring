package spring.practice.home.NoticeBoard.service.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import spring.practice.home.NoticeBoard.mapper.NoticeBoardMapper;
import spring.practice.home.NoticeBoard.service.NoticeBoardService;
import spring.practice.home.NoticeBoard.vo.NoticeBoardVO;
import spring.practice.home.common.controller.AtchFileController;
import spring.practice.home.common.mapper.AtchFileMapper;
import spring.practice.home.common.util.AtchFileUtil;
import spring.practice.home.common.vo.AtchFileVO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Resource
	NoticeBoardMapper brdMapper;
	
	@Resource
	AtchFileUtil atchfileUtil;
	
	@Override
	public String selectBoardList(NoticeBoardVO noticeBoardVO, Model model) {
		
		// 1. 페이지 네이션 생성
		int totalCnt = brdMapper.selectBoardListCnt(noticeBoardVO);
		double tmp = totalCnt/(double)noticeBoardVO.getPageRowCnt();
		int maxPage = (int) Math.ceil(tmp);
		noticeBoardVO.setMaxPage(maxPage);
		
		tmp = noticeBoardVO.getPage()/(double)noticeBoardVO.getPagenationCnt();
		int startPage = (int) (((Math.ceil(tmp)-1)*noticeBoardVO.getPagenationCnt())+1);
		noticeBoardVO.setStartPage(startPage);
		
		int endPage = (int) ((Math.ceil(tmp))*noticeBoardVO.getPagenationCnt());
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		noticeBoardVO.setEndPage(endPage);
		
		// 2. 리스트 호출
		List<NoticeBoardVO> noticeVOList = brdMapper.selectBoardList(noticeBoardVO);
		
		// 3. 리스트 담기
		model.addAttribute("noticeVOList", noticeVOList);
		model.addAttribute("noticeBoardVO", noticeBoardVO);
		
		return "noticeBoard/list";
	}
	
	@Override
	public int createForm(NoticeBoardVO noticeBoardVO) {
		
	    int result = brdMapper.createForm(noticeBoardVO);
	    
	    if(result > 0) {
	    	result += atchfileUtil.uploadFile(noticeBoardVO.getUploadFile(),noticeBoardVO.getNtbdAfId());
	    }

	    return result;
	}

	@Override
	public List<NoticeBoardVO> detail(String boardId) {
		return brdMapper.detail(boardId);
	}

	@Override
	public int updatePost(NoticeBoardVO noticeBoardVO) {
		int result =  brdMapper.updatePost(noticeBoardVO);
		return result;
	}

	@Override
	public int deletePost(String boardId) {
		
		int result = brdMapper.deletePost(boardId);
		
		return result;
	}

}
