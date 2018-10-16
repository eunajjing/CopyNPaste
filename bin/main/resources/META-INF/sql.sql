use copynpaste;

-- ����_�ڵ强
CREATE TABLE `subject` (
   `subjectCode` VARCHAR(30) NOT NULL COMMENT '�����ڵ�', -- �����ڵ�
   `subjectName` VARCHAR(30) NULL     COMMENT '�����ڵ��' -- �����ڵ��
)
COMMENT '����_�ڵ强';

-- ����_�ڵ强
ALTER TABLE `subject`
   ADD CONSTRAINT `PK_subject` -- ����_�ڵ强 �⺻Ű
      PRIMARY KEY (
         `subjectCode` -- �����ڵ�
      );
-- ����_�ڵ强_��
INSERT INTO subject(subjectCode,subjectName) 
VALUES ('SJ00','��Ÿ');
INSERT INTO subject(subjectCode,subjectName) 
VALUES ('SJ01','ȸ��');
INSERT INTO subject(subjectCode,subjectName) 
VALUES ('SJ02','��Ȱ');
INSERT INTO subject(subjectCode,subjectName) 
VALUES ('SJ03','����');
      
-- ó������_�ڵ强
CREATE TABLE `PScheck` (
   `checkCode` VARCHAR(30) NOT NULL COMMENT '�Ű�ó�������ڵ�', -- �Ű�ó�������ڵ�
   `checkName` VARCHAR(30) NULL     COMMENT '�Ű�ó�������ڵ��' -- �Ű�ó�������ڵ��
)
COMMENT 'ó������_�ڵ强';

-- ó������_�ڵ强
ALTER TABLE `PScheck`
   ADD CONSTRAINT `PK_check` -- ó������_�ڵ强 �⺻Ű
      PRIMARY KEY (
         `checkCode` -- �Ű�ó�������ڵ�
      );
-- ó������_�ڵ强_��
INSERT INTO PScheck(checkCode,checkName) 
VALUES ('PS00','�Ϸ�');
INSERT INTO PScheck(checkCode,checkName) 
VALUES ('PS01','����ε�');
INSERT INTO PScheck(checkCode,checkName) 
VALUES ('PS02','��Ȯ��');



-- �Ű����_�ڵ强
CREATE TABLE `reportCause` (
   `reportCauseCode`  VARCHAR(30)  NOT NULL COMMENT '�Ű�����ڵ�', -- �Ű�����ڵ�
   `reportCauseTitle` VARCHAR(100) NULL     COMMENT '�Ű��������' -- �Ű��������
)
COMMENT '�Ű����_�ڵ强';

-- �Ű����_�ڵ强
ALTER TABLE `reportCause`
   ADD CONSTRAINT `PK_reportCause` -- �Ű����_�ڵ强 �⺻Ű
      PRIMARY KEY (
         `reportCauseCode` -- �Ű�����ڵ�
      );

--�Ű����_�ڵ强_��
INSERT INTO reportCause(reportCauseCode,reportCauseTitle) 
VALUES ('NR00','��Ÿ');
INSERT INTO reportCause(reportCauseCode,reportCauseTitle) 
VALUES ('NR01','����/������ �Խù�');
INSERT INTO reportCause(reportCauseCode,reportCauseTitle) 
VALUES ('NR02','�弳 �� �������� ���');
INSERT INTO reportCause(reportCauseCode,reportCauseTitle) 
VALUES ('NR03','ȸ�� ���');
INSERT INTO reportCause(reportCauseCode,reportCauseTitle) 
VALUES ('NR04','���Ѽ�/���۱� ħ��');


-- ��Ʈ��ۿ���_�ڵ强
CREATE TABLE `noteOrComm` (
   `noteOrCommCode`  VARCHAR(30)         NOT NULL COMMENT '�����ڵ�', -- �����ڵ�
   `noteOrComm`     VARCHAR(30) NULL     COMMENT '�����ڵ��' -- �����ڵ��
)
COMMENT '��Ʈ��ۿ���_�ڵ强';

-- ��Ʈ��ۿ���_�ڵ强
ALTER TABLE `noteOrComm`
   ADD CONSTRAINT `PK_noteOrComm` -- ��Ʈ��ۿ���_�ڵ强 �⺻Ű
      PRIMARY KEY (
         `noteOrCommCode` -- �����ڵ�
      );
      
-- ��Ʈ��ۿ���_�ڵ强_��
INSERT INTO noteOrComm(noteOrCommCode,noteOrComm) 
VALUES ('NC00','��Ʈ');
INSERT INTO noteOrComm(noteOrCommCode,noteOrComm) 
VALUES ('NC01','���');

-- ����ڱ���_�ڵ强
CREATE TABLE `userRolls` (
   `rollCode` VARCHAR(30) NOT NULL COMMENT '�����ڵ�', -- �����ڵ�
   `rollName` VARCHAR(50) NULL     COMMENT '���Ѹ�' -- ���Ѹ�
)
COMMENT '����ڱ���';

-- ����ڱ���_�ڵ强
ALTER TABLE `userRolls`
   ADD CONSTRAINT `PK_userRolls` -- ����ڱ��� �⺻Ű
      PRIMARY KEY (
         `rollCode` -- �����ڵ�
      );
-- ����ڱ���_�ڵ强_��
INSERT INTO userRolls(rollCode,rollName) 
VALUES ('ROLE_USER','�Ϲ�ȸ��');
INSERT INTO userRolls(rollCode,rollName) 
VALUES ('ROLE_ADMIN','������');


-- ȸ��
CREATE TABLE `users` (
   `userEmail`   VARCHAR(100) NOT NULL COMMENT 'ȸ���̸���', -- ȸ���̸���
   `userNick`    VARCHAR(50)  NOT NULL COMMENT 'ȸ���г���', -- ȸ���г���
   `userPwd`     VARCHAR(100) NOT NULL COMMENT 'ȸ����й�ȣ', -- ȸ����й�ȣ
   `userPhoto`   TEXT         NULL     COMMENT 'ȸ�������ʻ���', -- ȸ�������ʻ���
   `userDate`    DATE         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ȸ����������', -- ȸ����������
   `userEnabled` TINYINT(1)   NOT NULL DEFAULT 1 COMMENT '��뿩��' -- ��뿩��
)
COMMENT 'ȸ��';

-- ȸ��
ALTER TABLE `users`
   ADD CONSTRAINT `PK_users` -- ȸ�� �⺻Ű
      PRIMARY KEY (
         `userEmail` -- ȸ���̸���
      );

-- �巡��
CREATE TABLE `drag` (
   `dragNum`    INT          NOT NULL auto_increment primary key COMMENT '�巡�׹�ȣ', -- �巡�׹�ȣ
   `userEmail`  VARCHAR(100) NOT NULL COMMENT 'ȸ���̸���', -- ȸ���̸���
   `dragText`   LONGTEXT     NOT NULL COMMENT '�ؽ�Ʈ', -- �ؽ�Ʈ
   `dragOrigin` TEXT         NULL     COMMENT '��ó', -- ��ó
   `dragDate`   DATE         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�巡������', -- �巡������
   `dragMark`   TINYINT(1)   NOT NULL DEFAULT 0 COMMENT '�߿�ǥ��' -- �߿�ǥ��
)
COMMENT '�巡��';


-- ��Ʈ
CREATE TABLE `note` (
   `noteNum`     INT          NOT NULL auto_increment primary key COMMENT '��Ʈ��ȣ', -- ��Ʈ��ȣ
   `folderName`  VARCHAR(50)  NOT NULL COMMENT '������', -- ������
   `userEmail`   VARCHAR(100) NOT NULL COMMENT 'ȸ���̸���', -- ȸ���̸���
   `noteTitle`   VARCHAR(100) NOT NULL COMMENT '��Ʈ����', -- ��Ʈ����
   `noteContent` LONGTEXT     NOT NULL COMMENT '��Ʈ����', -- ��Ʈ����
   `noteDate`    DATE         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�ۼ���', -- �ۼ���
   `subjectCode` VARCHAR(30)  NOT NULL DEFAULT 'SJ00' COMMENT '�����ڵ�', -- �����ڵ�
   `noteCount`   TINYINT(1)   NULL     DEFAULT 0 COMMENT '����ī��Ʈ', -- ����ī��Ʈ
   `notePublic`  TINYINT(1)   NULL     DEFAULT 1 COMMENT '�۰�������', -- �۰�������
   `notescrap`   TINYINT(1)   NULL     DEFAULT 0 COMMENT '��ũ��', -- ��ũ��
   `notePNum`    INT          NULL     COMMENT '�θ��Ʈ��ȣ' -- �θ��Ʈ��ȣ
)
COMMENT '��Ʈ';


-- QnA
CREATE TABLE `QNA` (
   `qnaNum`     INT          NOT NULL auto_increment primary key COMMENT 'QnA��ȣ', -- QnA��ȣ
   `userEmail`  VARCHAR(100) NOT NULL COMMENT 'ȸ���̸���', -- ȸ���̸���
   `qnaTitle`   VARCHAR(100) NOT NULL COMMENT 'QnA����', -- QnA����
   `qnaContent` LONGTEXT     NOT NULL COMMENT 'QnA����', -- QnA����
   `qnaDate`    DATE         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'QnA�ۼ���', -- QnA�ۼ���
   `qnaDept`    INT          NULL     DEFAULT 0 COMMENT '��۱���', -- ��۱���
   `qnaPNum`    INT          NULL     COMMENT '�θ�qna��ȣ', -- �θ�qna��ȣ
   `qnaNotice`  TINYINT(1)   NULL     DEFAULT 0 COMMENT '�����ۿ���', -- �����ۿ���
   `qnaSecret`  TINYINT(1)   NULL     DEFAULT 1 COMMENT '��бۿ���' -- ��бۿ���
)
COMMENT 'QnA';


-- ��Ʈ&��۽Ű�
CREATE TABLE `report` (
   `reportNum`        INT          NOT NULL auto_increment primary key COMMENT '�Ű�Խ��Ǳ۹�ȣ', -- �Ű�Խ��Ǳ۹�ȣ
   `userEmail`        VARCHAR(100) NOT NULL COMMENT '�Ű���ȸ���̸���', -- �Ű���ȸ���̸���
   `noteNum`          INT          NOT NULL COMMENT '��Ʈor��۹�ȣ', -- ��Ʈor��۹�ȣ
   `checkCode`        VARCHAR(30)  NOT NULL DEFAULT 'PS00' COMMENT '�Ű�ó�������ڵ�', -- �Ű�ó�������ڵ�
   `reportInDate`     DATE         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�Ű���', -- �Ű���
   `reportHandleDate` DATE         NOT NULL COMMENT 'ó����', -- ó����
   `reportCauseCode`  VARCHAR(30)  NOT NULL COMMENT '�Ű�����ڵ�', -- �Ű�����ڵ�
   `reportContent`    TEXT         NULL     COMMENT '�Ű���', -- �Ű���
   `reportmemo`       TEXT         NULL     COMMENT '�޸�', -- �޸�
   `noteOrCommCode`   VARCHAR(30)  NOT NULL COMMENT '��Ʈ��ۿ����ڵ�' -- ��Ʈ��ۿ����ڵ�
)
COMMENT '��Ʈ&��۽Ű�';

-- ���
CREATE TABLE `noteComm` (
   `noteCommNum`  INT          NOT NULL auto_increment primary key COMMENT '��۹�ȣ', -- ��۹�ȣ
   `userEmail`    VARCHAR(100) NOT NULL COMMENT 'ȸ���̸���', -- ȸ���̸���
   `noteNum`      INT          NOT NULL COMMENT '��Ʈ��ȣ', -- ��Ʈ��ȣ
   `commDept`     INT          NULL     DEFAULT 0 COMMENT '��۱���', -- ��۱���
   `commContent`  TEXT         NULL     COMMENT '��۳���', -- ��۳���
   `commDate`     DATE         NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '����ۼ���', -- ����ۼ���
   `noteCommPNum` INT          NULL     COMMENT '�θ��۹�ȣ' -- �θ��۹�ȣ
)
COMMENT '���';


-- ����
CREATE TABLE `folder` (
   `folderName`    VARCHAR(50)  NOT NULL COMMENT '������', -- ������
   `userEmail`     VARCHAR(100) NOT NULL COMMENT 'ȸ���̸���', -- ȸ���̸���
   `defaultFolder` TINYINT(1)   NULL     DEFAULT 0 COMMENT '����Ʈ����', -- ����Ʈ����
   `candelete`     TINYINT(1)   NULL     DEFAULT 0 COMMENT '������������' -- ������������
)
COMMENT '����';

-- ����
ALTER TABLE `folder`
   ADD CONSTRAINT `PK_folder` -- ���� �⺻Ű
      PRIMARY KEY (
         `folderName`, -- ������
         `userEmail`   -- ȸ���̸���
      );




-- QnA���
CREATE TABLE `QNAComm` (
   `qnaCommNum`     INT          NOT NULL auto_increment primary key COMMENT 'QnA��۹�ȣ', -- QnA��۹�ȣ
   `qnaNum`         INT          NOT NULL COMMENT 'QnA�۹�ȣ', -- QnA��ȣ
   `userEmail`      VARCHAR(100) NOT NULL COMMENT 'ȸ���̸���', -- ȸ���̸���
   `qnaCommContent` LONGTEXT     NULL     COMMENT '��۳���', -- ��۳���
   `qnaCommDate`    DATE         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ۼ���', -- ����ۼ���
   `qnaCommDept`    INT          NULL     DEFAULT 0 COMMENT '��۱���', -- ��۱���
   `qnaCommPNum`    INT          NULL     COMMENT '�θ��۹�ȣ' -- �θ��۹�ȣ
)
COMMENT 'QnA���';


-- ����
CREATE TABLE `rolls` (
   `userEmail` VARCHAR(100) NOT NULL COMMENT 'ȸ���̸���', -- ȸ���̸���
   `rollCode`  VARCHAR(30)  NOT NULL DEFAULT 'ROLE_USER' COMMENT '�����ڵ�' -- �����ڵ�
)
COMMENT '����';

-- ����
ALTER TABLE `rolls`
   ADD CONSTRAINT `PK_rolls` -- ���� �⺻Ű
      PRIMARY KEY (
         `userEmail`, -- ȸ���̸���
         `rollCode`   -- �����ڵ�
      );

-- �巡��
ALTER TABLE `drag`
   ADD CONSTRAINT `FK_users_TO_drag` -- ȸ�� -> �巡��
      FOREIGN KEY (
         `userEmail` -- ȸ���̸���
      )
      REFERENCES `users` ( -- ȸ��
         `userEmail` -- ȸ���̸���
      );

-- ��Ʈ
ALTER TABLE `note`
   ADD CONSTRAINT `FK_folder_TO_note` -- ���� -> ��Ʈ
      FOREIGN KEY (
         `folderName`, -- ������
         `userEmail`   -- ȸ���̸���
      )
      REFERENCES `folder` ( -- ����
         `folderName`, -- ������
         `userEmail`   -- ȸ���̸���
      );

-- ��Ʈ
ALTER TABLE `note`
   ADD CONSTRAINT `FK_subject_TO_note` -- ����_�ڵ强 -> ��Ʈ
      FOREIGN KEY (
         `subjectCode` -- �����ڵ�
      )
      REFERENCES `subject` ( -- ����_�ڵ强
         `subjectCode` -- �����ڵ�
      );

-- ��Ʈ
ALTER TABLE `note`
   ADD CONSTRAINT `FK_note_TO_note` -- ��Ʈ -> ��Ʈ
      FOREIGN KEY (
         `notePNum` -- �θ��Ʈ��ȣ
      )
      REFERENCES `note` ( -- ��Ʈ
         `noteNum` -- ��Ʈ��ȣ
      );

-- QnA
ALTER TABLE `QNA`
   ADD CONSTRAINT `FK_users_TO_QNA` -- ȸ�� -> QnA
      FOREIGN KEY (
         `userEmail` -- ȸ���̸���
      )
      REFERENCES `users` ( -- ȸ��
         `userEmail` -- ȸ���̸���
      );

-- QnA
ALTER TABLE `QNA`
   ADD CONSTRAINT `FK_QNA_TO_QNA` -- QnA -> QnA
      FOREIGN KEY (
         `qnaPNum` -- �θ�qna��ȣ
      )
      REFERENCES `QNA` ( -- QnA
         `qnaNum` -- QnA��ȣ
      );

-- ��Ʈ&��۽Ű�
ALTER TABLE `report`
   ADD CONSTRAINT `FK_users_TO_report` -- ȸ�� -> ��Ʈ&��۽Ű�
      FOREIGN KEY (
         `userEmail` -- �Ű���ȸ���̸���
      )
      REFERENCES `users` ( -- ȸ��
         `userEmail` -- ȸ���̸���
      );

-- ��Ʈ&��۽Ű�
ALTER TABLE `report`
   ADD CONSTRAINT `FK_note_TO_report` -- ��Ʈ -> ��Ʈ&��۽Ű�
      FOREIGN KEY (
         `noteNum` -- ��Ʈor��۹�ȣ
      )
      REFERENCES `note` ( -- ��Ʈ
         `noteNum` -- ��Ʈ��ȣ
      );

-- ��Ʈ&��۽Ű�
ALTER TABLE `report`
   ADD CONSTRAINT `FK_check_TO_report` -- ó������_�ڵ强 -> ��Ʈ&��۽Ű�
      FOREIGN KEY (
         `checkCode` -- �Ű�ó�������ڵ�
      )
      REFERENCES `check` ( -- ó������_�ڵ强
         `checkCode` -- �Ű�ó�������ڵ�
      );

-- ��Ʈ&��۽Ű�
ALTER TABLE `report`
   ADD CONSTRAINT `FK_reportCause_TO_report` -- �Ű����_�ڵ强 -> ��Ʈ&��۽Ű�
      FOREIGN KEY (
         `reportCauseCode` -- �Ű�����ڵ�
      )
      REFERENCES `reportCause` ( -- �Ű����_�ڵ强
         `reportCauseCode` -- �Ű�����ڵ�
      );

-- ��Ʈ&��۽Ű�
ALTER TABLE `report`
   ADD CONSTRAINT `FK_noteOrComm_TO_report` -- ��Ʈ��ۿ���_�ڵ强 -> ��Ʈ&��۽Ű�
      FOREIGN KEY (
         `noteOrCommCode` -- ��Ʈ��ۿ����ڵ�
      )
      REFERENCES `noteOrComm` ( -- ��Ʈ��ۿ���_�ڵ强
         `noteOrCommCode` -- �����ڵ�
      );

-- ���
ALTER TABLE `noteComm`
   ADD CONSTRAINT `FK_note_TO_noteComm` -- ��Ʈ -> ���
      FOREIGN KEY (
         `noteNum` -- ��Ʈ��ȣ
      )
      REFERENCES `note` ( -- ��Ʈ
         `noteNum` -- ��Ʈ��ȣ
      );

-- ���
ALTER TABLE `noteComm`
   ADD CONSTRAINT `FK_users_TO_noteComm` -- ȸ�� -> ���
      FOREIGN KEY (
         `userEmail` -- ȸ���̸���
      )
      REFERENCES `users` ( -- ȸ��
         `userEmail` -- ȸ���̸���
      );

-- ���
ALTER TABLE `noteComm`
   ADD CONSTRAINT `FK_noteComm_TO_noteComm` -- ��� -> ���
      FOREIGN KEY (
         `noteCommPNum` -- �θ��۹�ȣ
      )
      REFERENCES `noteComm` ( -- ���
         `noteCommNum` -- ��۹�ȣ
      );

-- ����
ALTER TABLE `folder`
   ADD CONSTRAINT `FK_users_TO_folder` -- ȸ�� -> ����
      FOREIGN KEY (
         `userEmail` -- ȸ���̸���
      )
      REFERENCES `users` ( -- ȸ��
         `userEmail` -- ȸ���̸���
      );

-- QnA���
ALTER TABLE `QNAComm`
   ADD CONSTRAINT `FK_QNA_TO_QNAComm` -- QnA -> QnA���
      FOREIGN KEY (
         `qnaNum` -- QnA��ȣ
      )
      REFERENCES `QNA` ( -- QnA
         `qnaNum` -- QnA��ȣ
      );

-- QnA���
ALTER TABLE `QNAComm`
   ADD CONSTRAINT `FK_users_TO_QNAComm` -- ȸ�� -> QnA���
      FOREIGN KEY (
         `userEmail` -- ȸ���̸���
      )
      REFERENCES `users` ( -- ȸ��
         `userEmail` -- ȸ���̸���
      );

-- QnA���
ALTER TABLE `QNAComm`
   ADD CONSTRAINT `FK_QNAComm_TO_QNAComm` -- QnA��� -> QnA���
      FOREIGN KEY (
         `qnaCommPNum` -- �θ��۹�ȣ
      )
      REFERENCES `QNAComm` ( -- QnA���
         `qnaCommNum` -- QnA��۹�ȣ
      );

-- ����
ALTER TABLE `rolls`
   ADD CONSTRAINT `FK_users_TO_rolls` -- ȸ�� -> ����
      FOREIGN KEY (
         `userEmail` -- ȸ���̸���
      )
      REFERENCES `users` ( -- ȸ��
         `userEmail` -- ȸ���̸���
      );

-- ����
ALTER TABLE `rolls`
   ADD CONSTRAINT `FK_userRolls_TO_rolls` -- ����ڱ��� -> ����
      FOREIGN KEY (
         `rollCode` -- �����ڵ�
      )
      REFERENCES `userRolls` ( -- ����ڱ���
         `rollCode` -- �����ڵ�
      );