package kr.book.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Book {
	private int num; //번호
	private String title; //제목
	private String author; //작가
	private String company; //출판사
	private String isbn; //ISBN
	private int count; //보유도서수
}
