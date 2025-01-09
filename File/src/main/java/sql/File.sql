DROP TABLE FileTest;
CREATE TABLE FileTest (
	fileno NUMBER PRIMARY KEY,
	title VARCHAR2(1000),
	origin_name VARCHAR2(4000),
	stored_name VARCHAR2(4000)
);

DROP SEQUENCE filetest_seq;
CREATE SEQUENCE filetest_seq;