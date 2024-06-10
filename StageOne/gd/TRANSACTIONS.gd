
[General]
Version=1

[Preferences]
Username=
Password=2160
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=TRANSACTIONS
Count=5000

[Record]
Name=TRANSACTIONID
Type=NUMBER
Size=38
Data=Sequence(10000000, [1], [99999999])
Master=

[Record]
Name=TRANSACTIONTYPE
Type=VARCHAR2
Size=20
Data=List('Bill payment','Transactions','Check','Transfer','ATM')
Master=

[Record]
Name=AMOUNT
Type=NUMBER
Size=
Data=Random(10, 10000)
Master=

[Record]
Name=TRANSACTIONDATE
Type=DATE
Size=
Data=SQL(SELECT TO_DATE('2000-01-01', 'YYYY-MM-DD') + (TO_DATE('2022-12-31', 'YYYY-MM-DD') - TO_DATE('2000-01-01', 'YYYY-MM-DD')) * DBMS_RANDOM.VALUE
=FROM dual)
Master=

[Record]
Name=ACCOUNTID
Type=NUMBER
Size=38
Data=List(select accountid from account) 
Master=

