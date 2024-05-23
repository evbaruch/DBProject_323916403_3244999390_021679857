
[General]
Version=1

[Preferences]
Username=
Password=2600
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=BRANCH
Count=400

[Record]
Name=BRANCHID
Type=NUMBER
Size=38
Data=Sequence(100, [1], [999])
Master=

[Record]
Name=BRANCHNAME
Type=VARCHAR2
Size=20
Data=LastName
Master=

[Record]
Name=BRANCHADDRESS
Type=VARCHAR2
Size=20
Data=Address1
Master=

[Record]
Name=BRANCHPHONENUMBER
Type=NUMBER
Size=
Data=Random(972500000, 972599999)
Master=

