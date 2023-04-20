create table board(
	num int not null auto_increment,
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(100) not null,
	indate datetime default now(),
	count int default 0,
	primary key(num)
);


insert into board(title, content, writer)
values('게시판 연습', '게시판 연습', '관리자');

insert into board(title, content, writer)
values('게시판 연습', '게시판 연습', '권기현');

insert into board(title, content, writer)
values('게시판 연습', '게시판 연습', '홍길동');

select *
from board;

commit;