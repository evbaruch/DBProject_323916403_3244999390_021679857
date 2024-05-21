
[General]
Version=1

[Preferences]
Username=
Password=2457
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=ACCOUNT
Count=400..500

[Record]
Name=ACCOUNTID
Type=NUMBER
Size=38
Data=Sequence(100000, [1], [999999])
Master=

[Record]
Name=BALANCE
Type=NUMBER
Size=32
Data=Random(-50000, 100000)
Master=

[Record]
Name=DATEOPENED
Type=DATE
Size=
Data=SQL(SELECT TO_DATE('2000-01-01', 'YYYY-MM-DD') + (TO_DATE('2022-12-31', 'YYYY-MM-DD') - TO_DATE('2000-01-01', 'YYYY-MM-DD')) * DBMS_RANDOM.VALUE
=FROM dual)
Master=

[Record]
Name=ACCOUNTSTATUS
Type=VARCHAR2
Size=20
Data=List('regular', 'closed', 'minor', 'soldier', 'student', 'elderly', 'foreign')
Master=

[Record]
Name=BRANCHID
Type=NUMBER
Size=38
Data=Sequence(100, 1, 999)
Master=

