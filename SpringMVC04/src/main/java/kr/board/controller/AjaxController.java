package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@RestController
public class AjaxController {
	
	@Autowired
	private BoardMapper mapper;
	
	
	@RequestMapping("/ajaxlist")
	public List<Board> ajaxList() {
		List<Board> list =mapper.ajaxList();
		
		// list 내용을 json 형식으로 변환
		// 변환된 json 객체를 응답을 하면 된다.
		
		return list; //jsp (forward), controller(redirect)
	}
}
