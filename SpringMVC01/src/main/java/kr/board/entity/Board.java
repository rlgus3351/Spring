package kr.board.entity;

import java.util.Date;

import lombok.Data;


// 게시판(Object) : 번호, 제목, 내용, 작성자, 작성 일, 조회수
@Data
public class Board {
	private int number;
	private String title;
	private String content;
	private String writer;
	private Date indate;
	private int count;
	
	// Lombok API
	
	
	
}
