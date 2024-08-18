-- 첫 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2024-08-01', 'YYYY-MM-DD'), 
    TO_DATE('2024-08-15', 'YYYY-MM-DD'), 
    1, 
    '고객 관리 시스템 설계', 
    '고객 관리 시스템의 기본 설계 작업 완료', 
    'zsn1527@gmail.com', 
    '181'
);

-- 두 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2024-08-16', 'YYYY-MM-DD'), 
    TO_DATE('2024-08-30', 'YYYY-MM-DD'), 
    1, 
    '고객 관리 시스템 개발', 
    '고객 관리 시스템의 핵심 모듈 개발 완료', 
    'lim_hyun_95@kakao.com', 
    '181'
);

-- 세 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2024-09-01', 'YYYY-MM-DD'), 
    TO_DATE('2024-09-20', 'YYYY-MM-DD'), 
    0, 
    '문서 관리 시스템 초기 분석', 
    '문서 관리 시스템의 요구사항 분석 및 초기 설계 작업', 
    'song.ahrum84@naver.com', 
    '182'
);

-- 네 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2024-09-21', 'YYYY-MM-DD'), 
    TO_DATE('2024-10-10', 'YYYY-MM-DD'), 
    0, 
    '채팅 애플리케이션 UI 디자인', 
    '채팅 애플리케이션의 사용자 인터페이스 디자인 작업 진행 중', 
    'jeong_soo_jin@naver.com', 
    '183'
);

-- 다섯 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2024-10-11', 'YYYY-MM-DD'), 
    TO_DATE('2024-10-30', 'YYYY-MM-DD'), 
    0, 
    '지능형 검색 시스템 알고리즘 개발', 
    '고급 검색 알고리즘의 개발 작업 시작', 
    'noh.kyuseok88@gmail.com', 
    '184'
);

-- 여섯 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2024-11-01', 'YYYY-MM-DD'), 
    TO_DATE('2024-11-15', 'YYYY-MM-DD'), 
    0, 
    '온라인 교육 플랫폼 콘텐츠 제작', 
    '온라인 교육을 위한 학습 콘텐츠 제작 완료', 
    'oh_jin_94@yahoo.com', 
    '185'
);

-- 일곱 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2024-11-16', 'YYYY-MM-DD'), 
    TO_DATE('2024-12-01', 'YYYY-MM-DD'), 
    0, 
    '전자상거래 관리 시스템 보안 강화', 
    '전자상거래 관리 시스템의 보안 강화 작업 진행 중', 
    'jung.min_ho87@daum.net', 
    '186'
);

-- 여덟 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2024-12-01', 'YYYY-MM-DD'), 
    TO_DATE('2024-12-15', 'YYYY-MM-DD'), 
    0, 
    '웹 기반 회계 시스템 통합 테스트', 
    '웹 기반 회계 시스템의 통합 테스트 수행', 
    'bae_young00@outlook.com', 
    '187'
);

-- 아홉 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2025-01-01', 'YYYY-MM-DD'), 
    TO_DATE('2025-01-15', 'YYYY-MM-DD'), 
    0, 
    '헬스케어 애플리케이션 기능 테스트', 
    '헬스케어 애플리케이션의 주요 기능 테스트 수행', 
    'kim_hee2001@hanmail.net', 
    '188'
);

-- 열 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2025-01-16', 'YYYY-MM-DD'), 
    TO_DATE('2025-01-31', 'YYYY-MM-DD'), 
    0, 
    '자동화 테스트 시스템 최종 검토', 
    '자동화 테스트 시스템의 최종 검토 및 배포 준비', 
    'cho.sunmi89@gmail.com', 
    '189'
);

-- 열한 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2025-02-01', 'YYYY-MM-DD'), 
    TO_DATE('2025-02-15', 'YYYY-MM-DD'), 
    0, 
    '디지털 마케팅 플랫폼 캠페인 관리 모듈 개발', 
    '디지털 마케팅 플랫폼의 캠페인 관리 모듈 개발 작업', 
    'seo.in_su88@kakao.com', 
    '190'
);

-- 열두 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2025-02-16', 'YYYY-MM-DD'), 
    TO_DATE('2025-02-28', 'YYYY-MM-DD'), 
    0, 
    '통합 커뮤니케이션 시스템 안정화', 
    '통합 커뮤니케이션 시스템의 안정화 작업', 
    'kwon.ho95@naver.com', 
    '191'
);

-- 열세 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2025-03-01', 'YYYY-MM-DD'), 
    TO_DATE('2025-03-15', 'YYYY-MM-DD'), 
    0, 
    '리얼타임 데이터 분석 시스템 배포', 
    '리얼타임 데이터 분석 시스템의 배포 준비 완료', 
    'kim.joo87@daum.net', 
    '192'
);

-- 열네 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2025-03-16', 'YYYY-MM-DD'), 
    TO_DATE('2025-03-31', 'YYYY-MM-DD'), 
    0, 
    '사이버 보안 솔루션 업그레이드', 
    '사이버 보안 솔루션의 최신 기술 적용 및 업그레이드', 
    'choi.ahn90@outlook.com', 
    '193'
);

-- 열다섯 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2025-04-01', 'YYYY-MM-DD'), 
    TO_DATE('2025-04-15', 'YYYY-MM-DD'), 
    0, 
    '스마트 홈 시스템 테스트', 
    '스마트 홈 시스템의 기능 및 성능 테스트', 
    'lee_yunjae92@hotmail.com', 
    '194'
);

-- 열여섯 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2025-04-16', 'YYYY-MM-DD'), 
    TO_DATE('2025-04-30', 'YYYY-MM-DD'), 
    0, 
    '고객 관리 시스템 유지보수', 
    '고객 관리 시스템의 유지보수 작업 및 추가 기능 개발', 
    'kang_min_su89@gmail.com', 
    '181'
);

-- 열일곱 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2025-05-01', 'YYYY-MM-DD'), 
    TO_DATE('2025-05-15', 'YYYY-MM-DD'), 
    0, 
    '문서 관리 시스템 업그레이드', 
    '문서 관리 시스템의 버전 업그레이드 및 개선 작업', 
    'park.haesoo97@yahoo.com', 
    '182'
);

-- 열여덟 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2025-05-16', 'YYYY-MM-DD'), 
    TO_DATE('2025-05-31', 'YYYY-MM-DD'), 
    0, 
    '채팅 애플리케이션 보안 점검', 
    '채팅 애플리케이션의 보안 점검 및 취약점 수정', 
    'kim.youjin96@naver.com', 
    '183'
);

-- 열아홉 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2025-06-01', 'YYYY-MM-DD'), 
    TO_DATE('2025-06-15', 'YYYY-MM-DD'), 
    0, 
    '지능형 검색 시스템 성능 최적화', 
    '지능형 검색 시스템의 성능 최적화 작업', 
    'noh_ahra99@daum.net', 
    '184'
);

-- 스무 번째 일정
INSERT INTO "JH"."SCHEDULE" 
(
    "SID", 
    "START_DATE", 
    "END_DATE", 
    "ENDYN", 
    "TITLE", 
    "DESCRIPTION", 
    "EMAIL", 
    "PID"
)
VALUES 
(
    'SID' || LPAD(SID_SEQ.NEXTVAL, 5, '0'), 
    TO_DATE('2025-06-16', 'YYYY-MM-DD'), 
    TO_DATE('2025-06-30', 'YYYY-MM-DD'), 
    0, 
    '온라인 교육 플랫폼 확장', 
    '온라인 교육 플랫폼의 새로운 기능 추가 및 확장 작업', 
    'jung_sung94@gmail.com', 
    '185'
);

-- 열한 번째 일정부터 열두 번째 일정까지 추가
-- 동일한 형식으로 일정 데이터를 생성하고 추가할 수 있습니다.
