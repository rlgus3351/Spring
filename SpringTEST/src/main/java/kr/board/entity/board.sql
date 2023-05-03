drop table board;

create table board(
	num int not null auto_increment,
	username varchar(100) not null,
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

create table member(
	idx int not null auto_increment primary key,
	username varchar(255) not null unique,
	password varchar(255) not null,
	name varchar(255) not null,
	email varchar(255) not null unique
);

insert into member(username,password,name,email)
values ('smhrd01', '12345','관리자','admin@naver.com');

insert into member(username,password,name,email)
values ('smhrd02', '12345','권기현','admin2@naver.com');

insert into member(username,password,name,email)
values ('smhrd03', '12345','관리자2','admin3@naver.com');

commit;

select * from member;

-------------------------------------답변형 게시판---------
create table reply(
	num int not null auto_increment,
	username varchar(100) not null,
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(100) not null,
	indate datetime default now(),
	count int default 0,
	bgroup int, -- 원글(부모글)과 답글(자식글)을 하나로 묶는 필드, 0부터 증가, 그룹으로 불러오기
	bseq int, -- 답글의 순서를 적용 (bseq=1,bseq=0-> 부모글)
	blevel int, -- 답글의 들여쓰기 (blevel = 0)
	bdelete int, -- 삭제 여부를 판단하는 필드 (bdelete=0(정상글), bdelete=1(삭제글))
	primary key(num)
); 

select * from reply;

select IFNULL(max(bgroup)+1,0) as bgroup from reply;


-------------------------------------답변형 게시판---------
drop table book
create table book(
	num int not null auto_increment,
	title varchar(50) not null,
	author varchar(30) not null,
	company varchar(50) not null,
	isbn varchar(30) not null,
	count int not null,
	primary key(num)
); 
commit;

insert into book(title, author, company, isbn, count)
values ('JAVA', '권기현','비트','222222','6');
insert into book(title, author, company, isbn, count)
values ('C++', '조길동','이지스','555555','11');

insert into book(title, author, company, isbn, count)
values ('파이썬', '이길동','영진','777777','4');

insert into book(title, author, company, isbn, count)
values ('JSP', '나길동','대림','888888','5');

insert into book(title, author, company, isbn, count)
values ('스프링', '홍길동','삼성','999999','10');

insert into book(title, author, company, isbn, count)
values ('스프1링', '홍길동1','삼성1','999999',10);


SELECT * FROM BOOK;

