
[General]
Version=1

[Preferences]
Username=
Password=2800
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=BLACKLIST
Count=400

[Record]
Name=ACCOUNTID
Type=NUMBER
Size=38
Data=Sequence(100100, [1], [100400])
Master=

[Record]
Name=NEGETIVEINTEREST
Type=FLOAT
Size=22
Data=List('0.01', '0.05','0.1','0.12','0.14','0.16','0.18','0.2')
Master=

[Record]
Name=MINIMUMMINUS
Type=NUMBER
Size=
Data=Random(-10000, 0)
Master=

