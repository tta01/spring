package spring.practice.home.board.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.practice.home.board.mapper.BoardMapper;
import spring.practice.home.board.service.BoardService;
import spring.practice.home.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper brdMapper;

	@Override
	public List<BoardVO> viewAll() {
		
		return brdMapper.viewAll();
	}

	
	
}
