package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

//JDBC -> Mybatis -> Mybatis-Spring -> Spring JPA
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
	// 게시글의 상세정보를 확인하는 메소드
	@GetMapping("/get")
	public String get(int num, Model model) {
		Board vo = mapper.get(num);
		model.addAttribute("vo", vo);
		mapper.count(num);
		// 조회수 누적
		return "board/get";
	}

	// 선택한 게시글을 삭제하는 메소드
	@GetMapping("/remove")
	public String remove(int num) {
		mapper.remove(num);
		return "redirect:/list";
	}
	
	// 선택한 게시글 수정하는 메소드
	@GetMapping("/modify")
	public String modify(int num, Model model) {
		// 선택한 게시글 보여주는 메소드
		Board vo =mapper.get(num);
		model.addAttribute("vo", vo);
		return "board/modify";
	}
	
	@PostMapping("/modify")
	public String modify(Board vo, RedirectAttributes rttr) {
		mapper.modify(vo);
		// 수정 성공 후 다시 리스트 페이지에 이동(/list)
		// return "redirect:/list";
		// 수정 성공 후 다시 상세보기 페이지로 이동(/get)
		rttr.addAttribute("num", vo.getNum());
		return "redirect:/get"; //?num=10이 넘어간다.
	}
	
	

}
