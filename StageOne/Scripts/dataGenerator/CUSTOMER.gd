
[General]
Version=1

[Preferences]
Username=
Password=2734
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=CUSTOMER
Count=400

[Record]
Name=CUSTOMERID
Type=NUMBER
Size=38
Data=Sequence(1000000, [1], [9999999])
Master=

[Record]
Name=FIRSTNAME
Type=VARCHAR2
Size=20
Data=FirstName
Master=

[Record]
Name=LASTNAME
Type=VARCHAR2
Size=20
Data=LastName
Master=

[Record]
Name=DATEOFBIRTH
Type=DATE
Size=
Data=SQL(SELECT TO_DATE('2000-01-01', 'YYYY-MM-DD') + (TO_DATE('2022-12-31', 'YYYY-MM-DD') - TO_DATE('2000-01-01', 'YYYY-MM-DD')) * DBMS_RANDOM.VALUE
=FROM dual)
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=20
Data=Address1
Master=

[Record]
Name=CONTACTNUMBER
Type=NUMBER
Size=
Data=Random(972500000, 972599999)
Master=

[Record]
Name=EMAIL
Type=VARCHAR2
Size=40
Data=Email
Master=

