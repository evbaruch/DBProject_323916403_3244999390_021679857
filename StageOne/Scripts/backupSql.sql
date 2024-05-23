prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by Evyatar Bruch on יום חמישי 23 מאי 2024
set feedback off
set define off

prompt Dropping BRANCH...
drop table BRANCH cascade constraints;
prompt Dropping ACCOUNT...
drop table ACCOUNT cascade constraints;
prompt Dropping BLACKLIST...
drop table BLACKLIST cascade constraints;
prompt Dropping CUSTOMER...
drop table CUSTOMER cascade constraints;
prompt Dropping REL5...
drop table REL5 cascade constraints;
prompt Dropping TRANSACTIONS...
drop table TRANSACTIONS cascade constraints;
prompt Dropping VIP...
drop table VIP cascade constraints;
prompt Dropping XSTREAM$_SYSGEN_OBJS...
drop table XSTREAM$_SYSGEN_OBJS cascade constraints;
prompt Creating BRANCH...
create table BRANCH
(
  branchid          NUMBER(38) not null,
  branchname        VARCHAR2(20) not null,
  branchaddress     VARCHAR2(20) not null,
  branchphonenumber NUMBER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BRANCH
  add constraint PK_BRANCH primary key (BRANCHID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references, alter, index, debug, read on BRANCH to PUBLIC;

prompt Creating ACCOUNT...
create table ACCOUNT
(
  accountid     NUMBER(38) not null,
  balance       NUMBER not null,
  dateopened    DATE not null,
  accountstatus VARCHAR2(20) not null,
  branchid      NUMBER(38)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACCOUNT
  add constraint PK_ACCOUNT primary key (ACCOUNTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACCOUNT
  add constraint FK_ACCOUNT foreign key (BRANCHID)
  references BRANCH (BRANCHID);
grant select, insert, update, delete, references, alter, index, debug, read on ACCOUNT to PUBLIC;

prompt Creating BLACKLIST...
create table BLACKLIST
(
  accountid        NUMBER(38) not null,
  negetiveinterest FLOAT not null,
  minimumminus     NUMBER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BLACKLIST
  add constraint PK_BLACKLIST primary key (ACCOUNTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BLACKLIST
  add constraint FK_BLACKLIST foreign key (ACCOUNTID)
  references ACCOUNT (ACCOUNTID);
grant select, insert, update, delete, references, alter, index, debug, read on BLACKLIST to PUBLIC;

prompt Creating CUSTOMER...
create table CUSTOMER
(
  customerid    NUMBER(38) not null,
  firstname     VARCHAR2(20) not null,
  lastname      VARCHAR2(20) not null,
  dateofbirth   DATE not null,
  address       VARCHAR2(20) not null,
  contactnumber NUMBER not null,
  email         VARCHAR2(40) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMER
  add constraint PK_CUSTOMER primary key (CUSTOMERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete, references, alter, index, debug, read on CUSTOMER to PUBLIC;

prompt Creating REL5...
create table REL5
(
  customerid NUMBER(38) not null,
  accountid  NUMBER(38) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REL5
  add constraint PK_REL5 primary key (CUSTOMERID, ACCOUNTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REL5
  add constraint FK_REL5 foreign key (CUSTOMERID)
  references CUSTOMER (CUSTOMERID) on delete cascade;
alter table REL5
  add constraint FK_REL52 foreign key (ACCOUNTID)
  references ACCOUNT (ACCOUNTID);
grant select, insert, update, delete, references, alter, index, debug, read on REL5 to PUBLIC;

prompt Creating TRANSACTIONS...
create table TRANSACTIONS
(
  transactionid   NUMBER(38) not null,
  transactiontype VARCHAR2(20) not null,
  amount          NUMBER not null,
  transactiondate DATE not null,
  accountid       NUMBER(38)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRANSACTIONS
  add constraint PK_TRANSACTIONS primary key (TRANSACTIONID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRANSACTIONS
  add constraint FK_TRANSACTIONS foreign key (ACCOUNTID)
  references ACCOUNT (ACCOUNTID);
grant select, insert, update, delete, references, alter, index, debug, read on TRANSACTIONS to PUBLIC;

prompt Creating VIP...
create table VIP
(
  accountid        NUMBER(38) not null,
  positiveinterest FLOAT not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VIP
  add constraint PK_VIP primary key (ACCOUNTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VIP
  add constraint FK_VIP foreign key (ACCOUNTID)
  references ACCOUNT (ACCOUNTID);
grant select, insert, update, delete, references, alter, index, debug, read on VIP to PUBLIC;

prompt Creating XSTREAM$_SYSGEN_OBJS...
create table XSTREAM$_SYSGEN_OBJS
(
  server_name  VARCHAR2(128) not null,
  object_owner VARCHAR2(128) not null,
  object_name  VARCHAR2(128) not null,
  object_type  VARCHAR2(128) not null,
  spare1       NUMBER,
  spare2       NUMBER,
  spare3       NUMBER,
  spare4       TIMESTAMP(6),
  spare5       VARCHAR2(4000),
  spare6       VARCHAR2(4000)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index I_XSTREAM_SYSGEN_OBJS1 on XSTREAM$_SYSGEN_OBJS (SERVER_NAME)
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index I_XSTREAM_SYSGEN_OBJS2 on XSTREAM$_SYSGEN_OBJS (OBJECT_OWNER, OBJECT_NAME, OBJECT_TYPE)
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for BRANCH...
alter table BRANCH disable all triggers;
prompt Disabling triggers for ACCOUNT...
alter table ACCOUNT disable all triggers;
prompt Disabling triggers for BLACKLIST...
alter table BLACKLIST disable all triggers;
prompt Disabling triggers for CUSTOMER...
alter table CUSTOMER disable all triggers;
prompt Disabling triggers for REL5...
alter table REL5 disable all triggers;
prompt Disabling triggers for TRANSACTIONS...
alter table TRANSACTIONS disable all triggers;
prompt Disabling triggers for VIP...
alter table VIP disable all triggers;
prompt Disabling triggers for XSTREAM$_SYSGEN_OBJS...
alter table XSTREAM$_SYSGEN_OBJS disable all triggers;
prompt Disabling foreign key constraints for ACCOUNT...
alter table ACCOUNT disable constraint FK_ACCOUNT;
prompt Disabling foreign key constraints for BLACKLIST...
alter table BLACKLIST disable constraint FK_BLACKLIST;
prompt Disabling foreign key constraints for REL5...
alter table REL5 disable constraint FK_REL5;
alter table REL5 disable constraint FK_REL52;
prompt Disabling foreign key constraints for TRANSACTIONS...
alter table TRANSACTIONS disable constraint FK_TRANSACTIONS;
prompt Disabling foreign key constraints for VIP...
alter table VIP disable constraint FK_VIP;
prompt Loading BRANCH...
prompt Table is empty
prompt Loading ACCOUNT...
prompt Table is empty
prompt Loading BLACKLIST...
prompt Table is empty
prompt Loading CUSTOMER...
prompt Table is empty
prompt Loading REL5...
prompt Table is empty
prompt Loading TRANSACTIONS...
prompt Table is empty
prompt Loading VIP...
prompt Table is empty
prompt Loading XSTREAM$_SYSGEN_OBJS...
prompt Table is empty
prompt Enabling foreign key constraints for ACCOUNT...
alter table ACCOUNT enable constraint FK_ACCOUNT;
prompt Enabling foreign key constraints for BLACKLIST...
alter table BLACKLIST enable constraint FK_BLACKLIST;
prompt Enabling foreign key constraints for REL5...
alter table REL5 enable constraint FK_REL5;
alter table REL5 enable constraint FK_REL52;
prompt Enabling foreign key constraints for TRANSACTIONS...
alter table TRANSACTIONS enable constraint FK_TRANSACTIONS;
prompt Enabling foreign key constraints for VIP...
alter table VIP enable constraint FK_VIP;
prompt Enabling triggers for BRANCH...
alter table BRANCH enable all triggers;
prompt Enabling triggers for ACCOUNT...
alter table ACCOUNT enable all triggers;
prompt Enabling triggers for BLACKLIST...
alter table BLACKLIST enable all triggers;
prompt Enabling triggers for CUSTOMER...
alter table CUSTOMER enable all triggers;
prompt Enabling triggers for REL5...
alter table REL5 enable all triggers;
prompt Enabling triggers for TRANSACTIONS...
alter table TRANSACTIONS enable all triggers;
prompt Enabling triggers for VIP...
alter table VIP enable all triggers;
prompt Enabling triggers for XSTREAM$_SYSGEN_OBJS...
alter table XSTREAM$_SYSGEN_OBJS enable all triggers;

set feedback on
set define on
prompt Done
