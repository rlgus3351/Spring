package kr.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@Controller // 컨트롤러로 인식을 한다.
public class BoardController { // Service(X) -> Controller(POJO)
	@Autowired
	private BoardMapper mapper;

	@RequestMapping("/list") // /list ---HandlerMapping---> 요청이 list() 메소드가 실행
	public String list(Model model) {
		List<Board> list = mapper.getLists();

		model.addAttribute("list", list);
		return "board/list"; // flist.jsp --> 반환 값은 flist로 해야한다.
		// WEB-INF/views/list.jsp
	}

	// 글 쓰는 화면
	@GetMapping("/register")
	public String register() {
		return "board/register";
	}

	// 글 작성 처리 코드
	@PostMapping("/register")
	public String register(Board vo) { // title, content, writer
		mapper.register(vo);
		// 등록 성공 후
		// 다시 리스트 페이지로 경로를 변경해줘야 한다.
		// redirect 기법 (컨트롤로 -> 다른 컨트롤러)
		// forwarding 기법( 컨트롤로 -> jsp)
		return "redirect:/list";
	}

	@GetMapping("/get")
	public String get(int num, Model model) {
		Board vo = mapper.get(num);
		model.addAttribute("vo", vo);
		return "board/get";
	}

}
