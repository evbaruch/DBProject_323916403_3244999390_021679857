
[General]
Version=1

[Preferences]
Username=
Password=2222
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=VIP
Count=50

[Record]
Name=ACCOUNTID
Type=NUMBER
Size=38
Data=Sequence(100000, [1], [100400])
Master=

[Record]
Name=POSITIVEINTEREST
Type=FLOAT
Size=22
Data=List('0.01', '0.05','0.1','0.12','0.14','0.16','0.18','0.2')
Master=
