package spring.practice.home.NoticeBoard.service.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import spring.practice.home.NoticeBoard.mapper.NoticeBoardMapper;
import spring.practice.home.NoticeBoard.service.NoticeBoardService;
import spring.practice.home.NoticeBoard.vo.NoticeBoardVO;
import spring.practice.home.common.mapper.AtchFileMapper;
import spring.practice.home.common.util.AtchFileUtil;
import spring.practice.home.common.vo.AtchFileVO;

@Slf4j
@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Resource
	String uploadFolder;
	
	@Resource
	NoticeBoardMapper boardMapper;
	
	@Resource
	AtchFileMapper atchMapper;
	
	@Resource
	AtchFileUtil atchUtil;
	
	@Override
	public String selectBoardList(NoticeBoardVO noticeBoardVO, Model model) {
		
		// 1. 페이지 네이션 생성
		int totalCnt = boardMapper.selectBoardListCnt(noticeBoardVO);
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
		List<NoticeBoardVO> noticeVOList = boardMapper.selectBoardList(noticeBoardVO);
		
		// 3. 리스트 담기
		model.addAttribute("noticeVOList", noticeVOList);
		model.addAttribute("noticeBoardVO", noticeBoardVO);
		
		return "noticeBoard/list";
	}
	
	@Override
	public int createForm(NoticeBoardVO noticeBoardVO) {
		
		MultipartFile[] uploadFile = noticeBoardVO.getUploadFile();
		noticeBoardVO.setNtbdAfId(atchUtil.getSaveAfId());

		int result = boardMapper.createForm(noticeBoardVO);
	    
	    if (uploadFile != null) {
	        result += atchUtil.uploadFile(uploadFile, noticeBoardVO.getNtbdAfId());
	    }
	    return result;
	}
	
	// 게시글 상세 조회
	@Override
	public NoticeBoardVO detail(int boardId) {
		System.out.println("#### impl######## : "+boardId);
		return boardMapper.detail(boardId); 
	}
 
	// 게시글 수정
	@Override
	public int updatePost(NoticeBoardVO noticeBoardVO) {
		System.out.println("updatePost noticeBoardVO : " +noticeBoardVO );
		MultipartFile[] uploadFile = noticeBoardVO.getUploadFile();
//		if(result > 0) {
			noticeBoardVO.setNtbdAfId(atchUtil.getSaveAfId());
			int result = atchUtil.uploadFileUpdate(uploadFile, noticeBoardVO.getNtbdAfId());
//		}
		
			result +=  boardMapper.updatePost(noticeBoardVO);
		return result;
	}
	
	// 게시글 삭제
	@Override
	public int deletePost(NoticeBoardVO boardVO) {
		
		int result = atchMapper.deleteFile(boardVO.getNtbdAfId());
		System.out.println("boardVO.getNtbdAfId() : "+boardVO.getNtbdAfId());
		
		result += boardMapper.deletePost(boardVO);
		
		return result;
	}
	
	

}
