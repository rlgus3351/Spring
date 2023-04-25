package kr.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.Member;
import kr.board.mapper.BoardMapper;

@Controller
public class LoginController {

	@Autowired // 외부에 만들어진 객체를 주입하여 연결하는 방법(의존성 주입 : DI)
	// @Inject
	private BoardMapper mapper;

	@RequestMapping("/login") // username, password, User(X), Member(O)
	public String login(Member mvo, HttpSession session) {
		Member vo = mapper.login(mvo);
		if (vo != null) { // 회원 인증에 성공
			session.setAttribute("mvo", vo);
		}
		return "redirect:/list";

	}

	@RequestMapping("/logout") // username, password, User(X), Member(O)
	public String logout(HttpSession session) {
		session.invalidate(); // 세션을 무효화
		return "redirect:/list";
	}
}
