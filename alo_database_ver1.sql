## ==== 비상 탈출 ===========================
drop database alomedia;


drop table member;
drop table lectureList;
drop table notice;
drop table examList;
drop table attendance;
drop table attendanceList;
drop table AttendanceCheck;

create database alomedia charset=utf8mb4;
use alomedia;

## 회원 목록========================================
create table member(
	id bigint auto_increment,
    name char(30) not null,
    password char(30) default '1111' not null,
    phone char(30) not null,
    mail char(30) not null,
    userType char(10) not null,
    birth date not null,
    gender char(10) not null,
	address char(30) not null,
    curriculum char(30) not null,
    primary key(id)
);

## 강의 목록===========================================================================
create table lectureList(
	lectureId bigint auto_increment,
    lectureName char(30) not null,
    lectureDay char(10),
    lectureTime char(30),
    lectureRoom char(30),
    lecturePeople int,
    lectureTeacher char(30),
    lectureStart date,
    lectureEnd date,
    lectureState char(30) default '준비 중',
	primary key(lectureId)
);
select * from lectureList;

## 공지 사항===========================================================
create table notice(
	noticeId bigint auto_increment,
    lectureId bigint,
    noticeName char(30) not null,
    noticeContent char(255) not null,
    noticeWriter char(30) not null,
    noticeDate date not null,
    primary key(noticeId)
);

## 평가 목록=======================================================================
create table examList(
	examId bigint auto_increment,
    lectureId bigint not null,
    examName char(30) not null,
    examDate date,
    timeLimit int not null,
    examinee int default 0,
    examStart datetime,
    examEnd datetime,
    examState char(10) default '대기 중', 
    now datetime,
    primary key(examId),
    foreign key(lectureId) references lectureList(lectureId)
	on delete cascade
    on update cascade
);

## 출석 ===============================================
create table attendance(
	id bigint not null,
    totalAttendance int not null default 0,
    late int not null default 0,
    leaveEarly int not null default 0,
    absent int not null default 0,
    foreign key(id) references member(id)
	on delete cascade
    on update cascade
);

## 출석 목록 ==============================================
create table AttendanceList(
	id bigint not null,
    lectureId bigint not null,
    attendanceDate date not null,
    attendanceTime time not null,
    foreign key(id) references member(id)
	on delete cascade
    on update cascade,
    foreign key(lectureId) references lectureList(lectureId)
	on delete cascade
    on update cascade
);

## 출석 체크 시스템===============================================
create table AttendanceCheck(
	lectureId bigint not null,
    AttendanceDate date not null,
    AttendanceNum int not null,
    foreign key(lectureId) references lectureList(lectureId)
	on delete cascade
    on update cascade
);

## 평가 문제 ================================
create table exam(
	examId bigint not null,
    lectureId bigint not null,
    questionNum int not null,
    examContent char(255) not null,
    examAllotment int not null,
    foreign key(examId) references examList(examId)
    on delete cascade
    on update cascade,
    foreign key(lectureId) references lectureList(lectureId)
    on delete cascade
    on update cascade
);

## 평가 답안 ==================================
create table examSubmit(
	id bigint not null,
    examId bigint not null,
    lectureId bigint not null,
    questionNum int not null,
	examContent char(255),
    ans char(255),
    examAllotment int not null,
    score int,
	teacherComent char(255),
    foreign key(id) references member(id)
    on delete cascade
    on update cascade,
    foreign key(examId) references examList(examId)
    on delete cascade
    on update cascade,
    foreign key(lectureId) references lectureList(lectureId)
    on delete cascade
    on update cascade
);

## 응시자 목록 =================================
create table submitList(
	id bigint not null,
	examId bigint not null,
    examName char(30) not null,
    submitTime char(30) not null,
    state char(10) default '미제출',
    totalScore int,
    name char(10) not null,
    foreign key(id) references member(id)
    on delete cascade
    on update cascade,
    foreign key(examId) references examList(examId)
    on delete cascade
    on update cascade
);

## 중간 표시선 전까지 입력 후, JAVA를 수강중인 학생을 만들고 추가 입력
## 드래그 / 컨+쉬+엔
insert into member(name,password,phone,mail,userType,birth,gender,address,curriculum)
values('홍길동','1111','010-1111-1111','example@naver.com','관리자','1999-12-12','M','서울시 용산구 한남동','-');
insert into member(name,password,phone,mail,userType,birth,gender,address,curriculum)
values('이미자','2222','010-3333-3333','example@naver.com','강사','1999-12-12','F','서울시 용산구 한남동','컴활 1급');
insert into member(name,password,phone,mail,userType,birth,gender,address,curriculum)
values('admin','1111','admin','example@naver.com','관리자','1999-12-12','F','서울시 용산구 한남동','-');
insert into member(name,password,phone,mail,userType,birth,gender,address,curriculum)
values('teacher','1111','teacher','example@naver.com','강사','1999-12-12','F','서울시 용산구 한남동','JAVA');
insert into member(name,password,phone,mail,userType,birth,gender,address,curriculum)
values('teacher2','1111','teacher2','example@naver.com','강사','1999-12-12','F','서울시 용산구 한남동','웹 퍼블리셔');

insert into lectureList(lectureName,lectureDay,lectureTime,lectureRoom,lecturePeople, lectureTeacher,lectureStart, lectureEnd)
values('웹 퍼블리셔','평일','09:00~18:00','2 강의실',20,'김디브','2023-07-01','2023-12-01');
insert into lectureList(lectureName,lectureDay,lectureTime,lectureRoom,lecturePeople, lectureTeacher,lectureStart, lectureEnd)
values('JAVA','평일','09:00~18:00','1 강의실',20,'나강사','2023-01-01','2023-07-01');
insert into lectureList(lectureName,lectureDay,lectureTime,lectureRoom,lecturePeople, lectureTeacher,lectureStart, lectureEnd)
values('분식회계 2급','주말','09:00~18:00','1 강의실',20,'김분식','2023-01-01','2023-07-01');
insert into lectureList(lectureName,lectureDay,lectureTime,lectureRoom,lecturePeople, lectureTeacher,lectureStart, lectureEnd)
values('컴활 1급','주말','09:00~18:00','2 강의실',20,'재활용','2023-01-01','2023-02-01');
insert into notice(lectureId,noticeName,noticeContent,noticeWriter,noticeDate)
values(2,'강의실에서 드시지 마세요','컴퓨터에 흘리는 경우가 있습니다.','teacher','2023-01-01');
insert into notice(lectureId,noticeName,noticeContent,noticeWriter,noticeDate)
values(2,'다음 주 강의는 휴강입니다.','착오없으시길 바랍니다.','teacher','2023-01-02');

insert into notice(noticeName,noticeContent,noticeWriter,noticeDate)
values('안녕하세요 아로미디어입니다.','반갑습니다.','홍길동','2023-01-05');
insert into notice(noticeName,noticeContent,noticeWriter,noticeDate)
values('사후 출결관리에 대한 건','서류 제출 안하시면 인정되지 않습니다.','홍길동','2023-01-05');
insert into notice(noticeName,noticeContent,noticeWriter,noticeDate)
values('대리 출석 체크에 관한 건','대리 출석 적발 시 큰 불이익이 있습니다.','홍길동','2023-01-05');
insert into notice(lectureId,noticeName,noticeContent,noticeWriter,noticeDate)
values(1,'웹 퍼블리싱','html css','이미자','2023-01-06');

## ====================================================================================
insert into examList(lectureId,examName,examDate,timeLimit,examState,examinee)
values(2,'자바 기초','2023-02-01',60,'완료',1);
insert into exam(examId,lectureId,questionNum,examContent,examAllotment)
values(1,2,1,'int num1과 int num2를 선언하고 값을 할당하시오. num1은 10, num 2는 20이다.',50);
#insert into exam(examId,lectureId,examNum,examContent,examAllotment)
#values(1,2,1.1,'1+2=?',25);
#insert into exam(examId,lectureId,examNum,examContent,examAllotment)
#values(1,2,1.2,'2+3=?',25);
insert into exam(examId,lectureId,questionNum,examContent,examAllotment)
values(1,2,2,'1차원 배열 arr를 선언하고 num1과 num2를 배열에 넣으시오.',50);
insert into examSubmit(id,examId,lectureId,questionNum,ans,examAllotment,score,examContent) 
values(6,1,2,1,'3',50,25,'int num1과 int num2를 선언하고 값을 할당하시오. num1은 10, num 2는 20이다.');
#insert into examSubmit(id,examId,lectureId,questionNum,ans) 
#values(6,1,2,1.2,'10');
insert into examSubmit(id,examId,lectureId,questionNum,ans,examAllotment,score,examContent) 
values(6,1,2,2,'5',50,40,'1차원 배열 arr를 선언하고 num1과 num2를 배열에 넣으시오.');
insert into submitList(id,examId,examName,submitTime,state,totalScore,name) 
values(6,1,'자바 기초','12:00','완료',70,'student');


insert into examList(lectureId,examName,examDate,timeLimit,examState,examinee)
values(2,'자바 고급','2023-03-01',60,'채점 중',1);
insert into exam(examId,lectureId,questionNum,examContent,examAllotment)
values(2,2,1,'[1,10,4,2,5] 배열을 내림차순으로 정렬하시오 ',50);
#insert into exam(examId,lectureId,examNum,examContent,examAllotment)
#values(2,2,1.1,'1+2=?',25);
#insert into exam(examId,lectureId,examNum,examContent,examAllotment)
#values(2,2,1.2,'2+3=?',25);
insert into exam(examId,lectureId,questionNum,examContent,examAllotment)
values(2,2,2,'say메서드를 가진 추상 인터페이스 Person을 생성하시오.',50);
insert into examSubmit(id,examId,lectureId,questionNum,ans,examAllotment,examContent)
values(6,2,2,1,'3',50,'[1,10,4,2,5] 배열을 내림차순으로 정렬하시오');
#insert into examSubmit(id,examId,lectureId,questionNum,ans) 
#values(6,2,2,1.2,'10');
insert into examSubmit(id,examId,lectureId,questionNum,ans,examAllotment,examContent) 
values(6,2,2,2,'5',50,'say메서드를 가진 추상 인터페이스 Person을 생성하시오.');
insert into submitList(id,examId,examName,submitTime,state,name) 
values(6,2,'자바 고급','13:00','미완료','student');
