package kr.book.mapper;

import java.util.List;

import kr.board.entity.Board;
import kr.board.entity.Criteria;
import kr.book.entity.Book;

public interface BookMapper {
	public List<Book> bookList();
}
