
CREATE TABLE member(
	id varchar(30) primary key,
    name varchar(30)
    );
    
select * from member;
insert into member(id, name) values('admin','홍길동');
insert into member(id,name) values('test','이순신');

commit;

select * from member;

# M : 1
select * from score s left join member m on s.name = m.id;

# 1 : M
select * from member m left join score s on m.id = s.name;
select * from member m left join score s on m.id = s.name where id = 'test';


create table board (
 num int primary key auto_increment,
 name varchar(30) not null,
 title varchar(30) not null,
 content varchar(300) not null
 );
 
 #//////////////////////////실습해보기///////////////////////////////////
 CREATE TABLE BOARD(
   num int auto_increment primary key,
    name varchar(30),
    title varchar(60),
    content varchar(200),
    note varchar(100)
);
 
 insert into board(name,title,content) values("테스터","테스트","테스트용입니당");
 insert into board(name, title, content) values("테스트","두번째","두번째입니다.");
 select * from board;