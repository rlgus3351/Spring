package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;

public interface BoardMapper {
	// 데이터 베이스 연결 작업(x) -> 설정(xml)
	
	// 게시판 전체 리스트 가져오기
	public List<Board> getLists();
	
	// 게시물을 등록하는 메소드
	public void register(Board vo);

	// 게시물을 상세정보를 가져오는 메소드
	public Board get(int num);
	
	// 선택한 번호의 게시물 1개를 삭제하는 메소드
	@Delete("delete from board where num =#{num}") // 인라인 sql
	public void remove(int num);
	
	// 선택한 번호에 해당하는 제목과 내용을 수정하는 메서드 정의
	public void modify(Board vo);
	
	@Update("update board set count=count+1 where num=#{num}")
	public void count(int num);
}
