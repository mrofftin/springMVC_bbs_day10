use sample;

create table tbl_board(
    bid int auto_increment primary key,
    subject varchar(100) not null,
    contents varchar(3000) not null,
    hit int default 0,
    writer varchar(30) not null,
    regDate datetime default now() not null
);

insert into tbl_board(subject, contents, writer)
values('테스트~~~', '테스트~~~~', '아무개');

select * from tbl_board;

----- 7/18 외래키 추가 --------
select * from tbl_board;

-- 기존테이블에 컬럼 추가
alter table tbl_board add uid varchar(50);

-- 외래키 지정방법
-- on delete cascade : 참조하는 키가 삭제되면 나도 삭제
alter table tbl_board add foreign key(uid)
    references member2(id) on delete cascade;
