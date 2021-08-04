--���̺� ������-----------------------------------------------
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
--������̺�----------------------------------
/* ȸ�� */
CREATE TABLE member (
   member_id VARCHAR2(30) NOT NULL, /* ���̵� */
   nickname VARCHAR2(30) NOT NULL, /* �г��� */
   name VARCHAR2(30) NOT NULL, /* �̸� */
   pwd VARCHAR2(30) NOT NULL, /* ��й�ȣ */
   addr1 varchar2(100) NOT NULL, /* �ּ�1 */
   addr2 varchar2(100) NOT NULL, /* �ּ�2 */
   addrno number(10) NOT NULL, /* �����ȣ */
   ph1 number(10) NOT NULL, /* ����ó1 */
   ph2 number(10) NOT NULL, /* ����ó2 */
   ph3 number(10) NOT NULL, /* ����ó3 */
   state number(1) NOT NULL, /* ȸ������ */
   jumin number(10) NOT NULL, /* �ֹε�Ϲ�ȣ */
   favorite_loc VARCHAR2(30) /* ��ȣ���� */
);

--�����ȸ��(business table)---------------------------

/* �����ȸ�� */
CREATE TABLE business (
   business_id NUMBER(30) NOT NULL, /* ����ڹ�ȣ */
   member_id VARCHAR2(30) NOT NULL, /* ���̵� fk */
   saup1 NUMBER(10) NOT NULL, /* ����ڹ�ȣ1 */
   saup2 NUMBER(10) NOT NULL, /* ����ڹ�ȣ2 */
   saup3 NUMBER(10) NOT NULL /* ����ڹ�ȣ3 */
);


--ȣ��----------------------------------

/* ȣ�� */
CREATE TABLE hotel (
   hotel_id NUMBER(10) NOT NULL, /* ȣ���ε��� */
   hname VARCHAR2(50) NOT NULL, /* ȣ�ڸ� */
   htitle VARCHAR2(50) NOT NULL, /* Ÿ��Ʋ */
   haddr1 VARCHAR2(100) NOT NULL, /* ȣ���ּ�1 */
   haddr2 VARCHAR2(100) NOT NULL, /* ȣ���ּ�2 */
   haddrno NUMBER(10) NOT NULL, /* �����ȣ */
   ph1 NUMBER(10) NOT NULL, /* ����ó1 */
   ph2 NUMBER(10) NOT NULL, /* ����ó2 */
   ph3 NUMBER(10) NOT NULL, /* ����ó3 */
   member_id VARCHAR2(30) NOT NULL, /* ���̵� */
   sido VARCHAR2(50) NOT NULL, /* ��/�� */
   gungu VARCHAR2(50) NOT NULL, /* ��/�� */
   business_id NUMBER(30) NOT NULL, /* ����ڹ�ȣ */
   description VARCHAR2(500), /* ȣ�ڼ��� */
   thumb_price NUMBER(30) NOT NULL, /* ���� */
   thumb_img VARCHAR2(100) NOT NULL /* ���� */
);

--��---------------------------------
/* �� */
CREATE TABLE room (
   room_id NUMBER(10) NOT NULL, /* ���ε��� */
   room_name VARCHAR2(50) NOT NULL, /* ���̸� */
   room_price NUMBER(30) NOT NULL, /* �氡�� */
   room_img VARCHAR2(100), /* ������ */
   hotel_id NUMBER(10) NOT NULL, /* ȣ���ε���  fk */
   state NUMBER(1) NOT NULL /* ���࿩�� */
);
--����-----------------------------------
/* ���� */
CREATE TABLE review (
   hotel_id NUMBER(10) NOT NULL, /* ȣ���ε��� fk  */
   wdate DATE NOT NULL, /* ����� */
   member_id VARCHAR2(30) NOT NULL, /* ���̵� fk  */
   discription VARCHAR2(500), /* ���� */
   star NUMBER(10) NOT NULL /* ���� */
);
--����-------------------------------
/* ���� */
CREATE TABLE star (
   kind NUMBER(10) NOT NULL, /* ģ���� */
   clean NUMBER(10) NOT NULL, /* û�ᵵ */
   easy NUMBER(10) NOT NULL, /* ���� */
   total_pnt NUMBER(10) NOT NULL /* ������ */
);
--������-----------------------------------
/* �� ���� */
CREATE TABLE total_point (
   hotel_name VARCHAR2(50) NOT NULL, /* ȣ���̸� */
   total_pnt NUMBER(10) NOT NULL /* ������ */
);

--����----------------------------------
/* ���� */
CREATE TABLE service (
   member_id VARCHAR2(30) NOT NULL, /* ���̵� */
   room_id NUMBER(10) NOT NULL, /* ���ε���  fk */
   start_date DATE NOT NULL, /* �Խ��� */
   end_date DATE NOT NULL /* ����� */
);

--�Ǹŷ�------------------------------------
/* �Ǹŷ� */
CREATE TABLE servicecount (
   hotel_id NUMBER(10) NOT NULL, /* ȣ���ε��� */
   count NUMBER(10) NOT NULL, /* ���Ǹŷ� */
   loc VARCHAR2(100) NOT NULL /* ���� */
);
--�̹���------------------------------------
CREATE TABLE image (
   room_id NUMBER(10) NOT NULL, /* ���ε��� */
   img_url VARCHAR2(100) /* url */
);

--pk, fk �� �ֱ�------------------------------
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
        