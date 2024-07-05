
create database sqlgames;

use sqlgames;



-- 회원(member) --
drop table member;
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
    resdate timestamp default current_timestamp,	-- 가입일
    tag1 varchar(20),				-- 관심태그1
    tag2 varchar(20),				-- 관심태그2
    tag3 varchar(20),				-- 관심태그3
    point int default 0 not null	-- 구매 포인트
);

-- 게임(game) --
drop table game;
create table game (
	gno int auto_increment primary key,		-- 상품번호
    title varchar(100) not null,			-- 제목
    remark varchar(2000),					-- 설명
    company varchar(50) not null,			-- 제작사(당사)
    publisher varchar(50) not null, 		-- 배급사
    age varchar(20) not null,				-- 연령제한
    price int not null,						-- 가격
    resdate timestamp default current_timestamp,	-- 발매일
    avgstar int default 0 not null,			-- 전체별점
    tag varchar(20),						-- 태그
    vidurl varchar(300),					-- 유튜브url(상세보기 캐러셀)
    img1 varchar(300),						-- 이미지1(상세보기 캐러셀)
    img2 varchar(300),						-- 이미지2(상세보기 캐러셀)
    img3 varchar(300),						-- 이미지3(상세보기 캐러셀)
    img4 varchar(300),						-- 이미지4(상세보기 캐러셀)
    img5 varchar(300),						-- 이미지5(상세보기 캐러셀)
    gpng varchar(300)						-- 게임로고
);

-- 게임기(product) --
drop table product;
create table product (
	pno int auto_increment primary key,		-- 상품번호
    name varchar(100) not null,				-- 상품명
    remark varchar(2000),					-- 상품설명
    price int not null,						-- 가격
    vidurl varchar(300),					-- 유튜브url(상품설명 동영상)
    img1 varchar(300),						-- 이미지1(상품설명 이미지)
    img2 varchar(300),						-- 이미지2(상품설명 이미지)
    img3 varchar(300),						-- 이미지3(상품설명 이미지)
    img4 varchar(300),						-- 이미지4(상품설명 이미지)
    img5 varchar(300)						-- 이미지5(상품설명 이미지)
);

-- 별점(star) --
drop table star;
create table star (
	sno int auto_increment primary key,		-- 게임번호
    id varchar(30) not null,				-- 사용자아이디
    rate int not null						-- 점수(rate)
);

-- 유저 라이브러리(library) --
drop table library;
create table library (
	lno int primary key,					-- 게임번호
    id varchar(30) not null					-- 사용자아이디
);

-- 고객접대(qna) --
drop table qna;
create table qna (
	qno int auto_increment primary key,		-- 글번호
    qtitle varchar(100) not null,			-- 글제목
    qlevel varchar(10) not null,			-- 글종류(1:원글 2:댓글)
    qcontent varchar(2000),					-- 글내용
    qparno varchar(10) not null,			-- 투고글 그룹
    qhits int default 0 not null,			-- 방문 횟수
    qresdate timestamp default current_timestamp,	-- 작성일
    qaid varchar(30) not null,				-- 작성자
    secret varchar(10) not null				-- 비밀글 여부
);

-- 공지사항(board) --
drop table board;
create table board (
	bno int auto_increment primary key,		-- 글번호
    title varchar(100) not null,			-- 글제목
    content varchar(2000),					-- 글내용
    author varchar(30) default 'admin' not null,	-- 작성자
    vcnt int default 0 not null,			-- 방문횟수
    resdate timestamp default current_timestamp		-- 작성일
);

-- 재고(inventory) --
drop table inventory;
create table inventory (
	ino int auto_increment primary key,		-- 재고번호
    pno int not null,						-- 상품번호
    iprice int ,							-- 입고가격
    oprice int ,							-- 출고가격
    amount int default 0 not null,			-- 재고량
    remark varchar(2000),					-- 상품설명
    resdate timestamp default current_timestamp		-- 입고일
);

-- 구매페이지(sales) --
drop table sales;
create table sales (
	sno int auto_increment primary key,		-- 판매번호
    pno int , 								-- 상품번호
    gno int ,								-- 게임번호
    amount int default 1 not null,			-- 주문량
    tot int not null,						-- 총 금액
    id varchar(30) not null,				-- 회원아이디
    paymethod varchar(50) not null,			-- 결제방법
    paynum int not null,		-- 결제번호
    addr varchar(300) not null,				-- 주소
    tel varchar(50) not null, 				-- 연락처
    delcom varchar(50) not null,			-- 배송사
    deltel varchar(50) not null, 			-- 배송사 번호
    delno varchar(50) not null, 			-- 배송코드
    delstatus varchar(50) not null, 		-- 배송상태
    st varchar(50) not null					-- 거래상태
);

-- 장바구니(basket) --
drop table basket;
create table basket (
	bskno int auto_increment primary key,	-- 장바구니 번호
    id varchar(30) not null,				-- 회원아이디
    pno int ,								-- 상품번호
    gno int , 								-- 게임번호
    amount int default 0 not null,			-- 담은 수
    remark varchar(2000)					-- 상품설명
);

-- ---------------------- 외래키(fk) 설정 --------------------------------
    
-- star(sno) -> game(gno) --
ALTER TABLE star
ADD CONSTRAINT fk_sno_gno
FOREIGN KEY (sno) REFERENCES game(gno);

-- star(id) -> member(id) --
ALTER TABLE star
ADD CONSTRAINT fk_id_id
FOREIGN KEY (id) REFERENCES member(id);

-- library(lno) -> game(gno) --
ALTER TABLE library
ADD CONSTRAINT fk_lno_gno
FOREIGN KEY (lno) REFERENCES game(gno);

-- library(id) -> member(id) --
ALTER TABLE library
ADD CONSTRAINT fk_lid_id
FOREIGN KEY (id) REFERENCES member(id);

-- qna(qaid) -> member(id) --
ALTER TABLE qna
ADD CONSTRAINT fk_qaid_id
FOREIGN KEY (qaid) REFERENCES member(id);

-- board(author) -> member(id) --
ALTER TABLE board
ADD CONSTRAINT fk_author_id
FOREIGN KEY (author) REFERENCES member(id);

-- inventory(pno) -> product(pno) --
ALTER TABLE inventory
ADD CONSTRAINT fk_ipno_pno
FOREIGN KEY (pno) REFERENCES product(pno);

-- sales(pno) -> product(pno) --
ALTER TABLE sales
ADD CONSTRAINT fk_spno_pno
FOREIGN KEY (pno) REFERENCES product(pno);

-- sales(id) -> member(id) --
ALTER TABLE sales
ADD CONSTRAINT fk_sid_id
FOREIGN KEY (id) REFERENCES member(id);

-- sales(gno) -> game(gno)
ALTER TABLE sales
ADD CONSTRAINT fk_sgno_gno
FOREIGN KEY (gno) REFERENCES member(gno);


-- basket(id) -> member(id) --
ALTER TABLE basket
ADD CONSTRAINT fk_bid_id
FOREIGN KEY (id) REFERENCES member(id);

-- basket(pno) -> product(pno) --
ALTER TABLE basket
ADD CONSTRAINT fk_bpno_pno
FOREIGN KEY (pno) REFERENCES product(pno);

-- basket(gno) -> product(gno) --
ALTER TABLE basket
ADD CONSTRAINT fk_bgno_gno
FOREIGN KEY (gno) REFERENCES game(gno);

-- ------------------- 외래키 설정 확인 쿼리 -------------------- --
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
    TABLE_NAME = 'basket'		-- 여기 테이블명 삽입
    AND CONSTRAINT_SCHEMA = 'sqlGames'
    AND REFERENCED_TABLE_NAME IS NOT NULL;
	-- 참조되는 테이블 : member, game, product