
[General]
Version=1

[Preferences]
Username=
Password=2672
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=DIRECTDEBIT
Count=400

[Record]
Name=IDDEBIT
Type=NUMBER
Size=38
Data=Sequence(1000000, [1], [9999999])
Master=

[Record]
Name=STARTDATE
Type=DATE
Size=
Data=SQL(SELECT TO_DATE('2000-01-01', 'YYYY-MM-DD') + (TO_DATE('2022-12-31', 'YYYY-MM-DD') - TO_DATE('2000-01-01', 'YYYY-MM-DD')) * DBMS_RANDOM.VALUE
=FROM dual)
Master=

[Record]
Name=TYPEDEBIT
Type=VARCHAR2
Size=20
Data=List('weekly','monthly','monthly','monthly','monthly','yearly','yearly')
Master=

[Record]
Name=AMOUNT
Type=NUMBER
Size=
Data=SQL(
=  SELECT ROUND(3000 + 1000 * DBMS_RANDOM.NORMAL) FROM dual
=)
Master=

[Record]
Name=ACCOUNTID
Type=NUMBER
Size=38
Data=List(select accountid from account) 
Master=

