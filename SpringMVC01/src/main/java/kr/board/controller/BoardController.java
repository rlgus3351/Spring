package kr.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.Board;
import kr.board.mapper.BoardDAO;

@Controller // 컨트롤러로 인식을 한다.
public class BoardController { // Service(X) -> Controller(POJO)

	@RequestMapping("/list") // /list ---HandlerMapping---> 요청이 list() 메소드가 실행
	public String list(HttpServletRequest request) {
		BoardDAO dao = new BoardDAO();
		List<Board> list = dao.getLists();
		request.setAttribute("list", list);
		return "board/list"; // flist.jsp --> 반환 값은 flist로 해야한다.
		// WEB-INF/views/list.jsp
	}

}
