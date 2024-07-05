create database sqlrecord;
use sqlrecord;

create table member (
	id varchar(30) primary key,		-- 아이디
    pw varchar(1000) not null,		-- 비밀번호
    name varchar(30) not null,		-- 이름
    email varchar(200) not null,	-- 이메일
    tel varchar(50) not null,		-- 연락처
    addr1 varchar(100) not null,	-- 기본 주소
    addr2 varchar(100) not null,	-- 상세 주소
    postcode varchar(20) not null,	-- 우편번호
    birth varchar(50) not null,		-- 생년월일
    point int default 0 not null,	-- 구매 포인트
    resdate timestamp default current_timestamp,	-- 가입일
    tag1 varchar(20),				-- 관심태그1
    tag2 varchar(20),				-- 관심태그2
    tag3 varchar(20)				-- 관심태그3
);

create table reply (
	id varchar(30) not null,
    rno int auto_increment primary key,
    pno int not null,
    nno int not null,
    depth int not null,
    content varchar(2000),
    resdate timestamp default current_timestamp,
    star float not null,
    img1 varchar(50),
    img2 varchar(50),
    img3 varchar(50)
);