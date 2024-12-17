package spring.practice.home.NoticeBoard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import spring.practice.home.NoticeBoard.service.NoticeBoardService;
import spring.practice.home.NoticeBoard.vo.NoticeBoardVO;
import spring.practice.home.common.service.AtchFileService;
import spring.practice.home.common.vo.AtchFileVO;

@Slf4j
@RequestMapping("/user/board")
@Controller
public class NoticeBoardController {
	
	@Resource
	NoticeBoardService noticeBoardService;
	
	@Resource
	AtchFileService atchFileService;
	
	
	// 공지사항 목록
	@RequestMapping("/list")
	public String list(NoticeBoardVO noticeBoardVO, Model model) {
		return noticeBoardService.selectBoardList(noticeBoardVO, model);
	}
	
	 @RequestMapping("/create")
	 public String create(AtchFileVO atchVO, Model model, HttpServletRequest req) {
		 return "noticeBoard/create";
	 }
	 
	 // 공지사항 등록
	@RequestMapping(value="/createForm", method=RequestMethod.POST)
    public String createPost(NoticeBoardVO noticeBoardVO) {
		
		int result = noticeBoardService.createForm(noticeBoardVO);
		log.info("noticeBoardController createForm : " + noticeBoardVO);
		
		return "redirect:/user/board/list";
	 }
	
	@RequestMapping("/detail")
	public String detail(NoticeBoardVO noticeBoardVO, Model model) {
		
		List<NoticeBoardVO> boardVO = noticeBoardService.detail(noticeBoardVO.getBoardId());
		log.info("noticeBoardController detail : " + boardVO);
		
		model.addAttribute("noticeBoardVO", boardVO);
		
		return "noticeBoard/detail";
	}
	
	@RequestMapping("/detailUpdate")
	public String detailUpdate(NoticeBoardVO noticeBoardVO, Model model) {
		
		List<NoticeBoardVO> boardVO = noticeBoardService.detail(noticeBoardVO.getBoardId());
		log.info("noticeBoardController detail : " + boardVO);
		
		model.addAttribute("noticeBoardVO", boardVO);
		
		return "noticeBoard/update";
	}
	
	@RequestMapping(value="/updatePost", method=RequestMethod.POST)
	public String updatePost(NoticeBoardVO noticeBoardVO) {
		
		int result = noticeBoardService.updatePost(noticeBoardVO);
		log.info("noticeBoardController updatePost : " + noticeBoardVO);

//		return result;
		return "redirect:/user/board/detail?boardId="+noticeBoardVO.getBoardId();
	}
	
	@RequestMapping(value="/deletePost", method=RequestMethod.POST)
	public String deletePost(String boardId) {
		
		int result = noticeBoardService.deletePost(boardId);

		return "redirect:/user/board/list";
	}
	
	
	@RequestMapping(value="/fileAjax", method=RequestMethod.POST)
	@ResponseBody
	public String fileAjax(MultipartFile[] uploadFile, AtchFileVO atchVO) {
		
		int result = atchFileService.insertFile(atchVO);
		log.info("noticeBoardController atchVO : " +atchVO);
		
		for (MultipartFile multipartFile : uploadFile) {

			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
		
			System.out.println("uploadFileName : "+uploadFileName);
		}
		
		System.out.println("uploadFile : "+uploadFile);
		
		return "redirect:/user/board/create";
	}
	
	
	
	
}
