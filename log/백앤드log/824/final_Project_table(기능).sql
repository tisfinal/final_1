--final project sql�� ����(���)

/*insert INTO service 
VALUES('"+"member_id"+"',1,to_date('"+check_in+"','DD/MM/YYYY'),to_date('"+check_out+"','DD/MM/YYYY'),"+state+","+business_id+")";*/

--�ε��� ������ ����, ����----------------------
/*drop sequence member_seq;

create sequence member_seq
start with 6
increment by 1
nocache;*/
---------------------------------------


--ȸ����������
delete from member where member_id = 'aaa3';

--ȸ������
select * from member;
--insert into member values('aaa4','AAA','ȫ�浿2','1234',1,'����',member_seq.nextval);
insert into member values('aaa','AAA','ȫ�浿2','1234',1,'����');

--���̵� �ߺ�üũ
select member_id from member where member_id = 'aaa'; 

--ȸ����������
update member set state = 0 where member_id='sungguen';

select * from member;

-- ȸ�����Խ� state�� 1�� ���� (�޸����=2,Ż��=3,�Ǹ���=4, �Ǹ����޸�=5, �Ǹ���Ż��=6 ������=0)
select * from member;


--ȣ�ڵ�� -----------------------------------------
insert INTO hotel VALUES(hotel_seq.nextval,'107-81-33333','test_hotel','�׽�Ʈȣ���Դϴ�.','��⵵ ������ ������ ���縮','010-0101-1111','����','������','2_1_01.png','�׽�Ʈȣ��',150000);
select * from hotel;

--ȣ������ ����
update hotel set hname ='test����', htitle ='�׽�Ʈ������', hotel_address='�׽�Ʈ', phone='010-999-9999', sido = '������', gungu = '����', business_id ='000-0000-1000', description = '�����Ϸ�' where hotel_id = 3004;

-- member_id, hotel_id ����
DELETE FROM hotel WHERE hotel_id = 3003;
commit;
roll back;

--�ε��� ������ ����, ����----------------------
-----------------------------------������----------------------------------------------        
drop sequence room_seq;
drop sequence hotel_seq;

--room_seq
create sequence room_seq
start with 3000
increment by 1
nocache;

create sequence hotel_seq
start with 3000 
increment by 1
nocache;

--�����Ͱ� 3000������ �����ϰ� ����
---------------------------------------


--��˻�
select * from room where hotel_id=2999;

-- �ش� ȣ���� ���ݼ����� ���� �����ٶ�  (���ݼ�) 
select * from room where hotel_id=2998 order by 3 asc;

-- Ư�� hotel_id ���� ���� ���� �������� �˻�(room)
      

--����
insert into room VALUES(room_seq.nextval,'�׽�Ʈ��',150000,'123',2999);
select * from room;

--������ ����
UPDATE room set room_name ='�ΰ� ���� �ȴ�',room_price= 150000, business_id = '000-0000-1000' where hotel_id=6;

--����
insert INTO service VALUES('dahye',2998,to_date('08-08-21','DD/MM/YYYY'),to_date('09-08-21','DD/MM/YYYY'),2999);
select * from service;
commit;
-- �����˻��� ����������
select * from (select count(*), finding from search group by finding order by 1 desc) where rownum<6
; 


select * from search;
-- ȣ�� ��� ������ ��
select h.hotel_id, h.thumb_img, h.htitle, h.min_price, t.total_star, t.count 
from hotel h join total_point t 
on h.hotel_id = t.hotel_id;
