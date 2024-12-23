package spring.practice.home.NoticeBoard.controller;

import java.util.List;

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
import spring.practice.home.admin.vo.ManagerVO;
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
	public String list(NoticeBoardVO noticeBoardVO,Model model) {
		return noticeBoardService.selectBoardList(noticeBoardVO, model);
	}
	
	@RequestMapping("/create")
	public String create(AtchFileVO atchVO, NoticeBoardVO boardVO, Model model,HttpSession session, HttpServletRequest request) {
		ManagerVO managerVO = (ManagerVO) session.getAttribute("managerVO");
		 
		if(managerVO != null) {
			String memId = managerVO.getMngrId();
			boardVO.setMemId(memId);
		}
		 
		return "noticeBoard/create";
	}
	 
	 // 공지사항 등록
	@RequestMapping(value="/createForm", method=RequestMethod.POST)
    public String createPost(NoticeBoardVO noticeBoardVO, Model model) {
		int result = noticeBoardService.createForm(noticeBoardVO);
		
		model.addAttribute("noticeBoardVO", noticeBoardVO);
		
		return "redirect:/user/board/list";
	 }
	
    // 게시글 상세 조회
	@RequestMapping("/detail")
	public String detail(NoticeBoardVO boardVO, Model model) {
		
		// 게시글 조회
		boardVO = noticeBoardService.detail(boardVO.getBoardId());

	    // 파일 목록 조회
	    if (boardVO.getNtbdAfId() != null) { // 파일이 있을 경우만 조회
	        List<AtchFileVO> fileVO = atchFileService.detailFile(boardVO.getNtbdAfId()); 
	        model.addAttribute("fileVO", fileVO);  
	    }
	    model.addAttribute("boardVO", boardVO);
	    
	    return "noticeBoard/detail";
	}
 
	@RequestMapping("/detailUpdate")
	public String detailUpdate(NoticeBoardVO boardVO, AtchFileVO atchVO, Model model) {
		// 게시글 조회
		boardVO = noticeBoardService.detail(boardVO.getBoardId());

	    // 파일 목록 조회
	    if (boardVO.getNtbdAfId() != null) { // 파일이 있을 경우만 조회
	        List<AtchFileVO> fileVO = atchFileService.detailFile(boardVO.getNtbdAfId()); 
	        model.addAttribute("fileVO", fileVO);  
	    }
	    model.addAttribute("boardVO", boardVO);

		return "noticeBoard/update";
	}
	
	// 게시글 수정
	@RequestMapping(value="/updatePost", method=RequestMethod.POST)
	public String updatePost(NoticeBoardVO noticeBoardVO) {
		
		int result = noticeBoardService.updatePost(noticeBoardVO);
		log.info("noticeBoardController updatePost : " + noticeBoardVO);

		return "redirect:/user/board/detail?boardId="+noticeBoardVO.getBoardId();
	}
	
	// 삭제
	@RequestMapping(value="/deletePost", method=RequestMethod.POST)
	public String deletePost(NoticeBoardVO boardVO) {
		log.info(" ## deletePost => boardVO :  " + boardVO.getBoardId());

		int result = noticeBoardService.deletePost(boardVO);
		log.info(" ## deletePost Service => boardVO :  " + result);
		
		return "redirect:/user/board/list";
	}
	
	
	@RequestMapping(value="/fileAjax", method=RequestMethod.POST)
	@ResponseBody
	public String fileAjax(MultipartFile[] uploadFile, AtchFileVO atchVO, HttpServletRequest request) {
		
		if(atchVO.getUseYn() == "Y") {
				
			int result = atchFileService.insertFile(atchVO);
			log.info("noticeBoardController atchVO : " +atchVO);
			
			for (MultipartFile multipartFile : uploadFile) {
	
				String uploadFileName = multipartFile.getOriginalFilename();
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
				System.out.println("uploadFileName : "+uploadFileName);
			}
		}
		System.out.println("uploadFile : "+uploadFile);
		
		return "redirect:/user/board/create";
	}
	
	@RequestMapping(value="/fileDelAjax", method=RequestMethod.POST)
	@ResponseBody
	public String fileDeleteAjax(MultipartFile[] uploadFile, AtchFileVO atchVO, HttpServletRequest request) {
		
		if(atchVO.getUseYn() == "N") {
			// 서버에서 '삭제' 버튼 누른  파일만 삭제 되어야 하고, 새로운 건 등록.. 되게
			int result = atchFileService.insertFile(atchVO);
			log.info("noticeBoardController atchVO : " +atchVO);
			
			for (MultipartFile multipartFile : uploadFile) {
				
				String uploadFileName = multipartFile.getOriginalFilename();
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
				System.out.println("uploadFileName : "+uploadFileName);
			}
		}
		System.out.println("uploadFile : "+uploadFile);
		
		return "redirect:/user/board/create";
	}
	
	
	
}
