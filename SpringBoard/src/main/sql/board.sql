-- Quiz 1~2

DROP TABLE boardfile;
DROP TABLE board;

-- 게시판 테이블
CREATE TABLE board (
    board_no NUMBER --글번호
    , title VARCHAR2(100) --제목
    , content VARCHAR2(4000) --본문
    , writer_id VARCHAR2(500) --작성자 아이디
    , writer_nick VARCHAR2(500) --작성자 닉네임
    , hit NUMBER DEFAULT 0 --조회수
    , write_date DATE DEFAULT sysdate --최초작성일
);

--게시판 테이블 기본키 삭제
ALTER TABLE board
DROP CONSTRAINT board_pk;

--게시판 테이블 기본키 추가
ALTER TABLE board
ADD CONSTRAINT board_pk PRIMARY KEY (board_no);

--게시판 테이블 시퀀스
DROP SEQUENCE board_seq;
CREATE SEQUENCE board_seq;

SELECT * FROM board;

INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목0', '본문0', '작성자아이디0', '작성자닉네임0' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목1', '본문1', '작성자아이디1', '작성자닉네임1' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목2', '본문2', '작성자아이디2', '작성자닉네임2' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목3', '본문3', '작성자아이디3', '작성자닉네임3' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목4', '본문4', '작성자아이디4', '작성자닉네임4' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목5', '본문5', '작성자아이디5', '작성자닉네임5' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목6', '본문6', '작성자아이디6', '작성자닉네임6' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목7', '본문7', '작성자아이디7', '작성자닉네임7' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목8', '본문8', '작성자아이디8', '작성자닉네임8' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목9', '본문9', '작성자아이디9', '작성자닉네임9' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목10', '본문10', '작성자아이디10', '작성자닉네임10' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목11', '본문11', '작성자아이디11', '작성자닉네임11' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목12', '본문12', '작성자아이디12', '작성자닉네임12' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목13', '본문13', '작성자아이디13', '작성자닉네임13' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목14', '본문14', '작성자아이디14', '작성자닉네임14' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목15', '본문15', '작성자아이디15', '작성자닉네임15' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목16', '본문16', '작성자아이디16', '작성자닉네임16' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목17', '본문17', '작성자아이디17', '작성자닉네임17' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목18', '본문18', '작성자아이디18', '작성자닉네임18' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목19', '본문19', '작성자아이디19', '작성자닉네임19' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목20', '본문20', '작성자아이디20', '작성자닉네임20' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목21', '본문21', '작성자아이디21', '작성자닉네임21' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목22', '본문22', '작성자아이디22', '작성자닉네임22' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목23', '본문23', '작성자아이디23', '작성자닉네임23' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목24', '본문24', '작성자아이디24', '작성자닉네임24' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목25', '본문25', '작성자아이디25', '작성자닉네임25' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목26', '본문26', '작성자아이디26', '작성자닉네임26' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목27', '본문27', '작성자아이디27', '작성자닉네임27' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목28', '본문28', '작성자아이디28', '작성자닉네임28' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목29', '본문29', '작성자아이디29', '작성자닉네임29' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목30', '본문30', '작성자아이디30', '작성자닉네임30' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목31', '본문31', '작성자아이디31', '작성자닉네임31' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목32', '본문32', '작성자아이디32', '작성자닉네임32' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목33', '본문33', '작성자아이디33', '작성자닉네임33' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목34', '본문34', '작성자아이디34', '작성자닉네임34' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목35', '본문35', '작성자아이디35', '작성자닉네임35' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목36', '본문36', '작성자아이디36', '작성자닉네임36' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목37', '본문37', '작성자아이디37', '작성자닉네임37' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목38', '본문38', '작성자아이디38', '작성자닉네임38' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목39', '본문39', '작성자아이디39', '작성자닉네임39' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목40', '본문40', '작성자아이디40', '작성자닉네임40' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목41', '본문41', '작성자아이디41', '작성자닉네임41' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목42', '본문42', '작성자아이디42', '작성자닉네임42' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목43', '본문43', '작성자아이디43', '작성자닉네임43' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목44', '본문44', '작성자아이디44', '작성자닉네임44' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목45', '본문45', '작성자아이디45', '작성자닉네임45' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목46', '본문46', '작성자아이디46', '작성자닉네임46' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목47', '본문47', '작성자아이디47', '작성자닉네임47' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목48', '본문48', '작성자아이디48', '작성자닉네임48' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목49', '본문49', '작성자아이디49', '작성자닉네임49' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목50', '본문50', '작성자아이디50', '작성자닉네임50' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목51', '본문51', '작성자아이디51', '작성자닉네임51' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목52', '본문52', '작성자아이디52', '작성자닉네임52' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목53', '본문53', '작성자아이디53', '작성자닉네임53' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목54', '본문54', '작성자아이디54', '작성자닉네임54' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목55', '본문55', '작성자아이디55', '작성자닉네임55' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목56', '본문56', '작성자아이디56', '작성자닉네임56' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목57', '본문57', '작성자아이디57', '작성자닉네임57' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목58', '본문58', '작성자아이디58', '작성자닉네임58' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목59', '본문59', '작성자아이디59', '작성자닉네임59' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목60', '본문60', '작성자아이디60', '작성자닉네임60' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목61', '본문61', '작성자아이디61', '작성자닉네임61' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목62', '본문62', '작성자아이디62', '작성자닉네임62' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목63', '본문63', '작성자아이디63', '작성자닉네임63' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목64', '본문64', '작성자아이디64', '작성자닉네임64' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목65', '본문65', '작성자아이디65', '작성자닉네임65' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목66', '본문66', '작성자아이디66', '작성자닉네임66' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목67', '본문67', '작성자아이디67', '작성자닉네임67' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목68', '본문68', '작성자아이디68', '작성자닉네임68' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목69', '본문69', '작성자아이디69', '작성자닉네임69' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목70', '본문70', '작성자아이디70', '작성자닉네임70' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목71', '본문71', '작성자아이디71', '작성자닉네임71' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목72', '본문72', '작성자아이디72', '작성자닉네임72' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목73', '본문73', '작성자아이디73', '작성자닉네임73' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목74', '본문74', '작성자아이디74', '작성자닉네임74' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목75', '본문75', '작성자아이디75', '작성자닉네임75' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목76', '본문76', '작성자아이디76', '작성자닉네임76' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목77', '본문77', '작성자아이디77', '작성자닉네임77' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목78', '본문78', '작성자아이디78', '작성자닉네임78' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목79', '본문79', '작성자아이디79', '작성자닉네임79' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목80', '본문80', '작성자아이디80', '작성자닉네임80' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목81', '본문81', '작성자아이디81', '작성자닉네임81' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목82', '본문82', '작성자아이디82', '작성자닉네임82' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목83', '본문83', '작성자아이디83', '작성자닉네임83' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목84', '본문84', '작성자아이디84', '작성자닉네임84' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목85', '본문85', '작성자아이디85', '작성자닉네임85' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목86', '본문86', '작성자아이디86', '작성자닉네임86' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목87', '본문87', '작성자아이디87', '작성자닉네임87' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목88', '본문88', '작성자아이디88', '작성자닉네임88' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목89', '본문89', '작성자아이디89', '작성자닉네임89' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목90', '본문90', '작성자아이디90', '작성자닉네임90' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목91', '본문91', '작성자아이디91', '작성자닉네임91' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목92', '본문92', '작성자아이디92', '작성자닉네임92' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목93', '본문93', '작성자아이디93', '작성자닉네임93' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목94', '본문94', '작성자아이디94', '작성자닉네임94' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목95', '본문95', '작성자아이디95', '작성자닉네임95' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목96', '본문96', '작성자아이디96', '작성자닉네임96' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목97', '본문97', '작성자아이디97', '작성자닉네임97' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목98', '본문98', '작성자아이디98', '작성자닉네임98' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목99', '본문99', '작성자아이디99', '작성자닉네임99' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목100', '본문100', '작성자아이디100', '작성자닉네임100' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목101', '본문101', '작성자아이디101', '작성자닉네임101' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목102', '본문102', '작성자아이디102', '작성자닉네임102' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목103', '본문103', '작성자아이디103', '작성자닉네임103' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목104', '본문104', '작성자아이디104', '작성자닉네임104' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목105', '본문105', '작성자아이디105', '작성자닉네임105' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목106', '본문106', '작성자아이디106', '작성자닉네임106' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목107', '본문107', '작성자아이디107', '작성자닉네임107' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목108', '본문108', '작성자아이디108', '작성자닉네임108' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목109', '본문109', '작성자아이디109', '작성자닉네임109' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목110', '본문110', '작성자아이디110', '작성자닉네임110' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목111', '본문111', '작성자아이디111', '작성자닉네임111' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목112', '본문112', '작성자아이디112', '작성자닉네임112' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목113', '본문113', '작성자아이디113', '작성자닉네임113' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목114', '본문114', '작성자아이디114', '작성자닉네임114' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목115', '본문115', '작성자아이디115', '작성자닉네임115' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목116', '본문116', '작성자아이디116', '작성자닉네임116' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목117', '본문117', '작성자아이디117', '작성자닉네임117' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목118', '본문118', '작성자아이디118', '작성자닉네임118' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목119', '본문119', '작성자아이디119', '작성자닉네임119' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목120', '본문120', '작성자아이디120', '작성자닉네임120' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목121', '본문121', '작성자아이디121', '작성자닉네임121' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목122', '본문122', '작성자아이디122', '작성자닉네임122' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목123', '본문123', '작성자아이디123', '작성자닉네임123' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목124', '본문124', '작성자아이디124', '작성자닉네임124' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목125', '본문125', '작성자아이디125', '작성자닉네임125' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목126', '본문126', '작성자아이디126', '작성자닉네임126' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목127', '본문127', '작성자아이디127', '작성자닉네임127' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목128', '본문128', '작성자아이디128', '작성자닉네임128' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목129', '본문129', '작성자아이디129', '작성자닉네임129' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목130', '본문130', '작성자아이디130', '작성자닉네임130' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목131', '본문131', '작성자아이디131', '작성자닉네임131' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목132', '본문132', '작성자아이디132', '작성자닉네임132' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목133', '본문133', '작성자아이디133', '작성자닉네임133' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목134', '본문134', '작성자아이디134', '작성자닉네임134' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목135', '본문135', '작성자아이디135', '작성자닉네임135' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목136', '본문136', '작성자아이디136', '작성자닉네임136' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목137', '본문137', '작성자아이디137', '작성자닉네임137' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목138', '본문138', '작성자아이디138', '작성자닉네임138' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목139', '본문139', '작성자아이디139', '작성자닉네임139' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목140', '본문140', '작성자아이디140', '작성자닉네임140' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목141', '본문141', '작성자아이디141', '작성자닉네임141' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목142', '본문142', '작성자아이디142', '작성자닉네임142' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목143', '본문143', '작성자아이디143', '작성자닉네임143' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목144', '본문144', '작성자아이디144', '작성자닉네임144' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목145', '본문145', '작성자아이디145', '작성자닉네임145' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목146', '본문146', '작성자아이디146', '작성자닉네임146' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목147', '본문147', '작성자아이디147', '작성자닉네임147' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목148', '본문148', '작성자아이디148', '작성자닉네임148' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목149', '본문149', '작성자아이디149', '작성자닉네임149' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목150', '본문150', '작성자아이디150', '작성자닉네임150' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목151', '본문151', '작성자아이디151', '작성자닉네임151' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목152', '본문152', '작성자아이디152', '작성자닉네임152' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목153', '본문153', '작성자아이디153', '작성자닉네임153' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목154', '본문154', '작성자아이디154', '작성자닉네임154' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목155', '본문155', '작성자아이디155', '작성자닉네임155' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목156', '본문156', '작성자아이디156', '작성자닉네임156' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목157', '본문157', '작성자아이디157', '작성자닉네임157' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목158', '본문158', '작성자아이디158', '작성자닉네임158' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목159', '본문159', '작성자아이디159', '작성자닉네임159' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목160', '본문160', '작성자아이디160', '작성자닉네임160' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목161', '본문161', '작성자아이디161', '작성자닉네임161' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목162', '본문162', '작성자아이디162', '작성자닉네임162' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목163', '본문163', '작성자아이디163', '작성자닉네임163' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목164', '본문164', '작성자아이디164', '작성자닉네임164' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목165', '본문165', '작성자아이디165', '작성자닉네임165' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목166', '본문166', '작성자아이디166', '작성자닉네임166' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목167', '본문167', '작성자아이디167', '작성자닉네임167' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목168', '본문168', '작성자아이디168', '작성자닉네임168' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목169', '본문169', '작성자아이디169', '작성자닉네임169' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목170', '본문170', '작성자아이디170', '작성자닉네임170' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목171', '본문171', '작성자아이디171', '작성자닉네임171' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목172', '본문172', '작성자아이디172', '작성자닉네임172' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목173', '본문173', '작성자아이디173', '작성자닉네임173' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목174', '본문174', '작성자아이디174', '작성자닉네임174' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목175', '본문175', '작성자아이디175', '작성자닉네임175' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목176', '본문176', '작성자아이디176', '작성자닉네임176' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목177', '본문177', '작성자아이디177', '작성자닉네임177' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목178', '본문178', '작성자아이디178', '작성자닉네임178' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목179', '본문179', '작성자아이디179', '작성자닉네임179' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목180', '본문180', '작성자아이디180', '작성자닉네임180' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목181', '본문181', '작성자아이디181', '작성자닉네임181' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목182', '본문182', '작성자아이디182', '작성자닉네임182' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목183', '본문183', '작성자아이디183', '작성자닉네임183' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목184', '본문184', '작성자아이디184', '작성자닉네임184' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목185', '본문185', '작성자아이디185', '작성자닉네임185' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목186', '본문186', '작성자아이디186', '작성자닉네임186' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목187', '본문187', '작성자아이디187', '작성자닉네임187' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목188', '본문188', '작성자아이디188', '작성자닉네임188' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목189', '본문189', '작성자아이디189', '작성자닉네임189' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목190', '본문190', '작성자아이디190', '작성자닉네임190' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목191', '본문191', '작성자아이디191', '작성자닉네임191' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목192', '본문192', '작성자아이디192', '작성자닉네임192' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목193', '본문193', '작성자아이디193', '작성자닉네임193' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목194', '본문194', '작성자아이디194', '작성자닉네임194' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목195', '본문195', '작성자아이디195', '작성자닉네임195' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목196', '본문196', '작성자아이디196', '작성자닉네임196' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목197', '본문197', '작성자아이디197', '작성자닉네임197' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목198', '본문198', '작성자아이디198', '작성자닉네임198' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목199', '본문199', '작성자아이디199', '작성자닉네임199' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목200', '본문200', '작성자아이디200', '작성자닉네임200' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목201', '본문201', '작성자아이디201', '작성자닉네임201' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목202', '본문202', '작성자아이디202', '작성자닉네임202' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목203', '본문203', '작성자아이디203', '작성자닉네임203' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목204', '본문204', '작성자아이디204', '작성자닉네임204' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목205', '본문205', '작성자아이디205', '작성자닉네임205' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목206', '본문206', '작성자아이디206', '작성자닉네임206' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목207', '본문207', '작성자아이디207', '작성자닉네임207' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목208', '본문208', '작성자아이디208', '작성자닉네임208' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목209', '본문209', '작성자아이디209', '작성자닉네임209' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목210', '본문210', '작성자아이디210', '작성자닉네임210' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목211', '본문211', '작성자아이디211', '작성자닉네임211' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목212', '본문212', '작성자아이디212', '작성자닉네임212' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목213', '본문213', '작성자아이디213', '작성자닉네임213' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목214', '본문214', '작성자아이디214', '작성자닉네임214' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목215', '본문215', '작성자아이디215', '작성자닉네임215' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목216', '본문216', '작성자아이디216', '작성자닉네임216' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목217', '본문217', '작성자아이디217', '작성자닉네임217' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목218', '본문218', '작성자아이디218', '작성자닉네임218' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목219', '본문219', '작성자아이디219', '작성자닉네임219' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목220', '본문220', '작성자아이디220', '작성자닉네임220' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목221', '본문221', '작성자아이디221', '작성자닉네임221' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목222', '본문222', '작성자아이디222', '작성자닉네임222' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목223', '본문223', '작성자아이디223', '작성자닉네임223' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목224', '본문224', '작성자아이디224', '작성자닉네임224' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목225', '본문225', '작성자아이디225', '작성자닉네임225' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목226', '본문226', '작성자아이디226', '작성자닉네임226' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목227', '본문227', '작성자아이디227', '작성자닉네임227' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목228', '본문228', '작성자아이디228', '작성자닉네임228' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목229', '본문229', '작성자아이디229', '작성자닉네임229' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목230', '본문230', '작성자아이디230', '작성자닉네임230' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목231', '본문231', '작성자아이디231', '작성자닉네임231' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목232', '본문232', '작성자아이디232', '작성자닉네임232' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목233', '본문233', '작성자아이디233', '작성자닉네임233' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목234', '본문234', '작성자아이디234', '작성자닉네임234' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목235', '본문235', '작성자아이디235', '작성자닉네임235' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목236', '본문236', '작성자아이디236', '작성자닉네임236' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목237', '본문237', '작성자아이디237', '작성자닉네임237' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목238', '본문238', '작성자아이디238', '작성자닉네임238' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목239', '본문239', '작성자아이디239', '작성자닉네임239' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목240', '본문240', '작성자아이디240', '작성자닉네임240' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목241', '본문241', '작성자아이디241', '작성자닉네임241' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목242', '본문242', '작성자아이디242', '작성자닉네임242' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목243', '본문243', '작성자아이디243', '작성자닉네임243' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목244', '본문244', '작성자아이디244', '작성자닉네임244' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목245', '본문245', '작성자아이디245', '작성자닉네임245' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목246', '본문246', '작성자아이디246', '작성자닉네임246' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목247', '본문247', '작성자아이디247', '작성자닉네임247' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목248', '본문248', '작성자아이디248', '작성자닉네임248' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목249', '본문249', '작성자아이디249', '작성자닉네임249' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목250', '본문250', '작성자아이디250', '작성자닉네임250' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목251', '본문251', '작성자아이디251', '작성자닉네임251' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목252', '본문252', '작성자아이디252', '작성자닉네임252' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목253', '본문253', '작성자아이디253', '작성자닉네임253' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목254', '본문254', '작성자아이디254', '작성자닉네임254' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목255', '본문255', '작성자아이디255', '작성자닉네임255' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목256', '본문256', '작성자아이디256', '작성자닉네임256' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목257', '본문257', '작성자아이디257', '작성자닉네임257' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목258', '본문258', '작성자아이디258', '작성자닉네임258' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목259', '본문259', '작성자아이디259', '작성자닉네임259' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목260', '본문260', '작성자아이디260', '작성자닉네임260' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목261', '본문261', '작성자아이디261', '작성자닉네임261' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목262', '본문262', '작성자아이디262', '작성자닉네임262' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목263', '본문263', '작성자아이디263', '작성자닉네임263' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목264', '본문264', '작성자아이디264', '작성자닉네임264' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목265', '본문265', '작성자아이디265', '작성자닉네임265' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목266', '본문266', '작성자아이디266', '작성자닉네임266' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목267', '본문267', '작성자아이디267', '작성자닉네임267' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목268', '본문268', '작성자아이디268', '작성자닉네임268' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목269', '본문269', '작성자아이디269', '작성자닉네임269' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목270', '본문270', '작성자아이디270', '작성자닉네임270' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목271', '본문271', '작성자아이디271', '작성자닉네임271' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목272', '본문272', '작성자아이디272', '작성자닉네임272' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목273', '본문273', '작성자아이디273', '작성자닉네임273' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목274', '본문274', '작성자아이디274', '작성자닉네임274' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목275', '본문275', '작성자아이디275', '작성자닉네임275' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목276', '본문276', '작성자아이디276', '작성자닉네임276' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목277', '본문277', '작성자아이디277', '작성자닉네임277' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목278', '본문278', '작성자아이디278', '작성자닉네임278' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목279', '본문279', '작성자아이디279', '작성자닉네임279' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목280', '본문280', '작성자아이디280', '작성자닉네임280' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목281', '본문281', '작성자아이디281', '작성자닉네임281' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목282', '본문282', '작성자아이디282', '작성자닉네임282' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목283', '본문283', '작성자아이디283', '작성자닉네임283' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목284', '본문284', '작성자아이디284', '작성자닉네임284' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목285', '본문285', '작성자아이디285', '작성자닉네임285' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목286', '본문286', '작성자아이디286', '작성자닉네임286' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목287', '본문287', '작성자아이디287', '작성자닉네임287' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목288', '본문288', '작성자아이디288', '작성자닉네임288' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목289', '본문289', '작성자아이디289', '작성자닉네임289' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목290', '본문290', '작성자아이디290', '작성자닉네임290' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목291', '본문291', '작성자아이디291', '작성자닉네임291' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목292', '본문292', '작성자아이디292', '작성자닉네임292' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목293', '본문293', '작성자아이디293', '작성자닉네임293' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목294', '본문294', '작성자아이디294', '작성자닉네임294' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목295', '본문295', '작성자아이디295', '작성자닉네임295' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목296', '본문296', '작성자아이디296', '작성자닉네임296' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목297', '본문297', '작성자아이디297', '작성자닉네임297' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목298', '본문298', '작성자아이디298', '작성자닉네임298' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목299', '본문299', '작성자아이디299', '작성자닉네임299' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목300', '본문300', '작성자아이디300', '작성자닉네임300' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목301', '본문301', '작성자아이디301', '작성자닉네임301' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목302', '본문302', '작성자아이디302', '작성자닉네임302' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목303', '본문303', '작성자아이디303', '작성자닉네임303' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목304', '본문304', '작성자아이디304', '작성자닉네임304' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목305', '본문305', '작성자아이디305', '작성자닉네임305' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목306', '본문306', '작성자아이디306', '작성자닉네임306' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목307', '본문307', '작성자아이디307', '작성자닉네임307' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목308', '본문308', '작성자아이디308', '작성자닉네임308' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목309', '본문309', '작성자아이디309', '작성자닉네임309' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목310', '본문310', '작성자아이디310', '작성자닉네임310' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목311', '본문311', '작성자아이디311', '작성자닉네임311' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목312', '본문312', '작성자아이디312', '작성자닉네임312' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목313', '본문313', '작성자아이디313', '작성자닉네임313' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목314', '본문314', '작성자아이디314', '작성자닉네임314' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목315', '본문315', '작성자아이디315', '작성자닉네임315' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목316', '본문316', '작성자아이디316', '작성자닉네임316' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목317', '본문317', '작성자아이디317', '작성자닉네임317' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목318', '본문318', '작성자아이디318', '작성자닉네임318' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목319', '본문319', '작성자아이디319', '작성자닉네임319' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목320', '본문320', '작성자아이디320', '작성자닉네임320' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목321', '본문321', '작성자아이디321', '작성자닉네임321' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목322', '본문322', '작성자아이디322', '작성자닉네임322' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목323', '본문323', '작성자아이디323', '작성자닉네임323' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목324', '본문324', '작성자아이디324', '작성자닉네임324' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목325', '본문325', '작성자아이디325', '작성자닉네임325' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목326', '본문326', '작성자아이디326', '작성자닉네임326' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목327', '본문327', '작성자아이디327', '작성자닉네임327' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목328', '본문328', '작성자아이디328', '작성자닉네임328' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목329', '본문329', '작성자아이디329', '작성자닉네임329' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목330', '본문330', '작성자아이디330', '작성자닉네임330' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목331', '본문331', '작성자아이디331', '작성자닉네임331' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목332', '본문332', '작성자아이디332', '작성자닉네임332' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목333', '본문333', '작성자아이디333', '작성자닉네임333' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목334', '본문334', '작성자아이디334', '작성자닉네임334' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목335', '본문335', '작성자아이디335', '작성자닉네임335' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목336', '본문336', '작성자아이디336', '작성자닉네임336' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목337', '본문337', '작성자아이디337', '작성자닉네임337' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목338', '본문338', '작성자아이디338', '작성자닉네임338' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목339', '본문339', '작성자아이디339', '작성자닉네임339' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목340', '본문340', '작성자아이디340', '작성자닉네임340' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목341', '본문341', '작성자아이디341', '작성자닉네임341' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목342', '본문342', '작성자아이디342', '작성자닉네임342' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목343', '본문343', '작성자아이디343', '작성자닉네임343' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목344', '본문344', '작성자아이디344', '작성자닉네임344' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목345', '본문345', '작성자아이디345', '작성자닉네임345' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목346', '본문346', '작성자아이디346', '작성자닉네임346' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목347', '본문347', '작성자아이디347', '작성자닉네임347' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목348', '본문348', '작성자아이디348', '작성자닉네임348' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목349', '본문349', '작성자아이디349', '작성자닉네임349' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목350', '본문350', '작성자아이디350', '작성자닉네임350' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목351', '본문351', '작성자아이디351', '작성자닉네임351' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목352', '본문352', '작성자아이디352', '작성자닉네임352' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목353', '본문353', '작성자아이디353', '작성자닉네임353' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목354', '본문354', '작성자아이디354', '작성자닉네임354' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목355', '본문355', '작성자아이디355', '작성자닉네임355' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목356', '본문356', '작성자아이디356', '작성자닉네임356' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목357', '본문357', '작성자아이디357', '작성자닉네임357' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목358', '본문358', '작성자아이디358', '작성자닉네임358' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목359', '본문359', '작성자아이디359', '작성자닉네임359' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목360', '본문360', '작성자아이디360', '작성자닉네임360' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목361', '본문361', '작성자아이디361', '작성자닉네임361' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목362', '본문362', '작성자아이디362', '작성자닉네임362' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목363', '본문363', '작성자아이디363', '작성자닉네임363' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목364', '본문364', '작성자아이디364', '작성자닉네임364' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목365', '본문365', '작성자아이디365', '작성자닉네임365' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목366', '본문366', '작성자아이디366', '작성자닉네임366' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목367', '본문367', '작성자아이디367', '작성자닉네임367' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목368', '본문368', '작성자아이디368', '작성자닉네임368' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목369', '본문369', '작성자아이디369', '작성자닉네임369' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목370', '본문370', '작성자아이디370', '작성자닉네임370' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목371', '본문371', '작성자아이디371', '작성자닉네임371' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목372', '본문372', '작성자아이디372', '작성자닉네임372' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목373', '본문373', '작성자아이디373', '작성자닉네임373' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목374', '본문374', '작성자아이디374', '작성자닉네임374' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목375', '본문375', '작성자아이디375', '작성자닉네임375' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목376', '본문376', '작성자아이디376', '작성자닉네임376' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목377', '본문377', '작성자아이디377', '작성자닉네임377' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목378', '본문378', '작성자아이디378', '작성자닉네임378' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목379', '본문379', '작성자아이디379', '작성자닉네임379' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목380', '본문380', '작성자아이디380', '작성자닉네임380' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목381', '본문381', '작성자아이디381', '작성자닉네임381' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목382', '본문382', '작성자아이디382', '작성자닉네임382' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목383', '본문383', '작성자아이디383', '작성자닉네임383' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목384', '본문384', '작성자아이디384', '작성자닉네임384' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목385', '본문385', '작성자아이디385', '작성자닉네임385' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목386', '본문386', '작성자아이디386', '작성자닉네임386' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목387', '본문387', '작성자아이디387', '작성자닉네임387' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목388', '본문388', '작성자아이디388', '작성자닉네임388' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목389', '본문389', '작성자아이디389', '작성자닉네임389' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목390', '본문390', '작성자아이디390', '작성자닉네임390' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목391', '본문391', '작성자아이디391', '작성자닉네임391' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목392', '본문392', '작성자아이디392', '작성자닉네임392' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목393', '본문393', '작성자아이디393', '작성자닉네임393' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목394', '본문394', '작성자아이디394', '작성자닉네임394' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목395', '본문395', '작성자아이디395', '작성자닉네임395' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목396', '본문396', '작성자아이디396', '작성자닉네임396' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목397', '본문397', '작성자아이디397', '작성자닉네임397' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목398', '본문398', '작성자아이디398', '작성자닉네임398' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목399', '본문399', '작성자아이디399', '작성자닉네임399' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목400', '본문400', '작성자아이디400', '작성자닉네임400' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목401', '본문401', '작성자아이디401', '작성자닉네임401' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목402', '본문402', '작성자아이디402', '작성자닉네임402' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목403', '본문403', '작성자아이디403', '작성자닉네임403' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목404', '본문404', '작성자아이디404', '작성자닉네임404' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목405', '본문405', '작성자아이디405', '작성자닉네임405' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목406', '본문406', '작성자아이디406', '작성자닉네임406' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목407', '본문407', '작성자아이디407', '작성자닉네임407' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목408', '본문408', '작성자아이디408', '작성자닉네임408' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목409', '본문409', '작성자아이디409', '작성자닉네임409' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목410', '본문410', '작성자아이디410', '작성자닉네임410' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목411', '본문411', '작성자아이디411', '작성자닉네임411' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목412', '본문412', '작성자아이디412', '작성자닉네임412' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목413', '본문413', '작성자아이디413', '작성자닉네임413' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목414', '본문414', '작성자아이디414', '작성자닉네임414' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목415', '본문415', '작성자아이디415', '작성자닉네임415' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목416', '본문416', '작성자아이디416', '작성자닉네임416' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목417', '본문417', '작성자아이디417', '작성자닉네임417' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목418', '본문418', '작성자아이디418', '작성자닉네임418' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목419', '본문419', '작성자아이디419', '작성자닉네임419' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목420', '본문420', '작성자아이디420', '작성자닉네임420' );
INSERT INTO board ( board_no, title, content, writer_id, writer_nick ) VALUES ( board_seq.nextval, '제목421', '본문421', '작성자아이디421', '작성자닉네임421' );


SELECT * FROM board
ORDER BY board_no DESC;

commit;

SELECT board_no, title,   content, writer_id writer_nick    FROM Board    ORDER BY board_no DESC;

-- 시퀀스가 꼬였을때 쓸수있는 구문
--ALTER SEQUENCE board_seq INCREMENT BY 1;
--SELECT board_seq.nextval FROM dual;

--DELETE FROM board 
--WHERE (board_no >= 450 AND board_no <=455);
-- Quiz 3

DROP TABLE member;
CREATE TABLE member (
	id VARCHAR2(200), --아이디
	pw VARCHAR2(200) NOT NULL, --비밀번호
	nick VARCHAR2(200) NOT NULL --닉네임
);
ALTER TABLE member DROP CONSTRAINT member_pk;
ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY (id);

DELETE member;
INSERT INTO member ( id, pw, nick ) VALUES ( 'a', 'b', 'c' );
INSERT INTO member ( id, pw, nick ) VALUES ( '1', '2', '3' );
INSERT INTO member ( id, pw, nick ) VALUES ( 'r', 'rr', 'rrr' );
COMMIT;

SELECT * FROM member;

-- Quiz 5
DROP TABLE boardfile;
CREATE TABLE boardfile (
    file_no NUMBER
    , board_no NUMBER
    , origin_name VARCHAR2(500)
    , stored_name VARCHAR2(500) );

DROP SEQUENCE boardfile_seq;
CREATE SEQUENCE boardfile_seq;

ALTER TABLE boardfile
ADD CONSTRAINT boardfile_PK PRIMARY KEY (file_no);

ALTER TABLE boardfile
ADD CONSTRAINT boardfile_FK FOREIGN KEY (board_no)
    REFERENCES board (board_no);

SELECT * FROM boardfile;

-- Quiz 8
DROP TABLE recommend;
CREATE TABLE recommend (
userid VARCHAR2(100) NOT NULL,
boardno NUMBER NOT null);

SELECT * FROM recommend;

-- Quiz 9
DROP TABLE commentTB;
CREATE TABLE commentTB (
	commentno NUMBER primary key,
	boardno NUMBER,
	userid VARCHAR2(100),
	content VARCHAR2(1000),
	write_date DATE default SYSDATE
);

DROP SEQUENCE commentTB_seq;
CREATE SEQUENCE commentTB_seq;

SELECT * FROM commentTB;

-- 테스트 데이터
INSERT into COMMENTTB (commentno, boardno, userid, content) values(commentTB_seq.nextval, 423, 'a', '테스트1');
INSERT into COMMENTTB (commentno, boardno, userid, content) values(commentTB_seq.nextval, 423, 'a', '테스트2');
INSERT into COMMENTTB (commentno, boardno, userid, content) values(commentTB_seq.nextval, 424, 'a', '테스트3');

-- Quiz 10
SELECT * FROM (SELECT rownum rnum, B.* FROM (SELECT board_no, title, writer_id, writer_nick, hit, write_date, (SELECT COUNT(*) FROM recommend WHERE boardno = board.board_no) AS recommend FROM Board ORDER BY board_no DESC) B ) WHERE rnum BETWEEN 410 AND 420

SELECT * FROM (SELECT rownum rnum, B.* FROM (SELECT board_no, title, writer_id, writer_nick, hit, write_date, (SELECT COUNT(*) FROM recommend WHERE boardno = board.board_no) AS recommend FROM Board ORDER BY board_no DESC) B )