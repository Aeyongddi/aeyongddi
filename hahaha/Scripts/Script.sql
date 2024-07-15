SELECT * FROM CALENDAR;
create table calendar2(
       id number primary key,
       title varchar2(200),
       writer varchar2(50),
       start1 varchar2(50),
       end1 varchar2(50),
       content varchar2(1000),
       backgroundColor varchar2(50),
       textColor varchar2(50),
       allDay number(1),
       urlLink varchar2(200)
    );
    CREATE SEQUENCE cal_seq2;
    INSERT INTO calendar2 values(cal_seq2.nextval,
    '첫일정','홍길동','2024-07-08','2024-07-09', '첫일정입니다.', '#0099CC', '#CCFFFF',1,
    'http://www.naver.com');
   SELECT id, title, writer, start1 "start", end1 "end", content, backgroundColor,
   textColor, allDay, urlLink
   FROM CALENDAR2;
    )
    /*
   SELECT id, title, writer, start1 "start", end1 "end", content, backgroundColor,
   textColor, allDay, urlLink
   FROM CALENDAR2;
   
   INSERT INTO calendar2 values(cal_seq2.nextval,
    #{title},#{writer},#{start},#{end},#{content},#{backgroundColor}, #{textColor},#{allDay},
     #{urlLink})
     * */
    
    SELECT * FROM MEMBER01;
    INSERT INTO MEMBER01 values('higirl', '8888', '홍현지', '일반사용자',1000);