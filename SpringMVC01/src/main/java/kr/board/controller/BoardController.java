package kr.board.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.Board;

@Controller // 컨트롤러로 인식을 한다.
public class BoardController { // Service(X) -> Controller(POJO)

	@RequestMapping("/list") // /list ---HandlerMapping---> 요청이 list() 메소드가 실행
	public String list(HttpServletRequest request) {
		// 게시판 3개를 생성하고 List에 저장하기
		Board vo1 = new Board(1,"게시판 연습","게시판 연습", "관리자",new Date(),0);
		Board vo2 = new Board(2,"게시판 연습","게시판 연습", "권기현",new Date(),0);
		Board vo3 = new Board(3,"게시판 연습","게시판 연습", "홍길동",new Date(),0);
		// 객체 바인딩
		List<Board> list = new ArrayList<Board>();
		list.add(vo1);
		list.add(vo2);
		list.add(vo3);
		request.setAttribute("list", list);
		return "list"; // flist.jsp --> 반환 값은 flist로 해야한다.
		// WEB-INF/views/list.jsp
	}

}
