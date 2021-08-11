--final project sql문 모음(기능)

/*insert INTO service 
VALUES('"+"member_id"+"',1,to_date('"+check_in+"','DD/MM/YYYY'),to_date('"+check_out+"','DD/MM/YYYY'),"+state+","+business_id+")";*/

--인덱스 시퀀스 생성, 삭제----------------------
/*drop sequence member_seq;

create sequence member_seq
start with 6
increment by 1
nocache;*/
---------------------------------------


--회원정보삭제
delete from member where member_id = 'aaa3';

--회원가입
select * from member;
--insert into member values('aaa4','AAA','홍길동2','1234',1,'강릉',member_seq.nextval);
insert into member values('aaa','AAA','홍길동2','1234',1,'강릉');

--아이디 중복체크
select member_id from member where member_id = 'aaa'; 

--회원정보수정
update member set state = 0 where member_id='sungguen';

select * from member;

-- 회원가입시 state는 1로 삽입 (휴면계정=2,탈퇴=3,판매자=4, 판매자휴면=5, 판매자탈퇴=6 관리자=0)



--호텔등록 -----------------------------------------
insert INTO hotel VALUES(hotel_seq.nextval,'test_hotel','테스트호텔입니다.','경기도 김포시 통진읍 도사리','010-0101-1111','jaegyeong','김포','통진읍','107-81-33333','테스트호텔');
select * from hotel;

--호텔정보 수정
update hotel set hname ='test수정', htitle ='테스트수정중', hotel_address='테스트', phone='010-999-9999', member_id='jaegyeong', sido = '김포시', gungu = '통진', business_id ='000-0000-1000', description = '수정완료' where hotel_id = 6;
-- member_id, hotel_id 주의


--인덱스 시퀀스 생성, 삭제----------------------
-----------------------------------시퀀스----------------------------------------------        
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

--데이터가 3000번부터 시작하게 셋팅
---------------------------------------


--방검색
select * from room where hotel_id=6;

-- 방검색 (가격순)
select * from room where hotel_id=3 order by 3 asc;

-- 특정 hotel_id 에서 가장 낮은 가격으로 검색(room)
      

--방등록
insert into room VALUES(1,'테스트방',150000,'',6);

--방정보 수정
UPDATE room set room_name ='널값 넣음 안댐',room_price= 150000, business_id = '000-0000-1000' where hotel_id=6;

--예약
insert INTO service VALUES('dahye',1,to_date('08-08-21','DD/MM/YYYY'),to_date('09-08-21','DD/MM/YYYY'),8);

-- 연관검색어 서브쿼리문
select * from (select count(*), finding from search group by finding order by 1 desc) where rownum<6
; 
