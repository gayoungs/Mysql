SELECT @@autocommit;
SET AUTOCOMMIT = 0; #해제

CREATE TABLE PRODUCT_CATEGORY(
	CATEGORY_ID INT PRIMARY KEY AUTO_INCREMENT,
    GROUP_ID VARCHAR(10),
    CATEGORY_LV INT, ##1,2,3
    CATEGORY_NM VARCHAR(100), ##대분류중분류소분류
    CATEGORY_DETAIL_LV INT, ##ORDER순서
    CATEGORY_DETAIL_NM VARCHAR(100), ##이름
    CATEGORY_PARENT_LV INT , ##1,2,3에 대한 부모컬럼
    CATEGORY_DETAIL_PARENT_LV INT ##ORDER순서에 대한 부모컬럼
);



COMMIT;
################################################################################################################################################
# 등록화면에서 처음 가져올 때
SELECT * FROM PRODUCT_CATEGORY;
SELECT * FROM PRODUCT_CATEGORY WHERE CATEGORY_LV = 1;
# 두번째 가져올 때 (GROUP_ID, CATEGORY_PARENT_LV전달)
SELECT * FROM PRODUCT_CATEGORY WHERE GROUP_ID = 'A' AND CATEGORY_PARENT_LV = 1 AND CATEGORY_DETAIL_PARENT_LV = 1;
# 세번째 가져올 때  (GROUP_ID, CATEGORY_PARENT_LV전달)
SELECT * FROM PRODUCT_CATEGORY WHERE GROUP_ID = 'A' AND CATEGORY_PARENT_LV = 2 AND CATEGORY_DETAIL_PARENT_LV = 1;
SELECT * FROM PRODUCT_CATEGORY WHERE GROUP_ID = 'A' AND CATEGORY_PARENT_LV = 2 AND CATEGORY_DETAIL_PARENT_LV = 2;


SELECT
	   #A1.*,
       #A2.CATEGORY_DETAIL_NM,
       #A3.CATEGORY_DETAIL_NM,
	   #CONCAT(A1.group_ID, A1.CATEGORY_ID, A1.category_LV,  A1.category_detail_LV) AS CATEGORY_KEY, ##카테고리 키
       CONCAT(A1.group_ID, A1.CATEGORY_ID) AS CATEGORY_KEY, ##카테고리 키 (그룹 + 키 형태로 카테고리분류)
 	   CASE A1.category_parent_LV
 	        WHEN 0 THEN A1.category_detail_NM
 			WHEN 1 THEN CONCAT(A2.category_detail_NM,' > ', A1.category_detail_NM)
 			WHEN 2 THEN CONCAT(A3.category_detail_NM, ' > ', A2.category_detail_NM,' > ', A1.category_detail_NM)
 	   END as CATEGORY_NAV
FROM PRODUCT_CATEGORY A1
LEFT OUTER JOIN PRODUCT_CATEGORY A2
ON A1.CATEGORY_PARENT_LV = A2.CATEGORY_LV AND A1.CATEGORY_DETAIL_PARENT_LV = A2.CATEGORY_DETAIL_LV AND A1.GROUP_ID = A2.GROUP_ID
LEFT OUTER JOIN PRODUCT_CATEGORY A3
ON A2.CATEGORY_PARENT_LV = A3.CATEGORY_LV AND A2.CATEGORY_DETAIL_PARENT_LV = A3.CATEGORY_DETAIL_LV
ORDER BY CATEGORY_NAV ASC;
####################################################################################################################

#####2023.08.03수업#####
SELECT #A1.CATEGORY_PARENT_LV,
	   #A1.CATEGORY_DETAIL_NM,
	   #A2.CATEGORY_DETAIL_NM,
       #A3.CATEGORY_DETAIL_NM,
       CASE A1.CATEGORY_PARENT_LV
			WHEN 0 THEN A1.CATEGORY_DETAIL_NM
            WHEN 1 THEN CONCAT(A2.CATEGORY_DETAIL_NM, ' > ', A1.CATEGORY_DETAIL_NM)
            WHEN 2 THEN CONCAT(A3.CATEGORY_DETAIL_NM, ' > ', A2.CATEGORY_DETAIL_NM, ' > ', A1.CATEGORY_DETAIL_NM)
		END AS CATEGORY_NAV,
        CONCAT(A1.CATEGORY_ID, A1.CATEGORY_ID) AS CATEGORY_KEY
FROM PRODUCT_CATEGORY A1
LEFT JOIN PRODUCT_CATEGORY A2
ON A1.CATEGORY_PARENT_LV = A2.CATEGORY_LV AND A1.CATEGORY_DETAIL_PARENT_LV = A2.CATEGORY_DETAIL_LV AND A1.GROUP_ID = A2.GROUP_ID
LEFT JOIN PRODUCT_CATEGORY A3
ON A2.CATEGORY_PARENT_LV = A3.CATEGORY_LV AND A2.CATEGORY_DETAIL_LV = A3.CATEGORY_DETAIL_LV; 

SELECT * FROM PRODUCT;

select * from product order by prod_id desc;


############################################################################################################
#################################################데이터######################################################
## CTRL + SHIFT + 엔터

################첫번쨰 카테고리#################
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('A', 1, '대분류', 1, '패션뷰티', 0, 0);
       
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('A', 2, '중분류', 1, '여성패션', 1, 1);
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('A', 2, '중분류', 2, '남성패션', 1, 1);
       
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('A', 3, '소분류', 1, '의류', 2, 1);       
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('A', 3, '소분류', 2, '속옷/잠옷', 2, 1); 						
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('A', 3, '소분류', 3, '신발', 2, 1); 
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('A', 3, '소분류', 4, '잡화/가방', 2, 1); 

INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('A', 3, '소분류', 1, '(남)의류', 2, 2);       
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('A', 3, '소분류', 2, '(남)속옷/잠옷', 2, 2); 						
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('A', 3, '소분류', 3, '(남)신발', 2, 2); 
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('A', 3, '소분류', 4, '(남)잡화/가방', 2, 2); 


################두번쨰 카테고리#################
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 1, '대분류', 2, '가전디지털', 0, 0);

### 2단 데이터       
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 2, '중분류', 1, '생활가전', 1, 2);
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 2, '중분류', 2, '주방가전', 1, 2);
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 2, '중분류', 3, '데스크톱', 1, 2);

### 3단 데이터
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 1, '공기청정기', 2, 1);       
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 2, '다리미/재봉/보풀', 2, 1); 						
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 3, '비데/온수기', 2, 1); 
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 4, '전동칫솔/살균기', 2, 1); 

INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 1, '전기밥솥', 2, 2);       
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 2, '전자레인지', 2, 2); 						
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 3, '가스레인지', 2, 2); 
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 4, '냉장고', 2, 2); 
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 5, '식기세척기', 2, 2); 


INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 1, '브랜드', 2, 3);       
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 2, '일체형', 2, 3); 						
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 3, '조립', 2, 3); 
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('B', 3, '소분류', 4, '미니', 2, 3);
       
################세번쨰 카테고리#################  
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 1, '대분류', 3, '스포츠/레저', 0, 0);

### 2단 데이터       
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 2, '중분류', 1, '수영', 1, 3);
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 2, '중분류', 2, '골프', 1, 3);
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 2, '중분류', 3, '자전거', 1, 3);

### 3단 데이터
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 1, '실내수영복', 2, 1);       
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 2, '비치웨어/래쉬가드', 2, 1); 						
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 3, '수영용품', 2, 1); 
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 4, '물놀이용품', 2, 1); 

INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 1, '골프클럽', 2, 2);       
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 2, '골프백', 2, 2); 						
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 3, '골프웨어', 2, 2); 
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 4, '골프장갑', 2, 2); 
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 5, '골프화', 2, 2); 


INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 1, '자전거', 2, 3);       
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 2, '보호장비', 2, 3); 						
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 3, '악세사리', 2, 3); 
INSERT INTO PRODUCT_CATEGORY(GROUP_ID, CATEGORY_LV, CATEGORY_NM, CATEGORY_DETAIL_LV, CATEGORY_DETAIL_NM, CATEGORY_PARENT_LV, CATEGORY_DETAIL_PARENT_LV) 
	   VALUES ('C', 3, '소분류', 4, '자전거부품', 2, 3);
     