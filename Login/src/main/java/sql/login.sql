DROP TABLE LOGINTB;
DROP SEQUENCE login_seq;

CREATE TABLE LOGINTB (
	NO NUMBER PRIMARY KEY,
	id VARCHAR2(50) not NULL,
	pw VARCHAR2(50) not NULL,
	email VARCHAR2(200),
	phone VARCHAR2(50)
)

CREATE SEQUENCE login_seq;

INSERT INTO logintb ( no, id, pw )
VALUES ( login_seq.nextval,  'TEST', 'TEST');

INSERT INTO logintb ( no, id, pw )
VALUES ( login_seq.nextval,  'a', 'b');

SELECT * FROM logintb;