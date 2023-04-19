package kr.board.mapper;

import java.util.List;

import kr.board.entity.Board;

public interface BoardMapper {
	// 데이터 베이스 연결 작업(x) -> 설정(xml)
	
	// 게시판 전체 리스트 가져오기
	public List<Board> getLists();
}
