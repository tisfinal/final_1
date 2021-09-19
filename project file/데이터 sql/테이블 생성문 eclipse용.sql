-----------------------------------테이블 드롭-------------------------------------
DROP TABLE hashtag;
DROP TABLE image;
DROP TABLE review;
DROP TABLE search;
DROP TABLE service;
DROP TABLE service_count;
DROP TABLE total_point;
DROP TABLE room;
DROP TABLE hotel;
DROP TABLE member;
-------------------------------멤버 테이블 생성-------------------------------------
/* 회원 */ 
CREATE TABLE member (
	user_id VARCHAR2(30) constraint pk_user_id primary key, /* 아이디 */
	nickname VARCHAR2(30) NOT NULL, /* 닉네임 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	pwd VARCHAR2(30) NOT NULL, /* 비밀번호 */
	state number(1) NOT NULL, /* 회원구분 */
	favorite_loc VARCHAR2(30), /* 선호지역 */
    mileage NUMBER(100) /* 마일리지 */
);



--멤버테이블 더미데이터 삽입
Insert into MEMBER (USER_ID,NICKNAME,NAME,PWD,STATE,FAVORITE_LOC) values ('test','sungsung','최성근','test',2,'부산광역시');
Insert into MEMBER (USER_ID,NICKNAME,NAME,PWD,STATE,FAVORITE_LOC) values ('test1','dayes','권다혜','test',2,'경기도');
Insert into MEMBER (USER_ID,NICKNAME,NAME,PWD,STATE,FAVORITE_LOC) values ('test2','jindown','박진하','test',2,'인천광역시');
Insert into MEMBER (USER_ID,NICKNAME,NAME,PWD,STATE,FAVORITE_LOC) values ('test3','hyang2','우향기','test',2,'대전광역시');
Insert into MEMBER (USER_ID,NICKNAME,NAME,PWD,STATE,FAVORITE_LOC) values ('test4','jack','김재경','test',2,'광주광역시');
Insert into MEMBER (USER_ID,NICKNAME,NAME,PWD,STATE,FAVORITE_LOC) values ('test0','test','test','test',1,'경기도');

--생성 확인
select * from member;
--커밋
commit;
-------------------------------호텔테이블 생성-------------------------------------
CREATE TABLE hotel (
	hotel_id NUMBER(10) constraint pk_hotel_id primary key, /* 호텔인덱스 */
	hname VARCHAR2(50) NOT NULL, /* 호텔명 */
	htitle VARCHAR2(50) NOT NULL, /* 호텔 */
	hotel_address VARCHAR2(100), /* 호텔주소 */
	phone VARCHAR2(20) NOT NULL, /* 연락처 */
	sido VARCHAR2(50), /* 시/도 */
	gungu VARCHAR2(50), /* 군/구 */
	thumb_img VARCHAR2(50), /* 사진 */
	description VARCHAR2(500) NOT NULL, /* 호텔설명 */
	min_price NUMBER(30) NOT NULL, /* 가격 */
	user_id VARCHAR2(30) CONSTRAINT fk_user_hotel_id REFERENCES member, /* 아이디 */
	business_id VARCHAR2(30) NOT NULL /* 사업자번호 */
);


-------------------------------룸테이블 생성-------------------------------------
/* 방 */
CREATE TABLE room (
	room_id NUMBER(10) constraint pk_room_id primary key, /* 방인덱스 */
	room_name VARCHAR2(50) NOT NULL, /* 방이름 */
	room_price NUMBER(30) NOT NULL, /* 방가격 */
	thumb_img VARCHAR2(100), /* 방썸네일 */
	hotel_id NUMBER(10) CONSTRAINT fk_hotel_id REFERENCES hotel /* fk_호텔인덱스 */
);

-------------------------------예약 테이블 생성-------------------------------------
/* 예약 */
CREATE TABLE service (
	service_id NUMBER(10) constraint pk_service_id primary key, /* 새 컬럼2 */
	user_id VARCHAR2(30) constraint fk_user_id REFERENCES member, /* fk_아이디 */
	room_id NUMBER(10) constraint fk_room_id REFERENCES room, /* 방인덱스 */
	check_in DATE NOT NULL, /* 체크인 */
	check_out DATE NOT NULL, /* 체크아웃 */
	hotel_id NUMBER(10) constraint fk_service_hotel_id REFERENCES hotel, /* 호텔인덱스 */
	r_state NUMBER(1) NOT NULL, /* 새 컬럼 */
	sdate DATE, /* 예약한 날짜 */
    payment number(100) 
);
-------------------------------판매량 테이블 생성-------------------------------------

/* 판매량 */
CREATE TABLE service_count (
	hotel_id NUMBER(10) constraint fk_servicecount_hotel_id REFERENCES hotel, /* 호텔인덱스 */
	count NUMBER(10) NOT NULL, /* 총판매량 */
	loc VARCHAR2(100) /* 지역 */
);

-------------------------------해시태그 테이블 생성-------------------------------------
/* 해시태그 */
CREATE TABLE hashtag (
	tag VARCHAR2(100), /* 태그 */
	hotel_id NUMBER(10) constraint fk_hash_hotel_id REFERENCES hotel /* 호텔인덱스 */
);

-------------------------------리뷰 테이블 생성-------------------------------------
/* 리뷰 */
CREATE TABLE review (
	room_id NUMBER(10) CONSTRAINT fk_review_room_id REFERENCES room, /* 방인덱스 */
	hotel_id NUMBER(10) constraint fk_review_hotel_id REFERENCES hotel, /* 호텔인덱스 */
	wdate DATE NOT NULL, /* 등록일 */
	user_id VARCHAR2(30) CONSTRAINT fk_review_user_id REFERENCES member, /* 아이디 */
	description VARCHAR2(500), /* 내용 */
	star NUMBER(10) NOT NULL, /* 별점 */
	review_id NUMBER(10) NOT NULL, /* 리뷰인덱스 */
    service_id NUMBER(10) constraint fk_service_id REFERENCES service /* 예약인덱스 */
);
-------------------------------총평점 테이블 생성-------------------------------------
/* 총 평점 */
CREATE TABLE Total_point (
	hotel_id NUMBER(10) CONSTRAINT FK_TP_HOTEL_ID REFERENCES hotel, /* 호텔인덱스 */
	total_star NUMBER(30,1), /* 평균평점 */
	count NUMBER(30) /* 리뷰수 */
);

-------------------------------총평점 테이블 생성-------------------------------------
/* 이미지 */
CREATE TABLE image (
	room_id NUMBER(10) CONSTRAINT fk_img_room_id REFERENCES room, /* 방인덱스 */
	img_url VARCHAR2(100) /* url */
);

-------------------------------지역검색 테이블 생성-------------------------------------
/* 지역검색 */
CREATE TABLE search (
	finding VARCHAR2(100) /* 검색내용 */
);


commit;

------------------------------------------------------------------
create SEQUENCE service_seq;
