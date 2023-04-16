package kr.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 컨트롤러로 인식을 한다.
public class BoardController {
	
	@RequestMapping("/list") // /list ---HandlerMapping---> 요청이 list() 메소드가 실행
	public String list(HttpServletRequest request) {
		List<String> list = new ArrayList<String>();
		list.add("사과");
		list.add("바나나");
		list.add("오렌지");
		request.setAttribute("list", list);
		return "flist"; // flist.jsp --> 반환 값은 flist로 해야한다.
	}
	
}
