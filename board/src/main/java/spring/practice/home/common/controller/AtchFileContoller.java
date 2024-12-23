package spring.practice.home.common.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import spring.practice.home.common.service.AtchFileService;
import spring.practice.home.common.vo.AtchFileVO;

@RequestMapping("/user")
@Slf4j
@Controller
public class AtchFileContoller {
	
	@Resource
	String uploadFolder;
	
	@Resource
	AtchFileService atchFileService;
	
	/** 컨트롤러 jsp 다 따로 만들고, c:import로 넣어주고, 파일id를 파라미터로 주고 받게끔  c에서 넘겨주젝ㄱ제1!!*/
	
	// 파일 다운로드
	@RequestMapping("/fileDown")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	// 파일 리스트 목록
	@RequestMapping("/fileList")
	public String fileList(AtchFileVO atchVO, Model model){
		
		List<AtchFileVO> fileVO = atchFileService.selectFileList(atchVO);
		model.addAttribute("fileVO",fileVO);
		
		return "common/atchFile/list";
	}
	
	@RequestMapping("/create")
	public String create() {
		return "common/atchFile/create";
	}
	
	// 파일 생성
	@RequestMapping(value="/createFile", method=RequestMethod.POST)
	public String insertFile(AtchFileVO atchVO, Model model, HttpServletRequest request) {
//		request.getParameter("uploadFile");
//		System.out.println("dddddddddddddddd : "+request.getParameter("uploadFile"));
		
		int result = atchFileService.insertFile(atchVO);
		model.addAttribute("fileVO", atchVO);	
		
		
		return "redirect:/common/atchFile/create";
	}
	
	// 파일 상세보기
	@RequestMapping("/detailFile")
	public String detailFile(AtchFileVO atchVO, Model model){
		
		List<AtchFileVO> fileList = atchFileService.detailFile(atchVO.getAfId());	
		model.addAttribute("fileList",fileList);
		
		return "common/atchFile/detail";
		
	}
	
	
	
}
