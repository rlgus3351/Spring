package kr.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int idx; // 일련 번호 (자동생성)
	private String username; // 회원 아이디
	private String password; // 회원 비밀번호 : 12345(평문) -> a$#@#$%12(암호화 : api)
	private String name; // 회원 이름
	private String email; // 회원의 이메일

}
