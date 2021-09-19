-----------------------------------���̺� ���-------------------------------------
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
-------------------------------��� ���̺� ����-------------------------------------
/* ȸ�� */ 
CREATE TABLE member (
	user_id VARCHAR2(30) constraint pk_user_id primary key, /* ���̵� */
	nickname VARCHAR2(30) NOT NULL, /* �г��� */
	name VARCHAR2(30) NOT NULL, /* �̸� */
	pwd VARCHAR2(30) NOT NULL, /* ��й�ȣ */
	state number(1) NOT NULL, /* ȸ������ */
	favorite_loc VARCHAR2(30), /* ��ȣ���� */
    mileage NUMBER(100) /* ���ϸ��� */
);



--������̺� ���̵����� ����
Insert into MEMBER (USER_ID,NICKNAME,NAME,PWD,STATE,FAVORITE_LOC) values ('test','sungsung','�ּ���','test',2,'�λ걤����');
Insert into MEMBER (USER_ID,NICKNAME,NAME,PWD,STATE,FAVORITE_LOC) values ('test1','dayes','�Ǵ���','test',2,'��⵵');
Insert into MEMBER (USER_ID,NICKNAME,NAME,PWD,STATE,FAVORITE_LOC) values ('test2','jindown','������','test',2,'��õ������');
Insert into MEMBER (USER_ID,NICKNAME,NAME,PWD,STATE,FAVORITE_LOC) values ('test3','hyang2','�����','test',2,'����������');
Insert into MEMBER (USER_ID,NICKNAME,NAME,PWD,STATE,FAVORITE_LOC) values ('test4','jack','�����','test',2,'���ֱ�����');
Insert into MEMBER (USER_ID,NICKNAME,NAME,PWD,STATE,FAVORITE_LOC) values ('test0','test','test','test',1,'��⵵');

--���� Ȯ��
select * from member;
--Ŀ��
commit;
-------------------------------ȣ�����̺� ����-------------------------------------
CREATE TABLE hotel (
	hotel_id NUMBER(10) constraint pk_hotel_id primary key, /* ȣ���ε��� */
	hname VARCHAR2(50) NOT NULL, /* ȣ�ڸ� */
	htitle VARCHAR2(50) NOT NULL, /* ȣ�� */
	hotel_address VARCHAR2(100), /* ȣ���ּ� */
	phone VARCHAR2(20) NOT NULL, /* ����ó */
	sido VARCHAR2(50), /* ��/�� */
	gungu VARCHAR2(50), /* ��/�� */
	thumb_img VARCHAR2(50), /* ���� */
	description VARCHAR2(500) NOT NULL, /* ȣ�ڼ��� */
	min_price NUMBER(30) NOT NULL, /* ���� */
	user_id VARCHAR2(30) CONSTRAINT fk_user_hotel_id REFERENCES member, /* ���̵� */
	business_id VARCHAR2(30) NOT NULL /* ����ڹ�ȣ */
);


-------------------------------�����̺� ����-------------------------------------
/* �� */
CREATE TABLE room (
	room_id NUMBER(10) constraint pk_room_id primary key, /* ���ε��� */
	room_name VARCHAR2(50) NOT NULL, /* ���̸� */
	room_price NUMBER(30) NOT NULL, /* �氡�� */
	thumb_img VARCHAR2(100), /* ������ */
	hotel_id NUMBER(10) CONSTRAINT fk_hotel_id REFERENCES hotel /* fk_ȣ���ε��� */
);

-------------------------------���� ���̺� ����-------------------------------------
/* ���� */
CREATE TABLE service (
	service_id NUMBER(10) constraint pk_service_id primary key, /* �� �÷�2 */
	user_id VARCHAR2(30) constraint fk_user_id REFERENCES member, /* fk_���̵� */
	room_id NUMBER(10) constraint fk_room_id REFERENCES room, /* ���ε��� */
	check_in DATE NOT NULL, /* üũ�� */
	check_out DATE NOT NULL, /* üũ�ƿ� */
	hotel_id NUMBER(10) constraint fk_service_hotel_id REFERENCES hotel, /* ȣ���ε��� */
	r_state NUMBER(1) NOT NULL, /* �� �÷� */
	sdate DATE, /* ������ ��¥ */
    payment number(100) 
);
-------------------------------�Ǹŷ� ���̺� ����-------------------------------------

/* �Ǹŷ� */
CREATE TABLE service_count (
	hotel_id NUMBER(10) constraint fk_servicecount_hotel_id REFERENCES hotel, /* ȣ���ε��� */
	count NUMBER(10) NOT NULL, /* ���Ǹŷ� */
	loc VARCHAR2(100) /* ���� */
);

-------------------------------�ؽ��±� ���̺� ����-------------------------------------
/* �ؽ��±� */
CREATE TABLE hashtag (
	tag VARCHAR2(100), /* �±� */
	hotel_id NUMBER(10) constraint fk_hash_hotel_id REFERENCES hotel /* ȣ���ε��� */
);

-------------------------------���� ���̺� ����-------------------------------------
/* ���� */
CREATE TABLE review (
	room_id NUMBER(10) CONSTRAINT fk_review_room_id REFERENCES room, /* ���ε��� */
	hotel_id NUMBER(10) constraint fk_review_hotel_id REFERENCES hotel, /* ȣ���ε��� */
	wdate DATE NOT NULL, /* ����� */
	user_id VARCHAR2(30) CONSTRAINT fk_review_user_id REFERENCES member, /* ���̵� */
	description VARCHAR2(500), /* ���� */
	star NUMBER(10) NOT NULL, /* ���� */
	review_id NUMBER(10) NOT NULL, /* �����ε��� */
    service_id NUMBER(10) constraint fk_service_id REFERENCES service /* �����ε��� */
);
-------------------------------������ ���̺� ����-------------------------------------
/* �� ���� */
CREATE TABLE Total_point (
	hotel_id NUMBER(10) CONSTRAINT FK_TP_HOTEL_ID REFERENCES hotel, /* ȣ���ε��� */
	total_star NUMBER(30,1), /* ������� */
	count NUMBER(30) /* ����� */
);

-------------------------------������ ���̺� ����-------------------------------------
/* �̹��� */
CREATE TABLE image (
	room_id NUMBER(10) CONSTRAINT fk_img_room_id REFERENCES room, /* ���ε��� */
	img_url VARCHAR2(100) /* url */
);

-------------------------------�����˻� ���̺� ����-------------------------------------
/* �����˻� */
CREATE TABLE search (
	finding VARCHAR2(100) /* �˻����� */
);


commit;

------------------------------------------------------------------
create SEQUENCE service_seq;
