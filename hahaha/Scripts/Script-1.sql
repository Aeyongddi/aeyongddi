SELECT * FROM CUSTOMERQNA;
INSERT INTO CUSTOMERQNA values(customerqna_seq.nextval, 'ZR6PBP6K', '항공권 예약은 어떻게 하나요?', '항공권 예약은 어떻게 하나요?, 예약을 변경하려면 어떻게 해야 하나요?
, 예약 취소는 어떻게 하나요?, 항공권 예약 확인서는 어디에서 받을 수 있나요? ','','미응답');
SELECT sequence_name, last_number 
FROM user_sequences 
WHERE sequence_name = 'CUSTOMERQNA_SEQ';
customerqna_seq.nextval;
DELETE  customerqna;

DROP SEQUENCE customerqna_seq; 
CREATE SEQUENCE customerqna_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;
    COMMIT;
 SELECT * FROM CUSTOMER;

 