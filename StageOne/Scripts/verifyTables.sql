Table Customer exists. Its structure is:
CUSTOMERID NUMBER(22)
FIRSTNAME VARCHAR2(20)
LASTNAME VARCHAR2(20)
DATEOFBIRTH TIMESTAMP(6)(11)
ADDRESS VARCHAR2(20)
CONTACTNUMBER NUMBER(22)
EMAIL VARCHAR2(40)
-------------------------
Table Account exists. Its structure is:
ACCOUNTID NUMBER(22)
BALANCE NUMBER(22)
DATEOPENED TIMESTAMP(6)(11)
ACCOUNTSTATUS VARCHAR2(20)
BRANCHID NUMBER(22)
-------------------------
Table Transactions exists. Its structure is:
TRANSACTIONID NUMBER(22)
ACCOUNTID NUMBER(22)
TRANSACTIONTYPE VARCHAR2(20)
AMOUNT NUMBER(22)
TRANSACTIONDATE TIMESTAMP(6)(11)
ACCOUNTID1 NUMBER(22)
-------------------------
Table DirectDebit exists. Its structure is:
IDDEBIT NUMBER(22)
STARTDATE TIMESTAMP(6)(11)
TYPEDEBIT VARCHAR2(20)
AMOUNT NUMBER(22)
IDACCOUNT NUMBER(22)
ACCOUNTID NUMBER(22)
-------------------------
Table Rel5 exists. Its structure is:
CUSTOMERID NUMBER(22)
ACCOUNTID NUMBER(22)
-------------------------
Table BlackList exists. Its structure is:
ACCOUNTID NUMBER(22)
NEGETIVEINTEREST FLOAT(22)
MINIMUMMINUS NUMBER(22)
-------------------------
Table Vip exists. Its structure is:
ACCOUNTID NUMBER(22)
POSITIVEINTEREST FLOAT(22)
-------------------------
Table Branch exists. Its structure is:
BRANCHID NUMBER(22)
BRANCHNAME VARCHAR2(20)
BRANCHADDRESS VARCHAR2(20)
BRANCHPHONENUMBER NUMBER(22)
-------------------------