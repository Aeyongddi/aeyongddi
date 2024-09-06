
<div align="center">
  <h1><strong>PROJECT: TRACER PMS</strong></h1>
</div>

## 📑 목차

## 🙋‍♂️ 프로젝트 개요
### 📅 개발기간
+ 2024년 7월 15일 ~ 2024년 8월 26일

### 🔍 프로젝트 소개
+ 소프트웨어 개발 프로젝트의 효율적인 관리와 팀원 간의 원할한 소통을 지원하기 위해 설계
+ 프로젝트 일정 관리, 실시간 채팅, 메일 발송, 간트 차트 등 다양한 기능을 제공하여 <br> 개발팀의 생산성을 극대화하고 프로젝트의 성공적인 완수에 도움
+ 사용자 친화적인 인터페이스와 강력한 기능을 통해 프로젝트를 효율적으로 관리하고 일정 내에 성공적으로 완료할 수 있도록 지원

### ⚙ 개발환경 및 도구
+ JAVA 17
+ IDE: ECLIPSE 기반 STS4
+ Framework: SpringBoot(3.1.2)
+ DataBase: Oracle DB(ojdbc8), Mybatis
+ DevOps: Maven, Git, GitHub
+ Tools: Oven, Figma

### 👬 멤버 구성
<table>
<tr>
<td>이름</td><td>담당업무</td>  
</tr>
<tr>
<td>박재현(팀장)</td><td>통합 관리, 이해관계자 관리, 의사소통 관리, 자원 관리, 품질 관리, 범위 관리</td>
</tr>
<tr>
<td>김기억(팀원)</td><td>리스크 관리, 품질 관리</td> 
</tr>
<tr>
<td>김남원(팀원)</td><td>자원 관리, 범위 관리, 일정 관리, 의사소통 관리</td> 
</tr>
  
</table>

### 🚩 주요 기능
<details>
  <summary> 자산 관리 [박재현] </summary>
  <div markdown="1">
  <br> - 예산 관리 <br>
  <br> - 드롭다운에서 프로젝트 선택 후 선택 된 프로젝트의 예산 현황 확인
    <img src ="https://github.com/user-attachments/assets/f7cbb5e7-f446-4293-a0e2-c3d7a31ffc78" >
  <br> - 예산 추가 / 예산 삭감 시 입력된 금액만큼 반영 <br>
  <br> - 새 프로젝트 생성 시에는 '새 프로젝트 예산 부여'를 사용 <br>
  <br> - 자산 관리
    <img src ="https://github.com/user-attachments/assets/12048821-0d39-451b-b0ce-29c18b1977de">
  <br> - 프로젝트마다 자산 추가 가능: 자산 이름, 자산 유형, 구매일/임대일, 만료일, 가격
    <img src ="https://github.com/user-attachments/assets/eab379b4-eba0-4746-95f3-b1e97ec6d37d">
  </div>
</details>
<details> 
  <summary> 결재 시스템 [박재현] </summary>
  <div markdown="1">
  <div>
    <br> - 'To Do' 게시판에서 작업에 대해 결재 요청을 할 경우 
    <img src ="https://github.com/user-attachments/assets/43542d40-2ac0-4a0d-91ef-9be97fd2d016">
    <br> - '결재 관리' 게시판에서 결재 요청 된 작업을 확인하여 반려 / 결재 완료 가능 
    <br> - '보류'시, 피드백 작성하여 반려 가능 <br>
    <br> - 'To Do' 게시판에서 결재 요청 시 파일 업로드, '결재 관리' 게시판에서 파일 다운로드 가능
  </div>
  </div>
</details>
<details>
  <summary> 다국어 전환 [박재현] </summary>
  <div markdown="1">
  <br> - 사용자의 접속 환경에 따라 한글 사용 시 'change to English', 영어 사용 시 '한국어로 변경' 출력 <br>
  <br> - 'change to English' : '내 정보' 페이지가 영어로 변경 <br>
  <br> - '한국어로 변경' : '내 정보' 페이지가 한국어로 변경<br>
 <br> - 한국어
 <img src = "https://github.com/user-attachments/assets/5bdb9798-f04e-4410-9ece-8319cb12df4e"
 alt="한국어 페이지">
 <br> - 영어
 <img src = "https://github.com/user-attachments/assets/a92fe3ea-cb3c-4fa7-8937-c3004cc9f168" alt="영어 페이지">
  </div>
</details>
<details>
  <summary> 채팅 [박재현] </summary>
  <div markdown="1">
  <h3> 단체 채팅 </h3> 
    - '단체 채팅' 입장 후 (기본 '단체 채팅1' 입장) 내용 입력 후 전송 <br>
    <br> - 로그아웃 후에도 채팅 기록 확인 가능 <br>
    <br> - '채팅 기록 삭제' 시, 저장된 채팅 기록 삭제 후 초기화
    <img src= "https://github.com/user-attachments/assets/f5e0a94b-ef4f-4ce2-93a3-6c32bc2c190c" alt="단체 채팅">
  <h3> 개인 채팅 </h3>
    - '개인 채팅' 입장 후 수신자와 내용 입력 후 전송 <br>
    <br> - 수신자 닉네임이 정확히 일치해야 수신됨
    <img src = "https://github.com/user-attachments/assets/8533585e-625a-4eb0-a013-6623bafe3835" alt="개인 채팅">
  </div>
</details>
<details>
  <summary> 간트 차트 / 캘린더 [김남원] </summary>
  <div markdown="1">
    <h3> 간트 차트 </h3>
    - 일정을 간트차트로 조회할 수 있다. <br>
    - 프로젝트 별로 일정을 확인할 수 있다. <br>
    - 드래그앤 드랍으로 일정을 변경할 수 있다. <br>
    - + 버튼으로 새 일정을 등록할 수 있다. <br>
    <image src="https://github.com/user-attachments/assets/92aa6e09-ab5b-412c-a6d7-64b816d1e873"> <br>
    <h3> 캘린더 </h3>
    - 일정을 캘린더 형식으로 조회할 수 있다. <br>
    - 프로젝트 별로 일정을 확인할 수 있다. <br>
    - 드래그앤 드랍으로 일정을 변경할 수 있다. <br>
    - 셀 또는 일정 바를 클릭하여 일정을 등록 및 변경할 수 있다. <br>
    - 프로젝트, 팀, 개인 별로 체크박스를 체크하여 해당하는 일정을 조회할 수 있다. <br>
    <image src="https://github.com/user-attachments/assets/72fff869-ffbb-4734-9d1d-f7fd6ebdcf1f"> <br>
  </div>
</details>
<details>
  <summary> 사용자 관리 [김남원] </summary>
  <div markdown="1">
    <h3> 로그인 </h3> 
    - 등록된 회원의 이메일과 비밀번호를 입력하여 로그인할 수 있다. <br>
    <image src="https://github.com/user-attachments/assets/0f53c305-aeee-4ce4-801b-10f6e0a86bb6"> <br>
    <h3> 회원가입 </h3> 
    - 회원 정보를 입력한다. <br>
    - 입력한 이메일로 인증번호를 전송하여 회원가입을 할 수 있다. <br>
    <image src="https://github.com/user-attachments/assets/74aee851-66e1-4173-b3c4-50fdd112a7e1"> <br>
    <h3> 비밀번호 초기화 </h3> 
    - 새 비밀번호를 이메일로 전송받을 수 있다. <br>
    <image src="https://github.com/user-attachments/assets/d5d84fdc-f0ed-447a-bae0-99f1d367ceb9"> <br>
    <h3> 회원 관리 </h3> 
    - 권한, 이름, 닉네임을 입력하여 회원을 검색할 수 있다. <br>
    - 드롭다운으로 회원의 권한을 변경하고, 삭제 버튼으로 삭제할 수 있다. <br>
    - 해당하는 번호의 페이지의 회원목록을 조회할 수 있다. <br>
    <image src="https://github.com/user-attachments/assets/2599884a-9a6e-4fe4-8697-cb3c773e2874"> <br>

  </div>
</details>
<details>
  <summary> 프로젝트 관리 [김남원] </summary>
  <div markdown="1">
  <h3>프로젝트 생성</h3>
  - 프로젝트 명, 설명, 기한을 입력하여 프로젝트를 생성할 수 있다. <br>
    <image src="https://github.com/user-attachments/assets/0a31efe1-268f-4700-8a22-366b04f9d44c"> <br>
  <h3>프로젝트 수정/삭제</h3>
  - 프로젝트에 대한 정보를 수정할 수 있다. <br>
  - 삭제 버튼으로 프로젝트를 삭제할 수 있다. <br>
  - 참여인원 확인을 클릭하면 모달창으로 참여 인원과 참여 가능인원을 조회할 수 있고, <br> 
      인원을 추가하거나 삭제할 수 있다. <br>
    <image src="https://github.com/user-attachments/assets/2ebe7cfe-0f98-42c2-aca8-ff1ae2283ed2"> <br>
    <image src="https://github.com/user-attachments/assets/ab2d611e-e06b-4ef9-aeb5-c4dad54eb9c6"> <br>
  </div>
</details>
<details>
  <summary> 메일 발송 [김기억] </summary>
  <div markdown="1">
    123
  </div>
</details>
<details>
  <summary> 이슈 관리 [김기억] </summary>
  <div markdown="1">
    123
  </div>
</details>

### 🛠 아키텍처
![image](https://github.com/user-attachments/assets/108811b1-a091-499a-89e5-0caebae92335)
