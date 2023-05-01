package kr.board.controller;

import java.security.interfaces.RSAMultiPrimePrivateCrtKey;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.board.entity.Board;
import kr.board.entity.Criteria;
import kr.board.entity.PageMaker;
import kr.board.mapper.BoardMapper;

//JDBC -> Mybatis -> Mybatis-Spring -> Spring JPA
@Controller // 컨트롤러로 인식을 한다.
public class BoardController { // Service(X) -> Controller(POJO)
	@Autowired
	private BoardMapper mapper;

	@RequestMapping("/list") // /list ---HandlerMapping---> 요청이 list() 메소드가 실행
	public String list(Criteria cri,Model model) {
		
		List<Board> list = mapper.getLists(cri);
		model.addAttribute("list", list);
		
		// 페이징 처리에 필요한 부분
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(cri));
		model.addAttribute("pm", pm);
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
	public String get(int num, Model model, @ModelAttribute("cri") Criteria cri) {
		Board vo = mapper.get(num);
		model.addAttribute("vo", vo);
		// 조회수 누적
		mapper.count(num);
		
		return "board/get";
	}

	// 선택한 게시글을 삭제하는 메소드
	@RequestMapping("/remove")
	public String remove(int num, Criteria cri,RedirectAttributes rttr) {
		mapper.remove(num);
		rttr.addAttribute("page", cri.getPage());
		return "redirect:/list";
	}
	
	// 선택한 게시글 수정하는 메소드
	@GetMapping("/modify")
	public String modify(int num, Model model, @ModelAttribute("cri") Criteria cri) {
		// 선택한 게시글 보여주는 메소드
		Board vo =mapper.get(num);
		model.addAttribute("vo", vo);
		return "board/modify";
	}
	
	@PostMapping("/modify")
	public String modify(Board vo, RedirectAttributes rttr, Criteria cri) {
		mapper.modify(vo);
		// 수정 성공 후 다시 리스트 페이지에 이동(/list)
		// return "redirect:/list";
		// 수정 성공 후 다시 상세보기 페이지로 이동(/get)
		rttr.addAttribute("num", vo.getNum());
		rttr.addAttribute("page", cri.getPage());
		return "redirect:/get"; //?num=10이 넘어간다.
	}
	
	@GetMapping("/reply") // ?num = 10
	public String reply(int num, Model model, @ModelAttribute("cri") Criteria cri) {
		//부모글 정보
		Board vo = mapper.get(num);
		model.addAttribute("vo", vo);
		return "board/reply";
	}
	
	@PostMapping("/reply") //num,username,title,content,writer,bgroup, bseq, blevel,bdelete
	public String reply(Board vo, RedirectAttributes rttr, Criteria cri) {
		// 답글에 필요한 정보 만들기
		
		// 1. 부모글(원글)의 정보를 가져오기
		Board parent = mapper.get(vo.getNum());
		
		// 2. 부모글의 bgroup을 답글의 bgroup에 저장
		vo.setBgroup(parent.getBgroup());
		
		// 3. 부모글의 bseq에 +1을 해서 답글의 bseq에 저장
		vo.setBseq(parent.getBseq()+1);
		
		// 4. 부모글의 blevel에 +1을 해서 답글의 blevel에 저장
		vo.setBlevel(parent.getBlevel()+1);
		
		// 5. 부모의 bgroup과 같고 부모의 bseq보다 큰 답글의 bseq를 모두 1을 더하는 작업
		mapper.replySeqUpdate(parent);
		
		// 6. 답글 저장하기
		mapper.replyInsert(vo);
		
		// 7. 페이지 정보 달고가기
		rttr.addAttribute("page", cri.getPage());
		return "redirect:/list";
	}

}
