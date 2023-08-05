############################파일업로드 테이블############################
CREATE TABLE PRODUCT_UPLOAD (
   UPLOAD_NO INT PRIMARY KEY auto_increment,
   FILENAME varchar(100) not null, ##실제파일명
   FILEPATH varchar(100) not null, ##폴더명
   UUID varchar(50) not null, ##UUID명
   REGDATE TIMESTAMP default now(),
   PROD_ID INT, ##FK
   PROD_WRITER VARCHAR(20) ##FK
);

select max(prod_id) from product where prod_writer = 'admin';

select * from product_upload;