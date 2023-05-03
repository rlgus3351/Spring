package kr.book.bshop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.book.entity.Book;
import kr.book.mapper.BookMapper;

@Controller
public class BookController {
	@Autowired
	private BookMapper mapper;

	@RequestMapping("/bookList")
	public String booklist(Model model) {
		List<Book> list = mapper.bookList();
		model.addAttribute("list", list);
		return "bookList";
	}
}
