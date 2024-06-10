   ALTER TABLE Customer
   ADD CONSTRAINT UniqueEmail UNIQUE (Email);
   
   
   ALTER TABLE Account
   MODIFY AccountStatus VARCHAR2(20) DEFAULT 'regular';
   
   
    ALTER TABLE Transactions
   ADD CONSTRAINT CheckAmount CHECK (Amount > 0)
