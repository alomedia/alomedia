  <h1>아로미디어 LMS시스템</h1>
  <h2>대면 강의 관리 시스템</h2>


 **프로젝트명**
  <br/>
 아로미디어
 <br/>
  <br/>

**개발 기간**
 <br/>
2023 12.12 ~ 2024 1.4
 <br/>
  <br/>

**개발 인원**
 <br/>
  <br/>
3명

 <br/>
  <div id="role" class="item">
    <p><strong>담당 업무</strong></p>
    <table>
      <thead>
        <tr>
          <th></th>
          <th><strong>우종곤(팀장)</strong></th>
          <th><strong>김부경(팀원)</strong></th>
          <th><strong>정시운(팀원)</strong></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><strong>Front</strong></td>
          <td><strong>-강사 페이지</strong><br>-출결 관리<br>-공지사항<br>-평가 페이지<br><strong>수강자 페이지</strong><br>-평가 페이지</td>
          <td><strong>CSS 전체</strong><br><strong>메뉴</strong><br>-헤더<br>-사이드바<br>-푸터<br><strong>관리자 페이지</strong><br>-회원
            관리<br>-강의 관리<br>-공지사항 관리</td>
          <td><strong>공용</strong><br>-마이페이지<br>-검색 페이지<br><strong>수강자 페이지</strong><br>-대시보드<br>-공지 사항<br><strong>관리자
              페이지</strong><br>-강의 수정</td>
        </tr>
        <tr>
          <td><strong>Back</strong></td>
          <td>
            <strong>공지사항</strong>
            <br>-관리자 공지사항(조회,작성,수정,삭제)
            <br>-강사 공지사항(조회,작성,수정,삭제)
            <br>-수강자 공지사항(조회)
            <br><strong>회원 관리</strong>
            <br>-회원 생성, 삭제, 수정
            <br>-회원 비밀번호 초기화
            <br><strong>평가 관리 기능</strong>
            <br>-평가 상태 관리
            <br>-강사 평가 기능(목록,생성,응시자,채점)
            <br>-수강자 평가 기능(목록, 응시, 조회)
          </td>
          <td>
            <strong>로그인 기능 구현</strong>
            <br>-세션 설정
            <br>-권한 별 페이지 구분
            <br><strong>출결 관리 기능</strong>
            <br>-강사 출석 기능(번호 설정, 출석시간 확인)
            <br>-수강자 출석 기능(번호 입력, 출석 처리)
          </td>
          <td>
            <strong>공용/복합</strong>
            <br>-내 정보 수정 기능
            <br>-검색 기능
            <br><strong>강의 관리</strong>
            <br>-강의 관리 기능(조회,생성,수정,삭제)
            <br><strong>회원 관리</strong>
            <br>-휴대폰 중복 체크 기능
            <br>-수강생 관리 페이지 기능
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  <div id="tool" class="item">

<br/>  
<br/>

**개발 환경**
 <br/>
windows10, STS3.9.18(Eclipse2.3.7), Java11, MySQL8.0.22, Lombok(1.18.30), myBatis(3.5.14) 
MyBatis(3.5.14), Bootstrap(5.3), Visual Studio Code(1.85.1), SpringFramework(5.2.25), JavaScript& jQuery
<br/>
<br/>

**설계 목적**
<br/>
출결,평가 전산화 및 편의성 제공

<br/>

---------------------------------------


**주요 기능**


로그인 페이지
<br/>
![1](https://github.com/alomedia/alomedia/assets/146792839/72ed6e7c-c001-4556-a7c9-fe865bd8b537)
<br/> 
<br/>

회원 관리 페이지
<br/>
![2](https://github.com/alomedia/alomedia/assets/146792839/60c41c94-86ab-4647-a861-c20bb3f4f30f)
<br/>
<br/>
강의 관리 페이지
<br/> 
![3](https://github.com/alomedia/alomedia/assets/146792839/90842bee-000f-4047-8331-e8e1c9ba4ce1)
<br/>
<br/>
공지사항 페이지
<br/>
![4](https://github.com/alomedia/alomedia/assets/146792839/8c856c37-65d1-4d81-b673-a05ca0e70b32)
<br/> 
<br/>
마이페이지 
<br/>
![5](https://github.com/alomedia/alomedia/assets/146792839/9fd3b0a6-af89-465e-af35-c8db20b64f58)
<br/> 
<br/>
출결(강사)
<br/>
![6](https://github.com/alomedia/alomedia/assets/146792839/28791973-3e59-495c-9c52-4d1a1bf477c9)
<br/> 
<br/>
출결(수강자)
<br/>
![7](https://github.com/alomedia/alomedia/assets/146792839/6870ead1-d6e1-4900-9382-1e6b7bb95a3f)
<br/> 
 <br/>
 공지 사항 조회
 <br/> 
![8](https://github.com/alomedia/alomedia/assets/146792839/fb002965-13f9-49ec-85b8-1c7c8dd3e026)
<br/> 
<br/> 
평가 등록(강사)
![9](https://github.com/alomedia/alomedia/assets/146792839/432c8a69-9e88-4c72-82ae-18a82a7ff7be)
<br/> 
<br/> 
평가 페이지(학생)
<br/>
![11](https://github.com/alomedia/alomedia/assets/146792839/2bb3a83b-205a-4ef8-9e7e-304ee07228bb)
<br/>
<br/>
결과 조회(학생)
<br/>
![10](https://github.com/alomedia/alomedia/assets/146792839/ce673cbb-d49a-434f-9993-1c5f1b800b47)
<br/>
<br/>
**추후 작업**
<br/>
<br/>
-게시물 작성 시 사진 업로드 기능 추가
<br/>
<br/>
-강의 생성 시 비는 강의실 확인할 수 있게끔 데이터 베이스와 연동하기
<br/>
<br/>
-병결, 경조사 등의 사유로 결석 후 서류 제출 시 직권 출결 인정 기능 추가
<br/>
<br/>
-강사 평가 추가 시간, 평가 즉시 종료 기능,소문항 기 추가
<br/>
<br/>
-수강생 출석 인정 시간 초과 시 지각/결석 처리



