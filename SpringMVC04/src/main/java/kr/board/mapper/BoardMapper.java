package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;
import kr.board.entity.Criteria;
import kr.board.entity.Member;

public interface BoardMapper {
	// 데이터 베이스 연결 작업(x) -> 설정(xml)
	
	// 게시판 전체 리스트 가져오기
	public List<Board> getLists(Criteria cri);
	
	// 게시물을 등록하는 메소드
	public void register(Board vo);

	// 게시물을 상세정보를 가져오는 메소드
	public Board get(int num);
	
	// 선택한 번호의 게시물 1개를 삭제하는 메소드
	@Update("update reply set bdelete= 1 where num=#{num}") // 인라인 sql
	public void remove(int num);
	// 선택한 번호에 해당하는 제목과 내용을 수정하는 메서드 정의
	public void modify(Board vo);
	
	// 조회수 누적 메소드
	@Update("update reply set count=count+1 where num=#{num}")
	public void count(int num);
	
	// 회원 로그인 처리 메소드
	@Select("select * from member where username=#{username} and password=#{password}")
	public Member login(Member mvo);
	
	// 원글 seq 증가 메소드
	public void replySeqUpdate(Board parent);
	
	// 답글 저장 메소드
	public void replyInsert(Board vo);
	
	// 전체 게시글 수 
	//@Select("select count(*) from reply") --> 검색 기능 추가 하기 이전 게시글 수 sql문 
	public int totalCount(Criteria cri); 
	
	@Select("select * from board order by num desc")
	public List<Board> ajaxList();
}
