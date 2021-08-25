drop table total_point;
drop table service_count;
drop table review;
drop table service_find;
drop table search;
drop table image;
drop table hashtag;
drop table service;
drop table room;
drop table hotel;
drop table member;


/* 회원 */
CREATE TABLE member (
	user_id VARCHAR2(30) NOT NULL, /* 아이디 */
	nickname VARCHAR2(30) NOT NULL, /* 닉네임 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	pwd VARCHAR2(30) NOT NULL, /* 비밀번호 */
	state number(1) NOT NULL, /* 회원구분 */
	favorite_loc VARCHAR2(30) /* 선호지역 */
);

/* 호텔 */
CREATE TABLE hotel (
   hotel_id NUMBER(10) NOT NULL, /* 호텔인덱스 */
   business_id VARCHAR2(30) NOT NULL, /* 사업자번호 */
   hname VARCHAR2(50) NOT NULL, /* 호텔명 */
   htitle VARCHAR2(50) NOT NULL, /* 타이틀 */
   hotel_address VARCHAR2(100) NOT NULL, /* 호텔주소 */
   phone VARCHAR2(20) NOT NULL, /* 연락처 */
   sido VARCHAR2(50) NOT NULL, /* 시/도 */
   gungu VARCHAR2(50) NOT NULL, /* 군/구 */
   thumb_img VARCHAR2(50) NOT NULL, /* 썸네일이미지 */
   description VARCHAR2(500) NOT NULL, /* 호텔설명 */
   min_price NUMBER(30) NOT NULL /* 최저가 */
);.

/* 방 */
CREATE TABLE room (
	room_id NUMBER(10) NOT NULL, /* 방인덱스 */
	room_name VARCHAR2(50) NOT NULL, /* 방이름 */
	room_price NUMBER(30) NOT NULL, /* 방가격 */
	thumb_img VARCHAR2(100), /* 썸네일이미지 */
	hotel_id NUMBER(10) NOT NULL /* 호텔인덱스 */
);

CREATE TABLE service (
	user_id VARCHAR2(30) NOT NULL, /* 아이디 */
	room_id NUMBER(10) NOT NULL, /* 방인덱스 */
	check_in DATE NOT NULL, /* 입실일 */
	htitle VARCHAR2(50) NOT NULL, /* 타이틀 */
	check_out DATE NOT NULL, /* 퇴실일 */
	hotel_id NUMBER(10) NOT NULL /* 호텔인덱스 */
);
/* 해시태그 */
CREATE TABLE hashtag (
	tag VARCHAR2(100), /* 태그내용 */
	hotel_id NUMBER(10) NOT NULL /* 호텔인덱스 */
);
/* 리뷰 */
CREATE TABLE review (
	hotel_id NUMBER(10) NOT NULL, /* 호텔인덱스 */
	wdate DATE NOT NULL, /* 등록일 */
	user_id VARCHAR2(30) NOT NULL, /* 아이디 */
	description VARCHAR2(500), /* 내용 */
	star NUMBER(10) NOT NULL /* 평점 */
);
/* 총 평점 (연결 안되어 있음.)*/
CREATE TABLE total_point (
	hotel_id VARCHAR2(50) NOT NULL, /* 호텔이름 */
	total_star NUMBER(30), /* 총평점 */
	count NUMBER(30) /*평점 갯수*/
); 
/* 판매량 */
CREATE TABLE service_count (
	hotel_id NUMBER(10) NOT NULL, /* 호텔인덱스 */
	count NUMBER(10) NOT NULL, /* 총판매량 */
	loc VARCHAR2(100) NOT NULL /* 지역 */
);
/* 룸 디테일이미지 */
CREATE TABLE image (
	room_id NUMBER(10) NOT NULL, /* 방인덱스 */
	img_url VARCHAR2(100) /* url */
);
/* 예약확인 */
CREATE TABLE service_find (
	state NUMBER(1) NOT NULL, /* 예약여부 */
	room_id NUMBER(10) NOT NULL /* 방인덱스 */
);
/* 지역검색 */
CREATE TABLE search (
   finding VARCHAR2(100) NOT NULL /* 검색명 */
);
------------------------------제약조건-----------------------------
--1.
ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			user_id
		);
--2.
ALTER TABLE hotel
	ADD
		CONSTRAINT PK_hotel
		PRIMARY KEY (
			hotel_id
		);


--3.

ALTER TABLE room
	ADD
		CONSTRAINT PK_room
		PRIMARY KEY (
			room_id
		);

ALTER TABLE room
	ADD
		CONSTRAINT FK_hotel_TO_room
		FOREIGN KEY (
			hotel_id
		)
		REFERENCES hotel (
			hotel_id
		);
--4.        
        ALTER TABLE service
	ADD
		CONSTRAINT FK_member_TO_service
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);

ALTER TABLE service
	ADD
		CONSTRAINT FK_room_TO_service
		FOREIGN KEY (
			room_id
		)
		REFERENCES room (
			room_id
		);

ALTER TABLE service
	ADD
		CONSTRAINT FK_hotel_TO_service
		FOREIGN KEY (
			hotel_id
		)
		REFERENCES hotel (
			hotel_id
		);
ALTER TABLE service
	ADD
		CONSTRAINT FK_hotel_TO_service
		FOREIGN KEY (
			htitle
		)
		REFERENCES hotel (
			htitle
		);

--5.
ALTER TABLE hashtag
	ADD
		CONSTRAINT FK_hotel_TO_hashtag
		FOREIGN KEY (
			hotel_id
		)
		REFERENCES hotel (
			hotel_id
		);
--6.
ALTER TABLE review
	ADD
		CONSTRAINT FK_hotel_TO_review
		FOREIGN KEY (
			hotel_id
		)
		REFERENCES hotel (
			hotel_id
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_member_TO_review
		FOREIGN KEY (
			user_id
		)
		REFERENCES member (
			user_id
		);
--7.
ALTER TABLE servicecount
	ADD
		CONSTRAINT FK_hotel_TO_servicecount
		FOREIGN KEY (
			hotel_id
		)
		REFERENCES hotel (
			hotel_id
		);        
--8.
ALTER TABLE service_find
	ADD
		CONSTRAINT FK_room_TO_service_find
		FOREIGN KEY (
			room_id
		)
		REFERENCES room (
			room_id
		);
