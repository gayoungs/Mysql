CREATE TABLE MEMO(
   MNO INT PRIMARY KEY AUTO_INCREMENT,
   MEMO VARCHAR(200) NOT NULL,
   PHONE VARCHAR(30),
   PW VARCHAR(4),
   SECRET CHAR(1) CHECK(SECRET IN ('y', 'n'))
); 