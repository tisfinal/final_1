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



--ȣ�ڵ�� -----------------------------------------
insert INTO hotel VALUES(hotel_seq.nextval,'test_hotel','�׽�Ʈȣ���Դϴ�.','��⵵ ������ ������ ���縮','010-0101-1111','jaegyeong','����','������','107-81-33333','�׽�Ʈȣ��');
select * from hotel;

--ȣ������ ����
update hotel set hname ='test����', htitle ='�׽�Ʈ������', hotel_address='�׽�Ʈ', phone='010-999-9999', member_id='jaegyeong', sido = '������', gungu = '����', business_id ='000-0000-1000', description = '�����Ϸ�' where hotel_id = 6;
-- member_id, hotel_id ����


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
select * from room where hotel_id=6;

-- ��˻� (���ݼ�)
select * from room where hotel_id=3 order by 3 asc;

-- Ư�� hotel_id ���� ���� ���� �������� �˻�(room)
      

--����
insert into room VALUES(1,'�׽�Ʈ��',150000,'',6);

--������ ����
UPDATE room set room_name ='�ΰ� ���� �ȴ�',room_price= 150000, business_id = '000-0000-1000' where hotel_id=6;

--����
insert INTO service VALUES('dahye',1,to_date('08-08-21','DD/MM/YYYY'),to_date('09-08-21','DD/MM/YYYY'),8);

-- �����˻��� ����������
select * from (select count(*), finding from search group by finding order by 1 desc) where rownum<6
; 
