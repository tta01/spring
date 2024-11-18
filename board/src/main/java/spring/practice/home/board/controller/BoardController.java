package spring.practice.home.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.practice.home.board.service.BoardService;
import spring.practice.home.board.vo.BoardVO;

@Controller
public class BoardController {
	
private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService brdService;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<BoardVO> brdList =  brdService.viewAll();
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("brdList", brdList );
		System.out.println("brdList : " + brdList);
		
		return "home";
	}
	
	
}
