CREATE TABLE BUSINESSTEST (
    BN_ID VARCHAR(50) PRIMARY KEY,
    BN_PW VARCHAR(20) NOT NULL,
    BN_NAME VARCHAR(50) NOT NULL,
    BN_TITLE VARCHAR(50) NOT NULL,
    BN_NUM VARCHAR(50) NOT NULL,
    BN_PHONE VARCHAR(50) NOT NULL
);
SELECT * FROM BUSINESSTEST;
SET SQL_SAFE_UPDATES=0;
DELETE FROM BUSINESSTEST;



INSERT INTO BUSINESSTEST (BN_ID, BN_PW, BN_NAME, BN_TITLE, BN_NUM, BN_PHONE)
VALUES
    ('ID1', 'password1', '회사 A', '대표', '123-456-7890','010-1234-1234'),
    ('id2', 'password2', 'Company B', '매니저','987-654-3210','010-4567-4567'),
    ('ID3', 'password3', 'Company C', '이사', '555-123-4567', '010-1234-1123');