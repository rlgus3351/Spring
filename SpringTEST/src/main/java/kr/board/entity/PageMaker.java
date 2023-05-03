package kr.board.entity;

import lombok.Data;

// 페이징 처리를 만드는 클래스

@Data
public class PageMaker {
	private Criteria cri;

	// 총 게시글의 수
	private int totalCount;

	// 시작 페이지 번호
	private int startPage;

	// 화면에 보여질 페이지의 수
	private int displayPageNum = 3;

	// 끝 페이지 번호 (조정 가능)
	private int endPage;

	// 이전 버튼이 존재 여부(true, false)
	private boolean prev;

	// 다음 버튼이 존재 여부(true, false)
	private boolean next;

	// 총 게시글의 수를 저장하는 메소드 생성
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		pageCalc();
	}

	public void pageCalc() {
		// 1. 화면에 보여질 마지막 페이지 번호
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

		// 2. 화면에 보여질 시작 페이지 번호 구하기
		startPage = endPage - displayPageNum + 1;

		// 3. 전체 마지막 페이지 계산
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		// 4. 실제 페이지보다 공식에 의해서 구해진 페이지가 더 클 경우
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		// 5.이전 페이지 버튼의 존재 여부
		prev = (startPage == 1) ? false : true;

		// 6. 다음 페이지 버튼의 존재 여부
		next = (endPage < tempEndPage) ? true : false;

	}

}
