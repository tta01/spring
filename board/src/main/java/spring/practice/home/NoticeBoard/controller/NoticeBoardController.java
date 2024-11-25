package spring.practice.home.NoticeBoard.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import spring.practice.home.NoticeBoard.service.NoticeBoardService;
import spring.practice.home.NoticeBoard.vo.NoticeBoardVO;

@Slf4j
@RequestMapping("/board")
@Controller
public class NoticeBoardController {
	
	@Resource
	NoticeBoardService noticeBoardService;
	
	// 공지사항 목록
	@RequestMapping("/list")
	public String list(NoticeBoardVO noticeBoardVO, Model model) {
		return noticeBoardService.selectBoardList(noticeBoardVO, model);
	}
	
	 @RequestMapping("/create")
	 public String create() {
		 return "noticeBoard/create";
	 }
	 
	 // 공지사항 등록
	 @RequestMapping(value="/createForm", method=RequestMethod.POST)
	 public String createForm(NoticeBoardVO noticeBoardVO) {
		
		int result = noticeBoardService.createForm(noticeBoardVO);
		log.info("noticeBoardController createForm : " + noticeBoardVO);
		log.info("noticeBoardController createForm : " + result);
		
		return "redirect:/board/list";
	 }
	
//	@RequestMapping(value = "/createForm", method = RequestMethod.GET)
//	public String create(@ModelAttribute("board") NoticeBoardVO board) {
//	    return "noticeBoard/create"; // create.jsp로 이동
//	}
//
//	@RequestMapping(value="/createForm", method=RequestMethod.POST)
//	public String createForm(NoticeBoardVO noticeBoardVO) {
//	    noticeBoardService.createFrom(noticeBoardVO);
//	    return "redirect:/noticeBoard/list";
//	}
	
	@RequestMapping("/detail")
	public String detail(NoticeBoardVO noticeBoardVO, Model model) {
		
		noticeBoardVO = noticeBoardService.detail(noticeBoardVO.getBoardId());
		log.info("noticeBoardController detail : " + noticeBoardVO);
		
		model.addAttribute("noticeBoardVO", noticeBoardVO);
		
		return "noticeBoard/detail";
	}
	
	@RequestMapping("/updatePost")
	public String updatePost(NoticeBoardVO noticeBoardVO) {
		
		noticeBoardVO = noticeBoardService.updatePost(noticeBoardVO);
		log.info("noticeBoardController updatePost : " + noticeBoardVO);

		return "redirect:/noticeBoard/detail?boardId="+noticeBoardVO.getBoardId();
	}
	
	@RequestMapping(value="/deletePost", method=RequestMethod.POST)
	public String deletePost(NoticeBoardVO noticeBoardVO) {
		
		int result = noticeBoardService.deletePost(noticeBoardVO);
		log.info("noticeBoardController deletePost : " + noticeBoardVO);

		return "redirect:/board/list";
	}
	
}
