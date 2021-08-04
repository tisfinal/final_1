--테이블 삭제문-----------------------------------------------
drop table image;
drop table service;
drop table total_point;
drop table star;
drop table review;
drop table room;
drop table hotel;
drop table business;
drop table member;
drop table servicecount;
-----------------------------------------------------------
--멤버테이블----------------------------------
/* 회원 */
CREATE TABLE member (
   member_id VARCHAR2(30) NOT NULL, /* 아이디 */
   nickname VARCHAR2(30) NOT NULL, /* 닉네임 */
   name VARCHAR2(30) NOT NULL, /* 이름 */
   pwd VARCHAR2(30) NOT NULL, /* 비밀번호 */
   addr1 varchar2(100) NOT NULL, /* 주소1 */
   addr2 varchar2(100) NOT NULL, /* 주소2 */
   addrno number(10) NOT NULL, /* 우편번호 */
   ph1 number(10) NOT NULL, /* 연락처1 */
   ph2 number(10) NOT NULL, /* 연락처2 */
   ph3 number(10) NOT NULL, /* 연락처3 */
   state number(1) NOT NULL, /* 회원구분 */
   jumin number(10) NOT NULL, /* 주민등록번호 */
   favorite_loc VARCHAR2(30) /* 선호지역 */
);

--사업자회원(business table)---------------------------

/* 사업자회원 */
CREATE TABLE business (
   business_id NUMBER(30) NOT NULL, /* 사업자번호 */
   member_id VARCHAR2(30) NOT NULL, /* 아이디 fk */
   saup1 NUMBER(10) NOT NULL, /* 사업자번호1 */
   saup2 NUMBER(10) NOT NULL, /* 사업자번호2 */
   saup3 NUMBER(10) NOT NULL /* 사업자번호3 */
);


--호텔----------------------------------

/* 호텔 */
CREATE TABLE hotel (
   hotel_id NUMBER(10) NOT NULL, /* 호텔인덱스 */
   hname VARCHAR2(50) NOT NULL, /* 호텔명 */
   htitle VARCHAR2(50) NOT NULL, /* 타이틀 */
   haddr1 VARCHAR2(100) NOT NULL, /* 호텔주소1 */
   haddr2 VARCHAR2(100) NOT NULL, /* 호텔주소2 */
   haddrno NUMBER(10) NOT NULL, /* 우편번호 */
   ph1 NUMBER(10) NOT NULL, /* 연락처1 */
   ph2 NUMBER(10) NOT NULL, /* 연락처2 */
   ph3 NUMBER(10) NOT NULL, /* 연락처3 */
   member_id VARCHAR2(30) NOT NULL, /* 아이디 */
   sido VARCHAR2(50) NOT NULL, /* 시/도 */
   gungu VARCHAR2(50) NOT NULL, /* 군/구 */
   business_id NUMBER(30) NOT NULL, /* 사업자번호 */
   description VARCHAR2(500), /* 호텔설명 */
   thumb_price NUMBER(30) NOT NULL, /* 가격 */
   thumb_img VARCHAR2(100) NOT NULL /* 사진 */
);

--방---------------------------------
/* 방 */
CREATE TABLE room (
   room_id NUMBER(10) NOT NULL, /* 방인덱스 */
   room_name VARCHAR2(50) NOT NULL, /* 방이름 */
   room_price NUMBER(30) NOT NULL, /* 방가격 */
   room_img VARCHAR2(100), /* 방썸네일 */
   hotel_id NUMBER(10) NOT NULL, /* 호텔인덱스  fk */
   state NUMBER(1) NOT NULL /* 예약여부 */
);
--리뷰-----------------------------------
/* 리뷰 */
CREATE TABLE review (
   hotel_id NUMBER(10) NOT NULL, /* 호텔인덱스 fk  */
   wdate DATE NOT NULL, /* 등록일 */
   member_id VARCHAR2(30) NOT NULL, /* 아이디 fk  */
   discription VARCHAR2(500), /* 내용 */
   star NUMBER(10) NOT NULL /* 별점 */
);
--평점-------------------------------
/* 평점 */
CREATE TABLE star (
   kind NUMBER(10) NOT NULL, /* 친절도 */
   clean NUMBER(10) NOT NULL, /* 청결도 */
   easy NUMBER(10) NOT NULL, /* 편리함 */
   total_pnt NUMBER(10) NOT NULL /* 총평점 */
);
--총평점-----------------------------------
/* 총 평점 */
CREATE TABLE total_point (
   hotel_name VARCHAR2(50) NOT NULL, /* 호텔이름 */
   total_pnt NUMBER(10) NOT NULL /* 총평점 */
);

--예약----------------------------------
/* 예약 */
CREATE TABLE service (
   member_id VARCHAR2(30) NOT NULL, /* 아이디 */
   room_id NUMBER(10) NOT NULL, /* 방인덱스  fk */
   start_date DATE NOT NULL, /* 입실일 */
   end_date DATE NOT NULL /* 퇴실일 */
);

--판매량------------------------------------
/* 판매량 */
CREATE TABLE servicecount (
   hotel_id NUMBER(10) NOT NULL, /* 호텔인덱스 */
   count NUMBER(10) NOT NULL, /* 총판매량 */
   loc VARCHAR2(100) NOT NULL /* 지역 */
);
--이미지------------------------------------
CREATE TABLE image (
   room_id NUMBER(10) NOT NULL, /* 방인덱스 */
   img_url VARCHAR2(100) /* url */
);

--pk, fk 값 넣기------------------------------
-----------------------------------------primary key--------------------------------------------        
ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			member_id
		);
        --
 ALTER TABLE business
	ADD
		CONSTRAINT PK_business
		PRIMARY KEY (
			business_id
		);       
        --
ALTER TABLE hotel
	ADD
		CONSTRAINT PK_hotel
		PRIMARY KEY (
			hotel_id
		);
        --
ALTER TABLE room
	ADD
		CONSTRAINT PK_room
		PRIMARY KEY (
			room_id
		);        
        --
-----------------------------------------foreign key--------------------------------------------        

ALTER TABLE business
	ADD
		CONSTRAINT FK_business_TO_member
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);
        --
ALTER TABLE hotel
	ADD
		CONSTRAINT FK_hotel_TO_member
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);        
        --
ALTER TABLE hotel
	ADD
		CONSTRAINT FK_business_TO_hotel
		FOREIGN KEY (
			business_id
		)
		REFERENCES business (
			business_id
		);
        --
ALTER TABLE room
	ADD
		CONSTRAINT FK_room_TO_hotel
		FOREIGN KEY (
			hotel_id
		)
		REFERENCES hotel (
			hotel_id
		);        
        --
ALTER TABLE review
	ADD
		CONSTRAINT FK_review_TO_hotel
		FOREIGN KEY (
			hotel_id
		)
		REFERENCES hotel (
			hotel_id
		);
        --
ALTER TABLE review
	ADD
		CONSTRAINT FK_review_TO_member
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);
        --
ALTER TABLE service
	ADD
		CONSTRAINT FK_service_TO_member
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);  
        --
ALTER TABLE service
	ADD
		CONSTRAINT FK_service_TO_room
		FOREIGN KEY (
			room_id
		)
		REFERENCES room (
			room_id
		);
        --
ALTER TABLE image
	ADD
		CONSTRAINT FK_image_TO_room
		FOREIGN KEY (
			room_id
		)
		REFERENCES room (
			room_id
		);
        --
ALTER TABLE servicecount
	ADD
		CONSTRAINT FK_servicecount_TO_hotel
		FOREIGN KEY (
			hotel_id
		)
		REFERENCES hotel (
			hotel_id
		);
        