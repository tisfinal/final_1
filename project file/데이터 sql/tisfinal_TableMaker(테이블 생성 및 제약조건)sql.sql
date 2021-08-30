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


/* ȸ�� */
CREATE TABLE member (
	user_id VARCHAR2(30) NOT NULL, /* ���̵� */
	nickname VARCHAR2(30) NOT NULL, /* �г��� */
	name VARCHAR2(30) NOT NULL, /* �̸� */
	pwd VARCHAR2(30) NOT NULL, /* ��й�ȣ */
	state number(1) NOT NULL, /* ȸ������ */
	favorite_loc VARCHAR2(30) /* ��ȣ���� */
);

/* ȣ�� */
CREATE TABLE hotel (
   user_id varchar2(20) NOT NULL,
   hotel_id NUMBER(10) NOT NULL, /* ȣ���ε��� */
   hname VARCHAR2(50) NOT NULL, /* ȣ�ڸ� */
   htitle VARCHAR2(50) NOT NULL, /* Ÿ��Ʋ */
   hotel_address VARCHAR2(100) NOT NULL, /* ȣ���ּ� */
   phone VARCHAR2(20) NOT NULL, /* ����ó */
   sido VARCHAR2(50) NOT NULL, /* ��/�� */
   gungu VARCHAR2(50) NOT NULL, /* ��/�� */
   thumb_img VARCHAR2(50) NOT NULL, /* ������̹��� */
   description VARCHAR2(500) NOT NULL, /* ȣ�ڼ��� */
   min_price NUMBER(30) NOT NULL /* ������ */
);.

/* �� */
CREATE TABLE room (
	room_id NUMBER(10) NOT NULL, /* ���ε��� */
	room_name VARCHAR2(50) NOT NULL, /* ���̸� */
	room_price NUMBER(30) NOT NULL, /* �氡�� */
	thumb_img VARCHAR2(100), /* ������̹��� */
	hotel_id NUMBER(10) NOT NULL /* ȣ���ε��� */
);
/* ����+����Ȯ�� */
CREATE TABLE service (
	user_id VARCHAR2(30) NOT NULL, /* ���̵� */
	room_id NUMBER(10) NOT NULL, /* ���ε��� */
	check_in DATE NOT NULL, /* �Խ��� */
	room_name VARCHAR2(30) NOT NULL, /* ���̸� */
	htitle VARCHAR2(50) NOT NULL, /* Ÿ��Ʋ */
	check_out DATE NOT NULL, /* ����� */
	hotel_id NUMBER(10) NOT NULL /* ȣ���ε��� */
);
/* �ؽ��±� */
CREATE TABLE hashtag (
	tag VARCHAR2(100), /* �±׳��� */
	hotel_id NUMBER(10) NOT NULL /* ȣ���ε��� */
);
/* ���� */
CREATE TABLE review (
	room_id NUMBER(10) NOT NULL, /* ���ε��� */
	hotel_id NUMBER(10) NOT NULL, /* ȣ���ε��� */
	wdate DATE NOT NULL, /* ����� */
	room_name VARCHAR2(30) NOT NULL, /* ���̸� */
	user_id VARCHAR2(30) NOT NULL, /* ���̵� */
	description VARCHAR2(500), /* ���� */
	star NUMBER(10) NOT NULL /* ���� */
	review_id num NUMBER(10) NOT NULL /* �����ε���*/
	
);
/* �� ���� (���� �ȵǾ� ����.)*/
CREATE TABLE total_point (
	hotel_id VARCHAR2(50) NOT NULL, /* ȣ���̸� */
	total_star NUMBER(30,1), /* ������ */
	count NUMBER(30) /*���� ����*/
); 
/* �Ǹŷ� */
CREATE TABLE service_count (
	hotel_id NUMBER(10) NOT NULL, /* ȣ���ε��� */
	count NUMBER(10) NOT NULL, /* ���Ǹŷ� */
	loc VARCHAR2(100) NOT NULL /* ���� */
);
/* �� �������̹��� */
CREATE TABLE image (
	room_id NUMBER(10) NOT NULL, /* ���ε��� */
	img_url VARCHAR2(100) /* url */
);
/* ����Ȯ�� */
CREATE TABLE service_find (
	state NUMBER(1) NOT NULL, /* ���࿩�� */
	room_id NUMBER(10) NOT NULL /* ���ε��� */
);
/* �����˻� */
CREATE TABLE search (
   finding VARCHAR2(100) NOT NULL /* �˻��� */
);
------------------------------��������-----------------------------
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
		CONSTRAINT PK_review
		PRIMARY KEY (
			review_id
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

ALTER TABLE review
	ADD
		CONSTRAINT FK_room_TO_review
		FOREIGN KEY (
			room_id
		)
		REFERENCES room (
			room_id
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
		CONSTRAINT pK_room_TO_service_find
		FOREIGN KEY (
			room_id
		)
		REFERENCES room (
			room_id
		);
