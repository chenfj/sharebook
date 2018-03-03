--------------------------------------------------------
--  �ļ��Ѵ��� - ����һ-ʮһ��-23-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ADMIN
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ADMIN" 
   (	"AID" NUMBER, 
	"LOGIN_NAME" VARCHAR2(30 BYTE), 
	"PASSWORD" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BOOK
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."BOOK" 
   (	"BID" NUMBER, 
	"BOOK_NAME" VARCHAR2(100 BYTE), 
	"PRESS" VARCHAR2(200 BYTE), 
	"AUTHOR" VARCHAR2(200 BYTE), 
	"PUBLISH_TIME" DATE, 
	"UPLOAD_TIME" DATE, 
	"EDITION" NUMBER(1,0), 
	"BOOK_IMG" VARCHAR2(100 BYTE), 
	"DEAL_TYPE" NUMBER(1,0), 
	"BOOK_STATE" NUMBER(1,0), 
	"CID" NUMBER, 
	"USID" NUMBER, 
	"DEAL_STATE" VARCHAR2(10 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."CATEGORY" 
   (	"CID" NUMBER, 
	"CATEGORY_NAME" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REMARK
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REMARK" 
   (	"RID" NUMBER, 
	"REMARK_TIME" DATE, 
	"CONTENT" VARCHAR2(500 BYTE), 
	"USID" NUMBER, 
	"BID" NUMBER, 
	"REMARK_STATE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USER_INFO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."USER_INFO" 
   (	"USID" NUMBER, 
	"LOGIN_NAME" VARCHAR2(30 BYTE), 
	"PASSWORD" VARCHAR2(30 BYTE), 
	"NICK_NAME" VARCHAR2(30 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"PHONE" VARCHAR2(15 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"ACTIVE_CODE" VARCHAR2(70 BYTE), 
	"STATE" NUMBER(1,0), 
	"HEAD_IMG" VARCHAR2(100 BYTE), 
	"NOFUNC" NUMBER(1,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.ADMIN
SET DEFINE OFF;
----------��������----------------
create sequence seq_uid;
create sequence seq_bid;
create sequence seq_cid;
create sequence seq_rid;
create sequence seq_aid;

Insert into SYSTEM.ADMIN (AID,LOGIN_NAME,PASSWORD) values (1,'admin','123456');
REM INSERTING into SYSTEM.BOOK
SET DEFINE OFF;
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (1,'��¥��','����','���ϰ�',to_date('04-11��-15','DD-MON-RR'),to_date('21-11��-15','DD-MON-RR'),2,'headImg/14480840922739062293-1_b.jpg',1,2,1,1,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (21,'JAVA','���������','δ֪',to_date('03-11��-15','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),1,'book_image/144863698506720285763-1_w.jpg',1,1,2,21,'�ѽ��');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (22,'���ݽṹ���㷨����','��е��ҵ������','Ҷ����',to_date('11-11��-10','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),1,'book_image/144863723525820417467-1_w.jpg',0,1,2,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (23,'Java��Ŀ����','���ʳ�����','Ҷ����',to_date('03-11��-15','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),1,'book_image/144863733747120991549-1_w_1.jpg',1,1,2,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (24,'java�����ŵ���ͨ','�廪������','δ֪',to_date('10-11��-15','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),2,'book_image/144863747812622862060-1_w.jpg',1,1,2,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (25,'javaģʽ','�廪������','�ŵ¸�',to_date('08-11��-11','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),1,'book_image/1448637556978696673-1_w.jpg',1,1,2,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (26,'Spring����','�廪������','����',to_date('04-11��-15','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),2,'book_image/144863768516922623020-1_w.jpg',1,1,2,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (27,'21��ѧͨjava','����������','δ֪',to_date('10-11��-15','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),1,'book_image/144863775719423219731-1_w.jpg',1,1,2,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (28,'javaweb���Ͽ���ʵ��','���ʳ�����','����',to_date('05-11��-15','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),2,'book_image/144863791840623268958-1_w.jpg',1,1,2,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (29,'java7���ž���','����������','δ֪',to_date('07-11��-09','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),2,'book_image/144863799869922813026-1_w.jpg',0,1,2,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (30,'java���Գ������','���������','Ҷ����',to_date('12-11��-10','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),1,'book_image/144863809077021122188-1_w_1.jpg',1,1,2,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (31,'javascript����','���ӹ�ҵ������','֣˹�´�',to_date('05-11��-15','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),7,'book_image/144863824532723169892-1_w.jpg',1,1,2,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (32,'���о���Ԥ������','���������','С��',to_date('10-11��-09','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),1,'book_image/1448638496378economic1.jpg',0,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (33,'��������ʽ���','δ֪','δ֪',to_date('07-11��-14','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),1,'book_image/1448638556438economic2.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (34,'��ש����','���������','С��',to_date('07-11��-12','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),1,'book_image/1448638630460economic3.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (35,'���ù������','���������','δ֪',to_date('03-11��-10','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),1,'book_image/1448638736135economic4.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (36,'��ҵ����ѧ','���ʳ�����','����',to_date('11-11��-10','DD-MON-RR'),to_date('27-11��-15','DD-MON-RR'),1,'book_image/1448638802606economic5.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (37,'����ѧԭ��','����������','����',to_date('11-11��-15','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448640316700economic6.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (41,'����ѧǰ������','3','С��',to_date('05-11��-15','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448671987419economic7.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (42,'���ξ���ѧԭ��','�廪������','С��',to_date('02-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),3,'book_image/1448672064499economic8.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (43,'��������г���������','���������','С·',to_date('02-11��-10','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448672141375economic9.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (44,'��������ѧ','���������','Ч��',to_date('15-11��-11','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448672226349economic11.jpg',0,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (45,'��������г���������','���������','С��',to_date('13-11��-13','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),4,'book_image/1448672317375economic13.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (46,'�г����÷��ɽ̳�','���������','δ֪',to_date('02-11��-07','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),3,'book_image/1448672402988economic14.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (47,'����ȫ��','����������','����',to_date('20-11��-14','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),3,'book_image/1448672468586economic16.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (48,'�й�����','���������','δ֪',to_date('06-11��-15','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448672538022economic17.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (49,'����ѧ����','�廪������','С��',to_date('13-11��-14','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),3,'book_image/1448672594478economic18.jpg',0,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (50,'��������ΰ��ľ�����','����������','δ֪',to_date('06-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448672668578economic21.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (51,'����','���ʳ�����','ϲ����',to_date('11-11��-15','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448672727983economic22.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (52,'�ҵĵ�һ��������','�廪������','����',to_date('08-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448672794277economic23.jpg',1,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (54,'΢�۾���ѧ','����������','Сޱ',to_date('03-11��-14','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448672898348economic24.jpg',0,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (55,'����ѧ����','�廪������','С��',to_date('08-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),5,'book_image/1448673001730economic26.jpg',0,1,1,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (56,'��ѧͨ��','���������','δ֪',to_date('14-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448673131912philosophy1.jpg',0,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (57,'С���´����','���ʳ�����','δ֪',to_date('08-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448673182721philosophy2.jpg',1,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (58,'������','��е��ҵ������','��ϣ',to_date('15-11��-11','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448673243639philosophy3.jpg',1,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (59,'���˼����ѧ','���������','����',to_date('09-11��-06','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),3,'book_image/1448673310688philosophy4.jpg',0,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (60,'��ѧ�ǻ�','���ʳ�����','С־',to_date('14-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448673395022philosophy5.jpg',0,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (61,'����ͨ��','���������','����',to_date('02-11��-05','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448673518138philosophy6.jpg',0,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (62,'������ѧ','���������','С��',to_date('03-11��-11','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448673579118philosophy7.jpg',1,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (63,'��ѧ����СƷ','���ʳ�����','С��',to_date('08-11��-06','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448673640270philosophy8.jpg',0,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (64,'����','���������','С��',to_date('17-11��-06','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448673685120philosophy9.jpg',1,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (65,'Ů��������ѧ','���������','������ ',to_date('12-11��-99','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448673749860philosophy10.jpg',1,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (66,'�й���ѧ����','���������','С��',to_date('04-11��-10','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448673819234philosophy11.jpg',0,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (67,'�ʼ�����','�廪������','С��',to_date('18-11��-99','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448673886797philosophy12.jpg',1,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (68,'���յµ��ǻ�','���ʳ�����','С��',to_date('13-11��-07','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448673962286philosophy17.jpg',1,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (69,'��ѧ����','���������','С��',to_date('15-11��-11','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674018212philosophy18.jpg',1,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (70,'����֮��','���������','С��',to_date('11-11��-14','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448674071517philosophy19.jpg',1,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (71,'�����׾�','����������','С��',to_date('04-11��-09','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674140111philosophy20.jpg',1,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (72,'���Ե�����','����������','����',to_date('22-11��-10','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674199672philosophy22.jpg',1,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (73,'�����׷����','���������',' �',to_date('20-11��-10','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674263694philosophy21.jpg',1,1,3,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (74,'����Թ������','���������','δ֪',to_date('02-11��-10','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674351413selfhelp1.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (75,'�ɹ�����żȻ','���ʳ�����','С��',to_date('06-11��-13','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674399102selfhelp2.jpg',0,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (76,'һ���ڲ���ˮ��','δ֪','δ֪',to_date('04-11��-15','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674495120selfhelp3.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (77,'�Ҹ����Ǳ���̬','δ֪','����',to_date('13-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674554494selfhelp5.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (78,'��Ƥ��','���������','Ч��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674617643selfhelp6.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (79,'�ҵķܶ�','���������','Ч��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674641152selfhelp8.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (80,'���־�����ô��','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674677969selfhelp7.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (81,'��������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674698795selfhelp9.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (82,'�����������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674721103selfhelp10.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (83,'����Թ������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674758653selfhelp12.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (84,'��������һ��������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674798558selfhelp14.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (85,'���˻�������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674828837selfhelp15.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (86,'20�������Ů�˵�һ��','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674876807selfhelp16.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (87,'Ӱ����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674895933selfhelp17.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (88,'�ı�������12������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674924762selfhelp18.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (89,'��������ΰ�����־��','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674953388selfhelp19.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (90,'˼���¸�','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448674976601selfhelp20.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (91,'�������������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675019797selfhelp21.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (92,'����ְ��������108����������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675079311selfhelp22.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (93,'�������˵�����������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675115363selfhelp23.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (94,'����Ů��������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675149371selfhelp24.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (95,'����Թ�����еĲ�����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675181991selfhelp25.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (96,'����Ը�����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675211943selfhelp26.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (97,'����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675230101selfhelp27.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (98,'��������æʲô','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675255108selfhelp28.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (99,'�ǲ�˹����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675277229selfhelp29.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (100,'����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675294732selfhelp30.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (101,'ץס��һ�λ���','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675319084selfhelp31.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (102,'���ź���','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675343045selfhelp32.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (103,'�������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675363840selfhelp33.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (104,'������������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675390469selfhelp34.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (105,'������һ���ж�','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675420796selfhelp35.jpg',1,1,5,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (106,'��ѧ','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675461450teach5.jpg',1,1,4,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (107,'��ѧ����̳�','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675488952teach3.jpg',1,1,4,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (108,'�������̰�ȫ����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675514193teach4.jpg',1,1,4,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (109,'����ѧרҵӢ��̳�','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675548638teach2.jpg',1,1,4,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (110,'�Ļ���','���������','С�� ',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675609946classics1.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (111,'΢��С˵���꾭��','���������','С�� ',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675635015classics2.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (112,'��������','���������','С�� ',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675652690classics3.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (113,'һ����������⾭��С˵','���������','С�� ',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675689850classics4.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (114,'��̽С˵','���������','С�� ',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675713530classics5.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (115,'����С��','���������','С�� ',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675733608classics6.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (116,'��������������','���������','С�� ',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675764402classics7.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (117,'ɣ�ֱ�','���������','С�� ',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675803199classics8.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (118,'�����������С˵','���������','С�� ',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675835304classics9.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (119,'��¥��','���������','��ѩ��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675858969classics10.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (120,'�о�С˵','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675903507classics11.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (121,'��Хɽׯ','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675920621classics12.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (122,'����ս��','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675941369classics13.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (123,'��ı��','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675966017classics14.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (124,'���羭��','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/1448675989074classics16.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (125,'���羭��','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676002131classics15.jpg',1,1,6,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (126,'�����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676052441children1.jpg',1,1,7,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (127,'���־�','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676065327children2.jpg',1,1,7,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (128,'���������ͼ','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676093266children3.jpg',1,1,7,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (129,'�����ʲô','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676118725children4.jpg',1,1,7,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (130,'����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676146212children5.jpg',0,1,7,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (131,'����ٿ�ͼ��','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676165603children6.jpg',0,1,7,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (132,'��ʷ����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676178411children7.jpg',0,1,7,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (133,'ϣ��Ѱ����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676196039children8.jpg',0,1,7,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (134,'˯ǰС����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676218081children10.jpg',0,1,7,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (135,'��������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676240842children11.jpg',0,1,7,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (136,'�ٶ���ͥ����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676271418children12.jpg',0,1,7,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (137,'��Ȼ�ֺ�','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676289545children13.jpg',0,1,7,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (138,'������˼�','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676321759life1.jpg',0,1,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (139,'һ���˵�����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676348591life2.jpg',0,1,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (140,'�ҳ���','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676363567life3.jpg',0,2,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (141,'����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676375439life4.jpg',0,1,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (142,'��������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676387513life5.jpg',0,1,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (143,'��������','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676400758life6.jpg',0,1,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (144,'���ʶ','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676425827life7.jpg',0,1,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (145,'����Ӣ��','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676439617life8.jpg',0,1,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (146,'��ļ�԰֮��','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676458493life9.jpg',1,1,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (147,'�����뽡��','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676483875life10.jpg',0,1,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (148,'����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676503281life11.jpg',0,1,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (149,'ʱ�а���','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676521455life12.jpg',0,1,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (150,'�����ˮ','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676535714life13.jpg',0,1,8,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (151,'�����˹�����','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676569628other1.jpg',0,1,9,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (152,'�����׶�','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676587662other2.jpg',0,1,9,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (153,'��ѧɢ��','���������','С��',to_date('15-11��-12','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),2,'book_image/1448676602217other3.jpg',0,1,9,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (154,'JAVA','���ʳ�����','С��',to_date('05-11��-15','DD-MON-RR'),to_date('28-11��-15','DD-MON-RR'),1,'book_image/144868064676920928547-1_b.jpg',1,0,2,21,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (161,'jquery','����������','δ֪',to_date('02-11��-15','DD-MON-RR'),to_date('30-11��-15','DD-MON-RR'),1,'book_image/144885139457722910975-1_b.jpg',1,0,2,41,'������');
Insert into SYSTEM.BOOK (BID,BOOK_NAME,PRESS,AUTHOR,PUBLISH_TIME,UPLOAD_TIME,EDITION,BOOK_IMG,DEAL_TYPE,BOOK_STATE,CID,USID,DEAL_STATE) values (162,'bbb','dd','bb',to_date('03-11��-15','DD-MON-RR'),to_date('30-11��-15','DD-MON-RR'),2,'book_image/1448863287255head8.jpg',1,1,3,42,'������');
REM INSERTING into SYSTEM.CATEGORY
SET DEFINE OFF;
Insert into SYSTEM.CATEGORY (CID,CATEGORY_NAME) values (1,'��������');
Insert into SYSTEM.CATEGORY (CID,CATEGORY_NAME) values (2,'���������');
Insert into SYSTEM.CATEGORY (CID,CATEGORY_NAME) values (3,'��ѧ��');
Insert into SYSTEM.CATEGORY (CID,CATEGORY_NAME) values (4,'�̿���');
Insert into SYSTEM.CATEGORY (CID,CATEGORY_NAME) values (5,'��־��');
Insert into SYSTEM.CATEGORY (CID,CATEGORY_NAME) values (6,'����С˵');
Insert into SYSTEM.CATEGORY (CID,CATEGORY_NAME) values (7,'�ٶ�����');
Insert into SYSTEM.CATEGORY (CID,CATEGORY_NAME) values (8,'����������');
Insert into SYSTEM.CATEGORY (CID,CATEGORY_NAME) values (9,'����');
REM INSERTING into SYSTEM.REMARK
SET DEFINE OFF;
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (1,to_date('21-11��-15','DD-MON-RR'),'nigebendan',1,1,1);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (21,to_date('26-11��-15','DD-MON-RR'),'fdgdg',1,1,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (22,to_date('26-11��-15','DD-MON-RR'),'fdgdg',1,1,1);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (23,to_date('26-11��-15','DD-MON-RR'),'jgfhg',1,1,1);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (24,to_date('26-11��-15','DD-MON-RR'),'jgfhgsfff',1,1,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (25,to_date('26-11��-15','DD-MON-RR'),'jgfhgsfffsdf',1,1,1);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (26,to_date('26-11��-15','DD-MON-RR'),'gfhgfh',1,1,1);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (27,to_date('26-11��-15','DD-MON-RR'),'gfhgfh',1,1,1);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (28,to_date('26-11��-15','DD-MON-RR'),'gfhgfh',1,1,1);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (29,to_date('26-11��-15','DD-MON-RR'),'gfhgfh',1,1,1);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (30,to_date('26-11��-15','DD-MON-RR'),'we',1,1,1);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (41,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (42,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (43,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (44,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (45,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (46,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (47,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (48,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (49,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (50,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (51,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (52,to_date('28-11��-15','DD-MON-RR'),'�����������һ��Ψһ�Ĵ��죬����Ĩƽ�ؽ�����ʹֻ��һ��ɻ��һ��ҲҪ����������߹�ʱ�������м�ס��仰�����������Լ�����ġ�������ı䲻�����磬��Ҫ�����������ı��Լ����ı��Լ���˼�����ж��ɡ�',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (53,to_date('28-11��-15','DD-MON-RR'),'�����������һ��Ψһ�Ĵ��죬����Ĩƽ�ؽ�����ʹֻ��һ��ɻ��һ��ҲҪ����������߹�ʱ�������м�ס��仰�����������Լ�����ġ�������ı䲻�����磬��Ҫ�����������ı��Լ����ı��Լ���˼�����ж��ɡ�',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (54,to_date('28-11��-15','DD-MON-RR'),'�����������һ��Ψһ�Ĵ��죬����Ĩƽ�ؽ�����ʹֻ��һ��ɻ��һ��ҲҪ����������߹�ʱ�������м�ס��仰�����������Լ�����ġ�������ı䲻�����磬��Ҫ�����������ı��Լ����ı��Լ���˼�����ж��ɡ�',21,21,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (55,to_date('28-11��-15','DD-MON-RR'),'��������ɱ��Ĳ���ʧȥ��֫������û������ϣ����Ŀ�꣡���Ǿ�����ԹʲôҲ�����������������ֻ�ǹ�����ӵ�л�Ƿȱ�Ķ���������ȥ��ϧ��ӵ�еģ��Ǹ����ı䲻�����⣡�����ı����˵ģ����������ǵĻ������������ǵ�̬�ȡ���',21,74,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (56,to_date('28-11��-15','DD-MON-RR'),'���������������Կ��ƣ���Щ���鲻����Ĵ�Ҳ�����������ֹ�ġ�����ѡ��Ĳ��Ƿ��������Ǽ���Ŭ����ȡ���õ������',21,74,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (57,to_date('28-11��-15','DD-MON-RR'),'���㲻�ܷ������룬���ǿ��Ըı䷽����Ϊ�㲻֪���������ĹսǴ�������ʲô����',21,74,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (58,to_date('28-11��-15','DD-MON-RR'),'��Ȼ�������ܸı䣬����ȴ���Ըı��Լ����ģ��ı��㿴���Լ��������۹⣬�����л���ӵ���㣬ϣ��͸�����Լ��Ĺ����������㡣�����������������',21,74,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (59,to_date('28-11��-15','DD-MON-RR'),'��Ȼ�������ܸı䣬����ȴ���Ըı��Լ����ģ��ı��㿴���Լ��������۹⣬�����л���ӵ���㣬ϣ��͸�����Լ��Ĺ����������㡣�����������������',21,74,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (60,to_date('28-11��-15','DD-MON-RR'),'����������Լ����ܴ����漣���Ǿ�Ŭ�����Լ����һ���漣����',21,74,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (61,to_date('28-11��-15','DD-MON-RR'),'������ɱ��Ĳ���ʧȥ��֫������û������ϣ����Ŀ�꣡���Ǿ�����ԹʲôҲ�����������������ֻ�ǹ�����ӵ�л�Ƿȱ�Ķ���������ȥ��ϧ��ӵ�еģ��Ǹ����ı䲻�����⣡�����ı����˵ģ����������ǵĻ������������ǵ�̬�ȡ���',21,74,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (62,to_date('28-11��-15','DD-MON-RR'),'��Ȼ�������ܸı䣬����ȴ���Ըı��Լ����ģ��ı��㿴���Լ��������۹⣬�����л���ӵ���㣬ϣ��͸�����Լ��Ĺ����������㡣�����������������',21,74,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (63,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,78,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (64,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,78,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (65,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,78,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (66,to_date('28-11��-15','DD-MON-RR'),'�����һֱ��Ŭ���ĸı��Լ�����һ�죬���ͻȻ���֣���������ĸı��ͻȻȫ��������������Ǵ��ǻ۵�����������',21,78,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (67,to_date('28-11��-15','DD-MON-RR'),'�����ϵ�������㶼�޷��ı䣡�����ܹ��ı��ֻ�����Լ���',21,78,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (68,to_date('28-11��-15','DD-MON-RR'),'û����������֪���ò���',21,153,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (81,to_date('30-11��-15','DD-MON-RR'),'ֵ��һ��',41,22,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (82,to_date('30-11��-15','DD-MON-RR'),'д�ĺܺ�Ŷ',41,28,0);
Insert into SYSTEM.REMARK (RID,REMARK_TIME,CONTENT,USID,BID,REMARK_STATE) values (83,to_date('30-11��-15','DD-MON-RR'),'ͦ��',42,98,0);
REM INSERTING into SYSTEM.USER_INFO
SET DEFINE OFF;
Insert into SYSTEM.USER_INFO (USID,LOGIN_NAME,PASSWORD,NICK_NAME,EMAIL,PHONE,ADDRESS,ACTIVE_CODE,STATE,HEAD_IMG,NOFUNC) values (1,'bbb','bbb','bbb','bbb@sharebook.com','13524678900','�Ϻ�','null',1,'images/head.jpg',1);
Insert into SYSTEM.USER_INFO (USID,LOGIN_NAME,PASSWORD,NICK_NAME,EMAIL,PHONE,ADDRESS,ACTIVE_CODE,STATE,HEAD_IMG,NOFUNC) values (21,'����','123456','С��','aaa@sharebook.com','13245678900','ɽ��','null',1,'headImg/1447842303324head1.jpg',0);
Insert into SYSTEM.USER_INFO (USID,LOGIN_NAME,PASSWORD,NICK_NAME,EMAIL,PHONE,ADDRESS,ACTIVE_CODE,STATE,HEAD_IMG,NOFUNC) values (22,'����','123456','С��','aaa@sharebook.com','13245678900','�Ϻ�','null',1,'images/head.jpg',0);
Insert into SYSTEM.USER_INFO (USID,LOGIN_NAME,PASSWORD,NICK_NAME,EMAIL,PHONE,ADDRESS,ACTIVE_CODE,STATE,HEAD_IMG,NOFUNC) values (41,'С��','123456','С��','aaa@sharebook.com','14235678900','ɽ��','null',1,'headImg/1448852456122head7.jpg',0);
Insert into SYSTEM.USER_INFO (USID,LOGIN_NAME,PASSWORD,NICK_NAME,EMAIL,PHONE,ADDRESS,ACTIVE_CODE,STATE,HEAD_IMG,NOFUNC) values (42,'С��','123456','С��','ccc@sharebook.com','13245678900','�Ϻ�','null',1,'headImg/1448887932710head11.jpg',0);
--------------------------------------------------------
--  DDL for Index SYS_C009656
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C009656" ON "SYSTEM"."ADMIN" ("AID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C009650
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C009650" ON "SYSTEM"."BOOK" ("BID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C009649
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C009649" ON "SYSTEM"."CATEGORY" ("CID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C009653
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C009653" ON "SYSTEM"."REMARK" ("RID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C009648
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C009648" ON "SYSTEM"."USER_INFO" ("USID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table ADMIN
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ADMIN" ADD PRIMARY KEY ("AID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOOK
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BOOK" ADD PRIMARY KEY ("BID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."CATEGORY" ADD PRIMARY KEY ("CID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REMARK
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REMARK" ADD PRIMARY KEY ("RID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USER_INFO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."USER_INFO" ADD PRIMARY KEY ("USID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOOK
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BOOK" ADD CONSTRAINT "FK_CID" FOREIGN KEY ("CID")
	  REFERENCES "SYSTEM"."CATEGORY" ("CID") ENABLE;
 
  ALTER TABLE "SYSTEM"."BOOK" ADD CONSTRAINT "FK_USID" FOREIGN KEY ("USID")
	  REFERENCES "SYSTEM"."USER_INFO" ("USID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REMARK
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REMARK" ADD CONSTRAINT "FK_BID" FOREIGN KEY ("BID")
	  REFERENCES "SYSTEM"."BOOK" ("BID") ENABLE;
 
  ALTER TABLE "SYSTEM"."REMARK" ADD CONSTRAINT "FK_RB_USID" FOREIGN KEY ("USID")
	  REFERENCES "SYSTEM"."USER_INFO" ("USID") ENABLE;
