
[General]
Version=1

[Preferences]
Username=
Password=2015
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=REL5
Count=2000

[Record]
Name=CUSTOMERID
Type=NUMBER
Size=38
Data=List(select customerid from customer)
Master=

[Record]
Name=ACCOUNTID
Type=NUMBER
Size=38
Data=List(select ACCOUNTID from ACCOUNT)
Master=

