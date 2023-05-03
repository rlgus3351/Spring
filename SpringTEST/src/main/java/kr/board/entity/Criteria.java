package kr.board.entity;

import lombok.Data;

@Data

public class Criteria {
	
	// 현재 페이지 번호
	private int page;
	
	// 한 페이지에 보여줄 게시글 개수
	private int perPageNum;
	
	// 검색기능에 필요한 변수 선언
	private String type; // 이름(writer), 제목(title), 내용(content)
	private String keyword; // 검색어
	public Criteria() {
		this.page=1;
		this.perPageNum = 5;
	}
	
	// 현재 페이지의 게시글의 시작 번호
	private int getPageStart() { //1page 2page 3page
								// 1~10	 11~20 	21~30
		return (perPageNum*(page-1));
	}
	
	
}
