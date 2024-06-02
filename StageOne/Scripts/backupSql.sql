prompt PL/SQL Developer Export Tables for user C##EVYATAR@XE
prompt Created by Evyatar Bruch on יום ראשון 02 יוני 2024
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
prompt Dropping DIRECTDEBIT...
drop table DIRECTDEBIT cascade constraints;
prompt Dropping REL5...
drop table REL5 cascade constraints;
prompt Dropping TRANSACTIONS...
drop table TRANSACTIONS cascade constraints;
prompt Dropping VIP...
drop table VIP cascade constraints;
prompt Creating BRANCH...
create table BRANCH
(
  branchid          NUMBER(38) not null,
  branchname        VARCHAR2(20) not null,
  branchaddress     VARCHAR2(20) not null,
  branchphonenumber NUMBER not null
);
alter table BRANCH
  add constraint PK_BRANCH primary key (BRANCHID);
grant select, insert, update, delete, references, alter, index, debug, read on BRANCH to PUBLIC;

prompt Creating ACCOUNT...
create table ACCOUNT
(
  accountid     NUMBER(38) not null,
  balance       NUMBER not null,
  dateopened    DATE not null,
  accountstatus VARCHAR2(20) not null,
  branchid      NUMBER(38)
);
alter table ACCOUNT
  add constraint PK_ACCOUNT primary key (ACCOUNTID);
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
);
alter table BLACKLIST
  add constraint PK_BLACKLIST primary key (ACCOUNTID);
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
);
alter table CUSTOMER
  add constraint PK_CUSTOMER primary key (CUSTOMERID);
grant select, insert, update, delete, references, alter, index, debug, read on CUSTOMER to PUBLIC;

prompt Creating DIRECTDEBIT...
create table DIRECTDEBIT
(
  iddebit   NUMBER(38) not null,
  startdate DATE not null,
  typedebit VARCHAR2(20) not null,
  amount    NUMBER not null,
  accountid NUMBER(38)
);
alter table DIRECTDEBIT
  add constraint PK_DIRECTDEBIT primary key (IDDEBIT);
alter table DIRECTDEBIT
  add constraint FK_DIRECTDEBIT foreign key (ACCOUNTID)
  references ACCOUNT (ACCOUNTID);
grant select, insert, update, delete, references, alter, index, debug, read on DIRECTDEBIT to PUBLIC;

prompt Creating REL5...
create table REL5
(
  customerid NUMBER(38) not null,
  accountid  NUMBER(38) not null
);
alter table REL5
  add constraint PK_REL5 primary key (CUSTOMERID, ACCOUNTID);
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
);
alter table TRANSACTIONS
  add constraint PK_TRANSACTIONS primary key (TRANSACTIONID);
alter table TRANSACTIONS
  add constraint FK_TRANSACTIONS foreign key (ACCOUNTID)
  references ACCOUNT (ACCOUNTID);
grant select, insert, update, delete, references, alter, index, debug, read on TRANSACTIONS to PUBLIC;

prompt Creating VIP...
create table VIP
(
  accountid        NUMBER(38) not null,
  positiveinterest FLOAT not null
);
alter table VIP
  add constraint PK_VIP primary key (ACCOUNTID);
alter table VIP
  add constraint FK_VIP foreign key (ACCOUNTID)
  references ACCOUNT (ACCOUNTID);
grant select, insert, update, delete, references, alter, index, debug, read on VIP to PUBLIC;

prompt Disabling triggers for BRANCH...
alter table BRANCH disable all triggers;
prompt Disabling triggers for ACCOUNT...
alter table ACCOUNT disable all triggers;
prompt Disabling triggers for BLACKLIST...
alter table BLACKLIST disable all triggers;
prompt Disabling triggers for CUSTOMER...
alter table CUSTOMER disable all triggers;
prompt Disabling triggers for DIRECTDEBIT...
alter table DIRECTDEBIT disable all triggers;
prompt Disabling triggers for REL5...
alter table REL5 disable all triggers;
prompt Disabling triggers for TRANSACTIONS...
alter table TRANSACTIONS disable all triggers;
prompt Disabling triggers for VIP...
alter table VIP disable all triggers;
prompt Disabling foreign key constraints for ACCOUNT...
alter table ACCOUNT disable constraint FK_ACCOUNT;
prompt Disabling foreign key constraints for BLACKLIST...
alter table BLACKLIST disable constraint FK_BLACKLIST;
prompt Disabling foreign key constraints for DIRECTDEBIT...
alter table DIRECTDEBIT disable constraint FK_DIRECTDEBIT;
prompt Disabling foreign key constraints for REL5...
alter table REL5 disable constraint FK_REL5;
alter table REL5 disable constraint FK_REL52;
prompt Disabling foreign key constraints for TRANSACTIONS...
alter table TRANSACTIONS disable constraint FK_TRANSACTIONS;
prompt Disabling foreign key constraints for VIP...
alter table VIP disable constraint FK_VIP;
prompt Loading BRANCH...
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (100, 'Woodward', '66 Foley Blvd', 972590632);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (101, 'Swinton', '52 Lionel Road', 972533691);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (102, 'Tempest', '242 Clinton Road', 972562512);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (103, 'Candy', '92 Chorzów Ave', 972597013);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (104, 'Guest', '5 Nagasaki Street', 972518504);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (105, 'Applegate', '89 Dillane Drive', 972511890);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (106, 'Margulies', '83 O''Neill Drive', 972569705);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (107, 'Nicholas', '43 Scott', 972571939);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (108, 'Trevino', '11 Stanley Road', 972547967);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (109, 'Sewell', '253 Helsingborg Stre', 972532017);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (110, 'Marie', '32 Lawrence Blvd', 972592058);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (111, 'Lucas', '11 Hampton Street', 972559933);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (112, 'Cervine', '62nd Street', 972576749);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (113, 'McConaughey', '23 Sweeney Street', 972541631);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (114, 'Lightfoot', '64 Driver Drive', 972545250);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (115, 'Paxton', '7 Duisburg Street', 972541502);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (116, 'Tyson', '42nd Street', 972549143);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (117, 'Sevigny', '35 Americana Drive', 972590785);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (118, 'Voight', '9 Pesci', 972506061);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (119, 'Crouch', '92 Danes Street', 972556113);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (120, 'Michael', '44 Kane Road', 972530160);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (121, 'Streep', '1 Caviezel Road', 972574503);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (122, 'Forrest', '80 Danni', 972598339);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (123, 'Herrmann', '93 Smyrna Road', 972556150);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (124, 'Wolf', '65 Orbit Street', 972546745);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (125, 'Avital', '393 Holland Road', 972569480);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (126, 'Cash', '15 Robby Drive', 972582134);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (127, 'Blair', '73 Longview', 972501134);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (128, 'Olyphant', '903 Jeff Street', 972595674);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (129, 'Reno', '774 Weber Road', 972562540);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (130, 'Brown', '18 Katt Drive', 972549791);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (131, 'Kahn', '260 Powell River Str', 972523209);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (132, 'Cocker', '94 McGriff Road', 972566675);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (133, 'Yankovic', '84 Schiavelli Road', 972508131);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (134, 'Ponty', '54 Patillo Ave', 972518792);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (135, 'Suchet', '87 Garfunkel Street', 972571785);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (136, 'Chappelle', '623 William Blvd', 972564574);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (137, 'Butler', '70 Brendan', 972530274);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (138, 'Buffalo', '18 Sewell Blvd', 972525297);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (139, 'Favreau', '95 urban Street', 972577462);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (140, 'Crow', '740 Gerald Street', 972523480);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (141, 'Clinton', '87 Anthony Road', 972517993);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (142, 'Sayer', '23 Pollack Street', 972595810);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (143, 'Quaid', '82nd Street', 972550984);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (144, 'Galecki', '918 Eder Street', 972586809);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (145, 'Cruz', '570 Fleet Drive', 972559451);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (146, 'DeVita', '19 Whitford Ave', 972559661);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (147, 'Graham', '246 Alfie Drive', 972551608);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (148, 'McDonald', '82nd Street', 972538521);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (149, 'Holbrook', '31 Vicious Street', 972551011);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (150, 'Herndon', '73 Wahlberg Drive', 972565894);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (151, 'Sedgwick', '34 Coburg Street', 972532891);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (152, 'Speaks', '36 Embeth Ave', 972590063);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (153, 'Lennix', '22 Ricardson Drive', 972534338);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (154, 'Mortensen', '11 Baker Street', 972588663);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (155, 'Lang', '53rd Street', 972522742);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (156, 'Allen', '99 Crewson Blvd', 972530864);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (157, 'Matarazzo', '59 Stanley Drive', 972573880);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (158, 'Coyote', '67 Staten Island Str', 972588898);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (159, 'Hyde', '76 Brent Road', 972574831);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (160, 'Raybon', '992 Epps Street', 972593937);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (161, 'Kenoly', '43 Cantrell', 972522573);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (162, 'Peebles', '41st Street', 972554833);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (163, 'Fogerty', '343 Bruneck Street', 972595186);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (164, 'Carrington', '67 Sendai Road', 972505972);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (165, 'Aglukark', '28 Berkoff Street', 972550002);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (166, 'Pastore', '63 St Jean de Soudai', 972526310);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (167, 'Cassidy', '46 Walken Drive', 972511796);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (168, 'Osment', '165 Chrissie Blvd', 972593408);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (169, 'Danes', '454 Shawn Road', 972590617);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (170, 'Molina', '27 Chaam Street', 972505583);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (171, 'Rourke', '31 Zwolle Road', 972526952);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (172, 'Coyote', '17 Christopher Stree', 972537448);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (173, 'Wayans', '88 Ness', 972584222);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (174, 'Reynolds', '79 Brampton Drive', 972511044);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (175, 'Adams', '915 Cumming Drive', 972577864);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (176, 'McGriff', '8 Tambor Blvd', 972584713);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (177, 'Sirtis', '997 Lane Road', 972585684);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (178, 'Cole', '77 Lucas Drive', 972594564);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (179, 'Gyllenhaal', '996 Rains Street', 972506020);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (180, 'Cochran', '52 Polley Drive', 972584971);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (181, 'Bandy', '32 Marshall Road', 972543567);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (182, 'Steagall', '65 Davidtz Street', 972578811);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (183, 'Summer', '39 Bad Camberg Stree', 972571879);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (184, 'Spears', '97 Freeman Road', 972525925);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (185, 'Buckingham', '91 Willem Drive', 972533919);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (186, 'Holy', '56 Mae Street', 972563737);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (187, 'Rain', '44 Short Street', 972597101);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (188, 'Dean', '293 Fiennes Road', 972522994);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (189, 'Shorter', '18 Sisto Ave', 972538800);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (190, 'Rickman', '63 Craddock Road', 972543427);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (191, 'Tomei', '31 Cardiff Drive', 972535269);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (192, 'Craig', '59 Baker Road', 972537295);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (193, 'Collette', '19 Martha Road', 972571930);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (194, 'Eastwood', '91st Street', 972526573);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (195, 'Howard', '82nd Street', 972564767);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (196, 'Marley', '22 Collin Road', 972590506);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (197, 'Colin Young', '19 Klein Street', 972503371);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (198, 'Polley', '51 Corey Street', 972516305);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (199, 'Myers', '168 Gold Road', 972582315);
commit;
prompt 100 records committed...
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (200, 'Elizabeth', '419 Seann Street', 972519740);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (201, 'May', '8 Alessandro Drive', 972513579);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (202, 'Hector', '72 Keen Drive', 972555958);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (203, 'Dukakis', '76 Craig Road', 972598079);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (204, 'Chappelle', '459 Earl Road', 972513063);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (205, 'Kirkwood', '74 Reisterstown Stre', 972572503);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (206, 'Hurt', '72 McCoy Ave', 972557680);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (207, 'Heche', '22nd Street', 972565407);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (208, 'Maxwell', '13 Brussel Street', 972567202);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (209, 'Preston', '29 McDowell Drive', 972563330);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (210, 'Estevez', '26 Juliette Street', 972563054);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (211, 'Botti', '63 Herbie Street', 972509540);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (212, 'Foster', '425 Atkinson', 972597643);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (213, 'O''Hara', '94 McGinley Street', 972589297);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (214, 'Carr', '324 Athens Drive', 972584950);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (215, 'Watley', '30 Snider Drive', 972516979);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (216, 'Albright', '96 Teena Blvd', 972548820);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (217, 'Kirkwood', '16 Katt Road', 972505029);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (218, 'Teng', '21 Loring Street', 972507054);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (219, 'Gertner', '93 Rudd Ave', 972562056);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (220, 'Pepper', '14 Chaplin Ave', 972553977);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (221, 'Gyllenhaal', '28 McCready Street', 972563009);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (222, 'Nelligan', '77 Moss', 972532005);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (223, 'Latifah', '30 Dickinson', 972551509);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (224, 'Kimball', '15 Bridget Ave', 972509938);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (225, 'Tempest', '991 High Wycombe Dri', 972504024);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (226, 'Gatlin', '61 Bobby Road', 972519846);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (227, 'Harrison', '832 Neneh', 972571547);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (228, 'Almond', '64 Rich Street', 972585616);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (229, 'Starr', '32 Jessee Road', 972531424);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (230, 'Conners', '68 Pepper Drive', 972599962);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (231, 'Sevigny', '521 Andrea Ave', 972597785);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (232, 'Oates', '68 Art', 972531248);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (233, 'Bonneville', '9 O''Hara Ave', 972502496);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (234, 'Kretschmann', '91 Tennison Street', 972511591);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (235, 'Torino', '13 Padova Street', 972597705);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (236, 'Salonga', '98 Milsons Point Ave', 972538848);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (237, 'Abraham', '43rd Street', 972593709);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (238, 'McCormack', '22nd Street', 972514739);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (239, 'Twilley', '64 Squier Road', 972517545);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (240, 'Pitney', '44 Burrows Road', 972508990);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (241, 'Supernaw', '80 Peniston Drive', 972519966);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (242, 'Bancroft', '8 Weaving Blvd', 972541095);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (243, 'Olin', '850 Warburton Street', 972518392);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (244, 'Tah', '63 Myles Drive', 972546196);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (245, 'Connelly', '14 Rose', 972530463);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (246, 'Berkoff', '50 Platt Ave', 972510499);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (247, 'King', '41 Malone Ave', 972507523);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (248, 'Ness', '21 Frank Drive', 972551453);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (249, 'Polley', '98 Hidalgo Blvd', 972541354);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (250, 'Paxton', '799 Knutsford Drive', 972590210);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (251, 'Henstridge', '91 William', 972590408);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (252, 'Geldof', '21st Street', 972547224);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (253, 'Barry', '97 Freddie Drive', 972588085);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (254, 'Mantegna', '26 Cattrall Blvd', 972564327);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (255, 'Gibbons', '12nd Street', 972537541);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (256, 'Henstridge', '310 Leon Road', 972559220);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (257, 'Neil', '65 Murdock Road', 972586725);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (258, 'Merchant', '957 McKellen Street', 972570895);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (259, 'Fisher', '12 Don Road', 972505797);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (260, 'Hirsch', '91 Alexander Street', 972583654);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (261, 'Van Helden', '732 Martinez Street', 972571738);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (262, 'Jackman', '550 Blossoms Road', 972517845);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (263, 'Tambor', '89 Lucien', 972541584);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (264, 'Yorn', '69 Claude Street', 972503824);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (265, 'Dickinson', '64 Waits Street', 972592905);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (266, 'Sinise', '2 Grant Blvd', 972598207);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (267, 'Trevino', '57 Emmylou Road', 972587311);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (268, 'Burke', '84 Ipswich Road', 972580561);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (269, 'Mason', '80 Wakeling Street', 972584665);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (270, 'Ferrer', '76 Osmond Drive', 972589211);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (271, 'Dickinson', '90 Or-yehuda Street', 972574682);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (272, 'Van Der Beek', '34 Colleen Street', 972503453);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (273, 'Linney', '12 Holiday Road', 972585332);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (274, 'Eat World', '18 Rozenburg Drive', 972582813);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (275, 'Rippy', '90 Tankard Street', 972576041);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (276, 'Blades', '59 Larenz Drive', 972520981);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (277, 'Pleasence', '589 Raul Street', 972515284);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (278, 'DiFranco', '4 Wiest Street', 972583620);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (279, 'Foley', '83 Allen Ave', 972512491);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (280, 'Myers', '96 Zellweger Ave', 972570159);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (281, 'Napolitano', '49 Sarah Road', 972566384);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (282, 'Biel', '92 Roundtree Road', 972562048);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (283, 'Duke', '27 Hong Kong Street', 972577813);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (284, 'Sweet', '8 Caviezel Blvd', 972559342);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (285, 'Beatty', '264 Quatro Street', 972581630);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (286, 'Orlando', '91 Hope Street', 972512184);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (287, 'Arden', '5 Malkovich Blvd', 972515278);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (288, 'Moreno', '100 Burke Street', 972510112);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (289, 'Smith', '67 Gainesville Road', 972505295);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (290, 'Wen', '43 Bologna', 972543901);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (291, 'Cornell', '16 Richter Drive', 972557530);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (292, 'Detmer', '81st Street', 972569660);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (293, 'Capshaw', '4 Conlee', 972526938);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (294, 'Beck', '42nd Street', 972519257);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (295, 'Tobolowsky', '17 Schenectady Drive', 972534787);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (296, 'Rhymes', '49 Oshkosh Drive', 972596755);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (297, 'Bean', '10 Terence Road', 972559657);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (298, 'Navarro', '92 Rockwell', 972564613);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (299, 'Wen', '42nd Street', 972557054);
commit;
prompt 200 records committed...
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (300, 'Tripplehorn', '100 Reid Ave', 972555613);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (301, 'Reinhold', '74 Close Road', 972506198);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (302, 'Hutch', '84 Birmingham', 972545496);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (303, 'Davis', '18 Makowicz Road', 972506057);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (304, 'Dysart', '87 Lillard Street', 972537031);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (305, 'Latifah', '9 Ruth Street', 972566873);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (306, 'Voight', '6 Valentin Street', 972520286);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (307, 'McDonnell', '57 Buscemi Street', 972578119);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (308, 'Gershon', '21 Bancroft Drive', 972531696);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (309, 'Venora', '56 Santa Rosa Street', 972515406);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (310, 'Fiorentino', '4 Cocker Drive', 972552618);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (311, 'Fiennes', '976 Amsterdam Street', 972566481);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (312, 'Spacek', '19 Penn Street', 972568816);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (313, 'Swank', '492 Sarsgaard Blvd', 972544460);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (314, 'Mann', '910 O''Neill Road', 972517017);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (315, 'Francis', '32 Green Drive', 972572545);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (316, 'Carlisle', '86 Hershey Street', 972530225);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (317, 'Lewin', '88 Holly Drive', 972528973);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (318, 'Sainte-Marie', '91st Street', 972584156);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (319, 'Basinger', '92nd Street', 972588269);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (320, 'Ponce', '54 Matarazzo Ave', 972536089);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (321, 'Davison', '28 Rich Blvd', 972536167);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (322, 'Ranger', '91 Biehn Street', 972520635);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (323, 'Chesnutt', '45 Stony Point Drive', 972506153);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (324, 'Sainte-Marie', '83rd Street', 972547838);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (325, 'Briscoe', '644 Gore Road', 972594724);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (326, 'Coward', '38 Ashland Ave', 972592780);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (327, 'Kleinenberg', '90 Snoqualmie Drive', 972578916);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (328, 'Vanian', '5 Tinsley Road', 972552969);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (329, 'Tanon', '62nd Street', 972539070);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (330, 'Douglas', '948 Molina Road', 972585234);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (331, 'Nakai', '46 Wheel Road', 972533831);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (332, 'Vai', '99 Ice Blvd', 972582490);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (333, 'Snow', '73 Keeslar Drive', 972528337);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (334, 'Klein', '41st Street', 972590476);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (335, 'Gibson', '57 Köln Drive', 972540417);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (336, 'Kinski', '338 Robbins Road', 972568905);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (337, 'Ball', '98 Kloten Drive', 972528408);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (338, 'Westerberg', '71 Ljubljana Drive', 972538916);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (339, 'Warwick', '55 Cook Drive', 972500621);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (340, 'LaMond', '288 Noah', 972583273);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (341, 'Garner', '58 Child Blvd', 972508428);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (342, 'Rauhofer', '59 Laws Street', 972531226);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (343, 'Northam', '100 Rua eteno Street', 972532989);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (344, 'LaPaglia', '48 Vilnius Street', 972540812);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (345, 'Margolyes', '43rd Street', 972539545);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (346, 'Adkins', '99 Cattrall Drive', 972534160);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (347, 'Garr', '64 Greenwood Road', 972560604);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (348, 'Harrison', '59 Kanazawa Ave', 972507501);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (349, 'Rydell', '88 Oro', 972560081);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (350, 'Clayton', '35 Weaving Street', 972548994);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (351, 'Barkin', '51 Renfro Street', 972514368);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (352, 'Arkin', '732 Nelson Street', 972551264);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (353, 'Caine', '83 Angelina', 972506377);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (354, 'Hannah', '83 Buffy Road', 972572769);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (355, 'Rebhorn', '64 Bassett Drive', 972557926);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (356, 'Utada', '87 Dempsey Street', 972589329);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (357, 'Lewis', '14 Ricardson Ave', 972557453);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (358, 'Del Toro', '82 Wen Road', 972507208);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (359, 'Bloch', '71 Kirk Street', 972531490);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (360, 'Hartnett', '39 Chaam Blvd', 972567066);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (361, 'Rhodes', '92 Shepard Drive', 972504789);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (362, 'Cartlidge', '42nd Street', 972554441);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (363, 'Skaggs', '99 Coburg Ave', 972511748);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (364, 'Richardson', '86 Nicolas Street', 972520580);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (365, 'Rankin', '77 Collie Road', 972514470);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (366, 'Donovan', '17 Carrie Street', 972566450);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (367, 'Hughes', '665 Nepean Road', 972585081);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (368, 'McBride', '467 Judi Drive', 972547742);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (369, 'Koyana', '20 Oshkosh Road', 972584734);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (370, 'Meniketti', '95 Eindhoven Drive', 972595180);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (371, 'Peniston', '95 Lisbon Drive', 972513018);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (372, 'Thompson', '37 Heubach Street', 972580914);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (373, 'English', '486 Spine Street', 972529362);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (374, 'Cozier', '4 Ft. Leavenworth Ro', 972545227);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (375, 'Solido', '57 Rucker Blvd', 972554981);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (376, 'Belushi', '3 Romijn-Stamos Driv', 972516259);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (377, 'Singletary', '50 Reilly Street', 972515692);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (378, 'Gandolfini', '5 Kingsley', 972596406);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (379, 'Gandolfini', '32nd Street', 972546190);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (380, 'Briscoe', '510 Frankfurt Drive', 972533382);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (381, 'Dale', '75 Joe Drive', 972506313);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (382, 'Langella', '55 Nelligan Road', 972537225);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (383, 'Fraser', '440 McNarland Street', 972572396);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (384, 'Ontiveros', '48 Collins Drive', 972503669);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (385, 'Wen', '76 Phifer Road', 972538932);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (386, 'Nicholas', '74 Bright Road', 972555801);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (387, 'Whitley', '9 Tara Drive', 972563507);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (388, 'Snipes', '16 Stormare Street', 972577354);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (389, 'Viterelli', '60 Parish Ave', 972559203);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (390, 'Holm', '12nd Street', 972543609);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (391, 'Page', '59 Paymer Street', 972583693);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (392, 'Michael', '81 Palminteri Ave', 972552540);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (393, 'Black', '58 Reeve Blvd', 972591511);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (394, 'Gilley', '25 Lane Street', 972575628);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (395, 'McElhone', '74 Robbie Road', 972542263);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (396, 'Dukakis', '59 Elijah Ave', 972548243);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (397, 'Stormare', '20 Edmunds Drive', 972598215);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (398, 'Jackson', '69 McIntosh', 972598494);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (399, 'Darren', '98 Dean Road', 972515636);
commit;
prompt 300 records committed...
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (400, 'Diaz', '82 Ani Drive', 972540407);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (401, 'Thewlis', '19 Jane Road', 972588673);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (402, 'Mathis', '43 Snow Road', 972504637);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (403, 'Lonsdale', '23 Tooele Ave', 972562265);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (404, 'Leguizamo', '91st Street', 972580031);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (405, 'Oldman', '37 Flack Road', 972504297);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (406, 'Abraham', '51 Flanagan Ave', 972561309);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (407, 'Preston', '49 Telford Road', 972536792);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (408, 'Rizzo', '9 D''Onofrio Road', 972547844);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (409, 'Holbrook', '711 Bullock Street', 972523908);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (410, 'Bugnon', '36 Vista Street', 972564506);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (411, 'Conley', '417 Sharp Ave', 972571612);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (412, 'Summer', '68 Tankard Drive', 972528812);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (413, 'Overstreet', '23 Gunton Ave', 972507968);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (414, 'Griffin', '39 Fairbanks Street', 972555458);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (415, 'McCain', '58 Wine Blvd', 972548466);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (416, 'Amos', '82 Taylor Street', 972528006);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (417, 'Hawn', '67 Emmylou Street', 972548050);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (418, 'Marsden', '31 Meredith', 972501223);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (419, 'Nunn', '575 Soest Road', 972563378);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (420, 'Brock', '98 Tottori Drive', 972595339);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (421, 'Phoenix', '21 Dreyfuss Street', 972518363);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (422, 'de Lancie', '962 Bismarck Ave', 972526135);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (423, 'Hiatt', '44 Rifkin Ave', 972596054);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (424, 'Lonsdale', '46 Leary Drive', 972534069);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (425, 'Twilley', '741 Hector Road', 972500140);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (426, 'Scorsese', '160 Paymer Road', 972591856);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (427, 'Jenkins', '491 Ramat Gan Street', 972518224);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (428, 'Bragg', '75 Carolyn Street', 972521337);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (429, 'Bacharach', '91 Neneh Ave', 972527415);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (430, 'Lynch', '23 Blanchett Road', 972552625);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (431, 'Yorn', '66 Keitel Street', 972540819);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (432, 'Oates', '63 Polley', 972570519);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (433, 'Elizondo', '67 Leto Drive', 972518813);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (434, 'Leoni', '54 Dean Drive', 972535773);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (435, 'Palminteri', '70 Neil Road', 972520666);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (436, 'Damon', '33 Matthew Street', 972546150);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (437, 'Coward', '32 Sarsgaard Street', 972527127);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (438, 'Shandling', '537 Oberwangen Blvd', 972583425);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (439, 'Sinise', '37 Burt Street', 972510522);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (440, 'Dunaway', '26 Darmstadt Road', 972525740);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (441, 'Flatts', '59 O''Neill Street', 972534218);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (442, 'McElhone', '32 Curt', 972582472);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (443, 'Ford', '648 Gleeson Road', 972506999);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (444, 'Ammons', '63 Kahn Ave', 972567731);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (445, 'Cherry', '851 Leonardo Street', 972559008);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (446, 'Perlman', '85 Hingle Street', 972568300);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (447, 'Gray', '56 Garcia Blvd', 972521693);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (448, 'Branagh', '63 Black', 972545896);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (449, 'Dushku', '85 Beckinsale Drive', 972583093);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (450, 'Malkovich', '41st Street', 972598260);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (451, 'Fonda', '32 Alan Road', 972526574);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (452, 'Stowe', '79 Chambers Ave', 972594881);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (453, 'Burns', '49 Ike Street', 972562005);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (454, 'Mewes', '46 Palminteri Drive', 972567501);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (455, 'Llewelyn', '97 Massagno Road', 972505929);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (456, 'Carlton', '23 Badalucco Drive', 972595618);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (457, 'Heslov', '71 Mint', 972540745);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (458, 'LaSalle', '92 Le chesnay Street', 972505995);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (459, 'Cervine', '83 Ponce Drive', 972585869);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (460, 'Branagh', '52 Miles Road', 972566631);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (461, 'Liu', '97 Salma Blvd', 972503550);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (462, 'Phoenix', '34 Sidney Road', 972574151);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (463, 'Torres', '76 Diffie', 972547791);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (464, 'Cage', '16 Navarro Road', 972548291);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (465, 'Dempsey', '77 Shelton Road', 972510855);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (466, 'Dorn', '89 O''Neal', 972583472);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (467, 'Henriksen', '70 Charleston Street', 972579848);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (468, 'Whitaker', '913 Crouse Street', 972552035);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (469, 'Slater', '11st Street', 972506410);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (470, 'Arkin', '12nd Street', 972508389);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (471, 'Ponty', '90 Mary-Louise', 972547946);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (472, 'Sweeney', '34 Rich Street', 972554759);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (473, 'Channing', '921 Hunt Valley Driv', 972556302);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (474, 'Seagal', '87 Enschede Drive', 972513503);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (475, 'Moraz', '72nd Street', 972528478);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (476, 'Andrews', '2 Alfred Street', 972541393);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (477, 'Howard', '915 Mitra Street', 972529208);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (478, 'Kutcher', '333 Elizondo Blvd', 972536546);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (479, 'Laurie', '82 Bachman Road', 972560636);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (480, 'Thomson', '77 Fuchstal-asch Dri', 972535449);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (481, 'Alexander', '96 Thomson Ave', 972535776);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (482, 'O''Connor', '47 Koblenz Road', 972548667);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (483, 'Whitford', '2 Joely Road', 972592369);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (484, 'Tate', '577 Rockville Drive', 972540486);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (485, 'Holm', '32nd Street', 972598200);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (486, 'Goodman', '74 Ruth Drive', 972584778);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (487, 'Burmester', '98 Denise Ave', 972506486);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (488, 'Child', '44 Jeff Ave', 972517199);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (489, 'Wopat', '63 Mewes Road', 972512161);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (490, 'Winans', '3 Ellis Blvd', 972528671);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (491, 'Schreiber', '15 Detmer Drive', 972570532);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (492, 'Lewin', '78 Ricardson Blvd', 972543219);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (493, 'O''Connor', '415 Brisbane', 972574207);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (494, 'Union', '87 Aiken Ave', 972568121);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (495, 'Keith', '992 Gersthofen Road', 972566242);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (496, 'Holm', '22nd Street', 972525636);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (497, 'Browne', '94 Jeanne Blvd', 972598111);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (498, 'Cox', '75 Franklin Road', 972530997);
insert into BRANCH (branchid, branchname, branchaddress, branchphonenumber)
values (499, 'Parish', '42 Lennie Road', 972543500);
commit;
prompt 400 records loaded
prompt Loading ACCOUNT...
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100000, 8873, to_date('24-01-2018 17:08:14', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 100);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100001, 31826, to_date('31-07-2011 10:04:01', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 101);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100002, 6953, to_date('17-06-2012 08:18:55', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 102);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100003, 97967, to_date('02-06-2005 20:27:03', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 103);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100004, 77588, to_date('17-12-2004 05:22:20', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 104);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100005, 50110, to_date('13-05-2011 23:32:42', 'dd-mm-yyyy hh24:mi:ss'), 'student', 105);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100006, 18721, to_date('06-04-2003 04:43:47', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 106);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100007, 54243, to_date('17-07-2006 10:35:53', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 107);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100008, -16822, to_date('10-03-2012 17:31:06', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 108);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100009, 85972, to_date('15-12-2003 21:58:23', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 109);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100010, 95017, to_date('17-03-2000 09:15:30', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 110);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100011, -19056, to_date('12-04-2014 04:49:54', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 111);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100012, 45237, to_date('06-12-2018 15:32:08', 'dd-mm-yyyy hh24:mi:ss'), 'student', 112);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100013, 88279, to_date('03-01-2022 12:17:58', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 113);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100014, 53435, to_date('12-09-2008 15:07:26', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 114);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100015, 79470, to_date('16-05-2001 13:44:13', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 115);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100016, -31204, to_date('25-03-2008 16:02:16', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 116);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100017, 63266, to_date('07-08-2000 21:46:17', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 117);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100018, 30357, to_date('27-09-2010 12:51:27', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 118);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100019, -4309, to_date('26-09-2014 09:06:34', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 119);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100020, 3421, to_date('01-12-2000 00:24:08', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 120);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100021, 68987, to_date('03-05-2006 05:23:06', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 121);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100022, 49845, to_date('19-07-2016 04:37:20', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 122);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100023, 77235, to_date('16-03-2014 14:58:05', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 123);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100024, 26044, to_date('25-06-2021 01:53:58', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 124);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100025, 39776, to_date('31-03-2011 11:10:21', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 125);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100026, 77473, to_date('04-09-2006 23:04:40', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 126);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100027, 30632, to_date('02-04-2011 05:04:09', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 127);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100028, 80988, to_date('06-02-2005 17:09:02', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 128);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100029, 8448, to_date('04-08-2006 07:20:52', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 129);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100030, 78971, to_date('03-04-2015 00:45:50', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 130);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100031, 83896, to_date('16-05-2019 07:44:57', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 131);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100032, -27481, to_date('22-07-2021 06:50:33', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 132);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100033, -18565, to_date('21-10-2009 23:48:01', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 133);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100034, 28724, to_date('24-04-2021 10:01:27', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 134);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100035, 91675, to_date('08-12-2022 18:18:45', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 135);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100036, -49076, to_date('15-01-2006 03:26:17', 'dd-mm-yyyy hh24:mi:ss'), 'student', 136);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100037, -43774, to_date('19-06-2014 16:41:40', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 137);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100038, 72709, to_date('20-10-2018 23:40:19', 'dd-mm-yyyy hh24:mi:ss'), 'student', 138);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100039, 22521, to_date('05-04-2010 12:35:56', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 139);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100040, 36675, to_date('14-10-2004 16:57:31', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 140);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100041, -34031, to_date('10-05-2009 05:31:52', 'dd-mm-yyyy hh24:mi:ss'), 'student', 141);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100042, 56782, to_date('12-09-2008 19:10:04', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 142);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100043, 2061, to_date('06-03-2011 12:04:50', 'dd-mm-yyyy hh24:mi:ss'), 'student', 143);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100044, -33578, to_date('13-05-2003 21:08:01', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 144);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100045, 79602, to_date('31-07-2010 06:23:48', 'dd-mm-yyyy hh24:mi:ss'), 'student', 145);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100046, 41803, to_date('13-11-2003 22:19:37', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 146);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100047, -7479, to_date('12-03-2003 10:02:55', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 147);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100048, 74701, to_date('24-04-2001 22:54:48', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 148);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100049, -25887, to_date('27-12-2002 14:11:15', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 149);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100050, 22149, to_date('15-09-2005 01:01:33', 'dd-mm-yyyy hh24:mi:ss'), 'student', 150);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100051, 13117, to_date('06-05-2020 03:59:06', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 151);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100052, 42916, to_date('26-09-2017 14:44:45', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 152);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100053, 26953, to_date('22-04-2017 10:00:42', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 153);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100054, 19730, to_date('21-08-2014 08:56:36', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 154);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100055, 10054, to_date('27-04-2016 06:58:58', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 155);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100056, 5110, to_date('22-06-2004 10:49:34', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 156);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100057, 98450, to_date('06-06-2007 09:33:22', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 157);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100058, -13661, to_date('26-07-2005 09:57:54', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 158);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100059, 39305, to_date('07-06-2014 21:22:25', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 159);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100060, 86327, to_date('02-05-2004 20:57:43', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 160);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100061, 19204, to_date('07-01-2006 17:17:12', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 161);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100062, 25185, to_date('08-01-2001 20:27:52', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 162);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100063, 26051, to_date('10-03-2000 18:22:57', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 163);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100064, -6556, to_date('12-03-2013 21:08:36', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 164);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100065, -21345, to_date('08-10-2008 05:17:23', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 165);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100066, 81017, to_date('19-10-2001 09:24:13', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 166);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100067, 80878, to_date('25-02-2000 08:01:05', 'dd-mm-yyyy hh24:mi:ss'), 'student', 167);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100068, 52730, to_date('13-06-2002 01:08:51', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 168);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100069, 43769, to_date('10-02-2013 18:33:29', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 169);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100070, 11489, to_date('03-04-2012 00:41:41', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 170);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100071, 44962, to_date('28-12-2020 13:07:19', 'dd-mm-yyyy hh24:mi:ss'), 'student', 171);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100072, 96598, to_date('06-01-2003 14:12:41', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 172);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100073, 56689, to_date('28-11-2011 06:40:05', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 173);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100074, 68987, to_date('26-02-2020 09:40:45', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 174);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100075, 47871, to_date('04-11-2005 03:45:15', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 175);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100076, -38870, to_date('10-05-2011 01:11:02', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 176);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100077, -22524, to_date('18-04-2014 17:43:04', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 177);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100078, 43927, to_date('25-05-2008 16:39:29', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 178);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100079, -5978, to_date('30-05-2000 10:30:26', 'dd-mm-yyyy hh24:mi:ss'), 'student', 179);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100080, 49345, to_date('26-03-2013 04:32:21', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 180);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100081, 67168, to_date('20-09-2006 18:46:09', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 181);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100082, -6344, to_date('09-12-2006 12:11:18', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 182);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100083, 63969, to_date('21-07-2019 21:33:38', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 183);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100084, 9569, to_date('16-01-2007 13:46:40', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 184);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100085, 79118, to_date('03-09-2022 20:15:55', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 185);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100086, 83299, to_date('18-08-2022 15:37:30', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 186);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100087, -38772, to_date('26-10-2007 08:02:26', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 187);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100088, 64033, to_date('21-12-2020 02:07:44', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 188);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100089, 71491, to_date('08-10-2005 05:25:09', 'dd-mm-yyyy hh24:mi:ss'), 'student', 189);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100090, -40642, to_date('07-10-2001 16:28:11', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 190);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100091, -33736, to_date('14-08-2000 15:51:46', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 191);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100092, 78664, to_date('10-07-2005 12:09:57', 'dd-mm-yyyy hh24:mi:ss'), 'student', 192);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100093, 45122, to_date('01-04-2015 04:51:54', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 193);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100094, 84176, to_date('27-04-2013 21:36:03', 'dd-mm-yyyy hh24:mi:ss'), 'student', 194);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100095, 49840, to_date('19-02-2005 22:59:08', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 195);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100096, -31926, to_date('26-05-2020 01:27:30', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 196);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100097, 5130, to_date('20-09-2006 23:25:44', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 197);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100098, 41595, to_date('06-02-2000 08:43:03', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 198);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100099, 85189, to_date('23-01-2022 05:47:38', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 199);
commit;
prompt 100 records committed...
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100100, 7655, to_date('20-07-2020 00:14:32', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 200);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100101, 21694, to_date('16-10-2005 11:33:48', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 201);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100102, 33526, to_date('13-12-2020 16:14:34', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 202);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100103, 12227, to_date('13-08-2018 01:01:16', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 203);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100104, -22847, to_date('08-07-2004 00:54:00', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 204);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100105, 15599, to_date('27-10-2019 12:07:58', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 205);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100106, 31062, to_date('13-10-2006 01:27:08', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 206);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100107, -8568, to_date('11-02-2001 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 207);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100108, 26733, to_date('12-09-2011 07:16:39', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 208);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100109, 29560, to_date('24-04-2003 23:15:10', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 209);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100110, -46362, to_date('22-06-2019 22:15:21', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 210);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100111, 75701, to_date('14-07-2006 12:27:25', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 211);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100112, 74751, to_date('03-12-2019 02:22:59', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 212);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100113, -34132, to_date('20-05-2022 04:52:12', 'dd-mm-yyyy hh24:mi:ss'), 'student', 213);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100114, 6448, to_date('12-01-2002 22:00:30', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 214);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100115, 34900, to_date('30-03-2022 13:04:40', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 215);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100116, -31976, to_date('05-04-2002 15:28:04', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 216);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100117, 15082, to_date('15-03-2006 09:14:57', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 217);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100118, 17488, to_date('07-05-2003 11:43:01', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 218);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100119, -44924, to_date('12-03-2007 06:55:17', 'dd-mm-yyyy hh24:mi:ss'), 'student', 219);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100120, -7181, to_date('04-01-2005 09:24:30', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 220);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100121, 51349, to_date('13-03-2003 02:41:29', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 221);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100122, 11659, to_date('11-08-2011 01:28:14', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 222);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100123, 97877, to_date('20-05-2012 03:31:37', 'dd-mm-yyyy hh24:mi:ss'), 'student', 223);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100124, -9666, to_date('29-09-2000 17:26:39', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 224);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100125, -42399, to_date('21-02-2016 14:27:47', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 225);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100126, -5696, to_date('03-12-2001 21:38:37', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 226);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100127, -27856, to_date('02-02-2022 21:36:22', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 227);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100128, 86833, to_date('08-08-2018 14:15:33', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 228);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100129, 76182, to_date('22-06-2018 08:40:12', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 229);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100130, -35498, to_date('04-09-2002 14:03:02', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 230);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100131, 9050, to_date('12-02-2017 03:31:46', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 231);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100132, 46448, to_date('03-04-2016 09:47:40', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 232);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100133, 29549, to_date('02-06-2019 20:05:50', 'dd-mm-yyyy hh24:mi:ss'), 'student', 233);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100134, 65735, to_date('11-09-2022 19:34:54', 'dd-mm-yyyy hh24:mi:ss'), 'student', 234);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100135, 30947, to_date('21-01-2006 04:08:46', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 235);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100136, -23657, to_date('06-03-2011 15:39:44', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 236);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100137, 21251, to_date('06-11-2003 13:51:14', 'dd-mm-yyyy hh24:mi:ss'), 'student', 237);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100138, 87850, to_date('13-08-2003 11:57:08', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 238);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100139, 28383, to_date('30-11-2001 00:24:52', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 239);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100140, -38059, to_date('18-12-2019 04:33:22', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 240);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100141, 12599, to_date('17-07-2001 07:33:33', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 241);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100142, 370, to_date('21-01-2015 05:01:40', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 242);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100143, -7573, to_date('03-01-2005 08:21:54', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 243);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100144, 58809, to_date('18-11-2015 11:24:45', 'dd-mm-yyyy hh24:mi:ss'), 'student', 244);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100145, 72920, to_date('24-09-2011 02:09:54', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 245);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100146, -28122, to_date('11-03-2021 19:31:27', 'dd-mm-yyyy hh24:mi:ss'), 'student', 246);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100147, 59349, to_date('06-10-2018 11:01:58', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 247);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100148, -9677, to_date('11-12-2017 10:58:21', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 248);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100149, 53987, to_date('09-07-2021 11:18:06', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 249);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100150, 30612, to_date('26-02-2022 14:12:01', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 250);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100151, -1258, to_date('11-11-2011 14:31:08', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 251);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100152, 21676, to_date('27-01-2007 19:36:42', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 252);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100153, -12569, to_date('22-10-2017 12:18:03', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 253);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100154, 90759, to_date('09-12-2014 08:33:34', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 254);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100155, 16858, to_date('05-11-2010 09:46:08', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 255);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100156, 84856, to_date('16-01-2011 01:04:44', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 256);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100157, 57862, to_date('07-07-2021 05:20:49', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 257);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100158, 49741, to_date('21-02-2005 21:21:27', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 258);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100159, -917, to_date('04-10-2003 18:40:42', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 259);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100160, 50174, to_date('12-05-2008 12:23:28', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 260);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100161, 41694, to_date('09-12-2007 23:43:36', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 261);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100162, -49466, to_date('26-10-2004 09:52:32', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 262);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100163, 77689, to_date('01-07-2004 00:26:50', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 263);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100164, 12017, to_date('23-06-2009 16:34:26', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 264);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100165, -23473, to_date('16-02-2021 06:55:44', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 265);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100166, 15906, to_date('17-05-2003 12:39:13', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 266);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100167, -1820, to_date('12-03-2017 14:15:24', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 267);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100168, 33286, to_date('25-09-2021 13:42:08', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 268);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100169, 98037, to_date('22-08-2015 23:49:10', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 269);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100170, 82122, to_date('23-01-2003 06:37:24', 'dd-mm-yyyy hh24:mi:ss'), 'student', 270);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100171, -44562, to_date('09-04-2002 02:24:07', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 271);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100172, 9025, to_date('07-11-2018 02:30:24', 'dd-mm-yyyy hh24:mi:ss'), 'student', 272);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100173, 45118, to_date('22-12-2009 10:37:27', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 273);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100174, 39297, to_date('17-12-2013 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 274);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100175, 54468, to_date('29-10-2009 12:31:18', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 275);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100176, 24308, to_date('04-05-2015 04:53:11', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 276);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100177, 23358, to_date('12-01-2003 06:00:54', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 277);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100178, 61830, to_date('04-06-2019 21:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 278);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100179, 47422, to_date('19-09-2015 17:03:46', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 279);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100180, 29979, to_date('12-04-2014 09:36:51', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 280);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100181, 38515, to_date('10-02-2018 22:42:18', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 281);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100182, 70949, to_date('07-05-2014 05:10:45', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 282);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100183, 80513, to_date('13-06-2017 00:13:58', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 283);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100184, 83149, to_date('01-02-2002 07:43:39', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 284);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100185, -13005, to_date('24-06-2002 23:11:53', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 285);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100186, 12468, to_date('13-11-2022 16:27:33', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 286);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100187, 71777, to_date('20-01-2004 21:02:36', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 287);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100188, 9531, to_date('19-08-2004 10:42:13', 'dd-mm-yyyy hh24:mi:ss'), 'student', 288);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100189, 32633, to_date('23-11-2014 20:58:23', 'dd-mm-yyyy hh24:mi:ss'), 'student', 289);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100190, 189, to_date('23-07-2011 05:28:43', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 290);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100191, 16481, to_date('20-09-2015 05:01:42', 'dd-mm-yyyy hh24:mi:ss'), 'student', 291);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100192, -42575, to_date('11-07-2000 04:31:14', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 292);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100193, -43445, to_date('26-06-2017 23:02:48', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 293);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100194, 12096, to_date('23-03-2007 20:41:42', 'dd-mm-yyyy hh24:mi:ss'), 'student', 294);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100195, -17046, to_date('10-03-2017 21:44:14', 'dd-mm-yyyy hh24:mi:ss'), 'student', 295);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100196, -12550, to_date('29-12-2013 11:17:55', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 296);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100197, 41404, to_date('10-08-2004 21:53:58', 'dd-mm-yyyy hh24:mi:ss'), 'student', 297);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100198, -22251, to_date('04-07-2000 23:06:57', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 298);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100199, 3335, to_date('18-11-2002 11:48:05', 'dd-mm-yyyy hh24:mi:ss'), 'student', 299);
commit;
prompt 200 records committed...
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100200, 57067, to_date('06-05-2015 05:21:05', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 300);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100201, 70085, to_date('26-04-2014 15:16:10', 'dd-mm-yyyy hh24:mi:ss'), 'student', 301);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100202, 64673, to_date('22-11-2011 11:41:05', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 302);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100203, -28559, to_date('18-04-2022 02:33:10', 'dd-mm-yyyy hh24:mi:ss'), 'student', 303);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100204, 20544, to_date('21-04-2014 23:15:59', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 304);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100205, -3416, to_date('23-03-2020 10:51:11', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 305);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100206, -27508, to_date('19-05-2016 16:20:18', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 306);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100207, 33162, to_date('02-12-2001 21:23:45', 'dd-mm-yyyy hh24:mi:ss'), 'student', 307);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100208, 55781, to_date('23-06-2000 19:13:43', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 308);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100209, 14653, to_date('15-04-2000 08:14:47', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 309);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100210, 67612, to_date('17-10-2005 22:56:25', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 310);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100211, 51062, to_date('24-10-2009 05:23:31', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 311);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100212, -16063, to_date('04-02-2013 04:40:52', 'dd-mm-yyyy hh24:mi:ss'), 'student', 312);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100213, -1172, to_date('10-05-2020 21:25:50', 'dd-mm-yyyy hh24:mi:ss'), 'student', 313);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100214, 52797, to_date('03-09-2004 18:24:00', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 314);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100215, 96955, to_date('01-07-2014 16:03:52', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 315);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100216, 36250, to_date('17-12-2022 11:20:36', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 316);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100217, 1819, to_date('28-11-2008 17:43:08', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 317);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100218, 7944, to_date('14-08-2012 22:25:11', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 318);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100219, 72749, to_date('07-03-2022 12:53:27', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 319);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100220, -29785, to_date('10-12-2008 16:21:03', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 320);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100221, -11699, to_date('25-11-2021 09:49:06', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 321);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100222, 39324, to_date('20-01-2007 01:30:04', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 322);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100223, 25394, to_date('06-01-2017 16:58:32', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 323);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100224, -6838, to_date('22-11-2022 23:36:50', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 324);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100225, -18277, to_date('08-07-2012 06:07:06', 'dd-mm-yyyy hh24:mi:ss'), 'student', 325);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100226, 47314, to_date('22-12-2018 06:25:40', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 326);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100227, 47854, to_date('28-05-2018 17:46:22', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 327);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100228, -36837, to_date('16-04-2005 00:03:34', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 328);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100229, 65269, to_date('27-11-2020 16:46:15', 'dd-mm-yyyy hh24:mi:ss'), 'student', 329);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100230, -23482, to_date('09-02-2015 12:06:45', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 330);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100231, 98874, to_date('27-12-2005 21:40:00', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 331);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100232, 74851, to_date('23-11-2006 19:18:22', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 332);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100233, -35756, to_date('25-10-2017 19:24:53', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 333);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100234, 82113, to_date('10-03-2008 17:02:28', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 334);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100235, -26297, to_date('30-06-2012 05:21:00', 'dd-mm-yyyy hh24:mi:ss'), 'student', 335);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100236, -48843, to_date('25-05-2017 07:50:47', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 336);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100237, -13316, to_date('30-06-2017 15:20:07', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 337);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100238, 8482, to_date('13-05-2021 07:01:14', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 338);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100239, 47073, to_date('02-02-2017 08:58:41', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 339);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100240, 73978, to_date('16-03-2000 13:20:17', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 340);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100241, 77426, to_date('15-07-2022 07:10:28', 'dd-mm-yyyy hh24:mi:ss'), 'student', 341);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100242, 55049, to_date('15-02-2017 04:41:37', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 342);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100243, -37619, to_date('22-10-2009 04:58:44', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 343);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100244, -17104, to_date('05-10-2005 01:20:20', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 344);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100245, 72820, to_date('12-02-2020 02:10:31', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 345);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100246, 47806, to_date('15-12-2021 07:13:39', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 346);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100247, 44425, to_date('19-02-2020 22:26:28', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 347);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100248, -22300, to_date('28-07-2011 09:47:57', 'dd-mm-yyyy hh24:mi:ss'), 'student', 348);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100249, 18228, to_date('23-01-2018 21:59:43', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 349);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100250, -11569, to_date('09-05-2015 17:25:18', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 350);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100251, -23225, to_date('31-05-2005 22:02:13', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 351);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100252, 89599, to_date('11-03-2007 14:15:42', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 352);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100253, 71058, to_date('15-06-2017 15:03:28', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 353);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100254, 96543, to_date('09-10-2011 16:32:26', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 354);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100255, -16526, to_date('16-07-2013 17:58:58', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 355);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100256, -7757, to_date('21-06-2003 03:50:40', 'dd-mm-yyyy hh24:mi:ss'), 'student', 356);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100257, 60304, to_date('13-04-2019 13:46:47', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 357);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100258, 87443, to_date('24-12-2016 20:14:43', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 358);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100259, 49184, to_date('28-08-2009 15:29:26', 'dd-mm-yyyy hh24:mi:ss'), 'student', 359);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100260, 12384, to_date('03-04-2017 02:08:57', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 360);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100261, 69597, to_date('22-11-2016 22:49:39', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 361);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100262, -658, to_date('04-11-2001 01:23:30', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 362);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100263, -48227, to_date('03-12-2011 08:23:54', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 363);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100264, 51451, to_date('16-09-2000 19:31:26', 'dd-mm-yyyy hh24:mi:ss'), 'student', 364);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100265, -1579, to_date('27-06-2005 16:06:38', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 365);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100266, 18198, to_date('13-09-2018 01:40:11', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 366);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100267, 96613, to_date('12-11-2006 06:02:08', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 367);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100268, 19934, to_date('16-12-2016 13:42:57', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 368);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100269, 43914, to_date('09-07-2000 11:36:34', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 369);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100270, 50184, to_date('25-10-2004 02:52:04', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 370);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100271, -16402, to_date('24-09-2018 23:14:12', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 371);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100272, 68865, to_date('23-04-2012 12:41:55', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 372);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100273, 37127, to_date('08-06-2013 20:02:42', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 373);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100274, 75135, to_date('07-08-2012 19:08:15', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 374);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100275, -19562, to_date('23-06-2011 00:02:33', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 375);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100276, 7414, to_date('05-07-2017 18:45:34', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 376);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100277, 64605, to_date('13-05-2013 09:31:33', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 377);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100278, 55904, to_date('30-07-2010 05:26:39', 'dd-mm-yyyy hh24:mi:ss'), 'student', 378);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100279, 66086, to_date('05-11-2016 05:14:05', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 379);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100280, 79230, to_date('24-05-2006 16:54:00', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 380);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100281, 88021, to_date('24-01-2011 11:35:24', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 381);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100282, -48578, to_date('04-11-2000 23:19:12', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 382);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100283, 87788, to_date('19-01-2000 23:05:58', 'dd-mm-yyyy hh24:mi:ss'), 'student', 383);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100284, 52485, to_date('20-10-2013 04:49:21', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 384);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100285, 93033, to_date('23-09-2015 01:57:43', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 385);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100286, -25772, to_date('06-04-2002 22:25:38', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 386);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100287, -19172, to_date('23-08-2011 05:36:15', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 387);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100288, 90871, to_date('10-04-2015 22:52:06', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 388);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100289, -45229, to_date('01-08-2020 22:35:09', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 389);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100290, 73741, to_date('21-06-2012 10:50:31', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 390);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100291, 14786, to_date('13-04-2010 07:03:35', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 391);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100292, 36022, to_date('20-05-2012 08:30:41', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 392);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100293, 65059, to_date('30-11-2016 09:32:50', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 393);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100294, 51508, to_date('10-07-2010 08:19:40', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 394);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100295, 99879, to_date('23-01-2004 01:25:19', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 395);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100296, -5460, to_date('17-02-2009 05:59:22', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 396);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100297, 32502, to_date('21-03-2011 23:05:45', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 397);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100298, 10239, to_date('18-09-2022 20:34:26', 'dd-mm-yyyy hh24:mi:ss'), 'student', 398);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100299, 36088, to_date('11-06-2000 00:47:12', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 399);
commit;
prompt 300 records committed...
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100300, -18099, to_date('01-01-2011 03:10:41', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 400);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100301, -42023, to_date('19-12-2010 03:53:34', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 401);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100302, 49322, to_date('01-08-2020 13:05:03', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 402);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100303, 10674, to_date('20-06-2014 17:02:06', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 403);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100304, 51052, to_date('26-07-2019 09:03:26', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 404);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100305, 33695, to_date('12-01-2002 02:13:47', 'dd-mm-yyyy hh24:mi:ss'), 'student', 405);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100306, 83113, to_date('17-07-2009 09:45:40', 'dd-mm-yyyy hh24:mi:ss'), 'student', 406);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100307, 23212, to_date('05-10-2015 14:26:13', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 407);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100308, 12306, to_date('27-03-2018 06:05:20', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 408);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100309, -39856, to_date('28-11-2011 01:17:43', 'dd-mm-yyyy hh24:mi:ss'), 'student', 409);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100310, 93602, to_date('23-10-2011 14:17:08', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 410);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100311, 42452, to_date('11-03-2013 05:28:09', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 411);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100312, 2458, to_date('07-10-2017 20:14:05', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 412);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100313, 8512, to_date('30-12-2006 09:05:36', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 413);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100314, 34324, to_date('16-11-2005 04:19:51', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 414);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100315, 12836, to_date('06-06-2013 20:17:05', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 415);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100316, 67233, to_date('08-08-2003 10:09:50', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 416);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100317, 44873, to_date('08-11-2003 09:31:44', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 417);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100318, 84, to_date('13-06-2016 11:46:47', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 418);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100319, 11356, to_date('20-12-2011 10:21:24', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 419);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100320, 77572, to_date('25-07-2012 00:48:42', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 420);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100321, -38162, to_date('19-02-2018 07:56:40', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 421);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100322, 95977, to_date('05-07-2022 22:22:44', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 422);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100323, 94243, to_date('14-08-2003 23:36:59', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 423);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100324, 50330, to_date('29-01-2021 18:44:27', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 424);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100325, 28974, to_date('18-07-2021 10:13:00', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 425);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100326, 37345, to_date('30-01-2017 14:46:00', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 426);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100327, 36223, to_date('27-06-2006 13:02:00', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 427);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100328, 57976, to_date('29-10-2013 09:48:20', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 428);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100329, 66991, to_date('27-02-2019 02:05:27', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 429);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100330, -2349, to_date('25-12-2003 03:10:05', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 430);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100331, 52078, to_date('11-01-2013 17:50:38', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 431);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100332, 20260, to_date('26-07-2005 12:05:38', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 432);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100333, 21055, to_date('25-09-2020 14:11:56', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 433);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100334, 5169, to_date('01-03-2021 05:27:32', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 434);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100335, 34221, to_date('08-06-2013 01:57:33', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 435);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100336, 53281, to_date('09-11-2008 04:21:04', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 436);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100337, 27054, to_date('11-03-2015 04:59:10', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 437);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100338, -24593, to_date('20-09-2009 02:13:11', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 438);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100339, 83441, to_date('06-08-2014 12:38:35', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 439);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100340, 38162, to_date('27-04-2006 13:19:16', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 440);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100341, 21537, to_date('07-02-2005 01:14:09', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 441);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100342, 8421, to_date('23-04-2016 05:30:07', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 442);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100343, 71113, to_date('12-01-2005 00:23:25', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 443);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100344, -34621, to_date('10-12-2010 15:05:32', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 444);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100345, 99444, to_date('26-04-2015 18:59:05', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 445);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100346, 91282, to_date('16-06-2014 16:25:35', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 446);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100347, 40292, to_date('02-12-2016 05:56:19', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 447);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100348, 88466, to_date('23-01-2003 08:27:30', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 448);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100349, 72325, to_date('28-01-2000 08:36:34', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 449);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100350, 52724, to_date('28-10-2019 04:32:33', 'dd-mm-yyyy hh24:mi:ss'), 'student', 450);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100351, 49092, to_date('19-12-2004 09:10:04', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 451);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100352, -4956, to_date('08-09-2007 07:45:28', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 452);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100353, 77377, to_date('26-11-2011 12:24:31', 'dd-mm-yyyy hh24:mi:ss'), 'student', 453);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100354, 53496, to_date('07-11-2009 01:48:20', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 454);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100355, 81429, to_date('13-08-2007 02:46:54', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 455);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100356, -44738, to_date('05-09-2015 19:35:31', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 456);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100357, 63865, to_date('26-06-2022 03:58:31', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 457);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100358, 85245, to_date('01-05-2009 02:53:57', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 458);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100359, 42083, to_date('24-09-2009 12:34:02', 'dd-mm-yyyy hh24:mi:ss'), 'student', 459);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100360, 79688, to_date('17-01-2015 05:35:07', 'dd-mm-yyyy hh24:mi:ss'), 'student', 460);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100361, 95095, to_date('31-10-2001 17:55:10', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 461);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100362, -9218, to_date('02-02-2017 08:45:16', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 462);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100363, -15500, to_date('30-03-2011 22:30:29', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 463);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100364, 80422, to_date('21-01-2008 10:07:45', 'dd-mm-yyyy hh24:mi:ss'), 'student', 464);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100365, 72262, to_date('05-05-2009 12:11:37', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 465);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100366, 21542, to_date('09-09-2006 14:52:59', 'dd-mm-yyyy hh24:mi:ss'), 'student', 466);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100367, 38102, to_date('29-12-2017 04:16:41', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 467);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100368, 60197, to_date('03-04-2022 07:25:26', 'dd-mm-yyyy hh24:mi:ss'), 'student', 468);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100369, -43399, to_date('10-09-2000 19:20:27', 'dd-mm-yyyy hh24:mi:ss'), 'student', 469);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100370, 12183, to_date('24-07-2007 06:28:16', 'dd-mm-yyyy hh24:mi:ss'), 'student', 470);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100371, 42488, to_date('10-09-2002 18:33:44', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 471);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100372, -31920, to_date('16-12-2016 05:35:24', 'dd-mm-yyyy hh24:mi:ss'), 'foreign', 472);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100373, 25510, to_date('01-07-2015 05:05:22', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 473);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100374, -29331, to_date('13-03-2009 12:24:12', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 474);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100375, 19192, to_date('19-07-2004 16:03:15', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 475);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100376, 26959, to_date('23-01-2000 06:12:44', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 476);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100377, -12489, to_date('09-01-2021 18:32:56', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 477);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100378, 22079, to_date('02-02-2002 02:44:43', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 478);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100379, 44010, to_date('05-12-2008 15:16:18', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 479);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100380, 68015, to_date('09-06-2013 23:40:27', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 480);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100381, 48080, to_date('24-02-2013 13:36:05', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 481);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100382, -19570, to_date('01-12-2012 22:01:25', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 482);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100383, 24689, to_date('20-02-2013 04:52:14', 'dd-mm-yyyy hh24:mi:ss'), 'closed', 483);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100384, 25733, to_date('12-02-2022 16:21:37', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 484);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100385, 17958, to_date('09-03-2012 11:26:24', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 485);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100386, -40225, to_date('30-05-2018 17:04:52', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 486);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100387, 61807, to_date('26-02-2018 04:06:25', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 487);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100388, 93761, to_date('16-02-2021 17:23:33', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 488);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100389, -4367, to_date('17-11-2022 16:27:02', 'dd-mm-yyyy hh24:mi:ss'), 'minor', 489);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100390, 55493, to_date('30-10-2021 20:43:09', 'dd-mm-yyyy hh24:mi:ss'), 'student', 490);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100391, 76122, to_date('15-11-2022 07:23:10', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 491);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100392, 30861, to_date('06-10-2019 21:56:37', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 492);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100393, 17510, to_date('29-09-2005 00:49:03', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 493);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100394, 82975, to_date('20-08-2005 03:27:16', 'dd-mm-yyyy hh24:mi:ss'), 'student', 494);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100395, -23972, to_date('16-03-2009 10:57:58', 'dd-mm-yyyy hh24:mi:ss'), 'regular', 495);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100396, -41661, to_date('24-07-2009 22:39:57', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 496);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100397, 53243, to_date('23-10-2018 02:35:03', 'dd-mm-yyyy hh24:mi:ss'), 'soldier', 497);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100398, -14721, to_date('04-10-2000 14:58:47', 'dd-mm-yyyy hh24:mi:ss'), 'student', 498);
insert into ACCOUNT (accountid, balance, dateopened, accountstatus, branchid)
values (100399, 52181, to_date('24-06-2021 07:40:42', 'dd-mm-yyyy hh24:mi:ss'), 'elderly', 499);
commit;
prompt 400 records loaded
prompt Loading BLACKLIST...
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100000, .05, 4294962596);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100001, .18, 4294960392);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100002, .16, 4294961885);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100003, .05, 4294959454);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100004, .01, 4294959169);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100005, .16, 4294960792);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100006, .01, 4294963138);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100007, .18, 4294959979);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100008, .2, 4294963471);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100009, .16, 4294967251);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100010, .12, 4294960523);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100011, .16, 4294963182);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100012, .1, 4294961028);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100013, .12, 4294965000);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100014, .01, 4294959660);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100015, .1, 4294959626);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100016, .18, 4294958831);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100017, .14, 4294962037);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100018, .2, 4294961523);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100019, .1, 4294960049);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100020, .14, 4294964532);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100021, .16, 4294959103);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100022, .01, 4294961955);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100023, .14, 4294963161);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100024, .12, 4294961263);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100025, .16, 4294960291);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100026, .16, 4294966806);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100027, .12, 4294964056);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100028, .18, 4294958092);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100029, .05, 4294964272);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100030, .2, 4294962691);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100031, .2, 4294963260);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100032, .14, 4294966094);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100033, .01, 4294966156);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100034, .12, 4294963382);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100035, .18, 4294966397);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100036, .14, 4294960048);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100037, .18, 4294959966);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100038, .14, 4294961813);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100039, .1, 4294964483);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100040, .01, 4294965770);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100041, .2, 4294961751);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100042, .05, 4294957724);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100043, .2, 4294964842);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100044, .16, 4294963050);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100045, .12, 4294963311);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100046, .16, 4294960917);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100047, .01, 4294962650);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100048, .05, 4294964234);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100049, .1, 4294966554);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100050, .1, 4294960144);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100051, .14, 4294963105);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100052, .05, 4294958423);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100053, .1, 4294958474);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100054, .18, 4294957622);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100055, .01, 4294964216);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100056, .18, 4294961296);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100057, .1, 4294966766);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100058, .14, 4294959166);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100059, .05, 4294960225);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100060, .1, 4294960557);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100061, .1, 4294966041);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100062, .12, 4294959951);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100063, .05, 4294965647);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100064, .12, 4294967012);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100065, .2, 4294964695);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100066, .2, 4294965902);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100067, .18, 4294959937);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100068, .05, 4294961267);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100069, .2, 4294962383);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100070, .18, 4294960700);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100071, .14, 4294962790);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100072, .16, 4294966054);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100073, .18, 4294958125);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100074, .01, 4294958426);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100075, .16, 4294960049);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100076, .12, 4294964178);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100077, .14, 4294959041);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100078, .01, 4294961816);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100079, .05, 4294960256);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100080, .05, 4294962091);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100081, .18, 4294959698);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100082, .2, 4294966152);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100083, .2, 4294961816);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100084, .18, 4294959094);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100085, .18, 4294962099);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100086, .12, 4294958770);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100087, .14, 4294960789);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100088, .2, 4294962160);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100089, .12, 4294966281);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100090, .16, 4294964203);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100091, .14, 4294959313);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100092, .12, 4294966381);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100093, .1, 4294961552);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100094, .05, 4294964936);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100095, .05, 4294964642);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100096, .12, 4294961043);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100097, .12, 4294958342);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100098, .1, 4294957795);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100099, .12, 4294958816);
commit;
prompt 100 records committed...
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100100, .05, 4294961330);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100101, .12, 4294960688);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100102, .05, 4294965961);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100103, .18, 4294958954);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100104, .18, 4294965641);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100105, .05, 4294959334);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100106, .1, 4294966604);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100107, .18, 4294958171);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100108, .01, 4294958542);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100109, .01, 4294965464);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100110, .16, 4294964145);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100111, .14, 4294967124);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100112, .1, 4294959346);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100113, .12, 4294965058);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100114, .12, 4294959143);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100115, .05, 4294966173);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100116, .14, 4294966302);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100117, .18, 4294963873);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100118, .18, 4294962810);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100119, .16, 4294958182);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100120, .16, 4294966424);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100121, .14, 4294963047);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100122, .2, 4294967141);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100123, .2, 4294961935);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100124, .05, 4294960945);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100125, .16, 4294965328);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100126, .14, 4294960681);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100127, .16, 4294966175);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100128, .16, 4294966383);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100129, .12, 4294961934);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100130, .2, 4294959911);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100131, .01, 4294964274);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100132, .05, 4294961244);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100133, .16, 4294960030);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100134, .1, 4294966258);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100135, .12, 4294959527);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100136, .2, 4294958348);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100137, .16, 4294960835);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100138, .2, 4294958732);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100139, .12, 4294961072);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100140, .16, 4294962776);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100141, .2, 4294958349);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100142, .12, 4294962190);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100143, .1, 4294960428);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100144, .2, 4294965443);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100145, .2, 4294958715);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100146, .18, 4294961220);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100147, .12, 4294958665);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100148, .16, 4294962299);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100149, .16, 4294960194);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100150, .05, 4294959653);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100151, .14, 4294964199);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100152, .2, 4294959155);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100153, .05, 4294963772);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100154, .16, 4294965704);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100155, .1, 4294961206);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100156, .1, 4294962129);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100157, .14, 4294964390);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100158, .01, 4294962724);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100159, .1, 4294958671);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100160, .05, 4294963722);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100161, .14, 4294962803);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100162, .14, 4294965599);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100163, .12, 4294960049);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100164, .05, 4294964515);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100165, .1, 4294958054);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100166, .2, 4294962752);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100167, .2, 4294963563);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100168, .1, 4294960495);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100169, .16, 4294960586);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100170, .14, 4294963786);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100171, .1, 4294963118);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100172, .1, 4294966008);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100173, .2, 4294965969);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100174, .14, 4294962740);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100175, .18, 4294959848);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100176, .2, 4294962323);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100177, .12, 4294959254);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100178, .14, 4294966982);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100179, .2, 4294964284);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100180, .14, 4294961844);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100181, .14, 4294959958);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100182, .2, 4294961714);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100183, .12, 4294959141);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100184, .16, 4294957922);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100185, .01, 4294957665);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100186, .16, 4294960116);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100187, .18, 4294962742);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100188, .14, 4294960316);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100189, .2, 4294958260);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100190, .1, 4294959102);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100191, .05, 4294963060);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100192, .14, 4294966255);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100193, .01, 4294960783);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100194, .01, 4294960708);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100195, .1, 4294962384);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100196, .05, 4294967148);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100197, .16, 4294964908);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100198, .05, 4294959106);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100199, .05, 4294962612);
commit;
prompt 200 records committed...
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100200, .18, 4294960900);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100201, .14, 4294959049);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100202, .16, 4294963239);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100203, .01, 4294961173);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100204, .12, 4294959868);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100205, .2, 4294959095);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100206, .1, 4294965081);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100207, .18, 4294957562);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100208, .14, 4294964432);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100209, .2, 4294957758);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100210, .01, 4294963527);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100211, .05, 4294960519);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100212, .01, 4294962192);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100213, .1, 4294964562);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100214, .16, 4294963903);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100215, .14, 4294965812);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100216, .12, 4294962795);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100217, .01, 4294966437);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100218, .14, 4294963103);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100219, .18, 4294964658);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100220, .01, 4294958384);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100221, .12, 4294958960);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100222, .14, 4294960352);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100223, .12, 4294962769);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100224, .14, 4294959675);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100225, .05, 4294958208);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100226, .14, 4294963589);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100227, .05, 4294960018);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100228, .16, 4294957648);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100229, .16, 4294963235);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100230, .12, 4294961483);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100231, .01, 4294960730);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100232, .12, 4294960881);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100233, .2, 4294959180);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100234, .18, 4294961066);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100235, .14, 4294964603);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100236, .18, 4294958490);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100237, .18, 4294960998);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100238, .12, 4294960999);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100239, .01, 4294958248);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100240, .01, 4294958712);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100241, .2, 4294957813);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100242, .05, 4294960455);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100243, .01, 4294957361);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100244, .01, 4294963098);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100245, .14, 4294957900);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100246, .16, 4294963632);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100247, .16, 4294959513);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100248, .18, 4294966340);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100249, .18, 4294964294);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100250, .16, 4294959890);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100251, .18, 4294957568);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100252, .01, 4294961717);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100253, .16, 4294961010);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100254, .18, 4294959511);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100255, .18, 4294963726);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100256, .2, 4294962176);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100257, .16, 4294959912);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100258, .14, 4294965091);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100259, .01, 4294964191);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100260, .01, 4294967025);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100261, .01, 4294958185);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100262, .01, 4294958543);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100263, .05, 4294964467);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100264, .14, 4294964257);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100265, .18, 4294966441);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100266, .12, 4294963743);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100267, .05, 4294965272);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100268, .1, 4294958503);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100269, .01, 4294957450);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100270, .18, 4294964784);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100271, .2, 4294959082);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100272, .2, 4294964608);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100273, .1, 4294965502);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100274, .2, 4294959867);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100275, .14, 4294957300);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100276, .2, 4294966820);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100277, .14, 4294966373);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100278, .18, 4294960814);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100279, .2, 4294958049);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100280, .18, 4294963625);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100281, .14, 4294957946);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100282, .05, 4294958200);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100283, .16, 4294964589);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100284, .01, 4294958193);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100285, .14, 4294961433);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100286, .16, 4294962117);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100287, .2, 4294964357);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100288, .01, 4294964451);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100289, .01, 4294963230);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100290, .16, 4294958563);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100291, .2, 4294958643);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100292, .12, 4294958780);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100293, .12, 4294957403);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100294, .01, 4294961450);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100295, .01, 4294962877);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100296, .16, 4294957344);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100297, .05, 4294958788);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100298, .16, 4294960243);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100299, .12, 4294957547);
commit;
prompt 300 records committed...
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100300, .01, 4294959039);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100301, .01, 4294966724);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100302, .12, 4294963221);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100303, .14, 4294959743);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100304, .05, 4294964061);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100305, .2, 4294959407);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100306, .14, 4294966363);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100307, .2, 4294965328);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100308, .01, 4294958111);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100309, .18, 4294958873);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100310, .16, 4294957861);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100311, .1, 4294961722);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100312, .12, 4294962221);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100313, .05, 4294966603);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100314, .18, 4294958258);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100315, .16, 4294961334);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100316, .2, 4294958195);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100317, .05, 4294959749);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100318, .01, 4294966207);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100319, .16, 4294965592);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100320, .12, 4294959693);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100321, .2, 4294957995);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100322, .18, 4294959856);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100323, .16, 4294959616);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100324, .18, 4294958922);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100325, .18, 4294961036);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100326, .14, 4294963866);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100327, .12, 4294957513);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100328, .14, 4294958964);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100329, .14, 4294966682);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100330, .18, 4294962041);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100331, .2, 4294958292);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100332, .14, 4294961727);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100333, .18, 4294959588);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100334, .18, 4294965597);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100335, .16, 4294962409);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100336, .18, 4294961515);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100337, .2, 4294960614);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100338, .18, 4294967041);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100339, .2, 4294958931);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100340, .05, 4294964230);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100341, .16, 4294966800);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100342, .2, 4294959685);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100343, .12, 4294963335);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100344, .05, 4294962194);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100345, .16, 4294961973);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100346, .1, 4294962791);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100347, .2, 4294965921);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100348, .16, 4294964604);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100349, .05, 4294957980);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100350, .16, 4294962317);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100351, .14, 4294960857);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100352, .14, 4294963596);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100353, .01, 4294966542);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100354, .01, 4294957318);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100355, .12, 4294965849);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100356, .12, 4294965956);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100357, .12, 4294961730);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100358, .16, 4294961951);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100359, .12, 4294962428);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100360, .01, 4294960434);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100361, .14, 4294963081);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100362, .1, 4294963113);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100363, .18, 4294966874);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100364, .14, 4294960699);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100365, .1, 4294959317);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100366, .16, 4294963700);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100367, .05, 4294961756);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100368, .01, 4294963914);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100369, .2, 4294962708);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100370, .05, 4294961500);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100371, .05, 4294958102);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100372, .12, 4294964930);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100373, .1, 4294964048);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100374, .14, 4294963699);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100375, .18, 4294958189);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100376, .16, 4294966114);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100377, .12, 4294958265);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100378, .18, 4294967020);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100379, .1, 4294958963);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100380, .18, 4294962798);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100381, .1, 4294960648);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100382, .01, 4294963485);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100383, .01, 4294966082);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100384, .16, 4294964353);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100385, .14, 4294963702);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100386, .01, 4294961800);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100387, .12, 4294958581);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100388, .05, 4294960887);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100389, .2, 4294964632);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100390, .01, 4294964370);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100391, .1, 4294964173);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100392, .16, 4294965571);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100393, .05, 4294963444);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100394, .18, 4294959931);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100395, .05, 4294965156);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100396, .18, 4294962587);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100397, .18, 4294961680);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100398, .16, 4294961816);
insert into BLACKLIST (accountid, negetiveinterest, minimumminus)
values (100399, .1, 4294964964);
commit;
prompt 400 records loaded
prompt Loading CUSTOMER...
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000000, 'Owen', 'Gaines', to_date('06-09-2000 01:48:02', 'dd-mm-yyyy hh24:mi:ss'), '64 St-laurent Drive', 972551875, 'owen@boldtechsystems.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000001, 'Loretta', 'Santa Rosa', to_date('13-01-2011 14:59:50', 'dd-mm-yyyy hh24:mi:ss'), '3 Lovitz Drive', 972562588, 'lorettas@gillette.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000002, 'Carlene', 'Burke', to_date('25-01-2009 00:13:37', 'dd-mm-yyyy hh24:mi:ss'), '969 Arjona Blvd', 972529314, 'carlene@pearllawgroup.in');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000003, 'Mint', 'Summer', to_date('18-11-2019 14:47:55', 'dd-mm-yyyy hh24:mi:ss'), '92 Gaynor Ave', 972541673, 'mint.summer@dvdt.nl');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000004, 'Marc', 'Snider', to_date('06-07-2015 10:01:30', 'dd-mm-yyyy hh24:mi:ss'), '4 Ferrer Ave', 972519452, 'marcs@dvdt.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000005, 'Kieran', 'Redford', to_date('13-06-2011 06:37:14', 'dd-mm-yyyy hh24:mi:ss'), '48 Vin', 972582750, 'kieran@eastmankodak.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000006, 'Annie', 'Bragg', to_date('30-06-2005 14:42:34', 'dd-mm-yyyy hh24:mi:ss'), '9 Terence Ave', 972561479, 'annie.b@timevision.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000007, 'Dar', 'Wainwright', to_date('26-11-2003 04:44:19', 'dd-mm-yyyy hh24:mi:ss'), '72 Hobson Drive', 972503001, 'dar.wainwright@randomwalk.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000008, 'Jesse', 'Osborne', to_date('04-04-2000 11:08:07', 'dd-mm-yyyy hh24:mi:ss'), '97 New Hope Road', 972572416, 'jesse.osborne@yumbrands.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000009, 'Clay', 'Diffie', to_date('22-04-2021 22:16:59', 'dd-mm-yyyy hh24:mi:ss'), '45 Harrison Road', 972599402, 'clay.diffie@serentec.au');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000010, 'Thin', 'Peniston', to_date('15-03-2012 21:52:59', 'dd-mm-yyyy hh24:mi:ss'), '355 Bacharach Street', 972509614, 'thin.p@pds.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000011, 'Hope', 'Esposito', to_date('16-08-2011 20:00:00', 'dd-mm-yyyy hh24:mi:ss'), '68 Birmingham Road', 972525890, 'hope.esposito@cima.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000012, 'Morgan', 'Fogerty', to_date('02-01-2003 22:28:00', 'dd-mm-yyyy hh24:mi:ss'), '51st Street', 972577003, 'morganf@wci.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000013, 'Taye', 'Tennison', to_date('16-01-2020 19:37:29', 'dd-mm-yyyy hh24:mi:ss'), '55 Cleveland Road', 972591211, 'taye@outsourcegroup.se');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000014, 'Allison', 'Goodall', to_date('08-04-2008 20:57:00', 'dd-mm-yyyy hh24:mi:ss'), '71 Magstadt Street', 972513431, 'allison.g@harrison.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000015, 'Armin', 'Lightfoot', to_date('15-04-2016 23:49:35', 'dd-mm-yyyy hh24:mi:ss'), '33rd Street', 972509387, 'armin@venoco.ch');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000016, 'Leo', 'Benet', to_date('23-07-2018 21:02:53', 'dd-mm-yyyy hh24:mi:ss'), '36 Chaplin Road', 972563463, 'leo.benet@microsoft.nz');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000017, 'Bebe', 'Holbrook', to_date('19-07-2013 14:56:49', 'dd-mm-yyyy hh24:mi:ss'), '557 Kitty Street', 972563364, 'bholbrook@trx.tr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000018, 'Rosco', 'Rhodes', to_date('17-06-2005 18:25:08', 'dd-mm-yyyy hh24:mi:ss'), '82nd Street', 972525458, 'rosco.rhodes@team.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000019, 'Michelle', 'Landau', to_date('09-10-2022 14:26:28', 'dd-mm-yyyy hh24:mi:ss'), '52 Kershaw Road', 972514947, 'michelle.landau@totalentertainment.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000020, 'Ernie', 'Parm', to_date('06-10-2014 14:44:23', 'dd-mm-yyyy hh24:mi:ss'), '97 Plimpton Road', 972593675, 'ernie.parm@marsinc.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000021, 'Derrick', 'Penders', to_date('16-01-2009 12:25:32', 'dd-mm-yyyy hh24:mi:ss'), '5 Chorzów Street', 972506218, 'derrick.penders@sunstream.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000022, 'Kim', 'Sanders', to_date('11-12-2017 10:34:42', 'dd-mm-yyyy hh24:mi:ss'), '33rd Street', 972571048, 'kims@softworld.au');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000023, 'Christian', 'Tyler', to_date('28-12-2001 13:03:01', 'dd-mm-yyyy hh24:mi:ss'), '80 Tempest Street', 972575255, 'christian@jewettcameron.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000024, 'Terry', 'Duke', to_date('27-11-2010 06:58:49', 'dd-mm-yyyy hh24:mi:ss'), '37 Sao jose rio pret', 972547703, 'terry.duke@wendysinternational.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000025, 'Charlize', 'Gryner', to_date('30-12-2012 03:55:20', 'dd-mm-yyyy hh24:mi:ss'), '97 Astin Drive', 972507288, 'charlize.gryner@kroger.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000026, 'Wallace', 'Hawke', to_date('15-01-2002 14:14:29', 'dd-mm-yyyy hh24:mi:ss'), '93 Tallahassee Road', 972588574, 'w.hawke@usenergyservices.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000027, 'Nick', 'Mac', to_date('04-04-2019 12:24:53', 'dd-mm-yyyy hh24:mi:ss'), '80 Price Street', 972549626, 'nick.mac@walmartstores.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000028, 'Shirley', 'Nolte', to_date('06-07-2011 14:05:42', 'dd-mm-yyyy hh24:mi:ss'), '59 Bell', 972503021, 'shirley.n@ads.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000029, 'Lin', 'Merchant', to_date('19-05-2012 08:21:11', 'dd-mm-yyyy hh24:mi:ss'), '29 Barcelona Road', 972575896, 'lin.merchant@cws.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000030, 'Chi', 'Wilder', to_date('05-06-2021 15:34:57', 'dd-mm-yyyy hh24:mi:ss'), '52 Isaac', 972515264, 'chi@sears.pl');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000031, 'Ray', 'Botti', to_date('09-06-2021 15:20:21', 'dd-mm-yyyy hh24:mi:ss'), '1 Mantegna', 972570131, 'ray@inzone.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000032, 'Ice', 'Winwood', to_date('18-01-2000 00:16:37', 'dd-mm-yyyy hh24:mi:ss'), '49 Gyllenhaal Road', 972592897, 'ice.winwood@stonetechprofessional.nc');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000033, 'Marie', 'Colon', to_date('29-07-2014 09:07:34', 'dd-mm-yyyy hh24:mi:ss'), '28 Lancaster Road', 972524903, 'marie@infopros.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000034, 'Elizabeth', 'Eat World', to_date('03-08-2000 06:39:32', 'dd-mm-yyyy hh24:mi:ss'), '64 Dern Blvd', 972531926, 'elizabeth.eatworld@dvdt.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000035, 'Joan', 'Boone', to_date('09-07-2019 20:55:21', 'dd-mm-yyyy hh24:mi:ss'), '92 Loggia Drive', 972562733, 'j.boone@sci.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000036, 'Malcolm', 'Carnes', to_date('27-06-2001 16:19:45', 'dd-mm-yyyy hh24:mi:ss'), '14 Chesnutt', 972523748, 'malcolm.carnes@owm.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000037, 'Gilberto', 'McLachlan', to_date('22-12-2013 11:04:23', 'dd-mm-yyyy hh24:mi:ss'), '68 Salzburg Road', 972529329, 'gilbertom@aquascapedesigns.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000038, 'Solomon', 'O''Hara', to_date('28-12-2005 18:50:39', 'dd-mm-yyyy hh24:mi:ss'), '261 Sonny Drive', 972535563, 's.ohara@tilsonlandscape.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000039, 'Radney', 'Dunaway', to_date('01-10-2014 13:08:50', 'dd-mm-yyyy hh24:mi:ss'), '35 Steven Street', 972553759, 'rdunaway@fetchlogistics.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000040, 'Embeth', 'Gano', to_date('18-08-2007 10:23:23', 'dd-mm-yyyy hh24:mi:ss'), '3 Diaz Road', 972543343, 'embeth.g@sunstream.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000041, 'Elisabeth', 'Garfunkel', to_date('13-07-2017 22:10:54', 'dd-mm-yyyy hh24:mi:ss'), '54 Wuerzburg Ave', 972573862, 'elisabeth.g@avr.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000042, 'Donal', 'Amos', to_date('23-09-2010 23:45:18', 'dd-mm-yyyy hh24:mi:ss'), '119 King of Prussia ', 972515199, 'damos@homedepot.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000043, 'Joe', 'Chandler', to_date('18-08-2004 23:49:41', 'dd-mm-yyyy hh24:mi:ss'), '36 Kevin', 972528005, 'joe.chandler@myricom.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000044, 'Rutger', 'Melvin', to_date('07-08-2019 18:23:50', 'dd-mm-yyyy hh24:mi:ss'), '96 Brando Ave', 972525007, 'rutger@accucode.it');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000045, 'Mel', 'Whitford', to_date('11-01-2021 09:40:02', 'dd-mm-yyyy hh24:mi:ss'), '18 urban Ave', 972518565, 'mwhitford@gbas.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000046, 'Spencer', 'Aaron', to_date('28-08-2016 11:19:13', 'dd-mm-yyyy hh24:mi:ss'), '98 Benoit Street', 972575355, 'spencer.aaron@sweetproductions.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000047, 'Balthazar', 'Allison', to_date('28-04-2005 19:23:21', 'dd-mm-yyyy hh24:mi:ss'), '28 Mewes Drive', 972580657, 'balthazar@fsffinancial.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000048, 'Suzanne', 'Macht', to_date('30-08-2002 22:41:15', 'dd-mm-yyyy hh24:mi:ss'), '58 Ali Ave', 972516610, 'suzanne.macht@outsourcegroup.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000049, 'Thelma', 'Sample', to_date('22-01-2002 02:21:32', 'dd-mm-yyyy hh24:mi:ss'), '52nd Street', 972573104, 'thelma.sample@pfizer.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000050, 'Carrie', 'Snider', to_date('14-03-2020 18:10:45', 'dd-mm-yyyy hh24:mi:ss'), '56 Lund Drive', 972566968, 'csnider@als.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000051, 'Gordon', 'Murdock', to_date('03-01-2000 11:57:05', 'dd-mm-yyyy hh24:mi:ss'), '70 Kristofferson Str', 972576498, 'gordonm@aristotle.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000052, 'Merrilee', 'Piven', to_date('26-02-2005 21:51:23', 'dd-mm-yyyy hh24:mi:ss'), '7 Boucherville Blvd', 972565458, 'm.piven@mathis.no');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000053, 'Rawlins', 'Fehr', to_date('04-03-2003 18:20:02', 'dd-mm-yyyy hh24:mi:ss'), '133 Colton Blvd', 972501007, 'rawlinsf@topicsentertainment.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000054, 'Vanessa', 'Quatro', to_date('11-05-2015 23:11:43', 'dd-mm-yyyy hh24:mi:ss'), '100 Christian Blvd', 972500540, 'vanessa.quatro@tilsonhr.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000055, 'Fiona', 'Yulin', to_date('03-08-2011 08:46:51', 'dd-mm-yyyy hh24:mi:ss'), '95 DeVita Road', 972577658, 'fyulin@smartronix.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000056, 'Brenda', 'Lane', to_date('12-01-2001 18:55:10', 'dd-mm-yyyy hh24:mi:ss'), '72nd Street', 972539938, 'brenda.l@als.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000057, 'Richie', 'Fariq', to_date('09-02-2011 14:28:06', 'dd-mm-yyyy hh24:mi:ss'), '703 Bates Drive', 972502995, 'richie@wellsfinancial.dk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000058, 'Delbert', 'Berkoff', to_date('21-02-2016 03:12:49', 'dd-mm-yyyy hh24:mi:ss'), '22nd Street', 972548196, 'dberkoff@deutschetelekom.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000059, 'Graham', 'Gatlin', to_date('10-01-2004 00:07:12', 'dd-mm-yyyy hh24:mi:ss'), '438 urban Road', 972501424, 'graham@prosperitybancshares.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000060, 'Andrae', 'Robbins', to_date('30-10-2000 14:58:25', 'dd-mm-yyyy hh24:mi:ss'), '28 Todd', 972551954, 'andrae.robbins@toyotamotor.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000061, 'Wesley', 'Steiger', to_date('05-12-2003 06:17:31', 'dd-mm-yyyy hh24:mi:ss'), '4 Vern Drive', 972533894, 'wesley.steiger@bluffcitysteel.es');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000062, 'Rory', 'Stowe', to_date('05-05-2002 20:04:41', 'dd-mm-yyyy hh24:mi:ss'), '5 Palin Drive', 972561895, 'r.stowe@fnb.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000063, 'Emily', 'Macy', to_date('21-04-2000 11:24:44', 'dd-mm-yyyy hh24:mi:ss'), '45 McCann Road', 972591062, 'e.macy@limitedbrands.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000064, 'Dionne', 'Colman', to_date('19-11-2012 07:24:34', 'dd-mm-yyyy hh24:mi:ss'), '12 Westerberg', 972584615, 'dionne.colman@gdi.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000065, 'Tia', 'Evanswood', to_date('17-10-2012 04:32:31', 'dd-mm-yyyy hh24:mi:ss'), '3 Bebe Drive', 972558790, 't.evanswood@interfacesoftware.it');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000066, 'Juliette', 'Ramis', to_date('23-02-2008 16:55:21', 'dd-mm-yyyy hh24:mi:ss'), '23rd Street', 972556402, 'julietter@diamondtechnologies.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000067, 'Trace', 'McFadden', to_date('29-06-2004 14:47:45', 'dd-mm-yyyy hh24:mi:ss'), '272 Münster Road', 972581167, 'tmcfadden@boldtechsystems.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000068, 'Richard', 'Akins', to_date('08-01-2011 06:41:52', 'dd-mm-yyyy hh24:mi:ss'), '39 Miyazaki Street', 972531984, 'rakins@conquestsystems.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000069, 'Joey', 'Balk', to_date('06-04-2014 15:47:39', 'dd-mm-yyyy hh24:mi:ss'), '22 München Drive', 972537542, 'joey.balk@ogi.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000070, 'Sylvester', 'Sepulveda', to_date('16-01-2008 12:58:25', 'dd-mm-yyyy hh24:mi:ss'), '91 Sinise Street', 972537875, 'sylvester.sepulveda@cooktek.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000071, 'Vienna', 'Loring', to_date('11-03-2003 07:26:16', 'dd-mm-yyyy hh24:mi:ss'), '75 Walker Drive', 972550811, 'viennal@ait.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000072, 'Oded', 'Sherman', to_date('31-01-2008 13:07:43', 'dd-mm-yyyy hh24:mi:ss'), '5 Gates Drive', 972519774, 'oded@commworks.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000073, 'Edgar', 'Day-Lewis', to_date('10-03-2016 18:10:26', 'dd-mm-yyyy hh24:mi:ss'), '22 Carmen', 972538290, 'e.daylewis@jsa.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000074, 'Micky', 'Orlando', to_date('28-05-2004 14:16:10', 'dd-mm-yyyy hh24:mi:ss'), '152 Pearland Drive', 972551344, 'micky.orlando@lms.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000075, 'Bradley', 'Flemyng', to_date('14-05-2011 09:08:13', 'dd-mm-yyyy hh24:mi:ss'), '49 Ulsteinvik Street', 972587667, 'bradley.flemyng@pioneerdatasystems.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000076, 'Paul', 'Cochran', to_date('28-01-2007 22:05:35', 'dd-mm-yyyy hh24:mi:ss'), '55 Barbara Street', 972551415, 'paul.cochran@servicesource.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000077, 'Moe', 'Dillon', to_date('09-08-2011 21:53:54', 'dd-mm-yyyy hh24:mi:ss'), '3 Port Macquarie Dri', 972570303, 'moe.dillon@otbd.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000078, 'Rich', 'Moriarty', to_date('26-04-2007 08:26:22', 'dd-mm-yyyy hh24:mi:ss'), '39 Wally Drive', 972549262, 'rich@gtp.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000079, 'Harvey', 'Hartnett', to_date('27-07-2013 05:40:04', 'dd-mm-yyyy hh24:mi:ss'), '11 Uetikon am See Ro', 972587948, 'hhartnett@conquest.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000080, 'Angela', 'Saucedo', to_date('21-01-2015 06:16:52', 'dd-mm-yyyy hh24:mi:ss'), '38 Williamson Street', 972523951, 'angela.saucedo@intel.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000081, 'Geoffrey', 'Channing', to_date('30-03-2022 08:25:14', 'dd-mm-yyyy hh24:mi:ss'), '64 Debbie Blvd', 972589376, 'geoffrey@progressivedesigns.hk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000082, 'Embeth', 'Branch', to_date('07-04-2019 00:21:59', 'dd-mm-yyyy hh24:mi:ss'), '61 Jackman Street', 972596160, 'e.branch@marsinc.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000083, 'Crispin', 'Olyphant', to_date('01-09-2016 11:57:05', 'dd-mm-yyyy hh24:mi:ss'), '52 Laurie Road', 972565298, 'crispin@ptg.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000084, 'Juice', 'Gunton', to_date('22-07-2015 02:41:13', 'dd-mm-yyyy hh24:mi:ss'), '364 Harvey Blvd', 972528879, 'juice.gunton@bat.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000085, 'Loretta', 'Pitney', to_date('15-10-2013 14:46:40', 'dd-mm-yyyy hh24:mi:ss'), '79 Dearborn Road', 972585766, 'l.pitney@gcd.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000086, 'Dabney', 'Aykroyd', to_date('11-01-2010 00:07:12', 'dd-mm-yyyy hh24:mi:ss'), '62 Nepean Road', 972571258, 'dabneya@glacierbancorp.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000087, 'Elle', 'Lucien', to_date('29-01-2001 19:11:47', 'dd-mm-yyyy hh24:mi:ss'), '9 Rueil-Malmaison St', 972508850, 'elle.l@servicesource.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000088, 'Billy', 'McDowall', to_date('07-09-2002 23:35:40', 'dd-mm-yyyy hh24:mi:ss'), '60 Braintree Road', 972535637, 'billy.m@techrx.at');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000089, 'Petula', 'Hartnett', to_date('23-09-2016 09:52:21', 'dd-mm-yyyy hh24:mi:ss'), '45 Delbert Blvd', 972599522, 'petula.hartnett@lynksystems.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000090, 'Rosario', 'Sayer', to_date('18-07-2000 21:02:34', 'dd-mm-yyyy hh24:mi:ss'), '75 Mattea Street', 972580082, 'rosario.sayer@telwares.au');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000091, 'Chris', 'Broza', to_date('27-04-2002 07:18:10', 'dd-mm-yyyy hh24:mi:ss'), '47 Rebecca Drive', 972532826, 'c.broza@apexsystems.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000092, 'Jackson', 'Ruffalo', to_date('25-11-2017 17:21:54', 'dd-mm-yyyy hh24:mi:ss'), '643 Benson Drive', 972572847, 'jacksonr@restaurantpartners.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000093, 'Noah', 'Phillippe', to_date('02-05-2008 14:55:19', 'dd-mm-yyyy hh24:mi:ss'), '32nd Street', 972553945, 'noah.phillippe@servicesource.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000094, 'Lois', 'Mantegna', to_date('21-01-2015 00:33:34', 'dd-mm-yyyy hh24:mi:ss'), '46 Mount Olive Ave', 972565918, 'lmantegna@officedepot.es');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000095, 'Nick', 'Walken', to_date('06-07-2020 17:47:57', 'dd-mm-yyyy hh24:mi:ss'), '44 Neuwirth Blvd', 972572218, 'nick.walken@aoe.il');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000096, 'Garland', 'Pollak', to_date('01-05-2007 02:43:25', 'dd-mm-yyyy hh24:mi:ss'), '100 Ft. Lauderdale S', 972566599, 'garland.p@dis.es');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000097, 'Rip', 'Dickinson', to_date('16-11-2018 16:40:39', 'dd-mm-yyyy hh24:mi:ss'), '488 Andre Road', 972549116, 'r.dickinson@americanmegacom.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000098, 'Hex', 'Whitwam', to_date('15-02-2009 14:37:27', 'dd-mm-yyyy hh24:mi:ss'), '31 Ramirez Drive', 972594817, 'hexw@staffforce.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000099, 'Russell', 'Lowe', to_date('16-08-2007 01:05:42', 'dd-mm-yyyy hh24:mi:ss'), '67 Driver Road', 972518729, 'russell.lowe@trc.at');
commit;
prompt 100 records committed...
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000100, 'Lennie', 'Burke', to_date('18-04-2012 01:27:42', 'dd-mm-yyyy hh24:mi:ss'), '74 Desmond Street', 972521335, 'lennie.burke@pragmatechsoftware.za');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000101, 'Taryn', 'Allison', to_date('14-09-2001 00:17:37', 'dd-mm-yyyy hh24:mi:ss'), '492 Isabella Drive', 972547343, 'taryn.a@mathis.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000102, 'Curt', 'Johansson', to_date('07-07-2008 02:49:37', 'dd-mm-yyyy hh24:mi:ss'), '151 Lyngby Drive', 972520880, 'cjohansson@cendant.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000103, 'Jose', 'Myers', to_date('30-09-2010 11:48:58', 'dd-mm-yyyy hh24:mi:ss'), '98 Portland Street', 972578504, 'jose.myers@tlsservicebureau.mo');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000104, 'Jerry', 'Borden', to_date('01-04-2018 20:31:58', 'dd-mm-yyyy hh24:mi:ss'), '98 Sharon Drive', 972576213, 'jerry.borden@mavericktechnologies.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000105, 'Joshua', 'Ali', to_date('11-08-2001 08:26:54', 'dd-mm-yyyy hh24:mi:ss'), '39 Oldwick Ave', 972548952, 'joshua.ali@elitemedical.nl');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000106, 'Liv', 'Shepard', to_date('16-05-2011 21:05:19', 'dd-mm-yyyy hh24:mi:ss'), '249 Benet Road', 972582041, 'liv@execuscribe.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000107, 'Elle', 'Wheel', to_date('26-03-2012 19:56:57', 'dd-mm-yyyy hh24:mi:ss'), '26 Warszawa Street', 972577538, 'elle.wheel@morganresearch.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000108, 'Ashton', 'Head', to_date('11-10-2014 16:13:57', 'dd-mm-yyyy hh24:mi:ss'), '707 Stephen Street', 972550635, 'ashton@royalgold.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000109, 'Javon', 'Brody', to_date('04-09-2022 07:38:06', 'dd-mm-yyyy hh24:mi:ss'), '80 Joinville Drive', 972564252, 'javon.brody@ait.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000110, 'Daryle', 'Coughlan', to_date('27-02-2002 14:26:55', 'dd-mm-yyyy hh24:mi:ss'), '72 Napolitano Street', 972562860, 'daryle.coughlan@larkinenterprises.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000111, 'Kiefer', 'Lawrence', to_date('03-02-2016 01:12:01', 'dd-mm-yyyy hh24:mi:ss'), '43 Osmond Street', 972557646, 'kiefer.lawrence@airmethods.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000112, 'Cathy', 'Gayle', to_date('09-05-2010 22:53:20', 'dd-mm-yyyy hh24:mi:ss'), '74 Tori Drive', 972518289, 'cathy.gayle@insurmark.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000113, 'Kevn', 'Lange', to_date('28-05-2012 03:34:47', 'dd-mm-yyyy hh24:mi:ss'), '71 Goldwyn Ave', 972541845, 'klange@savela.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000114, 'Dabney', 'Davies', to_date('10-09-2020 12:04:17', 'dd-mm-yyyy hh24:mi:ss'), '83rd Street', 972543680, 'dabney.davies@bps.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000115, 'Kelli', 'Kapanka', to_date('20-05-2016 17:39:38', 'dd-mm-yyyy hh24:mi:ss'), '62nd Street', 972525459, 'kellik@gna.za');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000116, 'CeCe', 'Gill', to_date('18-09-2017 21:04:11', 'dd-mm-yyyy hh24:mi:ss'), '45 Lapointe Street', 972575933, 'cece@nissanmotor.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000117, 'Carl', 'Gilley', to_date('15-05-2012 20:11:53', 'dd-mm-yyyy hh24:mi:ss'), '69 Grier Drive', 972537875, 'carl.gilley@drinkmorewater.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000118, 'Todd', 'Rivers', to_date('21-05-2001 06:36:32', 'dd-mm-yyyy hh24:mi:ss'), '48 Dorn Blvd', 972520052, 'todd.rivers@otbd.be');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000119, 'Emma', 'Sinatra', to_date('28-07-2015 07:00:14', 'dd-mm-yyyy hh24:mi:ss'), '71 Robbie Drive', 972524065, 'emma.s@efcbancorp.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000120, 'Jared', 'Horton', to_date('11-07-2006 14:24:52', 'dd-mm-yyyy hh24:mi:ss'), '21 Sydney Drive', 972508485, 'j.horton@investorstitle.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000121, 'Yaphet', 'Coolidge', to_date('10-09-2008 13:57:55', 'dd-mm-yyyy hh24:mi:ss'), '4 Hikaru Road', 972513164, 'yaphetc@balchem.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000122, 'Brothers', 'Reynolds', to_date('24-10-2006 22:05:55', 'dd-mm-yyyy hh24:mi:ss'), '31 Diggs Street', 972524977, 'brothers.reynolds@netnumina.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000123, 'Jerry', 'Alexander', to_date('04-12-2005 00:03:46', 'dd-mm-yyyy hh24:mi:ss'), '46 Assante Street', 972550094, 'jerry.alexander@softworld.at');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000124, 'Mickey', 'Kinnear', to_date('07-08-2022 06:42:58', 'dd-mm-yyyy hh24:mi:ss'), '79 Speaks Drive', 972571166, 'mickey.kinnear@pharmafab.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000125, 'Larenz', 'McCoy', to_date('06-02-2000 13:31:59', 'dd-mm-yyyy hh24:mi:ss'), '27 Warren', 972506236, 'larenz.mccoy@vspan.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000126, 'Stockard', 'Walker', to_date('15-09-2000 01:14:12', 'dd-mm-yyyy hh24:mi:ss'), '59 Colman Drive', 972578584, 'stockard@alternativetechnology.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000127, 'Clint', 'Stills', to_date('31-05-2015 15:51:07', 'dd-mm-yyyy hh24:mi:ss'), '31st Street', 972574305, 'clint@terrafirma.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000128, 'Famke', 'McIntosh', to_date('26-01-2012 10:51:05', 'dd-mm-yyyy hh24:mi:ss'), '52nd Street', 972586850, 'famke.mcintosh@gapinc.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000129, 'Jaime', 'Stiller', to_date('14-07-2013 04:53:36', 'dd-mm-yyyy hh24:mi:ss'), '24 Douglas Street', 972548160, 'jaime.stiller@bashen.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000130, 'Keith', 'Tennison', to_date('27-12-2018 10:13:55', 'dd-mm-yyyy hh24:mi:ss'), '93 Mainz-kastel Driv', 972556851, 'ktennison@gdatechnologies.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000131, 'Quentin', 'Gold', to_date('16-05-2019 23:33:16', 'dd-mm-yyyy hh24:mi:ss'), '3 Spring City Drive', 972556386, 'quentin@americanland.it');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000132, 'Toshiro', 'Ronstadt', to_date('22-04-2013 22:11:32', 'dd-mm-yyyy hh24:mi:ss'), '164 Berlin Drive', 972569857, 'toshiro.ronstadt@enterprise.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000133, 'Remy', 'Mulroney', to_date('31-10-2015 11:15:59', 'dd-mm-yyyy hh24:mi:ss'), '36 Liam Street', 972540092, 'remy.mulroney@thinktanksystems.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000134, 'Nina', 'Cumming', to_date('26-04-2001 17:29:02', 'dd-mm-yyyy hh24:mi:ss'), '78 Cochran Blvd', 972555975, 'nina@fam.nl');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000135, 'Dorry', 'Wilder', to_date('23-04-2010 02:48:50', 'dd-mm-yyyy hh24:mi:ss'), '72nd Street', 972516372, 'dwilder@mai.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000136, 'Stephanie', 'Caan', to_date('08-11-2000 16:52:08', 'dd-mm-yyyy hh24:mi:ss'), '83 Phoebe', 972508650, 'stephanie@cowlitzbancorp.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000137, 'Beverley', 'Rockwell', to_date('21-08-2007 21:27:17', 'dd-mm-yyyy hh24:mi:ss'), '56 Douala Ave', 972546972, 'brockwell@zaiqtechnologies.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000138, 'Grace', 'Neill', to_date('27-11-2005 07:54:02', 'dd-mm-yyyy hh24:mi:ss'), '14 Latin Street', 972530112, 'grace.neill@yes.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000139, 'CeCe', 'Gracie', to_date('02-05-2007 18:55:10', 'dd-mm-yyyy hh24:mi:ss'), '92 Tualatin Drive', 972515544, 'ceceg@ipsadvisory.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000140, 'Pierce', 'Wahlberg', to_date('19-06-2013 22:24:46', 'dd-mm-yyyy hh24:mi:ss'), '73 Graham Street', 972579378, 'pierce.wahlberg@sensortechnologies.ch');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000141, 'Natascha', 'Heald', to_date('09-03-2012 14:34:07', 'dd-mm-yyyy hh24:mi:ss'), '59 Davy Street', 972513197, 'natascha.heald@kingston.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000142, 'Emm', 'MacDonald', to_date('03-03-2017 20:23:49', 'dd-mm-yyyy hh24:mi:ss'), '28 Matheson Blvd', 972571999, 'emm.macdonald@ahl.dk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000143, 'Andie', 'Dupree', to_date('14-01-2013 22:29:00', 'dd-mm-yyyy hh24:mi:ss'), '980 Saudarkrokur Ave', 972540208, 'andie.dupree@ghrsystems.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000144, 'Stevie', 'Choice', to_date('19-02-2006 13:27:08', 'dd-mm-yyyy hh24:mi:ss'), '7 Evanswood Drive', 972529127, 'stevie.choice@amerisourcefunding.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000145, 'France', 'Blackwell', to_date('29-03-2021 09:06:51', 'dd-mm-yyyy hh24:mi:ss'), '228 Myers Drive', 972542669, 'france.blackwell@timevision.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000146, 'Mary-Louise', 'Stampley', to_date('15-09-2018 00:57:48', 'dd-mm-yyyy hh24:mi:ss'), '963 Spears Road', 972508664, 'marylouise.stampley@data.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000147, 'Kay', 'Baranski', to_date('14-08-2012 14:26:05', 'dd-mm-yyyy hh24:mi:ss'), '82 Laredo Road', 972589192, 'kay.baranski@curagroup.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000148, 'Nina', 'Paxton', to_date('15-09-2020 11:07:12', 'dd-mm-yyyy hh24:mi:ss'), '17 Kelly Street', 972520742, 'n.paxton@horizonorganic.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000149, 'Goldie', 'McIntyre', to_date('10-06-2016 07:10:06', 'dd-mm-yyyy hh24:mi:ss'), '1 Secada Ave', 972526137, 'goldie.mcintyre@tracertechnologies.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000150, 'Rutger', 'DeVita', to_date('01-02-2013 00:48:11', 'dd-mm-yyyy hh24:mi:ss'), '57 Vannelli Blvd', 972597156, 'r.devita@telepoint.it');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000151, 'Gin', 'Springfield', to_date('08-11-2013 17:08:17', 'dd-mm-yyyy hh24:mi:ss'), '52nd Street', 972526687, 'gin.springfield@trc.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000152, 'Ike', 'Whitwam', to_date('28-07-2004 06:38:34', 'dd-mm-yyyy hh24:mi:ss'), '23 Joy Drive', 972536874, 'ike.whitwam@maverick.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000153, 'Nathan', 'Turturro', to_date('10-12-2015 12:43:22', 'dd-mm-yyyy hh24:mi:ss'), '38 Hawke Road', 972556747, 'nathan.turturro@democracydata.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000154, 'Gabriel', 'Reeves', to_date('19-07-2013 01:09:27', 'dd-mm-yyyy hh24:mi:ss'), '27 Whitehouse Statio', 972568504, 'gabriel.reeves@lms.in');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000155, 'Udo', 'McKellen', to_date('24-11-2011 08:10:40', 'dd-mm-yyyy hh24:mi:ss'), '27 Lea Road', 972585985, 'udo.mckellen@saltgroup.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000156, 'Jared', 'Wilkinson', to_date('20-10-2001 13:49:36', 'dd-mm-yyyy hh24:mi:ss'), '35 Rosario Road', 972519383, 'jared.wilkinson@shar.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000157, 'Carole', 'Abraham', to_date('22-03-2009 04:03:49', 'dd-mm-yyyy hh24:mi:ss'), '11 Basinger Street', 972548880, 'carole.abraham@montpelierplastics.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000158, 'Carlos', 'Levy', to_date('01-03-2003 03:40:05', 'dd-mm-yyyy hh24:mi:ss'), '15 Crowe Road', 972550515, 'carlos@investorstitle.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000159, 'Mili', 'Gill', to_date('28-04-2007 07:23:03', 'dd-mm-yyyy hh24:mi:ss'), '75 Julie Street', 972583499, 'mgill@gha.au');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000160, 'Judy', 'Macht', to_date('22-02-2015 13:20:30', 'dd-mm-yyyy hh24:mi:ss'), '43 Suzanne Drive', 972509312, 'judy.macht@captechventures.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000161, 'Kay', 'Evett', to_date('13-05-2007 07:19:14', 'dd-mm-yyyy hh24:mi:ss'), '69 Reisterstown Driv', 972512078, 'kevett@ivorysystems.se');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000162, 'Joaquim', 'Forster', to_date('10-08-2008 19:30:13', 'dd-mm-yyyy hh24:mi:ss'), '73rd Street', 972538621, 'joaquim.forster@mainstreetbanks.dk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000163, 'Sydney', 'Martinez', to_date('01-02-2005 14:25:29', 'dd-mm-yyyy hh24:mi:ss'), '47 Webb Street', 972520143, 'smartinez@carteretmortgage.cz');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000164, 'Azucar', 'Soda', to_date('05-07-2015 18:54:05', 'dd-mm-yyyy hh24:mi:ss'), '52 Cheadle Drive', 972563703, 'azucar.s@yumbrands.cl');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000165, 'Buffy', 'Evanswood', to_date('24-06-2003 07:55:57', 'dd-mm-yyyy hh24:mi:ss'), '183 Trace', 972537198, 'buffy.evanswood@knightsbridge.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000166, 'Emily', 'Geldof', to_date('27-05-2003 04:00:51', 'dd-mm-yyyy hh24:mi:ss'), '68 Jordan Street', 972550054, 'e.geldof@evinco.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000167, 'Raymond', 'Clarkson', to_date('18-03-2011 15:45:28', 'dd-mm-yyyy hh24:mi:ss'), '81 Darren Road', 972534684, 'rclarkson@pds.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000168, 'Martin', 'Theron', to_date('17-01-2020 01:02:04', 'dd-mm-yyyy hh24:mi:ss'), '45 Holland Blvd', 972502832, 'martin@lms.au');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000169, 'Scarlett', 'Francis', to_date('08-08-2003 19:58:20', 'dd-mm-yyyy hh24:mi:ss'), '32 Bellevue Road', 972548876, 'scarlett.francis@cardtronics.se');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000170, 'Charlie', 'Caine', to_date('20-09-2000 12:34:48', 'dd-mm-yyyy hh24:mi:ss'), '50 Sinatra Blvd', 972577202, 'charlie.caine@chipssolutions.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000171, 'Debbie', 'Lloyd', to_date('08-03-2008 19:28:57', 'dd-mm-yyyy hh24:mi:ss'), '94 Juliana Street', 972584611, 'debbie.l@astute.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000172, 'Jim', 'Morrison', to_date('24-07-2001 10:46:00', 'dd-mm-yyyy hh24:mi:ss'), '569 Pacific Grove St', 972563501, 'jim.morrison@dataprise.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000173, 'LeVar', 'Sampson', to_date('23-07-2018 03:00:20', 'dd-mm-yyyy hh24:mi:ss'), '99 Spears Road', 972553563, 'levar.sampson@dps.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000174, 'Fairuza', 'Scott', to_date('12-08-2005 05:29:14', 'dd-mm-yyyy hh24:mi:ss'), '81 McDiarmid Drive', 972514000, 'fairuza.scott@prosperitybancshares.nl');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000175, 'Aidan', 'Calle', to_date('30-08-2012 03:51:59', 'dd-mm-yyyy hh24:mi:ss'), '33 Tim', 972560667, 'aidan.calle@aci.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000176, 'Devon', 'Tarantino', to_date('08-12-2006 23:04:45', 'dd-mm-yyyy hh24:mi:ss'), '88 Sean', 972563744, 'devon.tarantino@gra.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000177, 'Katrin', 'McFadden', to_date('09-07-2002 23:03:43', 'dd-mm-yyyy hh24:mi:ss'), '14 Koteas', 972570071, 'katrin.mcfadden@swi.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000178, 'Raul', 'Reeves', to_date('18-07-2018 14:29:50', 'dd-mm-yyyy hh24:mi:ss'), '21 San Francisco Ave', 972526881, 'raul.r@pioneermortgage.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000179, 'Tyrone', 'Sizemore', to_date('22-04-2020 17:50:11', 'dd-mm-yyyy hh24:mi:ss'), '50 Griffiths', 972565880, 'tyrone@timberlanewoodcrafters.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000180, 'Nik', 'Arkin', to_date('16-07-2016 20:42:05', 'dd-mm-yyyy hh24:mi:ss'), '31 Bailey Street', 972577067, 'nik.a@abatix.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000181, 'Wade', 'Dillane', to_date('17-10-2013 02:02:23', 'dd-mm-yyyy hh24:mi:ss'), '41 Paraju Drive', 972549279, 'waded@ssi.es');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000182, 'Nikki', 'Chilton', to_date('09-04-2006 08:59:24', 'dd-mm-yyyy hh24:mi:ss'), '7 Cube Ave', 972570271, 'nchilton@gltg.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000183, 'Jean-Claude', 'Salonga', to_date('22-08-2016 17:29:39', 'dd-mm-yyyy hh24:mi:ss'), '12 Reynolds Street', 972577065, 'jeanclaude.salonga@pragmatechsoftware.co');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000184, 'Bobby', 'Levy', to_date('23-06-2006 17:36:58', 'dd-mm-yyyy hh24:mi:ss'), '8 Wheel Street', 972523557, 'bobby.l@dataprise.be');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000185, 'Kelli', 'Olin', to_date('15-07-2009 11:23:23', 'dd-mm-yyyy hh24:mi:ss'), '98 The Woodlands Dri', 972500725, 'k.olin@hospitalsolutions.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000186, 'Lionel', 'Hewett', to_date('09-04-2008 07:43:56', 'dd-mm-yyyy hh24:mi:ss'), '20 Warrenton Ave', 972593661, 'lionel.hewett@investorstitle.au');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000187, 'Tori', 'Blair', to_date('10-02-2015 12:01:08', 'dd-mm-yyyy hh24:mi:ss'), '12nd Street', 972593022, 'tori.b@marketbased.dk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000188, 'Madeline', 'Voight', to_date('20-01-2002 15:19:48', 'dd-mm-yyyy hh24:mi:ss'), '99 Norm Street', 972513814, 'madeline.voight@bigdoughcom.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000189, 'Tcheky', 'Stallone', to_date('24-06-2004 21:09:07', 'dd-mm-yyyy hh24:mi:ss'), '86 Moody Ave', 972575940, 'tcheky.stallone@escalade.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000190, 'Morris', 'McIntyre', to_date('18-08-2017 10:11:53', 'dd-mm-yyyy hh24:mi:ss'), '40 Carlyle Drive', 972593042, 'mmcintyre@mwh.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000191, 'Russell', 'Lee', to_date('01-01-2016 06:12:39', 'dd-mm-yyyy hh24:mi:ss'), '53rd Street', 972575124, 'rlee@reckittbenckiser.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000192, 'Kyle', 'Dickinson', to_date('01-01-2015 04:46:31', 'dd-mm-yyyy hh24:mi:ss'), '427 Costa Drive', 972529576, 'kyle.d@pfizer.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000193, 'Loren', 'Kidman', to_date('08-07-2014 03:24:16', 'dd-mm-yyyy hh24:mi:ss'), '79 Cook Blvd', 972594326, 'loren.kidman@biosite.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000194, 'Lisa', 'Baez', to_date('03-06-2012 09:20:39', 'dd-mm-yyyy hh24:mi:ss'), '21 Jimmy Drive', 972513302, 'l.baez@gateway.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000195, 'Viggo', 'Cusack', to_date('23-12-2005 17:18:51', 'dd-mm-yyyy hh24:mi:ss'), '100 Guilfoyle Road', 972566800, 'viggo.cusack@investmentscorecard.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000196, 'Udo', 'Chinlund', to_date('31-08-2015 22:30:04', 'dd-mm-yyyy hh24:mi:ss'), '965 Burlington Drive', 972520043, 'udo.chinlund@savela.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000197, 'Hugh', 'LaBelle', to_date('28-07-2020 00:24:40', 'dd-mm-yyyy hh24:mi:ss'), '17 Ebersdorf Drive', 972525542, 'h.labelle@directdata.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000198, 'Elle', 'Idol', to_date('02-04-2001 14:14:28', 'dd-mm-yyyy hh24:mi:ss'), '94 Moe Blvd', 972538336, 'ellei@randomwalk.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000199, 'Carrie-Anne', 'Cantrell', to_date('08-03-2003 14:29:12', 'dd-mm-yyyy hh24:mi:ss'), '36 Evett Road', 972570647, 'carrieanne.cantrell@trm.de');
commit;
prompt 200 records committed...
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000200, 'Norm', 'Bello', to_date('05-11-2001 05:05:10', 'dd-mm-yyyy hh24:mi:ss'), '95 Uetikon am See Av', 972545447, 'norm.bello@gci.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000201, 'Samuel', 'Rapaport', to_date('05-06-2019 13:32:35', 'dd-mm-yyyy hh24:mi:ss'), '9 Taylor Road', 972538474, 'samuel@gci.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000202, 'Lenny', 'Robbins', to_date('21-10-2020 09:55:02', 'dd-mm-yyyy hh24:mi:ss'), '62 Sedgwick Ave', 972506321, 'lenny.robbins@shot.ve');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000203, 'Adrien', 'Rodgers', to_date('08-04-2022 21:53:12', 'dd-mm-yyyy hh24:mi:ss'), '100 Toulouse Ave', 972574020, 'adrien@ccb.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000204, 'Mika', 'Cusack', to_date('01-01-2012 10:10:26', 'dd-mm-yyyy hh24:mi:ss'), '51 Melrose park Driv', 972566296, 'mika.cusack@ibm.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000205, 'Cheryl', 'Stevens', to_date('13-09-2018 06:17:25', 'dd-mm-yyyy hh24:mi:ss'), '35 Menlo Park Road', 972532757, 'cheryl.stevens@nbs.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000206, 'Vince', 'Dern', to_date('09-07-2003 21:00:16', 'dd-mm-yyyy hh24:mi:ss'), '92 Breckin Drive', 972542631, 'vince.dern@gagwear.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000207, 'Morris', 'Donovan', to_date('06-07-2011 05:43:19', 'dd-mm-yyyy hh24:mi:ss'), '51 Los Angeles Road', 972534858, 'morris.d@bigyanksports.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000208, 'Freddy', 'Carmen', to_date('18-06-2018 11:47:05', 'dd-mm-yyyy hh24:mi:ss'), '64 Deschanel Drive', 972538033, 'freddy@glmt.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000209, 'Martin', 'Humphrey', to_date('03-02-2009 15:39:18', 'dd-mm-yyyy hh24:mi:ss'), '52 Day-Lewis Road', 972541593, 'martin.humphrey@contract.tr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000210, 'Elvis', 'Sossamon', to_date('17-03-2009 02:00:51', 'dd-mm-yyyy hh24:mi:ss'), '787 Van Der Beek Ave', 972561291, 'elvis.sossamon@questarcapital.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000211, 'Ewan', 'Bell', to_date('06-05-2018 10:31:41', 'dd-mm-yyyy hh24:mi:ss'), '38 Annette Street', 972542261, 'ewan.b@tama.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000212, 'Minnie', 'Reno', to_date('07-01-2000 06:06:12', 'dd-mm-yyyy hh24:mi:ss'), '804 Blige Street', 972547456, 'minnier@progressivedesigns.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000213, 'Boyd', 'Redgrave', to_date('07-06-2009 12:39:29', 'dd-mm-yyyy hh24:mi:ss'), '63rd Street', 972515318, 'boyd.redgrave@zaiqtechnologies.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000214, 'Antonio', 'Rickles', to_date('19-12-2000 00:52:43', 'dd-mm-yyyy hh24:mi:ss'), '75 Gavin Ave', 972555021, 'antonio.rickles@httprint.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000215, 'Arturo', 'Miller', to_date('15-08-2021 06:57:29', 'dd-mm-yyyy hh24:mi:ss'), '56 Nanaimo', 972551849, 'arturo.miller@nexxtworks.nl');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000216, 'Harry', 'Gore', to_date('24-11-2016 18:42:36', 'dd-mm-yyyy hh24:mi:ss'), '64 Syracuse', 972500056, 'harry.gore@mcdonalds.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000217, 'Norm', 'Tillis', to_date('18-11-2016 03:14:09', 'dd-mm-yyyy hh24:mi:ss'), '13 Getty', 972527384, 'norm.tillis@dcgroup.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000218, 'Roddy', 'Sarandon', to_date('14-03-2020 02:26:37', 'dd-mm-yyyy hh24:mi:ss'), '75 Stephanie', 972556687, 'roddy.sarandon@usenergyservices.es');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000219, 'Sigourney', 'Winslet', to_date('25-07-2017 10:13:53', 'dd-mm-yyyy hh24:mi:ss'), '68 O''fallon Drive', 972518544, 'swinslet@mls.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000220, 'Donal', 'Guest', to_date('17-12-2007 05:05:04', 'dd-mm-yyyy hh24:mi:ss'), '100 Stiller', 972560020, 'donal.g@epiqsystems.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000221, 'Rachael', 'Rosas', to_date('11-01-2021 14:12:45', 'dd-mm-yyyy hh24:mi:ss'), '41st Street', 972598959, 'rachael.rosas@seiaarons.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000222, 'Carl', 'O''Hara', to_date('18-03-2004 21:58:07', 'dd-mm-yyyy hh24:mi:ss'), '63rd Street', 972563253, 'carl.ohara@max.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000223, 'Ben', 'Bates', to_date('18-01-2012 05:48:35', 'dd-mm-yyyy hh24:mi:ss'), '80 East Peoria Road', 972512224, 'ben.bates@greenmountain.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000224, 'Tracy', 'Owen', to_date('12-02-2018 23:22:35', 'dd-mm-yyyy hh24:mi:ss'), '13 Ption-ville Driv', 972591867, 'tracy.owen@scjohnson.cr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000225, 'Cuba', 'Garcia', to_date('21-02-2013 21:55:26', 'dd-mm-yyyy hh24:mi:ss'), '62nd Street', 972570138, 'cgarcia@stmaryland.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000226, 'Illeana', 'Collette', to_date('01-03-2014 12:47:48', 'dd-mm-yyyy hh24:mi:ss'), '96 Russo Ave', 972583623, 'illeana.collette@nat.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000227, 'Melanie', 'Black', to_date('24-03-2017 09:16:04', 'dd-mm-yyyy hh24:mi:ss'), '33 Newnan Drive', 972504580, 'melanie.b@bis.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000228, 'Etta', 'Ontiveros', to_date('18-02-2016 03:25:00', 'dd-mm-yyyy hh24:mi:ss'), '78 Pete Road', 972590681, 'etta.ontiveros@aci.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000229, 'Taryn', 'Parish', to_date('12-11-2006 19:43:43', 'dd-mm-yyyy hh24:mi:ss'), '38 Winstone Road', 972593691, 'taryn.parish@sandyspringbancorp.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000230, 'Junior', 'Wen', to_date('05-11-2015 18:21:11', 'dd-mm-yyyy hh24:mi:ss'), '75 Li Drive', 972503851, 'junior@wellsfinancial.es');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000231, 'Marisa', 'Hudson', to_date('13-10-2008 04:09:56', 'dd-mm-yyyy hh24:mi:ss'), '37 Vicious Ave', 972586636, 'marisa.hudson@faef.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000232, 'Brendan', 'Hector', to_date('12-12-2021 12:36:18', 'dd-mm-yyyy hh24:mi:ss'), '36 McGovern Street', 972590981, 'brendan.hector@pepsico.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000233, 'Nina', 'Flanery', to_date('09-05-2016 00:24:52', 'dd-mm-yyyy hh24:mi:ss'), '687 Orbit Blvd', 972530895, 'nina.flanery@pib.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000234, 'Arnold', 'Atlas', to_date('31-07-2019 15:43:23', 'dd-mm-yyyy hh24:mi:ss'), '354 Courtney', 972578459, 'arnold.atlas@aventis.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000235, 'Petula', 'Winger', to_date('18-07-2005 06:52:30', 'dd-mm-yyyy hh24:mi:ss'), '614 Loreena Street', 972571946, 'p.winger@labradanutrition.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000236, 'Devon', 'Isaacs', to_date('30-06-2009 08:19:48', 'dd-mm-yyyy hh24:mi:ss'), '73rd Street', 972543631, 'devon.i@stonebrewing.ch');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000237, 'Nathan', 'Harmon', to_date('16-10-2009 05:59:40', 'dd-mm-yyyy hh24:mi:ss'), '8 Diehl Blvd', 972596584, 'nathan.harmon@hcoa.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000238, 'Kieran', 'Crouch', to_date('25-02-2005 23:12:59', 'dd-mm-yyyy hh24:mi:ss'), '501 Tempest Ave', 972523168, 'kieran.crouch@hardwoodwholesalers.it');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000239, 'Chad', 'Nelson', to_date('10-12-2001 05:24:04', 'dd-mm-yyyy hh24:mi:ss'), '88 De Niro Drive', 972501985, 'c.nelson@wlt.dk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000240, 'Joshua', 'Ledger', to_date('19-08-2018 03:02:40', 'dd-mm-yyyy hh24:mi:ss'), '81 Mantegna', 972556185, 'joshua@tmaresources.cy');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000241, 'Terri', 'Wariner', to_date('24-06-2017 09:44:47', 'dd-mm-yyyy hh24:mi:ss'), '66 Eldard Street', 972529131, 'terri.wariner@toyotamotor.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000242, 'Harrison', 'Davison', to_date('16-06-2010 22:32:49', 'dd-mm-yyyy hh24:mi:ss'), '92 Bloch Drive', 972548515, 'harrison.davison@biosite.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000243, 'Mark', 'Shandling', to_date('26-01-2002 21:26:00', 'dd-mm-yyyy hh24:mi:ss'), '82 Franco Road', 972528785, 'mark@eastmankodak.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000244, 'Joanna', 'Chaykin', to_date('30-11-2013 09:48:36', 'dd-mm-yyyy hh24:mi:ss'), '12 Cooper Road', 972522202, 'joanna.chaykin@consultants.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000245, 'Alex', 'Coughlan', to_date('06-08-2018 11:04:36', 'dd-mm-yyyy hh24:mi:ss'), '462 Clarence Road', 972513094, 'alex.c@accessus.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000246, 'Mae', 'Vai', to_date('16-08-2014 13:10:08', 'dd-mm-yyyy hh24:mi:ss'), '13rd Street', 972563777, 'm.vai@generalmills.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000247, 'Carole', 'Landau', to_date('25-11-2008 23:29:07', 'dd-mm-yyyy hh24:mi:ss'), '53 Englewood Drive', 972538582, 'carole.landau@smi.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000248, 'Franco', 'Hornsby', to_date('26-05-2008 06:38:25', 'dd-mm-yyyy hh24:mi:ss'), '73rd Street', 972527007, 'franco.hornsby@kitba.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000249, 'Nicholas', 'Bracco', to_date('16-08-2009 11:47:16', 'dd-mm-yyyy hh24:mi:ss'), '91 Montreal Blvd', 972537091, 'nicholas.bracco@learningvoyage.it');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000250, 'Cuba', 'Negbaur', to_date('18-07-2000 03:32:44', 'dd-mm-yyyy hh24:mi:ss'), '47 Shorter Street', 972562999, 'cuba.negbaur@egroup.se');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000251, 'Jeroen', 'Hingle', to_date('17-08-2000 03:35:08', 'dd-mm-yyyy hh24:mi:ss'), '48 Neustadt', 972511783, 'jeroen.hingle@capitalautomotive.be');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000252, 'Nick', 'Tilly', to_date('09-08-2018 14:37:25', 'dd-mm-yyyy hh24:mi:ss'), '8 Baranski', 972581258, 'n.tilly@mls.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000253, 'Robbie', 'Morales', to_date('19-06-2005 12:12:35', 'dd-mm-yyyy hh24:mi:ss'), '46 Butler Drive', 972551954, 'robbie@ibm.au');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000254, 'Garry', 'Mould', to_date('25-03-2015 20:17:47', 'dd-mm-yyyy hh24:mi:ss'), '61 Glenshaw Drive', 972549071, 'garry@newviewgifts.ch');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000255, 'Katrin', 'Child', to_date('19-12-2019 04:27:45', 'dd-mm-yyyy hh24:mi:ss'), '72nd Street', 972500179, 'katrin.child@healthscribe.au');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000256, 'Salma', 'Burke', to_date('28-07-2009 11:28:02', 'dd-mm-yyyy hh24:mi:ss'), '37 Morrison Drive', 972591791, 'salma.burke@mattel.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000257, 'Natalie', 'Curtis-Hall', to_date('21-12-2011 22:42:50', 'dd-mm-yyyy hh24:mi:ss'), '84 Rocklin', 972518651, 'natalie@reckittbenckiser.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000258, 'Dorry', 'Zeta-Jones', to_date('01-07-2016 07:09:16', 'dd-mm-yyyy hh24:mi:ss'), '32 Adrien', 972509379, 'dorry.z@prosperitybancshares.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000259, 'Kim', 'Pride', to_date('18-02-2005 13:35:26', 'dd-mm-yyyy hh24:mi:ss'), '97 Horsens', 972559083, 'kimp@prometheuslaboratories.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000260, 'Natalie', 'Lonsdale', to_date('27-07-2002 02:01:07', 'dd-mm-yyyy hh24:mi:ss'), '22 Kier Street', 972523157, 'nataliel@quicksilverresources.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000261, 'Glenn', 'Van Shelton', to_date('14-05-2019 15:21:27', 'dd-mm-yyyy hh24:mi:ss'), '89 Palin Street', 972555059, 'gvanshelton@inspirationsoftware.it');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000262, 'Geoffrey', 'Botti', to_date('17-04-2020 09:53:15', 'dd-mm-yyyy hh24:mi:ss'), '27 Milan', 972588995, 'geoffrey.botti@integramedamerica.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000263, 'Randy', 'Llewelyn', to_date('31-05-2017 00:23:24', 'dd-mm-yyyy hh24:mi:ss'), '17 Butner', 972539006, 'randy@ris.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000264, 'Joely', 'Ammons', to_date('13-06-2002 16:04:10', 'dd-mm-yyyy hh24:mi:ss'), '54 Vancouver Road', 972563645, 'joely@mercantilebank.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000265, 'Sydney', 'Taha', to_date('15-10-2005 17:44:14', 'dd-mm-yyyy hh24:mi:ss'), '439 Adrien Blvd', 972587658, 'sydney.t@capitolbancorp.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000266, 'Jesus', 'Cherry', to_date('21-11-2000 17:24:11', 'dd-mm-yyyy hh24:mi:ss'), '63 Spike Blvd', 972528526, 'jesus.cherry@procurementcentre.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000267, 'Donal', 'Rudd', to_date('06-07-2009 14:25:59', 'dd-mm-yyyy hh24:mi:ss'), '24 Johor Bahru Drive', 972562265, 'donal@pib.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000268, 'David', 'Scorsese', to_date('23-03-2019 18:39:09', 'dd-mm-yyyy hh24:mi:ss'), '582 Levin Blvd', 972526433, 'david.s@kis.es');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000269, 'Bradley', 'Saucedo', to_date('14-02-2006 00:05:41', 'dd-mm-yyyy hh24:mi:ss'), '38 Callow Road', 972508863, 'bsaucedo@securitycheck.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000270, 'Mary', 'Pfeiffer', to_date('25-07-2000 12:21:33', 'dd-mm-yyyy hh24:mi:ss'), '51st Street', 972504087, 'mary.pfeiffer@avr.it');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000271, 'Lari', 'Weber', to_date('13-07-2012 21:45:17', 'dd-mm-yyyy hh24:mi:ss'), '80 Thelma Drive', 972597625, 'lariw@colgatepalmolive.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000272, 'Jamie', 'Rea', to_date('13-05-2011 12:58:56', 'dd-mm-yyyy hh24:mi:ss'), '88 Dillon Drive', 972596175, 'jamie.rea@caliber.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000273, 'Davis', 'David', to_date('30-08-2007 00:59:26', 'dd-mm-yyyy hh24:mi:ss'), '3 Ismaning Road', 972527735, 'davis.david@wlt.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000274, 'Benjamin', 'Gambon', to_date('21-08-2019 07:39:53', 'dd-mm-yyyy hh24:mi:ss'), '53rd Street', 972518969, 'benjaming@philipmorris.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000275, 'Lena', 'Potter', to_date('15-11-2021 14:53:40', 'dd-mm-yyyy hh24:mi:ss'), '91 Mitchell Drive', 972582370, 'lena.potter@solutionbuilders.hk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000276, 'Hazel', 'Winans', to_date('18-08-2016 01:17:20', 'dd-mm-yyyy hh24:mi:ss'), '91st Street', 972532734, 'hazel.winans@extremepizza.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000277, 'Corey', 'Hingle', to_date('02-11-2018 11:08:14', 'dd-mm-yyyy hh24:mi:ss'), '41st Street', 972554126, 'c.hingle@saltgroup.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000278, 'Beth', 'Wariner', to_date('13-12-2020 05:17:43', 'dd-mm-yyyy hh24:mi:ss'), '17 Fountain Hills St', 972531198, 'beth@learningvoyage.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000279, 'Allison', 'Faithfull', to_date('10-07-2003 06:01:00', 'dd-mm-yyyy hh24:mi:ss'), '83 Olyphant Street', 972509572, 'allison@dvdt.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000280, 'Pete', 'Loring', to_date('08-10-2022 09:42:42', 'dd-mm-yyyy hh24:mi:ss'), '69 Donelly Road', 972525089, 'pete.loring@outsourcegroup.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000281, 'Devon', 'Rickles', to_date('16-09-2014 16:20:32', 'dd-mm-yyyy hh24:mi:ss'), '75 Miki Street', 972543476, 'devonr@fflcbancorp.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000282, 'Jack', 'Duncan', to_date('08-11-2017 12:51:12', 'dd-mm-yyyy hh24:mi:ss'), '13 Sharp Road', 972532642, 'jack.d@mercantilebank.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000283, 'Luke', 'Blige', to_date('27-09-2011 18:02:24', 'dd-mm-yyyy hh24:mi:ss'), '10 Gandolfini Blvd', 972584841, 'luke.blige@ipsadvisory.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000284, 'Garth', 'Michaels', to_date('01-05-2012 07:56:18', 'dd-mm-yyyy hh24:mi:ss'), '51st Street', 972580813, 'garth.michaels@pioneermortgage.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000285, 'Jose', 'Renfro', to_date('29-01-2008 14:38:58', 'dd-mm-yyyy hh24:mi:ss'), '73 Erpe-Mere Road', 972550590, 'jose.renfro@unitedasset.es');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000286, 'Danny', 'Hyde', to_date('01-10-2005 08:37:41', 'dd-mm-yyyy hh24:mi:ss'), '31 Haslam', 972597469, 'danny.hyde@elite.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000287, 'Colin', 'Quatro', to_date('10-07-2008 00:04:20', 'dd-mm-yyyy hh24:mi:ss'), '48 Armstrong Blvd', 972507746, 'colin.quatro@gltg.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000288, 'Nanci', 'Guzman', to_date('29-04-2005 23:07:42', 'dd-mm-yyyy hh24:mi:ss'), '38 Malcolm Ave', 972586668, 'nanci.guzman@glmt.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000289, 'Aida', 'Parm', to_date('29-01-2013 22:52:39', 'dd-mm-yyyy hh24:mi:ss'), '90 Purefoy Road', 972584538, 'aida@innovateecommerce.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000290, 'Tom', 'Costa', to_date('05-09-2010 20:27:56', 'dd-mm-yyyy hh24:mi:ss'), '100 Irons Road', 972585586, 'tomc@qas.ch');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000291, 'Allison', 'Rivers', to_date('24-01-2012 10:20:55', 'dd-mm-yyyy hh24:mi:ss'), '98 Webb', 972507331, 'allison@lifelinesystems.nl');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000292, 'Coley', 'Griggs', to_date('27-02-2006 21:21:06', 'dd-mm-yyyy hh24:mi:ss'), '31 Charles Road', 972554818, 'c.griggs@gulfmarkoffshore.at');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000293, 'Pamela', 'Curtis', to_date('14-06-2002 09:06:14', 'dd-mm-yyyy hh24:mi:ss'), '16 Pordenone Blvd', 972507541, 'p.curtis@gillette.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000294, 'Teri', 'Blossoms', to_date('10-05-2019 05:47:27', 'dd-mm-yyyy hh24:mi:ss'), '94 Solomon Street', 972540147, 'teri.blossoms@dbprofessionals.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000295, 'Brendan', 'Gallant', to_date('29-01-2021 19:06:50', 'dd-mm-yyyy hh24:mi:ss'), '98 København Road', 972528760, 'brendan.gallant@learningvoyage.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000296, 'Luke', 'Turturro', to_date('09-04-2000 03:29:00', 'dd-mm-yyyy hh24:mi:ss'), '999 Sample Ave', 972552923, 'luke@apexsystems.nl');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000297, 'Colm', 'Slater', to_date('08-05-2011 15:57:00', 'dd-mm-yyyy hh24:mi:ss'), '10 Boyle', 972534268, 'colm.slater@firstsouthbancorp.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000298, 'Shannyn', 'Tolkan', to_date('02-08-2011 11:52:00', 'dd-mm-yyyy hh24:mi:ss'), '630 Rosas Drive', 972504197, 'shannynt@hondamotor.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000299, 'Dionne', 'Cassel', to_date('21-02-2010 04:27:45', 'dd-mm-yyyy hh24:mi:ss'), '72nd Street', 972560617, 'dionne.cassel@base.com');
commit;
prompt 300 records committed...
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000300, 'Gabrielle', 'Bryson', to_date('20-09-2001 11:10:17', 'dd-mm-yyyy hh24:mi:ss'), '83 Oulu Drive', 972555471, 'g.bryson@mms.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000301, 'Kazem', 'Branagh', to_date('11-03-2015 01:31:40', 'dd-mm-yyyy hh24:mi:ss'), '8 Tartu Drive', 972547532, 'kazem@zaiqtechnologies.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000302, 'Hilary', 'McGregor', to_date('08-06-2021 21:14:24', 'dd-mm-yyyy hh24:mi:ss'), '39 San Mateo Road', 972545530, 'hilary.mcgregor@tilsonlandscape.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000303, 'Susan', 'Peebles', to_date('06-10-2019 19:37:21', 'dd-mm-yyyy hh24:mi:ss'), '90 Gore Road', 972583184, 'susan.p@ogi.es');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000304, 'Jon', 'DeVita', to_date('14-04-2017 12:46:42', 'dd-mm-yyyy hh24:mi:ss'), '25 Borgnine', 972529925, 'jon.devita@naturescure.nl');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000305, 'Andrae', 'Bailey', to_date('07-03-2020 11:12:37', 'dd-mm-yyyy hh24:mi:ss'), '11 Satriani', 972595265, 'andrae.b@fsffinancial.ch');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000306, 'Boyd', 'Dzundza', to_date('02-07-2022 18:28:48', 'dd-mm-yyyy hh24:mi:ss'), '74 Askew Road', 972585641, 'boyd.dzundza@bestever.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000307, 'Judge', 'Luongo', to_date('27-03-2012 15:54:45', 'dd-mm-yyyy hh24:mi:ss'), '74 Mexico City Blvd', 972522047, 'judge.luongo@larkinenterprises.ch');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000308, 'Chrissie', 'Peterson', to_date('21-04-2001 23:20:50', 'dd-mm-yyyy hh24:mi:ss'), '33rd Street', 972583220, 'chrissie.peterson@formatech.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000309, 'Delbert', 'Kirkwood', to_date('08-03-2013 01:35:30', 'dd-mm-yyyy hh24:mi:ss'), '45 Ipswich Blvd', 972528679, 'delbert.kirkwood@jcpenney.ch');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000310, 'Denzel', 'Red', to_date('27-06-2000 10:28:46', 'dd-mm-yyyy hh24:mi:ss'), '21 Marietta Road', 972588765, 'denzel@techbooks.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000311, 'Nicholas', 'Frakes', to_date('05-05-2009 21:10:44', 'dd-mm-yyyy hh24:mi:ss'), '12 Katie', 972562707, 'nicholas.frakes@ezecastlesoftware.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000312, 'Nils', 'Irons', to_date('07-09-2003 15:03:22', 'dd-mm-yyyy hh24:mi:ss'), '196 Glen allen Road', 972532866, 'nils.i@innovativelighting.cz');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000313, 'Cevin', 'Foxx', to_date('10-05-2011 20:00:28', 'dd-mm-yyyy hh24:mi:ss'), '972 Chandler Road', 972564182, 'cevin.foxx@ahl.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000314, 'Brad', 'Brosnan', to_date('15-11-2016 07:37:50', 'dd-mm-yyyy hh24:mi:ss'), '20 Birmensdorf Road', 972531673, 'bbrosnan@invisioncom.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000315, 'Nicolas', 'Koteas', to_date('25-11-2014 09:57:25', 'dd-mm-yyyy hh24:mi:ss'), '4 Purley Ave', 972521772, 'nicolas.koteas@networkdisplay.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000316, 'Curtis', 'Burns', to_date('12-06-2004 06:00:25', 'dd-mm-yyyy hh24:mi:ss'), '49 Brothers Street', 972591467, 'curtis.burns@learningvoyage.it');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000317, 'Rachael', 'Jeter', to_date('17-01-2003 18:30:56', 'dd-mm-yyyy hh24:mi:ss'), '9 Beckinsale Street', 972520032, 'rachael.jeter@mse.ch');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000318, 'Leonardo', 'Nicks', to_date('09-12-2002 00:27:44', 'dd-mm-yyyy hh24:mi:ss'), '8 Helen Drive', 972546248, 'leonardo.nicks@bigdoughcom.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000319, 'Robert', 'Blackmore', to_date('11-10-2007 15:11:51', 'dd-mm-yyyy hh24:mi:ss'), '71st Street', 972565646, 'robert@marathonheater.at');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000320, 'Jose', 'Penn', to_date('14-11-2018 16:36:53', 'dd-mm-yyyy hh24:mi:ss'), '93rd Street', 972582677, 'jose.p@homedepot.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000321, 'Nancy', 'Church', to_date('28-07-2011 13:52:07', 'dd-mm-yyyy hh24:mi:ss'), '12 Leipzig Road', 972540985, 'nancy.church@topicsentertainment.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000322, 'Chris', 'Gyllenhaal', to_date('30-07-2021 00:46:54', 'dd-mm-yyyy hh24:mi:ss'), '56 Peter', 972563791, 'chris.gyllenhaal@parker.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000323, 'Connie', 'Quaid', to_date('21-05-2002 16:00:15', 'dd-mm-yyyy hh24:mi:ss'), '50 Allison Ave', 972529386, 'connie.quaid@nhr.li');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000324, 'Gaby', 'Armatrading', to_date('28-07-2008 09:11:55', 'dd-mm-yyyy hh24:mi:ss'), '80 Hyde Drive', 972560411, 'garmatrading@stmaryland.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000325, 'Heath', 'Page', to_date('02-12-2019 18:09:00', 'dd-mm-yyyy hh24:mi:ss'), '55 Lange', 972569879, 'heath.p@glacierbancorp.za');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000326, 'Sophie', 'Mann', to_date('13-08-2010 16:52:06', 'dd-mm-yyyy hh24:mi:ss'), '32nd Street', 972568494, 'sophie.mann@tmaresources.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000327, 'Kyra', 'MacDowell', to_date('20-08-2011 16:27:56', 'dd-mm-yyyy hh24:mi:ss'), '93 Walter Drive', 972540766, 'kyra.macdowell@shirtfactory.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000328, 'Juliette', 'Rollins', to_date('04-01-2019 16:56:27', 'dd-mm-yyyy hh24:mi:ss'), '14 Debby Road', 972597102, 'julietter@banfeproducts.il');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000329, 'Don', 'Vince', to_date('22-03-2008 19:31:53', 'dd-mm-yyyy hh24:mi:ss'), '97 Arnold Street', 972557701, 'don@sht.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000330, 'Mandy', 'Salonga', to_date('06-01-2009 19:21:25', 'dd-mm-yyyy hh24:mi:ss'), '91 Zellweger Road', 972533162, 'mandy@sourcegear.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000331, 'Yolanda', 'Tyson', to_date('08-05-2018 12:27:37', 'dd-mm-yyyy hh24:mi:ss'), '98 Laurie Street', 972558911, 'y.tyson@mcdonalds.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000332, 'Dar', 'Orbit', to_date('11-01-2011 12:39:55', 'dd-mm-yyyy hh24:mi:ss'), '83rd Street', 972599637, 'dar.orbit@servicelink.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000333, 'Greg', 'Hopper', to_date('23-05-2019 02:32:07', 'dd-mm-yyyy hh24:mi:ss'), '10 Southampton Road', 972520304, 'g.hopper@quakercitybancorp.es');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000334, 'Reese', 'Reid', to_date('15-04-2000 01:38:21', 'dd-mm-yyyy hh24:mi:ss'), '36 Viterelli Street', 972545843, 'r.reid@gci.it');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000335, 'Manu', 'Gellar', to_date('20-01-2017 22:29:24', 'dd-mm-yyyy hh24:mi:ss'), '42 Hanks Street', 972569648, 'manu.gellar@portosan.my');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000336, 'Hikaru', 'Coltrane', to_date('23-11-2011 03:33:09', 'dd-mm-yyyy hh24:mi:ss'), '45 Bernie Drive', 972554579, 'hikaru.coltrane@sis.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000337, 'Dom', 'Shannon', to_date('11-05-2017 07:20:00', 'dd-mm-yyyy hh24:mi:ss'), '21 Deborah', 972517508, 'd.shannon@csi.ar');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000338, 'Diane', 'Crow', to_date('23-12-2000 09:57:09', 'dd-mm-yyyy hh24:mi:ss'), '98 Keith Road', 972547130, 'diane.crow@pra.il');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000339, 'Cheech', 'Mathis', to_date('21-08-2013 07:17:07', 'dd-mm-yyyy hh24:mi:ss'), '467 Laws Street', 972563675, 'cheechm@bestever.es');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000340, 'Danny', 'Rauhofer', to_date('05-04-2021 16:14:28', 'dd-mm-yyyy hh24:mi:ss'), '92 Idol Drive', 972597676, 'danny.rauhofer@directdata.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000341, 'Bill', 'Mollard', to_date('28-03-2006 19:06:27', 'dd-mm-yyyy hh24:mi:ss'), '85 Aurora Ave', 972506571, 'bill.mollard@trc.mx');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000342, 'Robby', 'Reid', to_date('12-11-2017 21:15:04', 'dd-mm-yyyy hh24:mi:ss'), '69 Nightingale Blvd', 972594409, 'robby@linksys.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000343, 'Toshiro', 'Marin', to_date('04-01-2009 14:11:04', 'dd-mm-yyyy hh24:mi:ss'), '42 The Woodlands Blv', 972533596, 'toshiro.marin@technica.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000344, 'Lara', 'Berry', to_date('09-06-2001 18:53:07', 'dd-mm-yyyy hh24:mi:ss'), '141 Bad Oeynhausen D', 972592383, 'lara.berry@asa.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000345, 'Dorry', 'Burton', to_date('22-07-2004 04:05:46', 'dd-mm-yyyy hh24:mi:ss'), '157 Shannon Drive', 972508556, 'dorry.burton@extremepizza.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000346, 'Juliet', 'Bale', to_date('19-12-2003 20:18:20', 'dd-mm-yyyy hh24:mi:ss'), '23 Robards Drive', 972595026, 'juliet.bale@drinkmorewater.pl');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000347, 'Devon', 'Witt', to_date('10-08-2010 03:21:31', 'dd-mm-yyyy hh24:mi:ss'), '348 McGinley Street', 972569733, 'devon.witt@fmi.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000348, 'Anjelica', 'Chambers', to_date('01-07-2005 03:37:10', 'dd-mm-yyyy hh24:mi:ss'), '2 Luongo Drive', 972583169, 'a.chambers@infinity.tr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000349, 'Dylan', 'MacLachlan', to_date('17-04-2022 06:15:11', 'dd-mm-yyyy hh24:mi:ss'), '82 Stormare', 972594569, 'dmaclachlan@at.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000350, 'Marianne', 'Bugnon', to_date('10-11-2005 10:18:41', 'dd-mm-yyyy hh24:mi:ss'), '79 Arkin Blvd', 972556263, 'marianne.bugnon@kingston.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000351, 'Gerald', 'Harry', to_date('21-02-2019 20:05:53', 'dd-mm-yyyy hh24:mi:ss'), '89 Keeslar Drive', 972599759, 'gerald.harry@eastmankodak.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000352, 'Manu', 'Jordan', to_date('03-12-2022 05:49:07', 'dd-mm-yyyy hh24:mi:ss'), '42nd Street', 972509137, 'manu.jordan@spenser.fr');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000353, 'Beverley', 'Bosco', to_date('01-03-2010 12:38:54', 'dd-mm-yyyy hh24:mi:ss'), '86 Sedgwick Street', 972511206, 'beverley.bosco@contract.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000354, 'Joe', 'Getty', to_date('11-07-2012 20:28:00', 'dd-mm-yyyy hh24:mi:ss'), '95 Beverley Drive', 972589977, 'joe.getty@bedfordbancshares.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000355, 'Luke', 'Darren', to_date('17-04-2010 20:22:12', 'dd-mm-yyyy hh24:mi:ss'), '30 West Point Road', 972547833, 'luke.darren@ait.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000356, 'Mel', 'Newton', to_date('10-02-2012 19:40:40', 'dd-mm-yyyy hh24:mi:ss'), '45 Law Blvd', 972544525, 'mel.newton@infopros.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000357, 'Cate', 'Dafoe', to_date('20-01-2009 14:06:30', 'dd-mm-yyyy hh24:mi:ss'), '11 Larry Road', 972514542, 'cate.dafoe@granitesystems.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000358, 'Mika', 'Leachman', to_date('26-05-2008 12:05:17', 'dd-mm-yyyy hh24:mi:ss'), '63 Mae Road', 972586792, 'm.leachman@conagra.dk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000359, 'Jean-Claude', 'Ness', to_date('19-04-2013 05:43:09', 'dd-mm-yyyy hh24:mi:ss'), '32nd Street', 972592997, 'jeanclaude.ness@ams.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000360, 'Shelby', 'Ruiz', to_date('29-05-2005 06:44:30', 'dd-mm-yyyy hh24:mi:ss'), '98 Aglukark', 972571328, 'shelby.ruiz@meghasystems.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000361, 'Harry', 'Mirren', to_date('09-07-2008 13:50:13', 'dd-mm-yyyy hh24:mi:ss'), '12 Simon Ave', 972513565, 'h.mirren@smi.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000362, 'Lydia', 'Chapman', to_date('04-08-2007 04:22:22', 'dd-mm-yyyy hh24:mi:ss'), '32 Carrack Blvd', 972599729, 'lydia.chapman@questarcapital.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000363, 'Azucar', 'Pride', to_date('02-05-2012 12:00:44', 'dd-mm-yyyy hh24:mi:ss'), '802 Lesley Drive', 972504905, 'azucar.pride@freedommedical.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000364, 'Bob', 'LaSalle', to_date('29-07-2009 04:07:37', 'dd-mm-yyyy hh24:mi:ss'), '52 Horton Road', 972543635, 'bob@cardtronics.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000365, 'Roger', 'Stampley', to_date('10-10-2000 12:07:07', 'dd-mm-yyyy hh24:mi:ss'), '23 Janney', 972553256, 'roger.stampley@unit.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000366, 'Kelli', 'Alexander', to_date('27-05-2003 19:40:08', 'dd-mm-yyyy hh24:mi:ss'), '18 Pelvic Road', 972562213, 'kelli@ccb.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000367, 'Harold', 'Avital', to_date('30-07-2015 18:36:31', 'dd-mm-yyyy hh24:mi:ss'), '20 Zooey Drive', 972536619, 'harold.avital@printtech.sg');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000368, 'Jose', 'Bridges', to_date('19-09-2005 03:20:28', 'dd-mm-yyyy hh24:mi:ss'), '6 Vance Road', 972544262, 'jose.bridges@colgatepalmolive.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000369, 'Paula', 'Willard', to_date('07-11-2017 17:34:59', 'dd-mm-yyyy hh24:mi:ss'), '665 Betty Drive', 972596081, 'paula.willard@taycorfinancial.ch');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000370, 'Jody', 'Bassett', to_date('16-07-2005 17:14:32', 'dd-mm-yyyy hh24:mi:ss'), '90 Isaacs Ave', 972506682, 'jody.bassett@technica.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000371, 'Bill', 'Tippe', to_date('16-09-2002 22:14:53', 'dd-mm-yyyy hh24:mi:ss'), '51 Hackman', 972596562, 'bill.tippe@hfn.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000372, 'Lili', 'Llewelyn', to_date('14-04-2009 13:37:23', 'dd-mm-yyyy hh24:mi:ss'), '95 Fox Road', 972517510, 'lili.llewelyn@newtoninteractive.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000373, 'Deborah', 'Navarro', to_date('20-10-2020 21:42:48', 'dd-mm-yyyy hh24:mi:ss'), '7 Koufu Road', 972545509, 'deborahn@pib.dk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000374, 'Brooke', 'Slater', to_date('15-10-2016 05:22:55', 'dd-mm-yyyy hh24:mi:ss'), '799 Thora Road', 972536000, 'brooke.slater@investorstitle.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000375, 'Elizabeth', 'Brooke', to_date('23-04-2020 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), '32 Towson Road', 972576756, 'elizabeth.brooke@inzone.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000376, 'Johnny', 'Dooley', to_date('16-02-2016 17:57:52', 'dd-mm-yyyy hh24:mi:ss'), '92nd Street', 972564281, 'johnny.dooley@americanvanguard.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000377, 'Benicio', 'Beatty', to_date('18-07-2002 21:05:14', 'dd-mm-yyyy hh24:mi:ss'), '483 Blige Street', 972519073, 'benicio.beatty@monitronicsinternational.');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000378, 'Vivica', 'Gary', to_date('28-12-2012 19:21:47', 'dd-mm-yyyy hh24:mi:ss'), '75 Warden Road', 972596922, 'vivica.gary@ois.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000379, 'Jessica', 'Biel', to_date('26-01-2014 12:49:05', 'dd-mm-yyyy hh24:mi:ss'), '40 Plymouth Meeting ', 972511450, 'jessica.biel@isd.br');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000380, 'Derek', 'Perlman', to_date('20-03-2019 00:24:11', 'dd-mm-yyyy hh24:mi:ss'), '68 Gosdin Street', 972550531, 'derek.perlman@isd.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000381, 'Isaac', 'Beals', to_date('23-06-2016 03:10:48', 'dd-mm-yyyy hh24:mi:ss'), '4 Shepard Street', 972530200, 'isaac.beals@insurmark.ch');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000382, 'Sigourney', 'Wood', to_date('12-10-2007 12:33:49', 'dd-mm-yyyy hh24:mi:ss'), '59 Wariner Street', 972557575, 'sigourneyw@myricom.es');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000383, 'Boz', 'Fogerty', to_date('07-12-2018 22:45:34', 'dd-mm-yyyy hh24:mi:ss'), '88 Marsden', 972585629, 'boz.fogerty@capitalbank.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000384, 'Larry', 'De Niro', to_date('22-05-2018 08:10:47', 'dd-mm-yyyy hh24:mi:ss'), '38 Sandler Drive', 972536321, 'larryd@usphysicaltherapy.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000385, 'Ryan', 'Hatchet', to_date('18-07-2021 15:49:26', 'dd-mm-yyyy hh24:mi:ss'), '89 St Kilda Drive', 972553906, 'ryan.hatchet@wci.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000386, 'Eliza', 'Stowe', to_date('24-08-2005 08:49:49', 'dd-mm-yyyy hh24:mi:ss'), '20 Spall Road', 972551924, 'eliza@banfeproducts.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000387, 'Maria', 'Schneider', to_date('22-02-2000 08:20:35', 'dd-mm-yyyy hh24:mi:ss'), '573 Alicia Ave', 972527318, 'maria@hotmail.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000388, 'Norm', 'Lightfoot', to_date('12-06-2005 16:38:37', 'dd-mm-yyyy hh24:mi:ss'), '462 Wesley Drive', 972523893, 'norm.lightfoot@innovativelighting.ca');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000389, 'Chloe', 'Gary', to_date('08-09-2008 13:43:39', 'dd-mm-yyyy hh24:mi:ss'), '52 Ebersdorf Drive', 972520827, 'chloe.gary@infopros.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000390, 'Toni', 'Love', to_date('11-05-2007 04:12:33', 'dd-mm-yyyy hh24:mi:ss'), '97 Goodman Drive', 972503245, 't.love@caliber.uk');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000391, 'Ozzy', 'Carlyle', to_date('20-04-2017 10:17:39', 'dd-mm-yyyy hh24:mi:ss'), '93 Stanley Drive', 972586706, 'ozzyc@linacsystems.no');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000392, 'Angela', 'Duschel', to_date('18-11-2002 21:10:13', 'dd-mm-yyyy hh24:mi:ss'), '12 Collin Drive', 972519234, 'a.duschel@firstsouthbancorp.za');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000393, 'Jann', 'Moreno', to_date('26-07-2008 14:19:31', 'dd-mm-yyyy hh24:mi:ss'), '55 Emmett Road', 972572275, 'jannm@emt.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000394, 'Sandra', 'Conroy', to_date('22-12-2002 19:17:52', 'dd-mm-yyyy hh24:mi:ss'), '9 Melvin Road', 972528531, 'sandra.conroy@reckittbenckiser.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000395, 'Sophie', 'Malone', to_date('02-11-2007 20:22:05', 'dd-mm-yyyy hh24:mi:ss'), '62 New hartford Stre', 972520770, 'sophie.malone@priorityexpress.de');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000396, 'Rufus', 'Oszajca', to_date('06-01-2007 07:13:34', 'dd-mm-yyyy hh24:mi:ss'), '10 Feore Drive', 972593114, 'rufus.oszajca@kwraf.is');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000397, 'Lennie', 'Nivola', to_date('08-04-2021 16:55:13', 'dd-mm-yyyy hh24:mi:ss'), '29 Regina Street', 972576446, 'lennie.nivola@ivci.jp');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000398, 'Remy', 'Cozier', to_date('04-08-2001 08:47:35', 'dd-mm-yyyy hh24:mi:ss'), '2 São paulo Road', 972584496, 'remy.c@hitechpharmacal.com');
insert into CUSTOMER (customerid, firstname, lastname, dateofbirth, address, contactnumber, email)
values (1000399, 'Brad', 'Berkeley', to_date('26-02-2007 22:13:35', 'dd-mm-yyyy hh24:mi:ss'), '25 Evett Drive', 972532875, 'brad.berkeley@amerisourcefunding.com');
commit;
prompt 400 records loaded
prompt Loading DIRECTDEBIT...
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000000, to_date('07-12-2016 06:55:52', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 10840, 100000);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000001, to_date('15-11-2012 12:48:55', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 9181, 100001);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000002, to_date('29-11-2016 10:48:09', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 18077, 100002);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000003, to_date('19-12-2012 01:02:36', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 9301, 100003);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000004, to_date('14-03-2009 23:05:57', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 24059, 100004);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000005, to_date('24-04-2015 04:02:37', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 4303, 100005);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000006, to_date('21-07-2021 23:24:58', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 4138, 100006);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000007, to_date('13-07-2001 15:24:22', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 23134, 100007);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000008, to_date('21-12-2019 11:23:46', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 11544, 100008);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000009, to_date('28-02-2006 09:34:28', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 1333, 100009);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000010, to_date('18-10-2022 08:05:50', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 15531, 100010);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000011, to_date('24-08-2001 01:56:51', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 20745, 100011);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000012, to_date('16-05-2001 08:32:40', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 8825, 100012);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000013, to_date('20-01-2015 05:40:31', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 23190, 100013);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000014, to_date('12-02-2018 21:11:52', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 17891, 100014);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000015, to_date('26-03-2004 20:18:25', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6452, 100015);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000016, to_date('17-03-2007 22:33:47', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 17220, 100016);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000017, to_date('07-11-2018 07:18:37', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 25862, 100017);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000018, to_date('05-09-2012 02:14:14', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7836, 100018);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000019, to_date('11-04-2013 20:02:54', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 16908, 100019);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000020, to_date('31-03-2000 17:36:02', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 27227, 100020);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000021, to_date('03-01-2016 02:19:09', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 24947, 100021);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000022, to_date('12-05-2016 09:22:42', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 17586, 100022);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000023, to_date('10-08-2000 21:04:15', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 13856, 100023);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000024, to_date('10-11-2009 11:34:35', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6291, 100024);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000025, to_date('28-06-2006 17:45:33', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 23734, 100025);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000026, to_date('21-09-2006 21:29:26', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 21106, 100026);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000027, to_date('22-04-2005 10:31:27', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 3492, 100027);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000028, to_date('01-02-2002 13:11:20', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 21344, 100028);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000029, to_date('26-04-2002 03:51:30', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22830, 100029);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000030, to_date('20-06-2020 03:00:57', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 18333, 100030);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000031, to_date('15-08-2005 10:32:17', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 19825, 100031);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000032, to_date('05-09-2014 01:26:23', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 3406, 100032);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000033, to_date('05-05-2001 02:26:19', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 10747, 100033);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000034, to_date('08-04-2015 01:20:54', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7708, 100034);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000035, to_date('24-02-2021 07:19:54', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 14509, 100035);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000036, to_date('06-04-2001 03:35:43', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 19406, 100036);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000037, to_date('30-09-2018 21:26:51', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 21166, 100037);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000038, to_date('08-12-2015 20:13:56', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 26681, 100038);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000039, to_date('19-03-2013 16:08:39', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 28370, 100039);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000040, to_date('27-05-2002 13:32:59', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 3363, 100040);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000041, to_date('06-03-2015 17:42:11', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 23446, 100041);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000042, to_date('26-09-2013 07:24:28', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 23903, 100042);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000043, to_date('20-07-2020 01:25:22', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 29858, 100043);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000044, to_date('07-10-2013 16:35:33', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6059, 100044);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000045, to_date('28-11-2019 11:00:08', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 13513, 100045);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000046, to_date('03-08-2009 20:58:51', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 15021, 100046);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000047, to_date('28-10-2006 08:11:13', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7764, 100047);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000048, to_date('23-12-2000 22:26:27', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 12697, 100048);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000049, to_date('02-05-2011 20:30:43', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22029, 100049);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000050, to_date('23-10-2008 04:01:23', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 24931, 100050);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000051, to_date('15-05-2020 21:02:37', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22814, 100051);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000052, to_date('23-09-2009 18:11:49', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 14299, 100052);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000053, to_date('15-02-2019 22:54:49', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 10363, 100053);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000054, to_date('09-06-2008 20:01:01', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 7365, 100054);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000055, to_date('18-10-2003 18:30:27', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 28723, 100055);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000056, to_date('14-05-2019 06:34:27', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 10073, 100056);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000057, to_date('21-08-2000 08:17:35', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 24316, 100057);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000058, to_date('10-04-2018 11:34:03', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 13397, 100058);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000059, to_date('16-04-2011 12:17:18', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22141, 100059);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000060, to_date('17-08-2017 07:54:07', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 1868, 100060);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000061, to_date('10-01-2019 02:25:55', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 25960, 100061);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000062, to_date('26-02-2007 01:56:39', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 16623, 100062);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000063, to_date('26-08-2011 12:50:09', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 16854, 100063);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000064, to_date('03-07-2007 12:00:47', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 8775, 100064);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000065, to_date('24-01-2015 09:26:44', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 27439, 100065);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000066, to_date('18-10-2022 09:16:45', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 28154, 100066);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000067, to_date('20-08-2002 12:08:23', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22379, 100067);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000068, to_date('21-10-2010 03:07:23', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22309, 100068);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000069, to_date('21-01-2011 17:25:48', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 25385, 100069);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000070, to_date('13-06-2017 12:27:05', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 25762, 100070);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000071, to_date('11-08-2009 12:06:47', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 8715, 100071);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000072, to_date('12-01-2011 01:00:48', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 14775, 100072);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000073, to_date('02-06-2003 09:38:43', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 28385, 100073);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000074, to_date('30-10-2010 21:28:16', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 25280, 100074);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000075, to_date('06-01-2014 10:11:36', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 23717, 100075);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000076, to_date('30-11-2012 13:19:17', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 20355, 100076);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000077, to_date('15-12-2002 06:21:33', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 28540, 100077);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000078, to_date('08-06-2007 05:15:28', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 18500, 100078);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000079, to_date('03-11-2010 10:01:02', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7853, 100079);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000080, to_date('28-10-2017 14:16:16', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6001, 100080);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000081, to_date('15-07-2015 01:30:49', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 1912, 100081);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000082, to_date('06-09-2002 07:34:04', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 10314, 100082);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000083, to_date('26-10-2011 07:23:10', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 19763, 100083);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000084, to_date('11-06-2021 02:46:19', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 15600, 100084);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000085, to_date('28-11-2005 23:01:58', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 10396, 100085);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000086, to_date('02-06-2009 05:02:44', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22341, 100086);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000087, to_date('17-01-2011 08:00:50', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 2094, 100087);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000088, to_date('24-12-2001 10:43:54', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 4590, 100088);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000089, to_date('17-07-2010 12:54:57', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 17191, 100089);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000090, to_date('10-06-2009 19:37:12', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 8912, 100090);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000091, to_date('21-11-2018 11:29:50', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 3780, 100091);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000092, to_date('10-10-2014 23:52:47', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 4127, 100092);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000093, to_date('03-02-2000 22:10:35', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 1959, 100093);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000094, to_date('13-11-2001 04:58:48', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 13621, 100094);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000095, to_date('27-11-2009 01:33:47', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 18670, 100095);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000096, to_date('31-03-2007 03:08:55', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 16093, 100096);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000097, to_date('14-07-2013 16:41:14', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 12543, 100097);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000098, to_date('09-03-2000 13:33:45', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 20367, 100098);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000099, to_date('28-07-2001 19:42:56', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 29535, 100099);
commit;
prompt 100 records committed...
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000100, to_date('20-12-2007 04:25:56', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6794, 100100);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000101, to_date('16-01-2004 09:25:56', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 5110, 100101);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000102, to_date('07-06-2016 20:18:00', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 13932, 100102);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000103, to_date('04-01-2012 23:27:16', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 11250, 100103);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000104, to_date('02-10-2014 06:09:26', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 21344, 100104);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000105, to_date('23-08-2019 01:29:39', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 29440, 100105);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000106, to_date('23-05-2011 07:14:12', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 4091, 100106);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000107, to_date('24-08-2022 07:31:06', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 6218, 100107);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000108, to_date('30-01-2022 05:16:22', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 24184, 100108);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000109, to_date('16-11-2015 01:16:29', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 11946, 100109);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000110, to_date('21-08-2014 04:31:29', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 4832, 100110);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000111, to_date('11-03-2014 20:50:43', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 6527, 100111);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000112, to_date('04-03-2016 09:48:24', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 21645, 100112);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000113, to_date('14-12-2020 19:08:07', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 26043, 100113);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000114, to_date('09-02-2000 19:40:27', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 9342, 100114);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000115, to_date('27-01-2016 10:40:26', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 16444, 100115);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000116, to_date('09-12-2001 01:27:53', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 8140, 100116);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000117, to_date('28-07-2016 06:59:23', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 2556, 100117);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000118, to_date('11-09-2022 20:50:59', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 11626, 100118);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000119, to_date('25-06-2009 22:44:42', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 12869, 100119);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000120, to_date('10-08-2002 22:21:41', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 25476, 100120);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000121, to_date('29-03-2009 04:53:57', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 19629, 100121);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000122, to_date('10-07-2021 23:38:13', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 23053, 100122);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000123, to_date('01-08-2002 03:00:09', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 27766, 100123);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000124, to_date('24-02-2011 15:36:23', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 23601, 100124);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000125, to_date('26-04-2019 17:25:53', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 12536, 100125);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000126, to_date('08-07-2019 13:40:33', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 18516, 100126);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000127, to_date('11-04-2018 04:09:43', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 13978, 100127);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000128, to_date('14-12-2016 02:19:56', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 20867, 100128);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000129, to_date('07-01-2011 11:02:01', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 15069, 100129);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000130, to_date('04-08-2015 05:54:32', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 10031, 100130);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000131, to_date('18-11-2020 17:45:13', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 2050, 100131);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000132, to_date('30-12-2006 15:47:29', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 14007, 100132);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000133, to_date('14-11-2000 01:33:28', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 28226, 100133);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000134, to_date('07-11-2022 09:28:18', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 5865, 100134);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000135, to_date('30-07-2009 20:25:41', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 4110, 100135);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000136, to_date('06-03-2012 03:00:28', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 21047, 100136);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000137, to_date('26-01-2014 14:48:16', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 18073, 100137);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000138, to_date('19-06-2011 14:54:16', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 2722, 100138);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000139, to_date('11-07-2020 08:02:42', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 16819, 100139);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000140, to_date('14-10-2021 00:18:27', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 7170, 100140);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000141, to_date('21-01-2001 09:34:13', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 8666, 100141);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000142, to_date('29-03-2002 04:51:33', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 27793, 100142);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000143, to_date('25-02-2018 20:32:18', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 8135, 100143);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000144, to_date('01-07-2008 08:03:04', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 3354, 100144);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000145, to_date('20-07-2009 15:17:39', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 15014, 100145);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000146, to_date('18-12-2011 22:10:17', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 4414, 100146);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000147, to_date('18-09-2016 01:20:40', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7304, 100147);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000148, to_date('31-08-2016 05:09:58', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 12499, 100148);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000149, to_date('26-07-2001 01:49:47', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 14324, 100149);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000150, to_date('23-05-2019 00:18:28', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 29471, 100150);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000151, to_date('08-11-2009 01:30:36', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 27645, 100151);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000152, to_date('10-10-2022 21:35:11', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 29208, 100152);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000153, to_date('17-09-2021 13:11:58', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 16497, 100153);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000154, to_date('26-02-2004 22:43:06', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 24476, 100154);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000155, to_date('12-02-2019 20:02:18', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 26829, 100155);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000156, to_date('12-05-2000 02:51:48', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 8787, 100156);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000157, to_date('14-12-2012 09:58:33', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 27517, 100157);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000158, to_date('16-04-2007 03:36:59', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 9557, 100158);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000159, to_date('15-09-2008 08:29:22', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 25027, 100159);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000160, to_date('30-08-2007 12:31:40', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 8867, 100160);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000161, to_date('25-12-2003 13:08:44', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 14733, 100161);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000162, to_date('13-07-2020 01:16:19', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 26140, 100162);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000163, to_date('29-01-2006 21:03:51', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22368, 100163);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000164, to_date('29-09-2016 02:49:57', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6278, 100164);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000165, to_date('28-06-2014 13:59:47', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 19022, 100165);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000166, to_date('09-10-2000 17:16:24', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7989, 100166);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000167, to_date('09-05-2005 12:48:51', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 1742, 100167);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000168, to_date('11-01-2012 09:56:23', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 26976, 100168);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000169, to_date('29-07-2011 10:34:43', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7968, 100169);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000170, to_date('07-08-2013 18:43:08', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 25757, 100170);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000171, to_date('22-09-2000 01:46:20', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7399, 100171);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000172, to_date('18-08-2017 16:33:36', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 29678, 100172);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000173, to_date('09-12-2001 01:42:32', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 4573, 100173);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000174, to_date('21-08-2004 19:16:59', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 22643, 100174);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000175, to_date('09-02-2011 06:24:45', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 19359, 100175);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000176, to_date('16-10-2018 20:11:36', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 5108, 100176);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000177, to_date('28-06-2010 21:48:30', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22512, 100177);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000178, to_date('19-04-2019 04:20:49', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 5219, 100178);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000179, to_date('25-10-2004 20:46:21', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 6083, 100179);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000180, to_date('18-11-2020 19:15:40', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 11281, 100180);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000181, to_date('28-11-2015 13:59:02', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 26579, 100181);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000182, to_date('17-02-2005 05:40:19', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 9623, 100182);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000183, to_date('23-09-2016 23:55:07', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 8372, 100183);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000184, to_date('25-09-2009 00:13:59', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22290, 100184);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000185, to_date('30-09-2019 04:37:37', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7816, 100185);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000186, to_date('01-01-2017 13:47:31', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 14637, 100186);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000187, to_date('11-05-2007 18:39:17', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 27919, 100187);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000188, to_date('28-10-2013 11:32:01', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22041, 100188);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000189, to_date('21-02-2007 13:05:17', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 19708, 100189);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000190, to_date('15-04-2018 04:55:03', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 4344, 100190);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000191, to_date('03-11-2019 15:32:08', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 27744, 100191);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000192, to_date('20-01-2018 03:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 29585, 100192);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000193, to_date('30-12-2008 16:10:35', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7909, 100193);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000194, to_date('11-08-2003 05:06:33', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 2086, 100194);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000195, to_date('14-07-2015 03:08:23', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 5408, 100195);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000196, to_date('19-07-2015 23:34:00', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 26159, 100196);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000197, to_date('05-01-2003 22:07:57', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 29591, 100197);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000198, to_date('05-07-2000 09:21:09', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 14790, 100198);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000199, to_date('11-07-2020 17:59:28', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 25225, 100199);
commit;
prompt 200 records committed...
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000200, to_date('15-02-2021 01:52:23', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 12462, 100200);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000201, to_date('26-07-2002 16:53:25', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 18759, 100201);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000202, to_date('10-06-2017 03:07:00', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 1965, 100202);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000203, to_date('19-04-2011 21:43:34', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 9472, 100203);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000204, to_date('04-07-2003 03:32:19', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 8536, 100204);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000205, to_date('11-01-2001 19:35:28', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 29229, 100205);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000206, to_date('17-12-2020 07:55:21', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 21711, 100206);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000207, to_date('27-07-2018 17:46:47', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 19447, 100207);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000208, to_date('16-03-2009 11:00:28', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 25180, 100208);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000209, to_date('15-06-2000 03:03:55', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 14651, 100209);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000210, to_date('08-12-2000 16:48:39', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 29077, 100210);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000211, to_date('30-03-2021 22:07:28', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 24329, 100211);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000212, to_date('11-11-2005 23:57:35', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 11588, 100212);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000213, to_date('02-06-2012 09:17:18', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 5122, 100213);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000214, to_date('10-06-2002 08:24:29', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6399, 100214);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000215, to_date('24-05-2017 12:45:39', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 19982, 100215);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000216, to_date('23-09-2000 17:46:21', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 27779, 100216);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000217, to_date('15-07-2014 15:03:50', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 15759, 100217);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000218, to_date('09-06-2013 15:43:08', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 7330, 100218);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000219, to_date('28-07-2007 14:21:58', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 10930, 100219);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000220, to_date('19-08-2021 03:05:04', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 17639, 100220);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000221, to_date('22-01-2019 22:11:28', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 27931, 100221);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000222, to_date('13-03-2002 04:20:59', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 2309, 100222);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000223, to_date('31-01-2007 13:53:24', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 4035, 100223);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000224, to_date('28-07-2020 02:45:18', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 25426, 100224);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000225, to_date('17-03-2017 23:49:41', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 29897, 100225);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000226, to_date('04-04-2016 04:54:43', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 22160, 100226);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000227, to_date('07-03-2010 16:07:36', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 3352, 100227);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000228, to_date('13-12-2004 23:50:29', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 11511, 100228);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000229, to_date('24-02-2005 04:38:09', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 21954, 100229);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000230, to_date('21-08-2008 00:24:13', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 23130, 100230);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000231, to_date('01-12-2016 22:03:59', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 13777, 100231);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000232, to_date('21-01-2013 14:41:55', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 14757, 100232);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000233, to_date('27-09-2013 07:27:49', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 24814, 100233);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000234, to_date('12-02-2016 18:29:55', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 21083, 100234);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000235, to_date('22-05-2001 22:47:59', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 4559, 100235);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000236, to_date('09-12-2016 09:34:30', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 26239, 100236);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000237, to_date('04-02-2003 13:35:41', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 7225, 100237);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000238, to_date('20-04-2012 17:41:54', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 9695, 100238);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000239, to_date('09-12-2018 11:14:27', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 14625, 100239);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000240, to_date('14-03-2020 07:41:32', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7808, 100240);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000241, to_date('10-12-2017 06:36:10', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 7436, 100241);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000242, to_date('09-08-2005 16:46:45', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 12374, 100242);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000243, to_date('09-09-2019 11:29:36', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 16899, 100243);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000244, to_date('24-07-2019 22:22:35', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 8622, 100244);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000245, to_date('22-09-2020 13:19:33', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 9471, 100245);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000246, to_date('28-03-2014 04:17:47', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 5943, 100246);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000247, to_date('13-10-2018 21:43:22', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 10664, 100247);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000248, to_date('15-07-2000 07:14:25', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 21305, 100248);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000249, to_date('17-01-2017 20:49:41', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 19195, 100249);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000250, to_date('08-02-2000 17:30:21', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 17401, 100250);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000251, to_date('08-03-2014 02:39:04', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 16971, 100251);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000252, to_date('27-01-2022 20:19:25', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7467, 100252);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000253, to_date('15-09-2002 13:42:08', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 15405, 100253);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000254, to_date('12-08-2004 07:52:52', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7097, 100254);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000255, to_date('13-09-2018 04:37:41', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 15993, 100255);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000256, to_date('11-10-2019 16:43:05', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 16446, 100256);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000257, to_date('13-09-2010 08:01:43', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 27999, 100257);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000258, to_date('24-06-2021 13:51:10', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 24994, 100258);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000259, to_date('16-06-2008 03:22:47', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 21788, 100259);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000260, to_date('08-03-2006 00:13:37', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 13719, 100260);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000261, to_date('08-08-2006 08:19:35', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 14706, 100261);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000262, to_date('28-06-2012 15:50:46', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 2096, 100262);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000263, to_date('07-04-2022 01:42:23', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 20046, 100263);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000264, to_date('12-03-2014 10:31:43', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7894, 100264);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000265, to_date('20-01-2017 11:18:34', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 29168, 100265);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000266, to_date('20-08-2022 20:55:27', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 14674, 100266);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000267, to_date('21-10-2022 09:32:05', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 22443, 100267);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000268, to_date('07-07-2015 22:52:59', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 18345, 100268);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000269, to_date('29-09-2014 02:06:23', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 25367, 100269);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000270, to_date('03-05-2013 00:00:06', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 28848, 100270);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000271, to_date('06-12-2020 01:27:53', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 2960, 100271);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000272, to_date('24-06-2009 21:40:00', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 29017, 100272);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000273, to_date('17-01-2019 08:29:54', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 5306, 100273);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000274, to_date('06-04-2004 01:51:34', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 17782, 100274);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000275, to_date('13-03-2018 01:27:39', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7869, 100275);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000276, to_date('15-10-2016 11:31:00', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 4648, 100276);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000277, to_date('07-06-2016 08:38:46', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 9402, 100277);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000278, to_date('14-11-2002 11:36:45', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 1186, 100278);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000279, to_date('09-02-2021 09:59:43', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 25009, 100279);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000280, to_date('05-04-2011 20:39:21', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 3279, 100280);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000281, to_date('12-05-2016 22:25:04', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 13999, 100281);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000282, to_date('13-05-2001 18:46:40', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 19763, 100282);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000283, to_date('11-01-2004 20:09:53', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 27741, 100283);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000284, to_date('09-11-2007 18:20:17', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 5191, 100284);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000285, to_date('02-04-2013 08:17:05', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7117, 100285);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000286, to_date('15-08-2012 02:41:40', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 19074, 100286);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000287, to_date('02-11-2009 07:25:00', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 28637, 100287);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000288, to_date('10-06-2001 15:29:31', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 9978, 100288);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000289, to_date('07-08-2014 08:21:05', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 13344, 100289);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000290, to_date('06-11-2009 02:10:46', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 23251, 100290);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000291, to_date('15-02-2000 09:48:06', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 12251, 100291);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000292, to_date('11-09-2009 21:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 9927, 100292);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000293, to_date('18-10-2001 09:32:40', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 5129, 100293);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000294, to_date('16-03-2018 12:56:50', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 5632, 100294);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000295, to_date('25-05-2011 18:13:15', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 8534, 100295);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000296, to_date('31-12-2011 17:54:44', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 23809, 100296);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000297, to_date('30-03-2005 13:42:12', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 24665, 100297);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000298, to_date('30-06-2019 21:01:41', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 15029, 100298);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000299, to_date('29-01-2012 21:15:34', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 15481, 100299);
commit;
prompt 300 records committed...
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000300, to_date('21-06-2012 15:25:56', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 9217, 100300);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000301, to_date('29-07-2004 04:17:53', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 12073, 100301);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000302, to_date('18-09-2016 23:11:15', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 21687, 100302);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000303, to_date('07-01-2010 04:54:25', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 19091, 100303);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000304, to_date('04-02-2013 05:19:35', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 14150, 100304);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000305, to_date('14-05-2004 19:21:55', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 23597, 100305);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000306, to_date('19-05-2009 04:06:42', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 12025, 100306);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000307, to_date('13-11-2015 07:50:25', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 26483, 100307);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000308, to_date('20-02-2019 22:20:54', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 14964, 100308);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000309, to_date('26-06-2007 19:29:37', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 17137, 100309);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000310, to_date('23-10-2016 14:37:24', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 11056, 100310);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000311, to_date('15-01-2008 13:22:27', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22860, 100311);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000312, to_date('25-01-2004 06:26:47', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 22381, 100312);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000313, to_date('05-11-2022 08:37:50', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 19794, 100313);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000314, to_date('26-06-2012 23:32:41', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 9501, 100314);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000315, to_date('14-01-2014 18:33:54', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22458, 100315);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000316, to_date('08-11-2019 16:36:40', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 16176, 100316);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000317, to_date('11-02-2002 18:32:26', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 28331, 100317);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000318, to_date('07-02-2009 09:07:23', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 20530, 100318);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000319, to_date('21-08-2015 02:01:15', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 23626, 100319);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000320, to_date('27-08-2008 19:39:39', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 1623, 100320);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000321, to_date('26-06-2009 23:06:13', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 19462, 100321);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000322, to_date('05-12-2022 19:20:11', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 4052, 100322);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000323, to_date('19-03-2002 20:48:14', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 19059, 100323);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000324, to_date('16-07-2016 11:39:03', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 12228, 100324);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000325, to_date('17-07-2008 12:56:56', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 13634, 100325);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000326, to_date('30-04-2009 19:41:09', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 11530, 100326);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000327, to_date('24-06-2021 15:34:44', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 2082, 100327);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000328, to_date('16-04-2001 22:12:06', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 27943, 100328);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000329, to_date('04-10-2000 22:53:15', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 8647, 100329);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000330, to_date('11-04-2007 22:43:13', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 19349, 100330);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000331, to_date('07-04-2006 02:56:56', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 8099, 100331);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000332, to_date('03-01-2021 12:56:38', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 27807, 100332);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000333, to_date('03-08-2019 10:48:00', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 14560, 100333);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000334, to_date('17-02-2008 14:54:08', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 19582, 100334);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000335, to_date('11-05-2001 01:58:56', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 25882, 100335);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000336, to_date('24-09-2020 17:47:00', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 6543, 100336);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000337, to_date('29-09-2010 22:53:22', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 20728, 100337);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000338, to_date('24-11-2019 04:00:18', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 16046, 100338);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000339, to_date('31-12-2003 16:41:11', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 27643, 100339);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000340, to_date('26-09-2020 03:46:42', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 29126, 100340);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000341, to_date('08-06-2006 17:19:04', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6377, 100341);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000342, to_date('16-11-2017 20:47:27', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 7211, 100342);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000343, to_date('04-07-2005 21:56:19', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 20376, 100343);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000344, to_date('12-06-2014 16:58:55', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 17539, 100344);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000345, to_date('03-05-2022 01:43:27', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 12532, 100345);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000346, to_date('01-03-2014 04:22:00', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 11707, 100346);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000347, to_date('21-07-2006 14:31:55', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 29762, 100347);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000348, to_date('30-11-2003 04:05:06', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 10641, 100348);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000349, to_date('23-04-2004 22:04:13', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 8736, 100349);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000350, to_date('13-01-2004 20:14:30', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6110, 100350);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000351, to_date('27-08-2020 13:34:23', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 23584, 100351);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000352, to_date('24-09-2014 12:48:25', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 13600, 100352);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000353, to_date('05-06-2019 16:21:52', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 3154, 100353);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000354, to_date('17-04-2014 18:03:49', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 11506, 100354);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000355, to_date('06-01-2006 03:04:59', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 21319, 100355);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000356, to_date('12-02-2013 17:14:49', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6161, 100356);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000357, to_date('18-01-2003 18:52:24', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 15489, 100357);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000358, to_date('01-07-2008 20:29:09', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 13651, 100358);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000359, to_date('22-05-2014 03:31:41', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 15377, 100359);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000360, to_date('16-02-2005 18:15:11', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 4412, 100360);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000361, to_date('28-08-2016 02:49:55', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 3038, 100361);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000362, to_date('17-02-2022 10:47:21', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 12255, 100362);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000363, to_date('24-02-2017 11:17:33', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 28640, 100363);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000364, to_date('28-01-2004 06:17:37', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 15923, 100364);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000365, to_date('11-12-2001 05:31:32', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6226, 100365);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000366, to_date('25-05-2009 15:21:23', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6558, 100366);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000367, to_date('20-10-2001 00:13:47', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 14541, 100367);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000368, to_date('05-08-2010 07:31:12', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 1390, 100368);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000369, to_date('21-05-2009 03:32:59', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 23540, 100369);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000370, to_date('14-01-2018 11:15:05', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 28340, 100370);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000371, to_date('04-08-2017 20:23:21', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 12845, 100371);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000372, to_date('20-07-2008 11:51:30', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 19075, 100372);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000373, to_date('26-12-2003 05:54:50', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 21488, 100373);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000374, to_date('21-02-2021 23:57:33', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22447, 100374);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000375, to_date('08-02-2000 12:38:34', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 15765, 100375);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000376, to_date('28-10-2008 00:49:39', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 1359, 100376);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000377, to_date('03-02-2014 23:42:11', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 13441, 100377);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000378, to_date('07-10-2008 11:20:10', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 15343, 100378);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000379, to_date('14-06-2020 15:44:09', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 22438, 100379);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000380, to_date('08-11-2012 11:01:09', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 21241, 100380);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000381, to_date('13-05-2013 15:55:38', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 23568, 100381);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000382, to_date('20-02-2019 05:09:08', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 6950, 100382);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000383, to_date('09-01-2016 11:00:31', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 20854, 100383);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000384, to_date('09-03-2020 15:15:08', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 21212, 100384);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000385, to_date('27-07-2021 16:47:01', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 12824, 100385);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000386, to_date('12-04-2012 06:01:55', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 5703, 100386);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000387, to_date('17-02-2011 06:11:27', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 20651, 100387);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000388, to_date('21-08-2022 05:40:24', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 20341, 100388);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000389, to_date('18-08-2016 11:23:17', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 27102, 100389);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000390, to_date('30-09-2015 05:30:37', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 1786, 100390);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000391, to_date('12-11-2002 12:02:10', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 3112, 100391);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000392, to_date('28-05-2004 01:43:17', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 23453, 100392);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000393, to_date('11-01-2019 14:47:40', 'dd-mm-yyyy hh24:mi:ss'), 'yearly', 11183, 100393);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000394, to_date('24-02-2021 03:58:44', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 14896, 100394);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000395, to_date('24-10-2001 10:04:19', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 6369, 100395);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000396, to_date('18-05-2008 22:50:36', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 20402, 100396);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000397, to_date('11-04-2004 12:08:50', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 10220, 100397);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000398, to_date('23-04-2007 22:10:06', 'dd-mm-yyyy hh24:mi:ss'), 'monthly', 18205, 100398);
insert into DIRECTDEBIT (iddebit, startdate, typedebit, amount, accountid)
values (1000399, to_date('16-01-2002 00:30:07', 'dd-mm-yyyy hh24:mi:ss'), 'weekly', 10631, 100399);
commit;
prompt 400 records loaded
prompt Loading REL5...
insert into REL5 (customerid, accountid)
values (1000108, 100044);
insert into REL5 (customerid, accountid)
values (1000259, 100191);
insert into REL5 (customerid, accountid)
values (1000340, 100071);
insert into REL5 (customerid, accountid)
values (1000198, 100234);
insert into REL5 (customerid, accountid)
values (1000273, 100009);
insert into REL5 (customerid, accountid)
values (1000148, 100145);
insert into REL5 (customerid, accountid)
values (1000162, 100008);
insert into REL5 (customerid, accountid)
values (1000128, 100367);
insert into REL5 (customerid, accountid)
values (1000072, 100265);
insert into REL5 (customerid, accountid)
values (1000365, 100270);
insert into REL5 (customerid, accountid)
values (1000253, 100204);
insert into REL5 (customerid, accountid)
values (1000388, 100192);
insert into REL5 (customerid, accountid)
values (1000159, 100237);
insert into REL5 (customerid, accountid)
values (1000327, 100126);
insert into REL5 (customerid, accountid)
values (1000226, 100082);
insert into REL5 (customerid, accountid)
values (1000058, 100060);
insert into REL5 (customerid, accountid)
values (1000346, 100149);
insert into REL5 (customerid, accountid)
values (1000283, 100041);
insert into REL5 (customerid, accountid)
values (1000367, 100368);
insert into REL5 (customerid, accountid)
values (1000230, 100358);
insert into REL5 (customerid, accountid)
values (1000029, 100219);
insert into REL5 (customerid, accountid)
values (1000213, 100226);
insert into REL5 (customerid, accountid)
values (1000077, 100235);
insert into REL5 (customerid, accountid)
values (1000011, 100177);
insert into REL5 (customerid, accountid)
values (1000127, 100109);
insert into REL5 (customerid, accountid)
values (1000261, 100019);
insert into REL5 (customerid, accountid)
values (1000135, 100040);
insert into REL5 (customerid, accountid)
values (1000118, 100047);
insert into REL5 (customerid, accountid)
values (1000223, 100397);
insert into REL5 (customerid, accountid)
values (1000324, 100067);
insert into REL5 (customerid, accountid)
values (1000033, 100392);
insert into REL5 (customerid, accountid)
values (1000202, 100065);
insert into REL5 (customerid, accountid)
values (1000245, 100317);
insert into REL5 (customerid, accountid)
values (1000157, 100184);
insert into REL5 (customerid, accountid)
values (1000354, 100190);
insert into REL5 (customerid, accountid)
values (1000065, 100215);
insert into REL5 (customerid, accountid)
values (1000094, 100241);
insert into REL5 (customerid, accountid)
values (1000013, 100352);
insert into REL5 (customerid, accountid)
values (1000372, 100294);
insert into REL5 (customerid, accountid)
values (1000161, 100345);
insert into REL5 (customerid, accountid)
values (1000096, 100309);
insert into REL5 (customerid, accountid)
values (1000181, 100297);
insert into REL5 (customerid, accountid)
values (1000100, 100216);
insert into REL5 (customerid, accountid)
values (1000036, 100100);
insert into REL5 (customerid, accountid)
values (1000319, 100329);
insert into REL5 (customerid, accountid)
values (1000267, 100050);
insert into REL5 (customerid, accountid)
values (1000031, 100017);
insert into REL5 (customerid, accountid)
values (1000227, 100079);
insert into REL5 (customerid, accountid)
values (1000044, 100043);
insert into REL5 (customerid, accountid)
values (1000209, 100364);
insert into REL5 (customerid, accountid)
values (1000316, 100273);
insert into REL5 (customerid, accountid)
values (1000334, 100105);
insert into REL5 (customerid, accountid)
values (1000056, 100170);
insert into REL5 (customerid, accountid)
values (1000222, 100176);
insert into REL5 (customerid, accountid)
values (1000107, 100024);
insert into REL5 (customerid, accountid)
values (1000363, 100286);
insert into REL5 (customerid, accountid)
values (1000000, 100025);
insert into REL5 (customerid, accountid)
values (1000149, 100174);
insert into REL5 (customerid, accountid)
values (1000286, 100280);
insert into REL5 (customerid, accountid)
values (1000347, 100336);
insert into REL5 (customerid, accountid)
values (1000231, 100225);
insert into REL5 (customerid, accountid)
values (1000189, 100298);
insert into REL5 (customerid, accountid)
values (1000164, 100374);
insert into REL5 (customerid, accountid)
values (1000369, 100338);
insert into REL5 (customerid, accountid)
values (1000342, 100013);
insert into REL5 (customerid, accountid)
values (1000306, 100291);
insert into REL5 (customerid, accountid)
values (1000397, 100271);
insert into REL5 (customerid, accountid)
values (1000045, 100224);
insert into REL5 (customerid, accountid)
values (1000193, 100038);
insert into REL5 (customerid, accountid)
values (1000024, 100293);
insert into REL5 (customerid, accountid)
values (1000052, 100264);
insert into REL5 (customerid, accountid)
values (1000364, 100205);
insert into REL5 (customerid, accountid)
values (1000356, 100372);
insert into REL5 (customerid, accountid)
values (1000042, 100162);
insert into REL5 (customerid, accountid)
values (1000113, 100209);
insert into REL5 (customerid, accountid)
values (1000385, 100115);
insert into REL5 (customerid, accountid)
values (1000175, 100395);
insert into REL5 (customerid, accountid)
values (1000281, 100238);
insert into REL5 (customerid, accountid)
values (1000102, 100251);
insert into REL5 (customerid, accountid)
values (1000358, 100118);
insert into REL5 (customerid, accountid)
values (1000353, 100049);
insert into REL5 (customerid, accountid)
values (1000154, 100321);
insert into REL5 (customerid, accountid)
values (1000080, 100202);
insert into REL5 (customerid, accountid)
values (1000088, 100212);
insert into REL5 (customerid, accountid)
values (1000124, 100179);
insert into REL5 (customerid, accountid)
values (1000326, 100110);
insert into REL5 (customerid, accountid)
values (1000297, 100072);
insert into REL5 (customerid, accountid)
values (1000247, 100160);
insert into REL5 (customerid, accountid)
values (1000208, 100150);
insert into REL5 (customerid, accountid)
values (1000264, 100175);
insert into REL5 (customerid, accountid)
values (1000200, 100324);
insert into REL5 (customerid, accountid)
values (1000144, 100112);
insert into REL5 (customerid, accountid)
values (1000007, 100156);
insert into REL5 (customerid, accountid)
values (1000219, 100335);
insert into REL5 (customerid, accountid)
values (1000317, 100057);
insert into REL5 (customerid, accountid)
values (1000194, 100361);
insert into REL5 (customerid, accountid)
values (1000142, 100159);
insert into REL5 (customerid, accountid)
values (1000224, 100127);
insert into REL5 (customerid, accountid)
values (1000017, 100155);
insert into REL5 (customerid, accountid)
values (1000061, 100381);
commit;
prompt 100 records committed...
insert into REL5 (customerid, accountid)
values (1000158, 100144);
insert into REL5 (customerid, accountid)
values (1000381, 100250);
insert into REL5 (customerid, accountid)
values (1000037, 100239);
insert into REL5 (customerid, accountid)
values (1000185, 100194);
insert into REL5 (customerid, accountid)
values (1000309, 100274);
insert into REL5 (customerid, accountid)
values (1000178, 100102);
insert into REL5 (customerid, accountid)
values (1000287, 100344);
insert into REL5 (customerid, accountid)
values (1000051, 100330);
insert into REL5 (customerid, accountid)
values (1000143, 100258);
insert into REL5 (customerid, accountid)
values (1000265, 100085);
insert into REL5 (customerid, accountid)
values (1000204, 100281);
insert into REL5 (customerid, accountid)
values (1000001, 100078);
insert into REL5 (customerid, accountid)
values (1000278, 100311);
insert into REL5 (customerid, accountid)
values (1000211, 100035);
insert into REL5 (customerid, accountid)
values (1000182, 100210);
insert into REL5 (customerid, accountid)
values (1000066, 100240);
insert into REL5 (customerid, accountid)
values (1000089, 100007);
insert into REL5 (customerid, accountid)
values (1000205, 100228);
insert into REL5 (customerid, accountid)
values (1000206, 100099);
insert into REL5 (customerid, accountid)
values (1000040, 100388);
insert into REL5 (customerid, accountid)
values (1000187, 100243);
insert into REL5 (customerid, accountid)
values (1000274, 100161);
insert into REL5 (customerid, accountid)
values (1000221, 100039);
insert into REL5 (customerid, accountid)
values (1000272, 100257);
insert into REL5 (customerid, accountid)
values (1000263, 100343);
insert into REL5 (customerid, accountid)
values (1000393, 100096);
insert into REL5 (customerid, accountid)
values (1000384, 100351);
insert into REL5 (customerid, accountid)
values (1000258, 100399);
insert into REL5 (customerid, accountid)
values (1000191, 100217);
insert into REL5 (customerid, accountid)
values (1000141, 100334);
insert into REL5 (customerid, accountid)
values (1000172, 100252);
insert into REL5 (customerid, accountid)
values (1000256, 100120);
insert into REL5 (customerid, accountid)
values (1000116, 100088);
insert into REL5 (customerid, accountid)
values (1000376, 100113);
insert into REL5 (customerid, accountid)
values (1000336, 100020);
insert into REL5 (customerid, accountid)
values (1000059, 100360);
insert into REL5 (customerid, accountid)
values (1000095, 100125);
insert into REL5 (customerid, accountid)
values (1000243, 100337);
insert into REL5 (customerid, accountid)
values (1000176, 100375);
insert into REL5 (customerid, accountid)
values (1000323, 100166);
insert into REL5 (customerid, accountid)
values (1000241, 100084);
insert into REL5 (customerid, accountid)
values (1000105, 100253);
insert into REL5 (customerid, accountid)
values (1000114, 100164);
insert into REL5 (customerid, accountid)
values (1000032, 100173);
insert into REL5 (customerid, accountid)
values (1000008, 100036);
insert into REL5 (customerid, accountid)
values (1000216, 100248);
insert into REL5 (customerid, accountid)
values (1000315, 100342);
insert into REL5 (customerid, accountid)
values (1000137, 100283);
insert into REL5 (customerid, accountid)
values (1000081, 100037);
insert into REL5 (customerid, accountid)
values (1000025, 100169);
insert into REL5 (customerid, accountid)
values (1000016, 100287);
insert into REL5 (customerid, accountid)
values (1000361, 100282);
insert into REL5 (customerid, accountid)
values (1000165, 100132);
insert into REL5 (customerid, accountid)
values (1000021, 100389);
insert into REL5 (customerid, accountid)
values (1000084, 100114);
insert into REL5 (customerid, accountid)
values (1000236, 100097);
insert into REL5 (customerid, accountid)
values (1000075, 100229);
insert into REL5 (customerid, accountid)
values (1000067, 100073);
insert into REL5 (customerid, accountid)
values (1000069, 100266);
insert into REL5 (customerid, accountid)
values (1000300, 100189);
insert into REL5 (customerid, accountid)
values (1000012, 100090);
insert into REL5 (customerid, accountid)
values (1000030, 100027);
insert into REL5 (customerid, accountid)
values (1000277, 100198);
insert into REL5 (customerid, accountid)
values (1000131, 100302);
insert into REL5 (customerid, accountid)
values (1000183, 100398);
insert into REL5 (customerid, accountid)
values (1000112, 100295);
insert into REL5 (customerid, accountid)
values (1000371, 100278);
insert into REL5 (customerid, accountid)
values (1000339, 100080);
insert into REL5 (customerid, accountid)
values (1000060, 100022);
insert into REL5 (customerid, accountid)
values (1000392, 100006);
insert into REL5 (customerid, accountid)
values (1000293, 100289);
insert into REL5 (customerid, accountid)
values (1000398, 100279);
insert into REL5 (customerid, accountid)
values (1000203, 100034);
insert into REL5 (customerid, accountid)
values (1000057, 100263);
insert into REL5 (customerid, accountid)
values (1000122, 100385);
insert into REL5 (customerid, accountid)
values (1000003, 100012);
insert into REL5 (customerid, accountid)
values (1000391, 100366);
insert into REL5 (customerid, accountid)
values (1000136, 100117);
insert into REL5 (customerid, accountid)
values (1000368, 100214);
insert into REL5 (customerid, accountid)
values (1000242, 100386);
insert into REL5 (customerid, accountid)
values (1000022, 100081);
insert into REL5 (customerid, accountid)
values (1000049, 100083);
insert into REL5 (customerid, accountid)
values (1000366, 100180);
insert into REL5 (customerid, accountid)
values (1000110, 100327);
insert into REL5 (customerid, accountid)
values (1000133, 100077);
insert into REL5 (customerid, accountid)
values (1000147, 100320);
insert into REL5 (customerid, accountid)
values (1000341, 100137);
insert into REL5 (customerid, accountid)
values (1000151, 100353);
insert into REL5 (customerid, accountid)
values (1000062, 100064);
insert into REL5 (customerid, accountid)
values (1000307, 100315);
insert into REL5 (customerid, accountid)
values (1000173, 100318);
insert into REL5 (customerid, accountid)
values (1000260, 100139);
insert into REL5 (customerid, accountid)
values (1000238, 100339);
insert into REL5 (customerid, accountid)
values (1000350, 100106);
insert into REL5 (customerid, accountid)
values (1000349, 100042);
insert into REL5 (customerid, accountid)
values (1000111, 100138);
insert into REL5 (customerid, accountid)
values (1000087, 100221);
insert into REL5 (customerid, accountid)
values (1000139, 100029);
insert into REL5 (customerid, accountid)
values (1000106, 100255);
insert into REL5 (customerid, accountid)
values (1000041, 100157);
commit;
prompt 200 records committed...
insert into REL5 (customerid, accountid)
values (1000329, 100086);
insert into REL5 (customerid, accountid)
values (1000146, 100063);
insert into REL5 (customerid, accountid)
values (1000382, 100095);
insert into REL5 (customerid, accountid)
values (1000192, 100168);
insert into REL5 (customerid, accountid)
values (1000053, 100396);
insert into REL5 (customerid, accountid)
values (1000225, 100062);
insert into REL5 (customerid, accountid)
values (1000284, 100373);
insert into REL5 (customerid, accountid)
values (1000301, 100382);
insert into REL5 (customerid, accountid)
values (1000026, 100093);
insert into REL5 (customerid, accountid)
values (1000055, 100124);
insert into REL5 (customerid, accountid)
values (1000279, 100178);
insert into REL5 (customerid, accountid)
values (1000199, 100384);
insert into REL5 (customerid, accountid)
values (1000195, 100003);
insert into REL5 (customerid, accountid)
values (1000288, 100092);
insert into REL5 (customerid, accountid)
values (1000103, 100296);
insert into REL5 (customerid, accountid)
values (1000014, 100262);
insert into REL5 (customerid, accountid)
values (1000218, 100135);
insert into REL5 (customerid, accountid)
values (1000396, 100098);
insert into REL5 (customerid, accountid)
values (1000362, 100068);
insert into REL5 (customerid, accountid)
values (1000322, 100054);
insert into REL5 (customerid, accountid)
values (1000210, 100141);
insert into REL5 (customerid, accountid)
values (1000086, 100233);
insert into REL5 (customerid, accountid)
values (1000093, 100272);
insert into REL5 (customerid, accountid)
values (1000386, 100004);
insert into REL5 (customerid, accountid)
values (1000006, 100014);
insert into REL5 (customerid, accountid)
values (1000255, 100094);
insert into REL5 (customerid, accountid)
values (1000215, 100346);
insert into REL5 (customerid, accountid)
values (1000201, 100070);
insert into REL5 (customerid, accountid)
values (1000282, 100052);
insert into REL5 (customerid, accountid)
values (1000078, 100305);
insert into REL5 (customerid, accountid)
values (1000228, 100186);
insert into REL5 (customerid, accountid)
values (1000239, 100371);
insert into REL5 (customerid, accountid)
values (1000074, 100129);
insert into REL5 (customerid, accountid)
values (1000280, 100153);
insert into REL5 (customerid, accountid)
values (1000251, 100059);
insert into REL5 (customerid, accountid)
values (1000377, 100308);
insert into REL5 (customerid, accountid)
values (1000010, 100312);
insert into REL5 (customerid, accountid)
values (1000289, 100053);
insert into REL5 (customerid, accountid)
values (1000104, 100301);
insert into REL5 (customerid, accountid)
values (1000234, 100393);
insert into REL5 (customerid, accountid)
values (1000076, 100123);
insert into REL5 (customerid, accountid)
values (1000073, 100276);
insert into REL5 (customerid, accountid)
values (1000064, 100306);
insert into REL5 (customerid, accountid)
values (1000399, 100304);
insert into REL5 (customerid, accountid)
values (1000229, 100322);
insert into REL5 (customerid, accountid)
values (1000290, 100074);
insert into REL5 (customerid, accountid)
values (1000304, 100199);
insert into REL5 (customerid, accountid)
values (1000246, 100213);
insert into REL5 (customerid, accountid)
values (1000171, 100181);
insert into REL5 (customerid, accountid)
values (1000168, 100140);
insert into REL5 (customerid, accountid)
values (1000050, 100133);
insert into REL5 (customerid, accountid)
values (1000117, 100010);
insert into REL5 (customerid, accountid)
values (1000140, 100362);
insert into REL5 (customerid, accountid)
values (1000237, 100069);
insert into REL5 (customerid, accountid)
values (1000166, 100383);
insert into REL5 (customerid, accountid)
values (1000160, 100349);
insert into REL5 (customerid, accountid)
values (1000101, 100300);
insert into REL5 (customerid, accountid)
values (1000370, 100350);
insert into REL5 (customerid, accountid)
values (1000082, 100288);
insert into REL5 (customerid, accountid)
values (1000235, 100066);
insert into REL5 (customerid, accountid)
values (1000249, 100001);
insert into REL5 (customerid, accountid)
values (1000197, 100284);
insert into REL5 (customerid, accountid)
values (1000292, 100107);
insert into REL5 (customerid, accountid)
values (1000196, 100363);
insert into REL5 (customerid, accountid)
values (1000005, 100151);
insert into REL5 (customerid, accountid)
values (1000331, 100185);
insert into REL5 (customerid, accountid)
values (1000296, 100370);
insert into REL5 (customerid, accountid)
values (1000333, 100201);
insert into REL5 (customerid, accountid)
values (1000019, 100391);
insert into REL5 (customerid, accountid)
values (1000214, 100196);
insert into REL5 (customerid, accountid)
values (1000207, 100016);
insert into REL5 (customerid, accountid)
values (1000184, 100211);
insert into REL5 (customerid, accountid)
values (1000167, 100051);
insert into REL5 (customerid, accountid)
values (1000098, 100206);
insert into REL5 (customerid, accountid)
values (1000360, 100365);
insert into REL5 (customerid, accountid)
values (1000314, 100108);
insert into REL5 (customerid, accountid)
values (1000015, 100104);
insert into REL5 (customerid, accountid)
values (1000152, 100325);
insert into REL5 (customerid, accountid)
values (1000028, 100197);
insert into REL5 (customerid, accountid)
values (1000380, 100130);
insert into REL5 (customerid, accountid)
values (1000092, 100076);
insert into REL5 (customerid, accountid)
values (1000038, 100303);
insert into REL5 (customerid, accountid)
values (1000240, 100033);
insert into REL5 (customerid, accountid)
values (1000312, 100245);
insert into REL5 (customerid, accountid)
values (1000109, 100091);
insert into REL5 (customerid, accountid)
values (1000156, 100136);
insert into REL5 (customerid, accountid)
values (1000126, 100359);
insert into REL5 (customerid, accountid)
values (1000269, 100394);
insert into REL5 (customerid, accountid)
values (1000170, 100116);
insert into REL5 (customerid, accountid)
values (1000121, 100332);
insert into REL5 (customerid, accountid)
values (1000048, 100032);
insert into REL5 (customerid, accountid)
values (1000174, 100357);
insert into REL5 (customerid, accountid)
values (1000310, 100218);
insert into REL5 (customerid, accountid)
values (1000220, 100355);
insert into REL5 (customerid, accountid)
values (1000302, 100246);
insert into REL5 (customerid, accountid)
values (1000320, 100111);
insert into REL5 (customerid, accountid)
values (1000299, 100220);
insert into REL5 (customerid, accountid)
values (1000047, 100208);
insert into REL5 (customerid, accountid)
values (1000345, 100165);
insert into REL5 (customerid, accountid)
values (1000344, 100203);
commit;
prompt 300 records committed...
insert into REL5 (customerid, accountid)
values (1000232, 100061);
insert into REL5 (customerid, accountid)
values (1000248, 100269);
insert into REL5 (customerid, accountid)
values (1000276, 100148);
insert into REL5 (customerid, accountid)
values (1000348, 100347);
insert into REL5 (customerid, accountid)
values (1000395, 100023);
insert into REL5 (customerid, accountid)
values (1000002, 100002);
insert into REL5 (customerid, accountid)
values (1000046, 100183);
insert into REL5 (customerid, accountid)
values (1000099, 100333);
insert into REL5 (customerid, accountid)
values (1000079, 100147);
insert into REL5 (customerid, accountid)
values (1000266, 100340);
insert into REL5 (customerid, accountid)
values (1000132, 100313);
insert into REL5 (customerid, accountid)
values (1000188, 100268);
insert into REL5 (customerid, accountid)
values (1000270, 100328);
insert into REL5 (customerid, accountid)
values (1000303, 100182);
insert into REL5 (customerid, accountid)
values (1000023, 100154);
insert into REL5 (customerid, accountid)
values (1000262, 100046);
insert into REL5 (customerid, accountid)
values (1000119, 100193);
insert into REL5 (customerid, accountid)
values (1000212, 100143);
insert into REL5 (customerid, accountid)
values (1000275, 100172);
insert into REL5 (customerid, accountid)
values (1000373, 100231);
insert into REL5 (customerid, accountid)
values (1000163, 100200);
insert into REL5 (customerid, accountid)
values (1000308, 100326);
insert into REL5 (customerid, accountid)
values (1000068, 100390);
insert into REL5 (customerid, accountid)
values (1000097, 100128);
insert into REL5 (customerid, accountid)
values (1000394, 100131);
insert into REL5 (customerid, accountid)
values (1000374, 100256);
insert into REL5 (customerid, accountid)
values (1000305, 100146);
insert into REL5 (customerid, accountid)
values (1000085, 100299);
insert into REL5 (customerid, accountid)
values (1000352, 100028);
insert into REL5 (customerid, accountid)
values (1000145, 100261);
insert into REL5 (customerid, accountid)
values (1000321, 100379);
insert into REL5 (customerid, accountid)
values (1000070, 100232);
insert into REL5 (customerid, accountid)
values (1000343, 100230);
insert into REL5 (customerid, accountid)
values (1000325, 100163);
insert into REL5 (customerid, accountid)
values (1000313, 100018);
insert into REL5 (customerid, accountid)
values (1000351, 100310);
insert into REL5 (customerid, accountid)
values (1000035, 100058);
insert into REL5 (customerid, accountid)
values (1000004, 100290);
insert into REL5 (customerid, accountid)
values (1000389, 100244);
insert into REL5 (customerid, accountid)
values (1000217, 100356);
insert into REL5 (customerid, accountid)
values (1000338, 100378);
insert into REL5 (customerid, accountid)
values (1000186, 100341);
insert into REL5 (customerid, accountid)
values (1000295, 100254);
insert into REL5 (customerid, accountid)
values (1000054, 100316);
insert into REL5 (customerid, accountid)
values (1000034, 100087);
insert into REL5 (customerid, accountid)
values (1000337, 100056);
insert into REL5 (customerid, accountid)
values (1000043, 100323);
insert into REL5 (customerid, accountid)
values (1000378, 100369);
insert into REL5 (customerid, accountid)
values (1000150, 100195);
insert into REL5 (customerid, accountid)
values (1000039, 100354);
insert into REL5 (customerid, accountid)
values (1000252, 100267);
insert into REL5 (customerid, accountid)
values (1000271, 100314);
insert into REL5 (customerid, accountid)
values (1000190, 100000);
insert into REL5 (customerid, accountid)
values (1000123, 100026);
insert into REL5 (customerid, accountid)
values (1000244, 100236);
insert into REL5 (customerid, accountid)
values (1000328, 100075);
insert into REL5 (customerid, accountid)
values (1000125, 100031);
insert into REL5 (customerid, accountid)
values (1000233, 100259);
insert into REL5 (customerid, accountid)
values (1000180, 100152);
insert into REL5 (customerid, accountid)
values (1000091, 100377);
insert into REL5 (customerid, accountid)
values (1000129, 100011);
insert into REL5 (customerid, accountid)
values (1000155, 100005);
insert into REL5 (customerid, accountid)
values (1000009, 100171);
insert into REL5 (customerid, accountid)
values (1000120, 100048);
insert into REL5 (customerid, accountid)
values (1000169, 100121);
insert into REL5 (customerid, accountid)
values (1000355, 100188);
insert into REL5 (customerid, accountid)
values (1000390, 100122);
insert into REL5 (customerid, accountid)
values (1000294, 100222);
insert into REL5 (customerid, accountid)
values (1000318, 100045);
insert into REL5 (customerid, accountid)
values (1000115, 100187);
insert into REL5 (customerid, accountid)
values (1000375, 100307);
insert into REL5 (customerid, accountid)
values (1000254, 100319);
insert into REL5 (customerid, accountid)
values (1000257, 100249);
insert into REL5 (customerid, accountid)
values (1000153, 100119);
insert into REL5 (customerid, accountid)
values (1000330, 100285);
insert into REL5 (customerid, accountid)
values (1000071, 100158);
insert into REL5 (customerid, accountid)
values (1000250, 100089);
insert into REL5 (customerid, accountid)
values (1000311, 100134);
insert into REL5 (customerid, accountid)
values (1000177, 100227);
insert into REL5 (customerid, accountid)
values (1000298, 100030);
insert into REL5 (customerid, accountid)
values (1000359, 100015);
insert into REL5 (customerid, accountid)
values (1000268, 100277);
insert into REL5 (customerid, accountid)
values (1000291, 100167);
insert into REL5 (customerid, accountid)
values (1000130, 100387);
insert into REL5 (customerid, accountid)
values (1000179, 100207);
insert into REL5 (customerid, accountid)
values (1000379, 100260);
insert into REL5 (customerid, accountid)
values (1000090, 100376);
insert into REL5 (customerid, accountid)
values (1000387, 100103);
insert into REL5 (customerid, accountid)
values (1000063, 100142);
insert into REL5 (customerid, accountid)
values (1000020, 100331);
insert into REL5 (customerid, accountid)
values (1000285, 100275);
insert into REL5 (customerid, accountid)
values (1000134, 100242);
insert into REL5 (customerid, accountid)
values (1000357, 100055);
insert into REL5 (customerid, accountid)
values (1000018, 100348);
insert into REL5 (customerid, accountid)
values (1000332, 100021);
insert into REL5 (customerid, accountid)
values (1000138, 100292);
insert into REL5 (customerid, accountid)
values (1000027, 100247);
insert into REL5 (customerid, accountid)
values (1000083, 100223);
insert into REL5 (customerid, accountid)
values (1000383, 100101);
insert into REL5 (customerid, accountid)
values (1000335, 100380);
commit;
prompt 400 records loaded
prompt Loading TRANSACTIONS...
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000000, 'Bill payment', 4040, to_date('29-05-2022 21:40:45', 'dd-mm-yyyy hh24:mi:ss'), 100000);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000001, 'Transfer', 2642, to_date('04-07-2009 13:32:52', 'dd-mm-yyyy hh24:mi:ss'), 100001);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000002, 'ATM', 7004, to_date('26-04-2013 01:36:25', 'dd-mm-yyyy hh24:mi:ss'), 100002);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000003, 'Transfer', 223, to_date('13-10-2014 17:14:33', 'dd-mm-yyyy hh24:mi:ss'), 100003);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000004, 'Bill payment', 3043, to_date('06-02-2020 03:58:00', 'dd-mm-yyyy hh24:mi:ss'), 100004);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000005, 'ATM', 2767, to_date('25-08-2022 15:41:36', 'dd-mm-yyyy hh24:mi:ss'), 100005);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000006, 'ATM', 5808, to_date('15-06-2016 07:35:53', 'dd-mm-yyyy hh24:mi:ss'), 100006);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000007, 'Bill payment', 8230, to_date('19-01-2016 23:47:00', 'dd-mm-yyyy hh24:mi:ss'), 100007);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000008, 'Transactions', 3782, to_date('16-09-2012 09:44:08', 'dd-mm-yyyy hh24:mi:ss'), 100008);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000009, 'Check', 8793, to_date('10-07-2002 15:49:47', 'dd-mm-yyyy hh24:mi:ss'), 100009);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000010, 'Transfer', 5314, to_date('14-05-2001 09:11:16', 'dd-mm-yyyy hh24:mi:ss'), 100010);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000011, 'Transactions', 4842, to_date('29-04-2008 20:04:51', 'dd-mm-yyyy hh24:mi:ss'), 100011);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000012, 'Bill payment', 7415, to_date('14-07-2002 17:17:18', 'dd-mm-yyyy hh24:mi:ss'), 100012);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000013, 'ATM', 837, to_date('07-03-2016 00:39:06', 'dd-mm-yyyy hh24:mi:ss'), 100013);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000014, 'Transactions', 6792, to_date('27-03-2009 04:28:43', 'dd-mm-yyyy hh24:mi:ss'), 100014);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000015, 'Transfer', 8016, to_date('18-10-2000 14:55:16', 'dd-mm-yyyy hh24:mi:ss'), 100015);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000016, 'Transfer', 1477, to_date('26-01-2007 05:39:39', 'dd-mm-yyyy hh24:mi:ss'), 100016);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000017, 'Transfer', 8264, to_date('27-03-2013 13:12:11', 'dd-mm-yyyy hh24:mi:ss'), 100017);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000018, 'Transfer', 2256, to_date('23-06-2012 20:21:19', 'dd-mm-yyyy hh24:mi:ss'), 100018);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000019, 'Transactions', 9886, to_date('08-01-2015 20:46:14', 'dd-mm-yyyy hh24:mi:ss'), 100019);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000020, 'Bill payment', 8242, to_date('19-06-2009 01:50:46', 'dd-mm-yyyy hh24:mi:ss'), 100020);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000021, 'Transfer', 5593, to_date('04-10-2010 23:52:41', 'dd-mm-yyyy hh24:mi:ss'), 100021);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000022, 'Transfer', 3046, to_date('18-11-2009 04:54:10', 'dd-mm-yyyy hh24:mi:ss'), 100022);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000023, 'Transactions', 9491, to_date('07-08-2008 00:30:41', 'dd-mm-yyyy hh24:mi:ss'), 100023);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000024, 'Bill payment', 5402, to_date('04-06-2003 07:54:31', 'dd-mm-yyyy hh24:mi:ss'), 100024);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000025, 'Transactions', 961, to_date('07-07-2008 12:32:24', 'dd-mm-yyyy hh24:mi:ss'), 100025);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000026, 'ATM', 6840, to_date('19-07-2010 18:36:59', 'dd-mm-yyyy hh24:mi:ss'), 100026);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000027, 'Check', 2397, to_date('19-04-2016 20:50:57', 'dd-mm-yyyy hh24:mi:ss'), 100027);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000028, 'Transactions', 9077, to_date('28-01-2019 14:38:01', 'dd-mm-yyyy hh24:mi:ss'), 100028);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000029, 'Transfer', 4513, to_date('19-05-2018 14:10:29', 'dd-mm-yyyy hh24:mi:ss'), 100029);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000030, 'Bill payment', 4350, to_date('20-06-2004 09:43:35', 'dd-mm-yyyy hh24:mi:ss'), 100030);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000031, 'Check', 9942, to_date('16-07-2015 15:38:38', 'dd-mm-yyyy hh24:mi:ss'), 100031);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000032, 'Transfer', 6701, to_date('20-01-2012 10:38:07', 'dd-mm-yyyy hh24:mi:ss'), 100032);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000033, 'Transactions', 874, to_date('24-04-2003 20:58:12', 'dd-mm-yyyy hh24:mi:ss'), 100033);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000034, 'ATM', 9443, to_date('09-11-2005 06:03:37', 'dd-mm-yyyy hh24:mi:ss'), 100034);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000035, 'Check', 3954, to_date('25-04-2016 04:22:11', 'dd-mm-yyyy hh24:mi:ss'), 100035);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000036, 'ATM', 4356, to_date('16-02-2016 18:52:24', 'dd-mm-yyyy hh24:mi:ss'), 100036);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000037, 'Transactions', 8106, to_date('27-03-2001 20:09:42', 'dd-mm-yyyy hh24:mi:ss'), 100037);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000038, 'Transactions', 2360, to_date('27-12-2011 22:32:34', 'dd-mm-yyyy hh24:mi:ss'), 100038);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000039, 'Transfer', 2391, to_date('06-02-2008 17:54:55', 'dd-mm-yyyy hh24:mi:ss'), 100039);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000040, 'Transfer', 1551, to_date('26-01-2001 07:39:13', 'dd-mm-yyyy hh24:mi:ss'), 100040);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000041, 'Bill payment', 5744, to_date('05-01-2007 18:01:05', 'dd-mm-yyyy hh24:mi:ss'), 100041);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000042, 'Transfer', 7113, to_date('21-06-2008 04:25:26', 'dd-mm-yyyy hh24:mi:ss'), 100042);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000043, 'Bill payment', 327, to_date('25-12-2007 09:55:55', 'dd-mm-yyyy hh24:mi:ss'), 100043);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000044, 'Transfer', 3832, to_date('14-11-2001 14:22:45', 'dd-mm-yyyy hh24:mi:ss'), 100044);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000045, 'Transactions', 3853, to_date('04-08-2016 08:41:16', 'dd-mm-yyyy hh24:mi:ss'), 100045);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000046, 'Bill payment', 3034, to_date('06-02-2018 01:12:55', 'dd-mm-yyyy hh24:mi:ss'), 100046);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000047, 'Bill payment', 4722, to_date('14-12-2009 02:49:52', 'dd-mm-yyyy hh24:mi:ss'), 100047);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000048, 'Bill payment', 4346, to_date('21-10-2021 03:31:42', 'dd-mm-yyyy hh24:mi:ss'), 100048);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000049, 'ATM', 9539, to_date('15-06-2015 15:39:11', 'dd-mm-yyyy hh24:mi:ss'), 100049);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000050, 'Transactions', 2739, to_date('10-11-2022 17:08:20', 'dd-mm-yyyy hh24:mi:ss'), 100050);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000051, 'Check', 2234, to_date('24-06-2016 09:04:19', 'dd-mm-yyyy hh24:mi:ss'), 100051);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000052, 'Bill payment', 2530, to_date('11-01-2009 16:47:54', 'dd-mm-yyyy hh24:mi:ss'), 100052);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000053, 'Transactions', 4091, to_date('22-06-2011 13:41:44', 'dd-mm-yyyy hh24:mi:ss'), 100053);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000054, 'Bill payment', 6122, to_date('03-10-2015 22:44:17', 'dd-mm-yyyy hh24:mi:ss'), 100054);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000055, 'Check', 7042, to_date('01-11-2002 05:35:16', 'dd-mm-yyyy hh24:mi:ss'), 100055);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000056, 'Transfer', 4294, to_date('09-01-2018 02:05:16', 'dd-mm-yyyy hh24:mi:ss'), 100056);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000057, 'Transactions', 6347, to_date('12-11-2000 20:13:24', 'dd-mm-yyyy hh24:mi:ss'), 100057);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000058, 'Transactions', 6697, to_date('01-02-2008 14:05:29', 'dd-mm-yyyy hh24:mi:ss'), 100058);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000059, 'Transfer', 9415, to_date('05-03-2016 18:36:01', 'dd-mm-yyyy hh24:mi:ss'), 100059);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000060, 'Bill payment', 4520, to_date('12-01-2018 05:52:06', 'dd-mm-yyyy hh24:mi:ss'), 100060);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000061, 'Bill payment', 8472, to_date('03-12-2020 17:19:28', 'dd-mm-yyyy hh24:mi:ss'), 100061);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000062, 'Bill payment', 4091, to_date('04-08-2008 15:25:37', 'dd-mm-yyyy hh24:mi:ss'), 100062);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000063, 'Transfer', 5466, to_date('06-10-2001 20:22:15', 'dd-mm-yyyy hh24:mi:ss'), 100063);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000064, 'Bill payment', 7123, to_date('01-11-2005 12:47:59', 'dd-mm-yyyy hh24:mi:ss'), 100064);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000065, 'Bill payment', 4823, to_date('23-03-2007 15:14:53', 'dd-mm-yyyy hh24:mi:ss'), 100065);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000066, 'Bill payment', 2611, to_date('24-08-2001 00:27:02', 'dd-mm-yyyy hh24:mi:ss'), 100066);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000067, 'Transactions', 9998, to_date('30-08-2018 12:09:42', 'dd-mm-yyyy hh24:mi:ss'), 100067);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000068, 'Transfer', 4597, to_date('01-06-2017 20:48:48', 'dd-mm-yyyy hh24:mi:ss'), 100068);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000069, 'ATM', 8420, to_date('23-03-2021 03:01:17', 'dd-mm-yyyy hh24:mi:ss'), 100069);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000070, 'Transactions', 1868, to_date('24-11-2008 08:50:11', 'dd-mm-yyyy hh24:mi:ss'), 100070);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000071, 'ATM', 8582, to_date('21-02-2008 13:18:52', 'dd-mm-yyyy hh24:mi:ss'), 100071);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000072, 'Bill payment', 8017, to_date('01-04-2020 07:13:16', 'dd-mm-yyyy hh24:mi:ss'), 100072);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000073, 'Transfer', 5500, to_date('13-12-2020 00:46:45', 'dd-mm-yyyy hh24:mi:ss'), 100073);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000074, 'Transactions', 3100, to_date('03-01-2000 06:42:10', 'dd-mm-yyyy hh24:mi:ss'), 100074);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000075, 'Transactions', 157, to_date('03-05-2011 16:13:31', 'dd-mm-yyyy hh24:mi:ss'), 100075);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000076, 'Check', 257, to_date('09-05-2004 08:33:57', 'dd-mm-yyyy hh24:mi:ss'), 100076);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000077, 'Transfer', 2237, to_date('25-12-2004 06:07:05', 'dd-mm-yyyy hh24:mi:ss'), 100077);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000078, 'ATM', 9491, to_date('21-07-2018 03:20:34', 'dd-mm-yyyy hh24:mi:ss'), 100078);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000079, 'Bill payment', 4353, to_date('25-03-2002 11:26:13', 'dd-mm-yyyy hh24:mi:ss'), 100079);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000080, 'Transfer', 6680, to_date('21-12-2000 04:11:35', 'dd-mm-yyyy hh24:mi:ss'), 100080);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000081, 'Check', 6765, to_date('30-05-2010 11:45:18', 'dd-mm-yyyy hh24:mi:ss'), 100081);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000082, 'Bill payment', 6358, to_date('13-10-2009 05:55:16', 'dd-mm-yyyy hh24:mi:ss'), 100082);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000083, 'Transactions', 4433, to_date('09-02-2005 07:25:55', 'dd-mm-yyyy hh24:mi:ss'), 100083);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000084, 'Bill payment', 3369, to_date('09-11-2006 03:52:14', 'dd-mm-yyyy hh24:mi:ss'), 100084);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000085, 'Transfer', 5302, to_date('23-03-2020 08:27:52', 'dd-mm-yyyy hh24:mi:ss'), 100085);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000086, 'Transactions', 8162, to_date('16-05-2018 21:13:54', 'dd-mm-yyyy hh24:mi:ss'), 100086);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000087, 'Transfer', 4137, to_date('29-01-2007 12:43:23', 'dd-mm-yyyy hh24:mi:ss'), 100087);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000088, 'Check', 7011, to_date('06-03-2004 17:11:35', 'dd-mm-yyyy hh24:mi:ss'), 100088);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000089, 'ATM', 5928, to_date('10-12-2013 20:09:07', 'dd-mm-yyyy hh24:mi:ss'), 100089);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000090, 'Check', 2007, to_date('29-06-2009 22:58:12', 'dd-mm-yyyy hh24:mi:ss'), 100090);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000091, 'Transfer', 426, to_date('01-03-2011 00:44:29', 'dd-mm-yyyy hh24:mi:ss'), 100091);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000092, 'Bill payment', 2065, to_date('28-02-2022 13:29:10', 'dd-mm-yyyy hh24:mi:ss'), 100092);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000093, 'Transactions', 5578, to_date('31-07-2020 13:58:11', 'dd-mm-yyyy hh24:mi:ss'), 100093);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000094, 'Transactions', 1169, to_date('12-11-2009 14:17:10', 'dd-mm-yyyy hh24:mi:ss'), 100094);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000095, 'Transactions', 9637, to_date('27-11-2006 20:27:11', 'dd-mm-yyyy hh24:mi:ss'), 100095);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000096, 'Transactions', 6182, to_date('28-03-2014 09:15:58', 'dd-mm-yyyy hh24:mi:ss'), 100096);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000097, 'Transfer', 8485, to_date('12-02-2010 04:52:29', 'dd-mm-yyyy hh24:mi:ss'), 100097);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000098, 'Bill payment', 9363, to_date('24-08-2003 22:05:37', 'dd-mm-yyyy hh24:mi:ss'), 100098);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000099, 'Bill payment', 7607, to_date('16-04-2019 11:11:34', 'dd-mm-yyyy hh24:mi:ss'), 100099);
commit;
prompt 100 records committed...
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000100, 'Transfer', 8600, to_date('26-10-2014 11:42:33', 'dd-mm-yyyy hh24:mi:ss'), 100100);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000101, 'Transactions', 8847, to_date('01-01-2004 10:03:07', 'dd-mm-yyyy hh24:mi:ss'), 100101);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000102, 'ATM', 1975, to_date('03-02-2018 16:08:44', 'dd-mm-yyyy hh24:mi:ss'), 100102);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000103, 'Bill payment', 4359, to_date('21-01-2019 10:44:58', 'dd-mm-yyyy hh24:mi:ss'), 100103);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000104, 'Check', 2166, to_date('28-05-2013 16:25:56', 'dd-mm-yyyy hh24:mi:ss'), 100104);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000105, 'Bill payment', 4883, to_date('12-11-2022 23:50:30', 'dd-mm-yyyy hh24:mi:ss'), 100105);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000106, 'Transfer', 1683, to_date('26-10-2004 01:17:50', 'dd-mm-yyyy hh24:mi:ss'), 100106);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000107, 'Transactions', 3957, to_date('21-05-2013 01:21:52', 'dd-mm-yyyy hh24:mi:ss'), 100107);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000108, 'Check', 9561, to_date('15-06-2016 19:48:50', 'dd-mm-yyyy hh24:mi:ss'), 100108);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000109, 'Transfer', 5001, to_date('24-04-2011 02:04:50', 'dd-mm-yyyy hh24:mi:ss'), 100109);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000110, 'Transfer', 1126, to_date('23-01-2005 17:01:29', 'dd-mm-yyyy hh24:mi:ss'), 100110);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000111, 'ATM', 6377, to_date('30-12-2018 06:16:51', 'dd-mm-yyyy hh24:mi:ss'), 100111);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000112, 'Transfer', 1126, to_date('12-04-2011 07:58:42', 'dd-mm-yyyy hh24:mi:ss'), 100112);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000113, 'Bill payment', 8108, to_date('13-11-2017 20:00:46', 'dd-mm-yyyy hh24:mi:ss'), 100113);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000114, 'Check', 2833, to_date('15-04-2021 02:01:56', 'dd-mm-yyyy hh24:mi:ss'), 100114);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000115, 'Bill payment', 3749, to_date('21-11-2001 09:44:19', 'dd-mm-yyyy hh24:mi:ss'), 100115);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000116, 'Transactions', 6110, to_date('25-02-2018 01:47:20', 'dd-mm-yyyy hh24:mi:ss'), 100116);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000117, 'ATM', 9692, to_date('20-12-2003 12:39:31', 'dd-mm-yyyy hh24:mi:ss'), 100117);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000118, 'Transfer', 3300, to_date('04-11-2008 09:05:38', 'dd-mm-yyyy hh24:mi:ss'), 100118);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000119, 'ATM', 1061, to_date('06-01-2010 05:59:34', 'dd-mm-yyyy hh24:mi:ss'), 100119);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000120, 'Check', 7127, to_date('02-03-2021 11:24:00', 'dd-mm-yyyy hh24:mi:ss'), 100120);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000121, 'Bill payment', 5473, to_date('20-02-2011 23:25:15', 'dd-mm-yyyy hh24:mi:ss'), 100121);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000122, 'Check', 4737, to_date('29-10-2006 12:54:11', 'dd-mm-yyyy hh24:mi:ss'), 100122);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000123, 'Check', 281, to_date('31-07-2016 10:17:59', 'dd-mm-yyyy hh24:mi:ss'), 100123);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000124, 'Check', 5595, to_date('22-10-2018 16:59:28', 'dd-mm-yyyy hh24:mi:ss'), 100124);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000125, 'Check', 3427, to_date('06-10-2018 23:07:21', 'dd-mm-yyyy hh24:mi:ss'), 100125);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000126, 'ATM', 6786, to_date('18-01-2015 09:46:03', 'dd-mm-yyyy hh24:mi:ss'), 100126);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000127, 'Transactions', 8198, to_date('28-06-2011 16:29:14', 'dd-mm-yyyy hh24:mi:ss'), 100127);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000128, 'Bill payment', 5803, to_date('26-01-2008 05:39:14', 'dd-mm-yyyy hh24:mi:ss'), 100128);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000129, 'ATM', 5379, to_date('27-08-2003 04:47:47', 'dd-mm-yyyy hh24:mi:ss'), 100129);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000130, 'Transactions', 5815, to_date('18-08-2007 03:25:04', 'dd-mm-yyyy hh24:mi:ss'), 100130);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000131, 'Bill payment', 9489, to_date('04-03-2019 20:16:30', 'dd-mm-yyyy hh24:mi:ss'), 100131);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000132, 'Bill payment', 5309, to_date('25-12-2008 16:10:12', 'dd-mm-yyyy hh24:mi:ss'), 100132);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000133, 'Check', 1648, to_date('24-08-2013 19:29:18', 'dd-mm-yyyy hh24:mi:ss'), 100133);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000134, 'ATM', 2748, to_date('14-04-2021 22:11:12', 'dd-mm-yyyy hh24:mi:ss'), 100134);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000135, 'Transfer', 8904, to_date('18-05-2014 20:37:31', 'dd-mm-yyyy hh24:mi:ss'), 100135);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000136, 'ATM', 9304, to_date('12-04-2010 11:35:48', 'dd-mm-yyyy hh24:mi:ss'), 100136);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000137, 'Bill payment', 3172, to_date('08-08-2014 07:13:06', 'dd-mm-yyyy hh24:mi:ss'), 100137);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000138, 'Transactions', 1821, to_date('30-06-2018 08:47:47', 'dd-mm-yyyy hh24:mi:ss'), 100138);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000139, 'Transactions', 7219, to_date('24-04-2000 23:41:04', 'dd-mm-yyyy hh24:mi:ss'), 100139);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000140, 'Transactions', 727, to_date('15-07-2008 10:32:42', 'dd-mm-yyyy hh24:mi:ss'), 100140);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000141, 'Transactions', 8609, to_date('09-06-2000 14:15:23', 'dd-mm-yyyy hh24:mi:ss'), 100141);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000142, 'Transactions', 8966, to_date('28-01-2003 19:00:14', 'dd-mm-yyyy hh24:mi:ss'), 100142);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000143, 'Bill payment', 1217, to_date('17-06-2015 01:10:17', 'dd-mm-yyyy hh24:mi:ss'), 100143);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000144, 'Bill payment', 9607, to_date('24-10-2008 16:09:52', 'dd-mm-yyyy hh24:mi:ss'), 100144);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000145, 'Transactions', 5777, to_date('14-10-2007 01:00:08', 'dd-mm-yyyy hh24:mi:ss'), 100145);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000146, 'Transactions', 2871, to_date('19-01-2013 10:28:49', 'dd-mm-yyyy hh24:mi:ss'), 100146);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000147, 'ATM', 2051, to_date('25-04-2017 15:16:31', 'dd-mm-yyyy hh24:mi:ss'), 100147);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000148, 'Transfer', 2724, to_date('21-07-2001 02:37:42', 'dd-mm-yyyy hh24:mi:ss'), 100148);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000149, 'Bill payment', 8782, to_date('16-09-2018 23:22:48', 'dd-mm-yyyy hh24:mi:ss'), 100149);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000150, 'Transactions', 2044, to_date('03-12-2016 02:26:45', 'dd-mm-yyyy hh24:mi:ss'), 100150);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000151, 'Transfer', 5126, to_date('28-05-2012 20:39:58', 'dd-mm-yyyy hh24:mi:ss'), 100151);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000152, 'Bill payment', 9716, to_date('04-04-2021 04:17:43', 'dd-mm-yyyy hh24:mi:ss'), 100152);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000153, 'Transfer', 4400, to_date('22-06-2010 10:59:48', 'dd-mm-yyyy hh24:mi:ss'), 100153);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000154, 'Transfer', 9603, to_date('14-11-2012 21:29:32', 'dd-mm-yyyy hh24:mi:ss'), 100154);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000155, 'Check', 1429, to_date('18-08-2010 04:42:00', 'dd-mm-yyyy hh24:mi:ss'), 100155);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000156, 'ATM', 2386, to_date('07-10-2022 09:10:28', 'dd-mm-yyyy hh24:mi:ss'), 100156);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000157, 'Transactions', 4031, to_date('22-02-2010 01:54:47', 'dd-mm-yyyy hh24:mi:ss'), 100157);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000158, 'ATM', 3258, to_date('20-07-2007 03:14:13', 'dd-mm-yyyy hh24:mi:ss'), 100158);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000159, 'Transactions', 1695, to_date('22-06-2021 22:05:10', 'dd-mm-yyyy hh24:mi:ss'), 100159);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000160, 'Transactions', 8777, to_date('10-07-2003 04:38:17', 'dd-mm-yyyy hh24:mi:ss'), 100160);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000161, 'Transfer', 9319, to_date('12-06-2012 04:42:55', 'dd-mm-yyyy hh24:mi:ss'), 100161);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000162, 'Transfer', 7109, to_date('23-07-2009 21:38:22', 'dd-mm-yyyy hh24:mi:ss'), 100162);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000163, 'Bill payment', 2649, to_date('11-06-2002 11:59:02', 'dd-mm-yyyy hh24:mi:ss'), 100163);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000164, 'Transfer', 7922, to_date('16-12-2001 21:34:08', 'dd-mm-yyyy hh24:mi:ss'), 100164);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000165, 'Check', 6972, to_date('09-05-2003 15:12:41', 'dd-mm-yyyy hh24:mi:ss'), 100165);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000166, 'Transactions', 5136, to_date('18-05-2010 02:54:22', 'dd-mm-yyyy hh24:mi:ss'), 100166);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000167, 'Check', 4203, to_date('22-07-2021 19:34:30', 'dd-mm-yyyy hh24:mi:ss'), 100167);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000168, 'Bill payment', 3385, to_date('22-06-2009 03:13:52', 'dd-mm-yyyy hh24:mi:ss'), 100168);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000169, 'Transactions', 5646, to_date('13-10-2016 10:49:43', 'dd-mm-yyyy hh24:mi:ss'), 100169);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000170, 'Check', 2713, to_date('16-03-2002 09:25:23', 'dd-mm-yyyy hh24:mi:ss'), 100170);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000171, 'Transactions', 7938, to_date('10-09-2003 12:20:03', 'dd-mm-yyyy hh24:mi:ss'), 100171);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000172, 'Check', 3309, to_date('29-05-2004 02:54:54', 'dd-mm-yyyy hh24:mi:ss'), 100172);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000173, 'ATM', 8190, to_date('03-12-2011 04:05:52', 'dd-mm-yyyy hh24:mi:ss'), 100173);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000174, 'Transactions', 3599, to_date('23-06-2002 07:09:51', 'dd-mm-yyyy hh24:mi:ss'), 100174);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000175, 'Transfer', 2393, to_date('26-12-2006 03:33:52', 'dd-mm-yyyy hh24:mi:ss'), 100175);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000176, 'Transactions', 2962, to_date('04-12-2018 00:25:23', 'dd-mm-yyyy hh24:mi:ss'), 100176);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000177, 'Bill payment', 2989, to_date('17-11-2019 23:23:00', 'dd-mm-yyyy hh24:mi:ss'), 100177);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000178, 'Transactions', 3255, to_date('25-11-2010 01:34:29', 'dd-mm-yyyy hh24:mi:ss'), 100178);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000179, 'Bill payment', 6524, to_date('11-05-2020 19:37:09', 'dd-mm-yyyy hh24:mi:ss'), 100179);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000180, 'Transfer', 7870, to_date('23-06-2014 22:30:09', 'dd-mm-yyyy hh24:mi:ss'), 100180);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000181, 'Transfer', 432, to_date('21-12-2008 12:12:48', 'dd-mm-yyyy hh24:mi:ss'), 100181);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000182, 'ATM', 3679, to_date('24-11-2000 13:09:13', 'dd-mm-yyyy hh24:mi:ss'), 100182);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000183, 'Transfer', 4800, to_date('30-04-2006 09:56:57', 'dd-mm-yyyy hh24:mi:ss'), 100183);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000184, 'Check', 3393, to_date('15-02-2014 15:47:36', 'dd-mm-yyyy hh24:mi:ss'), 100184);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000185, 'Check', 9751, to_date('02-07-2020 00:54:37', 'dd-mm-yyyy hh24:mi:ss'), 100185);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000186, 'ATM', 7121, to_date('21-10-2006 00:58:30', 'dd-mm-yyyy hh24:mi:ss'), 100186);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000187, 'ATM', 3511, to_date('02-10-2008 01:20:39', 'dd-mm-yyyy hh24:mi:ss'), 100187);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000188, 'Transfer', 6196, to_date('16-10-2000 21:24:05', 'dd-mm-yyyy hh24:mi:ss'), 100188);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000189, 'Check', 6066, to_date('02-11-2005 01:25:24', 'dd-mm-yyyy hh24:mi:ss'), 100189);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000190, 'Bill payment', 697, to_date('08-11-2012 18:42:41', 'dd-mm-yyyy hh24:mi:ss'), 100190);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000191, 'Bill payment', 8840, to_date('19-10-2013 16:14:05', 'dd-mm-yyyy hh24:mi:ss'), 100191);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000192, 'Transfer', 6386, to_date('19-01-2004 11:56:01', 'dd-mm-yyyy hh24:mi:ss'), 100192);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000193, 'Transactions', 6477, to_date('21-01-2005 06:26:09', 'dd-mm-yyyy hh24:mi:ss'), 100193);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000194, 'ATM', 8661, to_date('04-10-2002 11:40:05', 'dd-mm-yyyy hh24:mi:ss'), 100194);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000195, 'Transactions', 4156, to_date('01-07-2010 08:06:50', 'dd-mm-yyyy hh24:mi:ss'), 100195);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000196, 'Bill payment', 7395, to_date('17-10-2003 05:28:04', 'dd-mm-yyyy hh24:mi:ss'), 100196);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000197, 'Transactions', 1716, to_date('14-06-2013 21:54:36', 'dd-mm-yyyy hh24:mi:ss'), 100197);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000198, 'Transfer', 1824, to_date('06-01-2014 20:44:47', 'dd-mm-yyyy hh24:mi:ss'), 100198);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000199, 'Bill payment', 9673, to_date('15-04-2018 19:23:44', 'dd-mm-yyyy hh24:mi:ss'), 100199);
commit;
prompt 200 records committed...
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000200, 'Bill payment', 3405, to_date('27-07-2001 11:49:52', 'dd-mm-yyyy hh24:mi:ss'), 100200);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000201, 'Check', 3878, to_date('04-04-2015 19:54:12', 'dd-mm-yyyy hh24:mi:ss'), 100201);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000202, 'Bill payment', 9515, to_date('03-01-2021 03:36:33', 'dd-mm-yyyy hh24:mi:ss'), 100202);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000203, 'Transactions', 3390, to_date('17-12-2005 05:32:36', 'dd-mm-yyyy hh24:mi:ss'), 100203);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000204, 'ATM', 8120, to_date('20-08-2007 03:28:39', 'dd-mm-yyyy hh24:mi:ss'), 100204);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000205, 'Transfer', 5113, to_date('26-05-2019 09:36:36', 'dd-mm-yyyy hh24:mi:ss'), 100205);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000206, 'Transactions', 1605, to_date('24-05-2019 00:13:51', 'dd-mm-yyyy hh24:mi:ss'), 100206);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000207, 'Bill payment', 3830, to_date('08-03-2017 04:43:06', 'dd-mm-yyyy hh24:mi:ss'), 100207);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000208, 'ATM', 5471, to_date('10-05-2007 10:22:48', 'dd-mm-yyyy hh24:mi:ss'), 100208);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000209, 'Transactions', 4674, to_date('09-10-2000 23:04:01', 'dd-mm-yyyy hh24:mi:ss'), 100209);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000210, 'Bill payment', 2132, to_date('29-12-2007 00:19:10', 'dd-mm-yyyy hh24:mi:ss'), 100210);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000211, 'ATM', 4536, to_date('31-03-2014 07:40:36', 'dd-mm-yyyy hh24:mi:ss'), 100211);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000212, 'Transfer', 4686, to_date('12-02-2019 14:07:36', 'dd-mm-yyyy hh24:mi:ss'), 100212);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000213, 'Check', 6382, to_date('12-06-2008 16:23:25', 'dd-mm-yyyy hh24:mi:ss'), 100213);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000214, 'ATM', 9399, to_date('21-10-2004 08:02:07', 'dd-mm-yyyy hh24:mi:ss'), 100214);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000215, 'Transactions', 9318, to_date('24-08-2017 20:25:52', 'dd-mm-yyyy hh24:mi:ss'), 100215);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000216, 'ATM', 6482, to_date('13-12-2009 05:37:31', 'dd-mm-yyyy hh24:mi:ss'), 100216);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000217, 'Check', 9521, to_date('12-05-2016 22:36:52', 'dd-mm-yyyy hh24:mi:ss'), 100217);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000218, 'ATM', 4384, to_date('13-03-2011 13:19:41', 'dd-mm-yyyy hh24:mi:ss'), 100218);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000219, 'Check', 9754, to_date('02-10-2002 18:58:13', 'dd-mm-yyyy hh24:mi:ss'), 100219);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000220, 'ATM', 6266, to_date('10-03-2009 16:38:05', 'dd-mm-yyyy hh24:mi:ss'), 100220);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000221, 'Transfer', 3672, to_date('26-03-2000 21:37:02', 'dd-mm-yyyy hh24:mi:ss'), 100221);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000222, 'Bill payment', 8579, to_date('11-05-2012 11:48:34', 'dd-mm-yyyy hh24:mi:ss'), 100222);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000223, 'Transactions', 3614, to_date('10-07-2013 15:09:53', 'dd-mm-yyyy hh24:mi:ss'), 100223);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000224, 'Check', 6747, to_date('03-11-2021 17:15:52', 'dd-mm-yyyy hh24:mi:ss'), 100224);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000225, 'ATM', 4271, to_date('17-12-2004 21:05:28', 'dd-mm-yyyy hh24:mi:ss'), 100225);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000226, 'Bill payment', 2915, to_date('10-03-2014 20:26:53', 'dd-mm-yyyy hh24:mi:ss'), 100226);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000227, 'ATM', 4038, to_date('14-03-2008 08:22:57', 'dd-mm-yyyy hh24:mi:ss'), 100227);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000228, 'Transfer', 794, to_date('18-05-2002 02:00:27', 'dd-mm-yyyy hh24:mi:ss'), 100228);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000229, 'Transactions', 8945, to_date('29-06-2016 03:54:38', 'dd-mm-yyyy hh24:mi:ss'), 100229);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000230, 'Transfer', 4833, to_date('10-04-2002 22:57:36', 'dd-mm-yyyy hh24:mi:ss'), 100230);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000231, 'ATM', 6656, to_date('29-06-2020 12:15:15', 'dd-mm-yyyy hh24:mi:ss'), 100231);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000232, 'ATM', 6613, to_date('20-02-2012 19:17:12', 'dd-mm-yyyy hh24:mi:ss'), 100232);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000233, 'ATM', 9453, to_date('28-11-2008 05:11:02', 'dd-mm-yyyy hh24:mi:ss'), 100233);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000234, 'Check', 2484, to_date('29-04-2003 01:09:45', 'dd-mm-yyyy hh24:mi:ss'), 100234);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000235, 'Check', 5963, to_date('10-02-2022 01:58:48', 'dd-mm-yyyy hh24:mi:ss'), 100235);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000236, 'ATM', 836, to_date('16-05-2005 21:49:24', 'dd-mm-yyyy hh24:mi:ss'), 100236);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000237, 'Check', 8551, to_date('16-04-2020 13:23:03', 'dd-mm-yyyy hh24:mi:ss'), 100237);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000238, 'Bill payment', 7117, to_date('06-07-2000 14:40:03', 'dd-mm-yyyy hh24:mi:ss'), 100238);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000239, 'Check', 2965, to_date('25-06-2021 02:10:24', 'dd-mm-yyyy hh24:mi:ss'), 100239);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000240, 'Bill payment', 326, to_date('10-04-2021 23:58:38', 'dd-mm-yyyy hh24:mi:ss'), 100240);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000241, 'ATM', 1823, to_date('18-10-2014 01:17:40', 'dd-mm-yyyy hh24:mi:ss'), 100241);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000242, 'Transfer', 2438, to_date('01-01-2000 09:01:15', 'dd-mm-yyyy hh24:mi:ss'), 100242);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000243, 'ATM', 7583, to_date('29-11-2019 11:31:41', 'dd-mm-yyyy hh24:mi:ss'), 100243);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000244, 'ATM', 1012, to_date('14-04-2014 17:48:50', 'dd-mm-yyyy hh24:mi:ss'), 100244);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000245, 'Check', 4422, to_date('30-08-2017 02:44:48', 'dd-mm-yyyy hh24:mi:ss'), 100245);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000246, 'Transactions', 6842, to_date('13-06-2008 12:39:57', 'dd-mm-yyyy hh24:mi:ss'), 100246);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000247, 'Transactions', 8267, to_date('31-12-2013 17:33:33', 'dd-mm-yyyy hh24:mi:ss'), 100247);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000248, 'Check', 5458, to_date('03-06-2021 05:03:00', 'dd-mm-yyyy hh24:mi:ss'), 100248);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000249, 'Transfer', 4734, to_date('15-12-2013 00:59:46', 'dd-mm-yyyy hh24:mi:ss'), 100249);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000250, 'Transactions', 2420, to_date('02-04-2013 03:05:03', 'dd-mm-yyyy hh24:mi:ss'), 100250);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000251, 'Transactions', 6330, to_date('24-12-2012 22:06:09', 'dd-mm-yyyy hh24:mi:ss'), 100251);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000252, 'Bill payment', 3789, to_date('08-09-2013 19:31:38', 'dd-mm-yyyy hh24:mi:ss'), 100252);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000253, 'ATM', 6973, to_date('19-05-2003 08:33:21', 'dd-mm-yyyy hh24:mi:ss'), 100253);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000254, 'Bill payment', 4806, to_date('24-10-2008 10:33:37', 'dd-mm-yyyy hh24:mi:ss'), 100254);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000255, 'ATM', 8066, to_date('31-05-2000 05:05:44', 'dd-mm-yyyy hh24:mi:ss'), 100255);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000256, 'Transfer', 7206, to_date('21-03-2020 16:59:40', 'dd-mm-yyyy hh24:mi:ss'), 100256);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000257, 'ATM', 8715, to_date('14-03-2012 00:03:26', 'dd-mm-yyyy hh24:mi:ss'), 100257);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000258, 'Bill payment', 5505, to_date('28-02-2014 13:55:33', 'dd-mm-yyyy hh24:mi:ss'), 100258);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000259, 'Bill payment', 1296, to_date('04-01-2010 05:29:07', 'dd-mm-yyyy hh24:mi:ss'), 100259);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000260, 'Bill payment', 4302, to_date('22-11-2012 13:31:14', 'dd-mm-yyyy hh24:mi:ss'), 100260);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000261, 'Transactions', 8056, to_date('31-08-2021 23:11:27', 'dd-mm-yyyy hh24:mi:ss'), 100261);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000262, 'Check', 5260, to_date('05-09-2014 16:58:21', 'dd-mm-yyyy hh24:mi:ss'), 100262);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000263, 'Transactions', 8310, to_date('30-06-2019 05:40:00', 'dd-mm-yyyy hh24:mi:ss'), 100263);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000264, 'Transfer', 8552, to_date('07-09-2009 04:15:04', 'dd-mm-yyyy hh24:mi:ss'), 100264);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000265, 'Check', 8786, to_date('26-04-2011 01:28:55', 'dd-mm-yyyy hh24:mi:ss'), 100265);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000266, 'ATM', 1304, to_date('11-05-2013 09:39:24', 'dd-mm-yyyy hh24:mi:ss'), 100266);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000267, 'Transfer', 7234, to_date('29-06-2001 11:57:00', 'dd-mm-yyyy hh24:mi:ss'), 100267);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000268, 'Bill payment', 5526, to_date('28-09-2005 05:46:29', 'dd-mm-yyyy hh24:mi:ss'), 100268);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000269, 'ATM', 2911, to_date('26-04-2005 22:42:10', 'dd-mm-yyyy hh24:mi:ss'), 100269);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000270, 'Bill payment', 6351, to_date('17-02-2016 22:36:16', 'dd-mm-yyyy hh24:mi:ss'), 100270);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000271, 'Check', 9346, to_date('24-03-2008 05:36:10', 'dd-mm-yyyy hh24:mi:ss'), 100271);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000272, 'Bill payment', 4541, to_date('28-02-2008 23:54:32', 'dd-mm-yyyy hh24:mi:ss'), 100272);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000273, 'ATM', 9087, to_date('13-03-2011 22:20:56', 'dd-mm-yyyy hh24:mi:ss'), 100273);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000274, 'Transfer', 7544, to_date('31-08-2022 06:29:54', 'dd-mm-yyyy hh24:mi:ss'), 100274);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000275, 'Transfer', 4927, to_date('23-06-2000 10:26:55', 'dd-mm-yyyy hh24:mi:ss'), 100275);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000276, 'Transactions', 6075, to_date('24-11-2017 00:21:50', 'dd-mm-yyyy hh24:mi:ss'), 100276);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000277, 'ATM', 8297, to_date('23-10-2020 00:28:31', 'dd-mm-yyyy hh24:mi:ss'), 100277);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000278, 'Transactions', 212, to_date('11-07-2004 08:43:26', 'dd-mm-yyyy hh24:mi:ss'), 100278);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000279, 'Bill payment', 8035, to_date('06-04-2020 22:18:52', 'dd-mm-yyyy hh24:mi:ss'), 100279);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000280, 'Bill payment', 6305, to_date('01-12-2018 22:05:15', 'dd-mm-yyyy hh24:mi:ss'), 100280);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000281, 'ATM', 5220, to_date('10-06-2004 23:31:56', 'dd-mm-yyyy hh24:mi:ss'), 100281);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000282, 'Transfer', 7172, to_date('08-03-2021 06:29:06', 'dd-mm-yyyy hh24:mi:ss'), 100282);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000283, 'Transactions', 2434, to_date('24-01-2016 21:32:05', 'dd-mm-yyyy hh24:mi:ss'), 100283);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000284, 'Transfer', 9981, to_date('15-11-2019 12:27:59', 'dd-mm-yyyy hh24:mi:ss'), 100284);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000285, 'ATM', 7209, to_date('02-02-2011 09:31:14', 'dd-mm-yyyy hh24:mi:ss'), 100285);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000286, 'Transfer', 1203, to_date('27-11-2020 17:20:58', 'dd-mm-yyyy hh24:mi:ss'), 100286);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000287, 'Check', 3051, to_date('12-05-2009 12:16:52', 'dd-mm-yyyy hh24:mi:ss'), 100287);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000288, 'ATM', 5307, to_date('09-02-2021 05:14:28', 'dd-mm-yyyy hh24:mi:ss'), 100288);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000289, 'Transactions', 1333, to_date('26-06-2017 15:05:18', 'dd-mm-yyyy hh24:mi:ss'), 100289);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000290, 'Transactions', 5016, to_date('14-02-2009 07:27:55', 'dd-mm-yyyy hh24:mi:ss'), 100290);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000291, 'Transfer', 1419, to_date('08-04-2018 11:20:38', 'dd-mm-yyyy hh24:mi:ss'), 100291);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000292, 'Transfer', 4568, to_date('17-12-2018 12:34:30', 'dd-mm-yyyy hh24:mi:ss'), 100292);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000293, 'Bill payment', 4465, to_date('12-03-2015 07:38:24', 'dd-mm-yyyy hh24:mi:ss'), 100293);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000294, 'Check', 5175, to_date('23-12-2017 07:50:24', 'dd-mm-yyyy hh24:mi:ss'), 100294);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000295, 'Transfer', 7896, to_date('18-12-2007 04:13:42', 'dd-mm-yyyy hh24:mi:ss'), 100295);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000296, 'ATM', 4356, to_date('11-02-2003 02:46:34', 'dd-mm-yyyy hh24:mi:ss'), 100296);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000297, 'Bill payment', 3012, to_date('11-05-2013 18:40:39', 'dd-mm-yyyy hh24:mi:ss'), 100297);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000298, 'ATM', 733, to_date('27-05-2021 23:28:41', 'dd-mm-yyyy hh24:mi:ss'), 100298);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000299, 'ATM', 7987, to_date('10-01-2020 23:35:19', 'dd-mm-yyyy hh24:mi:ss'), 100299);
commit;
prompt 300 records committed...
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000300, 'Transfer', 5948, to_date('25-12-2022 01:26:58', 'dd-mm-yyyy hh24:mi:ss'), 100300);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000301, 'ATM', 3844, to_date('01-08-2001 11:16:13', 'dd-mm-yyyy hh24:mi:ss'), 100301);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000302, 'Bill payment', 2099, to_date('24-03-2022 23:09:42', 'dd-mm-yyyy hh24:mi:ss'), 100302);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000303, 'Check', 3225, to_date('02-08-2006 04:57:32', 'dd-mm-yyyy hh24:mi:ss'), 100303);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000304, 'Transactions', 1767, to_date('25-02-2002 23:20:43', 'dd-mm-yyyy hh24:mi:ss'), 100304);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000305, 'Transactions', 4436, to_date('01-12-2012 09:34:57', 'dd-mm-yyyy hh24:mi:ss'), 100305);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000306, 'Transactions', 5843, to_date('17-06-2013 08:33:03', 'dd-mm-yyyy hh24:mi:ss'), 100306);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000307, 'Bill payment', 8872, to_date('02-08-2008 19:53:28', 'dd-mm-yyyy hh24:mi:ss'), 100307);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000308, 'ATM', 7152, to_date('11-03-2001 09:01:53', 'dd-mm-yyyy hh24:mi:ss'), 100308);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000309, 'Check', 3134, to_date('04-05-2013 19:17:03', 'dd-mm-yyyy hh24:mi:ss'), 100309);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000310, 'Check', 1219, to_date('05-09-2020 03:24:36', 'dd-mm-yyyy hh24:mi:ss'), 100310);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000311, 'ATM', 1876, to_date('21-02-2016 15:04:55', 'dd-mm-yyyy hh24:mi:ss'), 100311);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000312, 'Check', 5831, to_date('22-08-2016 23:35:22', 'dd-mm-yyyy hh24:mi:ss'), 100312);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000313, 'Check', 301, to_date('06-05-2012 20:24:39', 'dd-mm-yyyy hh24:mi:ss'), 100313);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000314, 'Transfer', 4577, to_date('29-01-2003 03:01:12', 'dd-mm-yyyy hh24:mi:ss'), 100314);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000315, 'Check', 8957, to_date('08-10-2009 01:59:13', 'dd-mm-yyyy hh24:mi:ss'), 100315);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000316, 'Transactions', 5716, to_date('04-10-2009 08:42:41', 'dd-mm-yyyy hh24:mi:ss'), 100316);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000317, 'ATM', 6236, to_date('03-08-2012 10:19:19', 'dd-mm-yyyy hh24:mi:ss'), 100317);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000318, 'Transfer', 9534, to_date('09-11-2005 17:56:53', 'dd-mm-yyyy hh24:mi:ss'), 100318);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000319, 'ATM', 7680, to_date('18-10-2007 09:29:32', 'dd-mm-yyyy hh24:mi:ss'), 100319);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000320, 'Check', 6966, to_date('20-10-2005 16:34:13', 'dd-mm-yyyy hh24:mi:ss'), 100320);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000321, 'Check', 6173, to_date('25-06-2022 17:07:18', 'dd-mm-yyyy hh24:mi:ss'), 100321);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000322, 'Transactions', 6594, to_date('05-10-2019 23:17:38', 'dd-mm-yyyy hh24:mi:ss'), 100322);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000323, 'Check', 1816, to_date('14-09-2001 18:20:59', 'dd-mm-yyyy hh24:mi:ss'), 100323);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000324, 'Transfer', 6351, to_date('06-07-2020 06:20:34', 'dd-mm-yyyy hh24:mi:ss'), 100324);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000325, 'ATM', 3920, to_date('10-02-2011 06:26:40', 'dd-mm-yyyy hh24:mi:ss'), 100325);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000326, 'Check', 2996, to_date('10-03-2016 09:49:52', 'dd-mm-yyyy hh24:mi:ss'), 100326);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000327, 'Transactions', 9858, to_date('11-04-2011 02:41:06', 'dd-mm-yyyy hh24:mi:ss'), 100327);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000328, 'Bill payment', 3985, to_date('23-07-2001 17:01:36', 'dd-mm-yyyy hh24:mi:ss'), 100328);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000329, 'ATM', 9688, to_date('26-01-2021 05:58:35', 'dd-mm-yyyy hh24:mi:ss'), 100329);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000330, 'Transfer', 6187, to_date('03-07-2020 10:02:13', 'dd-mm-yyyy hh24:mi:ss'), 100330);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000331, 'Check', 4202, to_date('18-11-2017 01:48:48', 'dd-mm-yyyy hh24:mi:ss'), 100331);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000332, 'ATM', 9333, to_date('24-05-2022 11:44:44', 'dd-mm-yyyy hh24:mi:ss'), 100332);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000333, 'Transactions', 440, to_date('04-10-2003 07:53:08', 'dd-mm-yyyy hh24:mi:ss'), 100333);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000334, 'Transfer', 5725, to_date('08-11-2003 03:16:24', 'dd-mm-yyyy hh24:mi:ss'), 100334);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000335, 'Check', 6309, to_date('26-01-2021 21:25:58', 'dd-mm-yyyy hh24:mi:ss'), 100335);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000336, 'Check', 6355, to_date('12-05-2017 09:06:54', 'dd-mm-yyyy hh24:mi:ss'), 100336);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000337, 'Transfer', 7982, to_date('24-08-2011 15:02:09', 'dd-mm-yyyy hh24:mi:ss'), 100337);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000338, 'Check', 390, to_date('27-08-2001 17:25:33', 'dd-mm-yyyy hh24:mi:ss'), 100338);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000339, 'Transactions', 7011, to_date('23-01-2021 21:29:52', 'dd-mm-yyyy hh24:mi:ss'), 100339);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000340, 'ATM', 6442, to_date('07-06-2001 04:48:17', 'dd-mm-yyyy hh24:mi:ss'), 100340);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000341, 'Bill payment', 7960, to_date('03-08-2018 20:45:34', 'dd-mm-yyyy hh24:mi:ss'), 100341);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000342, 'Check', 1647, to_date('04-07-2002 03:21:48', 'dd-mm-yyyy hh24:mi:ss'), 100342);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000343, 'Transfer', 3285, to_date('03-10-2014 04:49:51', 'dd-mm-yyyy hh24:mi:ss'), 100343);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000344, 'Transactions', 5885, to_date('01-11-2006 11:29:58', 'dd-mm-yyyy hh24:mi:ss'), 100344);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000345, 'Transactions', 2370, to_date('14-03-2012 10:29:07', 'dd-mm-yyyy hh24:mi:ss'), 100345);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000346, 'Bill payment', 9873, to_date('14-01-2005 13:19:50', 'dd-mm-yyyy hh24:mi:ss'), 100346);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000347, 'Transactions', 6972, to_date('20-09-2005 21:17:11', 'dd-mm-yyyy hh24:mi:ss'), 100347);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000348, 'ATM', 1144, to_date('13-10-2004 17:57:43', 'dd-mm-yyyy hh24:mi:ss'), 100348);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000349, 'Bill payment', 6496, to_date('02-11-2000 01:47:17', 'dd-mm-yyyy hh24:mi:ss'), 100349);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000350, 'Check', 6484, to_date('04-10-2015 13:43:14', 'dd-mm-yyyy hh24:mi:ss'), 100350);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000351, 'Transfer', 7429, to_date('30-11-2008 19:20:47', 'dd-mm-yyyy hh24:mi:ss'), 100351);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000352, 'Transactions', 8280, to_date('04-11-2012 11:47:58', 'dd-mm-yyyy hh24:mi:ss'), 100352);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000353, 'ATM', 157, to_date('02-03-2018 22:46:18', 'dd-mm-yyyy hh24:mi:ss'), 100353);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000354, 'Bill payment', 3658, to_date('24-09-2021 17:56:18', 'dd-mm-yyyy hh24:mi:ss'), 100354);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000355, 'Transactions', 6726, to_date('30-06-2020 07:47:33', 'dd-mm-yyyy hh24:mi:ss'), 100355);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000356, 'Bill payment', 8480, to_date('10-09-2012 17:42:53', 'dd-mm-yyyy hh24:mi:ss'), 100356);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000357, 'Transactions', 2224, to_date('03-06-2015 08:59:34', 'dd-mm-yyyy hh24:mi:ss'), 100357);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000358, 'Transfer', 6523, to_date('10-11-2017 07:38:38', 'dd-mm-yyyy hh24:mi:ss'), 100358);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000359, 'ATM', 4755, to_date('18-09-2003 16:22:19', 'dd-mm-yyyy hh24:mi:ss'), 100359);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000360, 'Transactions', 8673, to_date('28-12-2010 15:33:32', 'dd-mm-yyyy hh24:mi:ss'), 100360);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000361, 'Transactions', 6056, to_date('19-12-2010 18:35:16', 'dd-mm-yyyy hh24:mi:ss'), 100361);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000362, 'Check', 7293, to_date('21-06-2003 21:42:16', 'dd-mm-yyyy hh24:mi:ss'), 100362);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000363, 'Bill payment', 9030, to_date('02-08-2000 20:46:37', 'dd-mm-yyyy hh24:mi:ss'), 100363);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000364, 'ATM', 6852, to_date('05-02-2017 03:10:12', 'dd-mm-yyyy hh24:mi:ss'), 100364);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000365, 'Bill payment', 3176, to_date('14-07-2001 06:41:00', 'dd-mm-yyyy hh24:mi:ss'), 100365);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000366, 'Transactions', 5611, to_date('20-03-2014 12:30:53', 'dd-mm-yyyy hh24:mi:ss'), 100366);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000367, 'ATM', 4519, to_date('03-01-2011 08:42:16', 'dd-mm-yyyy hh24:mi:ss'), 100367);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000368, 'Transactions', 6773, to_date('29-12-2000 11:26:49', 'dd-mm-yyyy hh24:mi:ss'), 100368);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000369, 'Transactions', 9516, to_date('24-09-2004 20:26:45', 'dd-mm-yyyy hh24:mi:ss'), 100369);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000370, 'Check', 6851, to_date('01-11-2007 23:29:04', 'dd-mm-yyyy hh24:mi:ss'), 100370);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000371, 'Transactions', 1696, to_date('11-03-2011 13:30:58', 'dd-mm-yyyy hh24:mi:ss'), 100371);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000372, 'ATM', 4574, to_date('07-03-2008 07:04:53', 'dd-mm-yyyy hh24:mi:ss'), 100372);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000373, 'Transfer', 2328, to_date('12-05-2008 21:18:40', 'dd-mm-yyyy hh24:mi:ss'), 100373);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000374, 'Check', 3084, to_date('20-07-2022 14:19:23', 'dd-mm-yyyy hh24:mi:ss'), 100374);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000375, 'Transfer', 9610, to_date('21-08-2012 04:04:11', 'dd-mm-yyyy hh24:mi:ss'), 100375);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000376, 'ATM', 5087, to_date('08-09-2011 03:36:25', 'dd-mm-yyyy hh24:mi:ss'), 100376);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000377, 'Transfer', 1379, to_date('20-10-2001 12:37:28', 'dd-mm-yyyy hh24:mi:ss'), 100377);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000378, 'ATM', 7877, to_date('05-06-2007 15:38:10', 'dd-mm-yyyy hh24:mi:ss'), 100378);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000379, 'Transactions', 6451, to_date('20-04-2002 00:18:18', 'dd-mm-yyyy hh24:mi:ss'), 100379);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000380, 'Transactions', 8770, to_date('13-12-2011 08:13:57', 'dd-mm-yyyy hh24:mi:ss'), 100380);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000381, 'Check', 8241, to_date('12-12-2008 23:33:06', 'dd-mm-yyyy hh24:mi:ss'), 100381);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000382, 'Bill payment', 6318, to_date('10-03-2020 22:01:53', 'dd-mm-yyyy hh24:mi:ss'), 100382);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000383, 'ATM', 4078, to_date('28-05-2014 04:49:33', 'dd-mm-yyyy hh24:mi:ss'), 100383);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000384, 'Transactions', 4616, to_date('29-03-2016 04:44:53', 'dd-mm-yyyy hh24:mi:ss'), 100384);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000385, 'Bill payment', 8028, to_date('29-03-2019 03:58:31', 'dd-mm-yyyy hh24:mi:ss'), 100385);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000386, 'Bill payment', 5110, to_date('19-05-2015 09:36:21', 'dd-mm-yyyy hh24:mi:ss'), 100386);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000387, 'Transactions', 6300, to_date('03-02-2012 05:27:38', 'dd-mm-yyyy hh24:mi:ss'), 100387);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000388, 'ATM', 4758, to_date('06-03-2019 16:52:42', 'dd-mm-yyyy hh24:mi:ss'), 100388);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000389, 'Bill payment', 6450, to_date('17-09-2021 10:55:02', 'dd-mm-yyyy hh24:mi:ss'), 100389);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000390, 'Bill payment', 4445, to_date('15-10-2001 13:48:16', 'dd-mm-yyyy hh24:mi:ss'), 100390);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000391, 'Bill payment', 9672, to_date('10-05-2005 00:40:26', 'dd-mm-yyyy hh24:mi:ss'), 100391);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000392, 'Transactions', 574, to_date('12-08-2022 09:37:26', 'dd-mm-yyyy hh24:mi:ss'), 100392);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000393, 'Bill payment', 188, to_date('15-02-2005 15:07:50', 'dd-mm-yyyy hh24:mi:ss'), 100393);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000394, 'Check', 7542, to_date('26-08-2021 18:16:28', 'dd-mm-yyyy hh24:mi:ss'), 100394);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000395, 'Transactions', 7342, to_date('13-07-2018 07:58:29', 'dd-mm-yyyy hh24:mi:ss'), 100395);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000396, 'ATM', 3892, to_date('15-02-2020 03:26:34', 'dd-mm-yyyy hh24:mi:ss'), 100396);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000397, 'Check', 2589, to_date('20-09-2016 15:52:40', 'dd-mm-yyyy hh24:mi:ss'), 100397);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000398, 'ATM', 3782, to_date('06-10-2002 13:32:07', 'dd-mm-yyyy hh24:mi:ss'), 100398);
insert into TRANSACTIONS (transactionid, transactiontype, amount, transactiondate, accountid)
values (10000399, 'ATM', 2410, to_date('30-10-2007 22:56:46', 'dd-mm-yyyy hh24:mi:ss'), 100399);
commit;
prompt 400 records loaded
prompt Loading VIP...
insert into VIP (accountid, positiveinterest)
values (100000, .1);
insert into VIP (accountid, positiveinterest)
values (100001, .2);
insert into VIP (accountid, positiveinterest)
values (100002, .16);
insert into VIP (accountid, positiveinterest)
values (100003, .1);
insert into VIP (accountid, positiveinterest)
values (100004, .12);
insert into VIP (accountid, positiveinterest)
values (100005, .01);
insert into VIP (accountid, positiveinterest)
values (100006, .12);
insert into VIP (accountid, positiveinterest)
values (100007, .16);
insert into VIP (accountid, positiveinterest)
values (100008, .18);
insert into VIP (accountid, positiveinterest)
values (100009, .12);
insert into VIP (accountid, positiveinterest)
values (100010, .01);
insert into VIP (accountid, positiveinterest)
values (100011, .05);
insert into VIP (accountid, positiveinterest)
values (100012, .12);
insert into VIP (accountid, positiveinterest)
values (100013, .18);
insert into VIP (accountid, positiveinterest)
values (100014, .01);
insert into VIP (accountid, positiveinterest)
values (100015, .2);
insert into VIP (accountid, positiveinterest)
values (100016, .05);
insert into VIP (accountid, positiveinterest)
values (100017, .1);
insert into VIP (accountid, positiveinterest)
values (100018, .16);
insert into VIP (accountid, positiveinterest)
values (100019, .2);
insert into VIP (accountid, positiveinterest)
values (100020, .01);
insert into VIP (accountid, positiveinterest)
values (100021, .2);
insert into VIP (accountid, positiveinterest)
values (100022, .12);
insert into VIP (accountid, positiveinterest)
values (100023, .01);
insert into VIP (accountid, positiveinterest)
values (100024, .12);
insert into VIP (accountid, positiveinterest)
values (100025, .14);
insert into VIP (accountid, positiveinterest)
values (100026, .05);
insert into VIP (accountid, positiveinterest)
values (100027, .12);
insert into VIP (accountid, positiveinterest)
values (100028, .1);
insert into VIP (accountid, positiveinterest)
values (100029, .18);
insert into VIP (accountid, positiveinterest)
values (100030, .18);
insert into VIP (accountid, positiveinterest)
values (100031, .2);
insert into VIP (accountid, positiveinterest)
values (100032, .1);
insert into VIP (accountid, positiveinterest)
values (100033, .14);
insert into VIP (accountid, positiveinterest)
values (100034, .01);
insert into VIP (accountid, positiveinterest)
values (100035, .01);
insert into VIP (accountid, positiveinterest)
values (100036, .05);
insert into VIP (accountid, positiveinterest)
values (100037, .05);
insert into VIP (accountid, positiveinterest)
values (100038, .14);
insert into VIP (accountid, positiveinterest)
values (100039, .18);
insert into VIP (accountid, positiveinterest)
values (100040, .01);
insert into VIP (accountid, positiveinterest)
values (100041, .18);
insert into VIP (accountid, positiveinterest)
values (100042, .16);
insert into VIP (accountid, positiveinterest)
values (100043, .05);
insert into VIP (accountid, positiveinterest)
values (100044, .14);
insert into VIP (accountid, positiveinterest)
values (100045, .16);
insert into VIP (accountid, positiveinterest)
values (100046, .05);
insert into VIP (accountid, positiveinterest)
values (100047, .16);
insert into VIP (accountid, positiveinterest)
values (100048, .1);
insert into VIP (accountid, positiveinterest)
values (100049, .1);
insert into VIP (accountid, positiveinterest)
values (100050, .16);
insert into VIP (accountid, positiveinterest)
values (100051, .14);
insert into VIP (accountid, positiveinterest)
values (100052, .1);
insert into VIP (accountid, positiveinterest)
values (100053, .05);
insert into VIP (accountid, positiveinterest)
values (100054, .14);
insert into VIP (accountid, positiveinterest)
values (100055, .16);
insert into VIP (accountid, positiveinterest)
values (100056, .18);
insert into VIP (accountid, positiveinterest)
values (100057, .12);
insert into VIP (accountid, positiveinterest)
values (100058, .12);
insert into VIP (accountid, positiveinterest)
values (100059, .05);
insert into VIP (accountid, positiveinterest)
values (100060, .05);
insert into VIP (accountid, positiveinterest)
values (100061, .01);
insert into VIP (accountid, positiveinterest)
values (100062, .14);
insert into VIP (accountid, positiveinterest)
values (100063, .12);
insert into VIP (accountid, positiveinterest)
values (100064, .1);
insert into VIP (accountid, positiveinterest)
values (100065, .05);
insert into VIP (accountid, positiveinterest)
values (100066, .05);
insert into VIP (accountid, positiveinterest)
values (100067, .1);
insert into VIP (accountid, positiveinterest)
values (100068, .16);
insert into VIP (accountid, positiveinterest)
values (100069, .1);
insert into VIP (accountid, positiveinterest)
values (100070, .12);
insert into VIP (accountid, positiveinterest)
values (100071, .05);
insert into VIP (accountid, positiveinterest)
values (100072, .05);
insert into VIP (accountid, positiveinterest)
values (100073, .12);
insert into VIP (accountid, positiveinterest)
values (100074, .01);
insert into VIP (accountid, positiveinterest)
values (100075, .1);
insert into VIP (accountid, positiveinterest)
values (100076, .16);
insert into VIP (accountid, positiveinterest)
values (100077, .12);
insert into VIP (accountid, positiveinterest)
values (100078, .2);
insert into VIP (accountid, positiveinterest)
values (100079, .12);
insert into VIP (accountid, positiveinterest)
values (100080, .1);
insert into VIP (accountid, positiveinterest)
values (100081, .18);
insert into VIP (accountid, positiveinterest)
values (100082, .12);
insert into VIP (accountid, positiveinterest)
values (100083, .18);
insert into VIP (accountid, positiveinterest)
values (100084, .2);
insert into VIP (accountid, positiveinterest)
values (100085, .01);
insert into VIP (accountid, positiveinterest)
values (100086, .14);
insert into VIP (accountid, positiveinterest)
values (100087, .18);
insert into VIP (accountid, positiveinterest)
values (100088, .14);
insert into VIP (accountid, positiveinterest)
values (100089, .14);
insert into VIP (accountid, positiveinterest)
values (100090, .2);
insert into VIP (accountid, positiveinterest)
values (100091, .18);
insert into VIP (accountid, positiveinterest)
values (100092, .18);
insert into VIP (accountid, positiveinterest)
values (100093, .05);
insert into VIP (accountid, positiveinterest)
values (100094, .12);
insert into VIP (accountid, positiveinterest)
values (100095, .16);
insert into VIP (accountid, positiveinterest)
values (100096, .01);
insert into VIP (accountid, positiveinterest)
values (100097, .2);
insert into VIP (accountid, positiveinterest)
values (100098, .1);
insert into VIP (accountid, positiveinterest)
values (100099, .18);
commit;
prompt 100 records committed...
insert into VIP (accountid, positiveinterest)
values (100100, .16);
insert into VIP (accountid, positiveinterest)
values (100101, .01);
insert into VIP (accountid, positiveinterest)
values (100102, .14);
insert into VIP (accountid, positiveinterest)
values (100103, .12);
insert into VIP (accountid, positiveinterest)
values (100104, .18);
insert into VIP (accountid, positiveinterest)
values (100105, .2);
insert into VIP (accountid, positiveinterest)
values (100106, .01);
insert into VIP (accountid, positiveinterest)
values (100107, .16);
insert into VIP (accountid, positiveinterest)
values (100108, .18);
insert into VIP (accountid, positiveinterest)
values (100109, .18);
insert into VIP (accountid, positiveinterest)
values (100110, .1);
insert into VIP (accountid, positiveinterest)
values (100111, .01);
insert into VIP (accountid, positiveinterest)
values (100112, .16);
insert into VIP (accountid, positiveinterest)
values (100113, .16);
insert into VIP (accountid, positiveinterest)
values (100114, .1);
insert into VIP (accountid, positiveinterest)
values (100115, .01);
insert into VIP (accountid, positiveinterest)
values (100116, .01);
insert into VIP (accountid, positiveinterest)
values (100117, .12);
insert into VIP (accountid, positiveinterest)
values (100118, .01);
insert into VIP (accountid, positiveinterest)
values (100119, .05);
insert into VIP (accountid, positiveinterest)
values (100120, .18);
insert into VIP (accountid, positiveinterest)
values (100121, .12);
insert into VIP (accountid, positiveinterest)
values (100122, .1);
insert into VIP (accountid, positiveinterest)
values (100123, .2);
insert into VIP (accountid, positiveinterest)
values (100124, .16);
insert into VIP (accountid, positiveinterest)
values (100125, .18);
insert into VIP (accountid, positiveinterest)
values (100126, .12);
insert into VIP (accountid, positiveinterest)
values (100127, .14);
insert into VIP (accountid, positiveinterest)
values (100128, .1);
insert into VIP (accountid, positiveinterest)
values (100129, .2);
insert into VIP (accountid, positiveinterest)
values (100130, .05);
insert into VIP (accountid, positiveinterest)
values (100131, .01);
insert into VIP (accountid, positiveinterest)
values (100132, .12);
insert into VIP (accountid, positiveinterest)
values (100133, .2);
insert into VIP (accountid, positiveinterest)
values (100134, .2);
insert into VIP (accountid, positiveinterest)
values (100135, .2);
insert into VIP (accountid, positiveinterest)
values (100136, .1);
insert into VIP (accountid, positiveinterest)
values (100137, .14);
insert into VIP (accountid, positiveinterest)
values (100138, .14);
insert into VIP (accountid, positiveinterest)
values (100139, .1);
insert into VIP (accountid, positiveinterest)
values (100140, .01);
insert into VIP (accountid, positiveinterest)
values (100141, .14);
insert into VIP (accountid, positiveinterest)
values (100142, .1);
insert into VIP (accountid, positiveinterest)
values (100143, .01);
insert into VIP (accountid, positiveinterest)
values (100144, .01);
insert into VIP (accountid, positiveinterest)
values (100145, .18);
insert into VIP (accountid, positiveinterest)
values (100146, .2);
insert into VIP (accountid, positiveinterest)
values (100147, .14);
insert into VIP (accountid, positiveinterest)
values (100148, .18);
insert into VIP (accountid, positiveinterest)
values (100149, .01);
insert into VIP (accountid, positiveinterest)
values (100150, .2);
insert into VIP (accountid, positiveinterest)
values (100151, .05);
insert into VIP (accountid, positiveinterest)
values (100152, .1);
insert into VIP (accountid, positiveinterest)
values (100153, .16);
insert into VIP (accountid, positiveinterest)
values (100154, .2);
insert into VIP (accountid, positiveinterest)
values (100155, .2);
insert into VIP (accountid, positiveinterest)
values (100156, .12);
insert into VIP (accountid, positiveinterest)
values (100157, .16);
insert into VIP (accountid, positiveinterest)
values (100158, .18);
insert into VIP (accountid, positiveinterest)
values (100159, .05);
insert into VIP (accountid, positiveinterest)
values (100160, .2);
insert into VIP (accountid, positiveinterest)
values (100161, .01);
insert into VIP (accountid, positiveinterest)
values (100162, .18);
insert into VIP (accountid, positiveinterest)
values (100163, .14);
insert into VIP (accountid, positiveinterest)
values (100164, .2);
insert into VIP (accountid, positiveinterest)
values (100165, .1);
insert into VIP (accountid, positiveinterest)
values (100166, .16);
insert into VIP (accountid, positiveinterest)
values (100167, .16);
insert into VIP (accountid, positiveinterest)
values (100168, .12);
insert into VIP (accountid, positiveinterest)
values (100169, .12);
insert into VIP (accountid, positiveinterest)
values (100170, .05);
insert into VIP (accountid, positiveinterest)
values (100171, .1);
insert into VIP (accountid, positiveinterest)
values (100172, .01);
insert into VIP (accountid, positiveinterest)
values (100173, .2);
insert into VIP (accountid, positiveinterest)
values (100174, .14);
insert into VIP (accountid, positiveinterest)
values (100175, .16);
insert into VIP (accountid, positiveinterest)
values (100176, .01);
insert into VIP (accountid, positiveinterest)
values (100177, .01);
insert into VIP (accountid, positiveinterest)
values (100178, .1);
insert into VIP (accountid, positiveinterest)
values (100179, .16);
insert into VIP (accountid, positiveinterest)
values (100180, .2);
insert into VIP (accountid, positiveinterest)
values (100181, .1);
insert into VIP (accountid, positiveinterest)
values (100182, .2);
insert into VIP (accountid, positiveinterest)
values (100183, .05);
insert into VIP (accountid, positiveinterest)
values (100184, .12);
insert into VIP (accountid, positiveinterest)
values (100185, .18);
insert into VIP (accountid, positiveinterest)
values (100186, .05);
insert into VIP (accountid, positiveinterest)
values (100187, .12);
insert into VIP (accountid, positiveinterest)
values (100188, .16);
insert into VIP (accountid, positiveinterest)
values (100189, .2);
insert into VIP (accountid, positiveinterest)
values (100190, .14);
insert into VIP (accountid, positiveinterest)
values (100191, .16);
insert into VIP (accountid, positiveinterest)
values (100192, .18);
insert into VIP (accountid, positiveinterest)
values (100193, .18);
insert into VIP (accountid, positiveinterest)
values (100194, .18);
insert into VIP (accountid, positiveinterest)
values (100195, .2);
insert into VIP (accountid, positiveinterest)
values (100196, .01);
insert into VIP (accountid, positiveinterest)
values (100197, .1);
insert into VIP (accountid, positiveinterest)
values (100198, .2);
insert into VIP (accountid, positiveinterest)
values (100199, .16);
commit;
prompt 200 records committed...
insert into VIP (accountid, positiveinterest)
values (100200, .16);
insert into VIP (accountid, positiveinterest)
values (100201, .16);
insert into VIP (accountid, positiveinterest)
values (100202, .12);
insert into VIP (accountid, positiveinterest)
values (100203, .05);
insert into VIP (accountid, positiveinterest)
values (100204, .12);
insert into VIP (accountid, positiveinterest)
values (100205, .14);
insert into VIP (accountid, positiveinterest)
values (100206, .01);
insert into VIP (accountid, positiveinterest)
values (100207, .16);
insert into VIP (accountid, positiveinterest)
values (100208, .05);
insert into VIP (accountid, positiveinterest)
values (100209, .12);
insert into VIP (accountid, positiveinterest)
values (100210, .2);
insert into VIP (accountid, positiveinterest)
values (100211, .14);
insert into VIP (accountid, positiveinterest)
values (100212, .16);
insert into VIP (accountid, positiveinterest)
values (100213, .16);
insert into VIP (accountid, positiveinterest)
values (100214, .01);
insert into VIP (accountid, positiveinterest)
values (100215, .18);
insert into VIP (accountid, positiveinterest)
values (100216, .01);
insert into VIP (accountid, positiveinterest)
values (100217, .16);
insert into VIP (accountid, positiveinterest)
values (100218, .1);
insert into VIP (accountid, positiveinterest)
values (100219, .14);
insert into VIP (accountid, positiveinterest)
values (100220, .16);
insert into VIP (accountid, positiveinterest)
values (100221, .01);
insert into VIP (accountid, positiveinterest)
values (100222, .16);
insert into VIP (accountid, positiveinterest)
values (100223, .18);
insert into VIP (accountid, positiveinterest)
values (100224, .2);
insert into VIP (accountid, positiveinterest)
values (100225, .1);
insert into VIP (accountid, positiveinterest)
values (100226, .05);
insert into VIP (accountid, positiveinterest)
values (100227, .14);
insert into VIP (accountid, positiveinterest)
values (100228, .14);
insert into VIP (accountid, positiveinterest)
values (100229, .2);
insert into VIP (accountid, positiveinterest)
values (100230, .01);
insert into VIP (accountid, positiveinterest)
values (100231, .05);
insert into VIP (accountid, positiveinterest)
values (100232, .14);
insert into VIP (accountid, positiveinterest)
values (100233, .14);
insert into VIP (accountid, positiveinterest)
values (100234, .18);
insert into VIP (accountid, positiveinterest)
values (100235, .1);
insert into VIP (accountid, positiveinterest)
values (100236, .05);
insert into VIP (accountid, positiveinterest)
values (100237, .12);
insert into VIP (accountid, positiveinterest)
values (100238, .14);
insert into VIP (accountid, positiveinterest)
values (100239, .2);
insert into VIP (accountid, positiveinterest)
values (100240, .05);
insert into VIP (accountid, positiveinterest)
values (100241, .05);
insert into VIP (accountid, positiveinterest)
values (100242, .18);
insert into VIP (accountid, positiveinterest)
values (100243, .12);
insert into VIP (accountid, positiveinterest)
values (100244, .12);
insert into VIP (accountid, positiveinterest)
values (100245, .05);
insert into VIP (accountid, positiveinterest)
values (100246, .12);
insert into VIP (accountid, positiveinterest)
values (100247, .2);
insert into VIP (accountid, positiveinterest)
values (100248, .14);
insert into VIP (accountid, positiveinterest)
values (100249, .01);
insert into VIP (accountid, positiveinterest)
values (100250, .14);
insert into VIP (accountid, positiveinterest)
values (100251, .2);
insert into VIP (accountid, positiveinterest)
values (100252, .18);
insert into VIP (accountid, positiveinterest)
values (100253, .2);
insert into VIP (accountid, positiveinterest)
values (100254, .12);
insert into VIP (accountid, positiveinterest)
values (100255, .05);
insert into VIP (accountid, positiveinterest)
values (100256, .01);
insert into VIP (accountid, positiveinterest)
values (100257, .01);
insert into VIP (accountid, positiveinterest)
values (100258, .01);
insert into VIP (accountid, positiveinterest)
values (100259, .18);
insert into VIP (accountid, positiveinterest)
values (100260, .16);
insert into VIP (accountid, positiveinterest)
values (100261, .2);
insert into VIP (accountid, positiveinterest)
values (100262, .1);
insert into VIP (accountid, positiveinterest)
values (100263, .14);
insert into VIP (accountid, positiveinterest)
values (100264, .16);
insert into VIP (accountid, positiveinterest)
values (100265, .14);
insert into VIP (accountid, positiveinterest)
values (100266, .16);
insert into VIP (accountid, positiveinterest)
values (100267, .05);
insert into VIP (accountid, positiveinterest)
values (100268, .16);
insert into VIP (accountid, positiveinterest)
values (100269, .12);
insert into VIP (accountid, positiveinterest)
values (100270, .16);
insert into VIP (accountid, positiveinterest)
values (100271, .12);
insert into VIP (accountid, positiveinterest)
values (100272, .16);
insert into VIP (accountid, positiveinterest)
values (100273, .05);
insert into VIP (accountid, positiveinterest)
values (100274, .01);
insert into VIP (accountid, positiveinterest)
values (100275, .1);
insert into VIP (accountid, positiveinterest)
values (100276, .1);
insert into VIP (accountid, positiveinterest)
values (100277, .18);
insert into VIP (accountid, positiveinterest)
values (100278, .12);
insert into VIP (accountid, positiveinterest)
values (100279, .18);
insert into VIP (accountid, positiveinterest)
values (100280, .14);
insert into VIP (accountid, positiveinterest)
values (100281, .18);
insert into VIP (accountid, positiveinterest)
values (100282, .2);
insert into VIP (accountid, positiveinterest)
values (100283, .16);
insert into VIP (accountid, positiveinterest)
values (100284, .16);
insert into VIP (accountid, positiveinterest)
values (100285, .14);
insert into VIP (accountid, positiveinterest)
values (100286, .16);
insert into VIP (accountid, positiveinterest)
values (100287, .14);
insert into VIP (accountid, positiveinterest)
values (100288, .05);
insert into VIP (accountid, positiveinterest)
values (100289, .12);
insert into VIP (accountid, positiveinterest)
values (100290, .1);
insert into VIP (accountid, positiveinterest)
values (100291, .01);
insert into VIP (accountid, positiveinterest)
values (100292, .16);
insert into VIP (accountid, positiveinterest)
values (100293, .01);
insert into VIP (accountid, positiveinterest)
values (100294, .14);
insert into VIP (accountid, positiveinterest)
values (100295, .16);
insert into VIP (accountid, positiveinterest)
values (100296, .18);
insert into VIP (accountid, positiveinterest)
values (100297, .18);
insert into VIP (accountid, positiveinterest)
values (100298, .1);
insert into VIP (accountid, positiveinterest)
values (100299, .18);
commit;
prompt 300 records committed...
insert into VIP (accountid, positiveinterest)
values (100300, .1);
insert into VIP (accountid, positiveinterest)
values (100301, .12);
insert into VIP (accountid, positiveinterest)
values (100302, .12);
insert into VIP (accountid, positiveinterest)
values (100303, .14);
insert into VIP (accountid, positiveinterest)
values (100304, .12);
insert into VIP (accountid, positiveinterest)
values (100305, .01);
insert into VIP (accountid, positiveinterest)
values (100306, .1);
insert into VIP (accountid, positiveinterest)
values (100307, .12);
insert into VIP (accountid, positiveinterest)
values (100308, .2);
insert into VIP (accountid, positiveinterest)
values (100309, .12);
insert into VIP (accountid, positiveinterest)
values (100310, .1);
insert into VIP (accountid, positiveinterest)
values (100311, .05);
insert into VIP (accountid, positiveinterest)
values (100312, .14);
insert into VIP (accountid, positiveinterest)
values (100313, .18);
insert into VIP (accountid, positiveinterest)
values (100314, .1);
insert into VIP (accountid, positiveinterest)
values (100315, .05);
insert into VIP (accountid, positiveinterest)
values (100316, .1);
insert into VIP (accountid, positiveinterest)
values (100317, .12);
insert into VIP (accountid, positiveinterest)
values (100318, .1);
insert into VIP (accountid, positiveinterest)
values (100319, .05);
insert into VIP (accountid, positiveinterest)
values (100320, .05);
insert into VIP (accountid, positiveinterest)
values (100321, .05);
insert into VIP (accountid, positiveinterest)
values (100322, .18);
insert into VIP (accountid, positiveinterest)
values (100323, .16);
insert into VIP (accountid, positiveinterest)
values (100324, .12);
insert into VIP (accountid, positiveinterest)
values (100325, .18);
insert into VIP (accountid, positiveinterest)
values (100326, .12);
insert into VIP (accountid, positiveinterest)
values (100327, .01);
insert into VIP (accountid, positiveinterest)
values (100328, .1);
insert into VIP (accountid, positiveinterest)
values (100329, .01);
insert into VIP (accountid, positiveinterest)
values (100330, .16);
insert into VIP (accountid, positiveinterest)
values (100331, .16);
insert into VIP (accountid, positiveinterest)
values (100332, .2);
insert into VIP (accountid, positiveinterest)
values (100333, .01);
insert into VIP (accountid, positiveinterest)
values (100334, .12);
insert into VIP (accountid, positiveinterest)
values (100335, .14);
insert into VIP (accountid, positiveinterest)
values (100336, .2);
insert into VIP (accountid, positiveinterest)
values (100337, .18);
insert into VIP (accountid, positiveinterest)
values (100338, .14);
insert into VIP (accountid, positiveinterest)
values (100339, .16);
insert into VIP (accountid, positiveinterest)
values (100340, .01);
insert into VIP (accountid, positiveinterest)
values (100341, .16);
insert into VIP (accountid, positiveinterest)
values (100342, .18);
insert into VIP (accountid, positiveinterest)
values (100343, .01);
insert into VIP (accountid, positiveinterest)
values (100344, .14);
insert into VIP (accountid, positiveinterest)
values (100345, .12);
insert into VIP (accountid, positiveinterest)
values (100346, .14);
insert into VIP (accountid, positiveinterest)
values (100347, .14);
insert into VIP (accountid, positiveinterest)
values (100348, .16);
insert into VIP (accountid, positiveinterest)
values (100349, .1);
insert into VIP (accountid, positiveinterest)
values (100350, .1);
insert into VIP (accountid, positiveinterest)
values (100351, .12);
insert into VIP (accountid, positiveinterest)
values (100352, .01);
insert into VIP (accountid, positiveinterest)
values (100353, .14);
insert into VIP (accountid, positiveinterest)
values (100354, .1);
insert into VIP (accountid, positiveinterest)
values (100355, .18);
insert into VIP (accountid, positiveinterest)
values (100356, .16);
insert into VIP (accountid, positiveinterest)
values (100357, .1);
insert into VIP (accountid, positiveinterest)
values (100358, .18);
insert into VIP (accountid, positiveinterest)
values (100359, .01);
insert into VIP (accountid, positiveinterest)
values (100360, .01);
insert into VIP (accountid, positiveinterest)
values (100361, .16);
insert into VIP (accountid, positiveinterest)
values (100362, .2);
insert into VIP (accountid, positiveinterest)
values (100363, .16);
insert into VIP (accountid, positiveinterest)
values (100364, .14);
insert into VIP (accountid, positiveinterest)
values (100365, .16);
insert into VIP (accountid, positiveinterest)
values (100366, .05);
insert into VIP (accountid, positiveinterest)
values (100367, .05);
insert into VIP (accountid, positiveinterest)
values (100368, .05);
insert into VIP (accountid, positiveinterest)
values (100369, .01);
insert into VIP (accountid, positiveinterest)
values (100370, .12);
insert into VIP (accountid, positiveinterest)
values (100371, .05);
insert into VIP (accountid, positiveinterest)
values (100372, .18);
insert into VIP (accountid, positiveinterest)
values (100373, .01);
insert into VIP (accountid, positiveinterest)
values (100374, .14);
insert into VIP (accountid, positiveinterest)
values (100375, .16);
insert into VIP (accountid, positiveinterest)
values (100376, .18);
insert into VIP (accountid, positiveinterest)
values (100377, .1);
insert into VIP (accountid, positiveinterest)
values (100378, .1);
insert into VIP (accountid, positiveinterest)
values (100379, .01);
insert into VIP (accountid, positiveinterest)
values (100380, .14);
insert into VIP (accountid, positiveinterest)
values (100381, .12);
insert into VIP (accountid, positiveinterest)
values (100382, .2);
insert into VIP (accountid, positiveinterest)
values (100383, .16);
insert into VIP (accountid, positiveinterest)
values (100384, .18);
insert into VIP (accountid, positiveinterest)
values (100385, .14);
insert into VIP (accountid, positiveinterest)
values (100386, .12);
insert into VIP (accountid, positiveinterest)
values (100387, .18);
insert into VIP (accountid, positiveinterest)
values (100388, .18);
insert into VIP (accountid, positiveinterest)
values (100389, .2);
insert into VIP (accountid, positiveinterest)
values (100390, .16);
insert into VIP (accountid, positiveinterest)
values (100391, .16);
insert into VIP (accountid, positiveinterest)
values (100392, .14);
insert into VIP (accountid, positiveinterest)
values (100393, .14);
insert into VIP (accountid, positiveinterest)
values (100394, .2);
insert into VIP (accountid, positiveinterest)
values (100395, .1);
insert into VIP (accountid, positiveinterest)
values (100396, .16);
insert into VIP (accountid, positiveinterest)
values (100397, .16);
insert into VIP (accountid, positiveinterest)
values (100398, .14);
insert into VIP (accountid, positiveinterest)
values (100399, .12);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for ACCOUNT...
alter table ACCOUNT enable constraint FK_ACCOUNT;
prompt Enabling foreign key constraints for BLACKLIST...
alter table BLACKLIST enable constraint FK_BLACKLIST;
prompt Enabling foreign key constraints for DIRECTDEBIT...
alter table DIRECTDEBIT enable constraint FK_DIRECTDEBIT;
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
prompt Enabling triggers for DIRECTDEBIT...
alter table DIRECTDEBIT enable all triggers;
prompt Enabling triggers for REL5...
alter table REL5 enable all triggers;
prompt Enabling triggers for TRANSACTIONS...
alter table TRANSACTIONS enable all triggers;
prompt Enabling triggers for VIP...
alter table VIP enable all triggers;

set feedback on
set define on
prompt Done
