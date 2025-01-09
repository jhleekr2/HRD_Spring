DROP TABLE usertb CASCADE CONSTRAINTS;

CREATE TABLE usertb (
	userno NUMBER,
	userid VARCHAR2(500),
	userpw VARCHAR2(500),
	usernick VARCHAR2(500)
);

ALTER TABLE usertb DROP CONSTRAINT usertb_pk;
ALTER TABLE usertb ADD CONSTRAINT usertb_pk PRIMARY KEY ( userno );

ALTER TABLE usertb DROP CONSTRAINT usertb_uk;
ALTER TABLE usertb ADD CONSTRAINT usertb_uk UNIQUE ( userid );

DROP SEQUENCE usertb_seq;
CREATE SEQUENCE usertb_seq;

INSERT INTO usertb ( userno, userid, userpw, usernick )
VALUES ( usertb_seq.nextval, 'apple', 'apple1', '사과');
INSERT INTO usertb ( userno, userid, userpw, usernick )
VALUES ( usertb_seq.nextval, 'banana', 'banana1', '바나나');
COMMIT;

INSERT INTO usertb ( userno, userid, userpw, usernick )
VALUES ( usertb_seq.nextval, 'admin', 'admin1', '관리자');
COMMIT;

SELECT * FROM usertb;
