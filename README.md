# databases

### presented by: **Account Department**

- head of team: **Evyatar Baruch**
- head scientist: **Ephraim Levi**
- head of database: **Yehuda Pilant**

## Table of Contents

[Stage One](#stage-one)

1. [Description of the Organization](#description-of-the-organization)

2. [Entity-Relationship Diagram (ERD)](#entity-relationship-diagram-erd)

3. [Data Structure Diagram (DSD)](#data-structure-diagram-dsd)

4. [Database Schema](#database-schema)
   <details>
   <summary>Subsections</summary>

   - [Customer](#customer)
   - [Account](#account)
   - [Transaction](#transaction)
   - [Branch](#branch)
   - [Direct Debit](#directdebit)
   - [VIP](#vip-inherits-from-customer)
   - [Blacklist](#blacklist-inherits-from-customer)

   </details>

5. [Relationships](#relationships)

6. [Third Normal Form (3NF)](#third-normal-form-3nf)

7. [Create Table Script](#create-table-script)
   <details>
   <summary>Subsections</summary>

   - [DESC Command](#desc-command)
   - [Tables](#tables)

   </details>

8. [Data Entry](#data-entry)

9. [Drop Table Script](#drop-table-script)

10. [Backup and Test](#backup-and-test)

[Stage Two](#stage-two)

1. [Alters](#alters)

2. [Parameterless Queries](#parameterless-queries)
   <details>
   <summary>Subsections</summary>

   - [4 Select Queries](#4-select-queries)
   - [2 Delete Queries](#2-delete)
   - [2 Update Queries](#2-update)

   </details>

3. [Parameterized Queries](#parameterized-queries)

4. [Constraints](#constraints)
   <details>
   <summary>Subsections</summary>

   - [NOT NULL Constraint](#not-null-constraint)
   - [UNIQUE Constraint](#unique-constraint)
   - [DEFAULT Constraint](#default-constraint)
   - [CHECK Constraint](#check-constraint)

   </details>

# Stage One

## Description of the Organization

The organization under consideration is a banking institution known as XYZ Bank. XYZ Bank is a reputable financial institution with a wide range of services catering to individuals, businesses, and organizations. Established in [year], XYZ Bank has been serving customers for [number] years, providing comprehensive banking solutions, including savings and checking accounts, loans, investments, and financial advisory services.

XYZ Bank operates through a network of branches strategically located across [region/country], ensuring accessibility and convenience for its customers. With a strong focus on customer satisfaction, XYZ Bank prides itself on delivering exceptional banking experiences and personalized services to meet the diverse needs of its clientele.

In addition to its traditional banking services, XYZ Bank has embraced technological advancements to offer online banking platforms and mobile applications, allowing customers to manage their accounts, conduct transactions, and access banking services conveniently from anywhere, at any time.

Overall, XYZ Bank is committed to upholding the highest standards of integrity, professionalism, and innovation in the banking industry, striving to be the preferred financial partner for individuals and businesses alike.

## Entity-Relationship Diagram (ERD)

The Entity-Relationship Diagram (ERD) for the Accounts wing of XYZ Bank illustrates the entities and their relationships within the database schema.

![Project Photo](StageOne/Images/ERD-nonWeak.png)

![dds-lite](<StageOne/Images/ERD(dds-lite).png>)

## Database Schema

### Customer

- The Customer entity represents the bank's customers who hold accounts with the bank.

  **Attributes:**

  - **CustomerID (Primary Key):** Unique identifier for the customer.
  - **FirstName:** First name of the customer.
  - **LastName:** Last name of the customer.
  - **DateOfBirth:** Date of birth of the customer.
  - **Address:** Address of the customer.
  - **ContactNumber:** Contact number of the customer.
  - **Email:** Email address of the customer.

### Account

- The Account entity represents the bank accounts held by customers.

  **Attributes:**

  - **AccountID (Primary Key):** Unique identifier for the account.
  - **Balance:** Current balance of the account.
  - **DateOpened:** Date when the account was opened.
  - **AccountStatus:** Status of the account (e.g., active, closed).

### Transaction

- The Transaction entity represents the transactions associated with customer accounts.

  **Attributes:**

  - **TransactionID (Primary Key):** Unique identifier for the transaction.
  - **AccountID (Foreign Key):** References the AccountID of the associated account.
  - **TransactionType:** Type of the transaction (e.g., deposit, withdrawal).
  - **Amount:** Amount involved in the transaction.
  - **TransactionDate:** Date when the transaction occurred.

### Branch

- The Branch entity represents the bank branches where customers can access banking services.

  **Attributes:**

  - **BranchID (Primary Key):** Unique identifier for the branch.
  - **BranchName:** Name of the branch.
  - **BranchAddress:** Address of the branch.
  - **BranchPhoneNumber:** Phone number of the branch.

### DirectDebit

- The DirectDebit entity represents the direct debit arrangements set up by customers for recurring payments.

  **Attributes:**

  - **IDDebit (Primary Key):** Unique identifier for the direct debit.
  - **StartDate:** Start date of the direct debit.
  - **TypeDebit:** Type of the direct debit.
  - **Amount:** Amount of the direct debit.
  - **IDAccount (Foreign Key):** References the AccountID of the associated account.
  - **IDBranch (Foreign Key):** References the BranchID of the associated branch.

### Vip (Inherits from Customer)

- The Vip entity represents VIP customers who have special privileges and benefits.

  **Attributes:**

  - Inherits all attributes from Customer.
  - **PositiveInterest:** Interest rate applied to VIP accounts.

### BlackList (Inherits from Customer)

- The BlackList entity represents customers who have been blacklisted due to certain reasons.

  **Attributes:**

  - Inherits all attributes from Customer.
  - **NegetiveInterest:** Interest rate applied to BlackList accounts.
  - **MinimumMinus:** Minimum balance allowed for BlackList accounts.

## Relationships

- **Customer and Account:** Many-to-Many (A customer can have multiple accounts and an account can belong to multiple customers).
- **Account and Transaction:** One-to-Many (An account can have multiple transactions but a transaction belongs to only one account).
- **Branch and Account:** One-to-Many (A branch can have multiple accounts but an account belongs to only one branch).
- **Account and DirectDebit:** One-to-Many (An account can have multiple direct debits but a direct debit belongs to only one account).
- **Customer** is the superclass of **Vip** and **BlackList**. These entities inherit attributes from the Customer entity.

## Data Structure Diagram (DSD)

The Data Structure Diagram (DSD) is derived from the Entity-Relationship Diagram (ERD) and represents the logical structure of the database. It outlines the tables, fields, and relationships in a hierarchical manner.

| Account       | Data Type  | Nullability |
| ------------- | ---------- | ----------- |
| AccountID     | NUMBER(38) | NOT NULL    |
| Balance       | NUMBER     | NOT NULL    |
| DateOpened    | DATE       | NOT NULL    |
| AccountStatus | VARCHAR2   | NOT NULL    |
| BranchID      | NUMBER(38) |             |

| Customer      | Data Type  | Nullability |
| ------------- | ---------- | ----------- |
| CustomerID    | NUMBER(38) | NOT NULL    |
| FirstName     | VARCHAR2   | NOT NULL    |
| LastName      | VARCHAR2   | NOT NULL    |
| DateOfBirth   | DATE       | NOT NULL    |
| Address       | VARCHAR2   | NOT NULL    |
| ContactNumber | NUMBER     | NOT NULL    |
| Email         | VARCHAR2   | NOT NULL    |

| Transaction     | Data Type  | Nullability |
| --------------- | ---------- | ----------- |
| TransactionID   | NUMBER(38) | NOT NULL    |
| TransactionType | VARCHAR2   | NOT NULL    |
| Amount          | NUMBER     | NOT NULL    |
| TransactionDate | DATE       | NOT NULL    |
| AccountID       | NUMBER(38) |             |

| Branch            | Data Type  | Nullability |
| ----------------- | ---------- | ----------- |
| BranchID          | NUMBER(38) | NOT NULL    |
| BranchName        | VARCHAR2   | NOT NULL    |
| BranchAddress     | VARCHAR2   | NOT NULL    |
| BranchPhoneNumber | NUMBER     | NOT NULL    |

| DirectDebit | Data Type  | Nullability |
| ----------- | ---------- | ----------- |
| IDDebit     | NUMBER(38) | NOT NULL    |
| StartDate   | DATE       | NOT NULL    |
| TypeDebit   | VARCHAR2   | NOT NULL    |
| Amount      | NUMBER     | NOT NULL    |
| AccountID   | NUMBER(38) |             |

| Vip                                | Data Type  | Nullability |
| ---------------------------------- | ---------- | ----------- |
| AccountID (Inherits from Customer) | NUMBER(38) | NOT NULL    |
| PositiveInterest                   | FLOAT      | NOT NULL    |

| BlackList                          | Data Type  | Nullability |
| ---------------------------------- | ---------- | ----------- |
| AccountID (Inherits from Customer) | NUMBER(38) | NOT NULL    |
| NegetiveInterest                   | FLOAT      | NOT NULL    |
| MinimumMinus                       | NUMBER     | NOT NULL    |

| Rel5       | Data Type  | Nullability |
| ---------- | ---------- | ----------- |
| CustomerID | NUMBER(38) | NOT NULL    |
| AccountID  | NUMBER(38) | NOT NULL    |

![part-one](StageOne/Images/Desc_part_1.png)
![part-two](StageOne/Images/Desc_part_2.png)

### tables

> The tables in the database are as follows:
> ![tables](StageOne/Images/tables.bmp)

## Data Entry

> The data entry process involves inserting records into the tables of the database. This can be done manually or through automated scripts.

[here](StageOne/StageOne/Scripts/insertTables.sql)

### data generator images

#### Costumer Table

> ![Costumer Table](StageOne/Images/insertTabls/DataGenerator/Customer/DataGeneratorCustomerInit.png)

> ![Costumer Table](StageOne/Images/insertTabls/DataGenerator/Customer/DataGeneratorCustomerSql.png)

#### Account Table

> ![Account Table](StageOne/Images/insertTabls/DataGenerator/Account/DataGeneratorAccountInit.png)

> ![Account Table](StageOne/Images/insertTabls/DataGenerator/Account/DataGeneratorAccountSql.png)

#### Transaction Table

> ![Transaction Table](StageOne/Images/insertTabls/DataGenerator/Transactions/DataGeneratorTransactionsInit.png)

> ![Transaction Table](StageOne/Images/insertTabls/DataGenerator/Transactions/DataGeneratorTransactionsSql.png)

#### Branch Table

> ![Branch Table](StageOne/Images/insertTabls/DataGenerator/Branch/DataGeneratorBrachInit.png)

> ![Branch Table](StageOne/Images/insertTabls/DataGenerator/Branch/DataGeneratorBranchSql.png)

#### Direct Debit Table

> ![Direct Debit Table](StageOne/Images/insertTabls/DataGenerator/DirectDebit/DataGeneratorDirectDebitInit.png)

> ![Direct Debit Table](StageOne/Images/insertTabls/DataGenerator/DirectDebit/DataGeneratorDirectDebitSql.png)

#### VIP Table

> ![VIP Table](StageOne/Images/insertTabls/DataGenerator/Vip/DataGeneratorVIPInit.png)

> ![VIP Table](StageOne/Images/insertTabls/DataGenerator/Vip/DataGeneratorVIPSql.png)

#### BlackList Table

> ![BlackList Table](StageOne/Images/insertTabls/DataGenerator/BlackList/DataGeneratorBlackListInit.png)

> ![BlackList Table](StageOne/Images/insertTabls/DataGenerator/BlackList/DataGeneratorBlackListSql.png)

#### Rel5 Table

> ![Rel5 Table](StageOne/Images/insertTabls/DataGenerator/Rel5/DataGeneratorRel5Init.png)

> ![Rel5 Table](StageOne/Images/insertTabls/DataGenerator/Rel5/DataGeneratorRel5Sql.png)

### Mockaroo images

#### Direct Debit Table

> ![Direct Debit Table](StageOne/Images/insertTabls/Mockaroo/DirectDebit/MockarooDirectDebitDefine.png)

> ![Direct Debit Table](StageOne/Images/insertTabls/Mockaroo/DirectDebit/MockarooDirectDebitPreview.png)

#### Transaction Table

> ![Transaction Table](StageOne/Images/insertTabls/Mockaroo/Transactions/MockarooTransactionsDefine.png)

> ![Transaction Table](StageOne/Images/insertTabls/Mockaroo/Transactions/MockarooTransactionsPreview.png)

## Drop Table Script

> The drop table script is used to remove tables from the database. It includes the table name and the command to drop the table.

[here](StageOne/StageOne/Scripts/dropTables.sql)

## Backup and Test

> The backup and test process involves creating a backup of the database and testing the database to ensure that it is functioning correctly.

- Backup SQL script:
  [here](StageOne/Scripts/backupSql.sql)

- Backup PL/SQL script:
  [here](StageOne/Scripts/backupPlSql.sql)

- Backup pde script:
  [here](StageOne/Scripts/backupPLSQL.pde)

# Stage Two

## alters

1. **Alter the Rel5 Table Name:**

   The Rel5 table is used to establish a many-to-many relationship between the Customer and Account tables. However, the name "Rel5" does not provide meaningful information about the relationship it represents. To improve clarity and maintain consistency in naming conventions, the table name can be altered to a more descriptive name, such as "Relationship."

   ```sql
   ALTER TABLE Rel5 RENAME TO Relationship;
   ```

## parameterless queries

### 4 select queries

1. **Query 1:**

   Story: The bank wants to identify customers who have account balances greater than the 90th percentile balance for each branch. This information can help the bank identify high-balance customers and offer them personalized services or investment opportunities.

   sql explanation: The query retrieves the first name, last name, account balance, branch name, and branch address for customers who have account balances greater than the 90th percentile balance for each branch. The subquery calculates the 90th percentile balance for each branch using the PERCENTILE_DISC function within a group. The main query filters customers based on their account balances exceeding the calculated 90th percentile balance for their respective branches.

   syntax explanation: The query uses the SELECT statement to retrieve specific columns from the Customer, Account, and Branch tables. It includes a correlated subquery within the WHERE clause to filter customers based on their account balances exceeding the 90th percentile balance for each branch. The results are ordered by account balance in descending order.

   ```sql
   SELECT c.FirstName, c.LastName, a.Balance, b.BranchName, b.BranchAddress
   FROM Customer c JOIN Relationship r ON c.CustomerID = r.CustomerID JOIN Account a ON r.AccountID = a.AccountID JOIN Branch b ON a.BranchID = b.BranchID
   WHERE a.Balance > (
         SELECT PERCENTILE_DISC(0.9) WITHIN GROUP (ORDER BY a2.Balance) -- Calculate the 90th percentile balance for each branch
         FROM Account a2
         WHERE a2.BranchID = a.BranchID
       )
   ORDER BY
     a.Balance DESC;
   ```

   ![image](StageTwo/Photos/select1.png)

   file: [here](StageTwo/select1.sql)

2. **Query 2:**

   Story: The bank wants to generate a report of transactions made by customers within the last 24 months. This report should include the customer's first name, last name, transaction date, transaction type, and transaction amount. The bank can use this information to analyze customer transaction patterns and identify trends.

   sql explanation: The query retrieves the first name, last name, transaction date, transaction type, and amount for transactions made by customers within the last 24 months. It joins the Transactions, Account, Relationship, and Customer tables to link transactions to customers. The WHERE clause filters transactions based on the transaction date falling within the specified date range. The results are ordered by customer last name, first name, and transaction date in descending order.

   syntax explanation: The query uses the SELECT statement to retrieve specific columns from the Transactions, Account, Relationship, and Customer tables. It includes JOIN operations to link transactions to customers through the Account and Relationship tables. The WHERE clause filters transactions based on the transaction date falling within the last 24 months. The results are ordered by customer last name, first name, and transaction date in descending order.

   ```sql
   SELECT  c.FirstName, c.LastName, t.TransactionDate, t.TransactionType, t.Amount
   FROM Transactions t JOIN Account a ON t.AccountID = a.AccountID JOIN Relationship r ON a.AccountID = r.AccountID JOIN Customer c ON r.CustomerID = c.CustomerID
   WHERE t.TransactionDate BETWEEN ADD_MONTHS(SYSDATE, -24) AND SYSDATE
   ORDER BY c.LastName, c.FirstName, t.TransactionDate DESC;
   ```

   ![image](StageTwo/Photos/select2.png)

   file: [here](StageTwo/select2.sql)

3. **Query 3:**

   ```sql
   SELECT b.BranchName, b.BranchAddress, SUM(a.Balance) AS TotalBalance, COUNT(a.AccountID) AS AccountCount
   FROM Branch b JOIN  Account a ON b.BranchID = a.BranchID
   WHERE a.DateOpened BETWEEN ADD_MONTHS(SYSDATE, -24) AND SYSDATE
   GROUP BY b.BranchName, b.BranchAddress
   ORDER BY TotalBalance DESC;
   ```

   ![image](StageTwo/Photos/select3.png)

   file: [here](StageTwo/select3.sql)

4. **Query 4:**

   Story: The bank wants to identify customers who have VIP accounts but have not made any transactions. This information can help the bank identify inactive VIP customers and reach out to them to encourage account activity.

   sql explanation: The query retrieves the first name, last name, account balance, and positive interest rate for VIP customers who have not made any transactions. It joins the Customer, Relationship, Account, and VIP tables to link customers to their VIP accounts. The WHERE clause uses a NOT EXISTS subquery to filter customers who have no transactions associated with their accounts. The results are ordered by customer last name and first name.

   syntax explanation: The query uses the SELECT statement to retrieve specific columns from the Customer, Account, and VIP tables. It includes JOIN operations to link customers to their VIP accounts through the Relationship table. The WHERE clause uses a NOT EXISTS subquery to filter customers who have no transactions associated with their accounts. The results are ordered by customer last name and first name.

   ```sql
   SELECT c.FirstName, c.LastName, a.Balance, v.PositiveInterest
   FROM Customer c JOIN Relationship r ON c.CustomerID = r.CustomerID JOIN Account a ON r.AccountID = a.AccountID JOIN Vip v ON a.AccountID = v.AccountID
   WHERE NOT EXISTS (
       SELECT 1
       FROM Transactions t
       WHERE t.AccountID = a.AccountID
   )
   ORDER BY c.LastName, c.FirstName;
   ```

   ![image](StageTwo/Photos/select4.png)

   file: [here](StageTwo/select4.sql)

### 2 delete

1. **Delete Query 1:**

   Story: The bank wants to remove customers from the blacklist whose negative interest rates are below the 25th percentile negative interest rate. This action is necessary to maintain an updated blacklist of customers with significant negative balances.

   sql explanation: The query deletes customers from the BlackList table whose negative interest rates are below the 25th percentile negative interest rate. It uses a subquery to calculate the 25th percentile negative interest rate within the BlackList table and filters customers based on their negative interest rates being lower than the calculated threshold.

   syntax explanation: The query uses the DELETE statement to remove records from the BlackList table based on a specified condition. It includes a subquery to calculate the 25th percentile negative interest rate within the BlackList table. The WHERE clause filters customers based on their negative interest rates being lower than the calculated threshold.

   ```sql
   DELETE FROM BlackList
   WHERE NEGETIVEINTEREST < (
       SELECT PERCENTILE_DISC(0.25) WITHIN GROUP (ORDER BY NEGETIVEINTEREST) -- Calculate the 25th percentile negative interest
       FROM
       BlackList
       );
   ```

   ![image](StageTwo/Photos/delete1.png)

   This query deletes customers from the BlackList table whose negative interest rates are below the 25th percentile negative interest rate. It uses a subquery to calculate the 25th percentile negative interest rate within the BlackList table and filters customers based on their negative interest rates being lower than the calculated threshold.

   file: [here](StageTwo/delete1.sql)

2. **Delete Query 2:**

   Story: The bank wants to remove direct debit arrangements for accounts that are closed. This action is necessary to ensure that direct debits are not processed for accounts that are no longer active.

   sql explanation: The query deletes direct debit arrangements from the DirectDebit table for accounts that are closed. It uses a subquery to retrieve AccountIDs of closed accounts from the Account table and filters direct debits based on the associated AccountIDs.

   syntax explanation: The query uses the DELETE statement to remove records from the DirectDebit table based on a specified condition. It includes a subquery to retrieve AccountIDs of closed accounts from the Account table. The WHERE clause filters direct debits based on the associated AccountIDs of closed accounts.

   ```sql
   DELETE FROM DirectDebit
   WHERE AccountID IN (
       SELECT AccountID
       FROM Account
       WHERE AccountStatus = 'closed'
       );
   ```

   ![image](StageTwo/Photos/delete2.png)

   This query deletes direct debit arrangements from the DirectDebit table for accounts that are closed. It uses a subquery to retrieve AccountIDs of closed accounts from the Account table and filters direct debits based on the associated AccountIDs.

   file: [here](StageTwo/delete2.sql)

### 2 update

1. **Update Query 1:**

   story: The bank wants to update the contact numbers of customers who have accounts opened more than 20 years ago. This update is necessary to ensure that customer contact information is up-to-date and accurate.

   sql explanation: The query updates the contact numbers of customers who have accounts opened more than 20 years ago. It uses a subquery to retrieve CustomerIDs of customers with accounts opened before the specified date and updates their contact numbers.

   syntax explanation: The query uses the UPDATE statement to modify the contact numbers of customers based on a specified condition. It includes a subquery to retrieve CustomerIDs of customers with accounts opened more than 20 years ago. The SET clause updates the contact numbers for those customers.

   ```sql
   UPDATE Customer
   SET ContactNumber = '0000000000'
   WHERE CustomerID IN (
                         SELECT c.CustomerID
                         FROM Customer c JOIN Relationship r ON c.CustomerID = r.CustomerID JOIN Account a ON r.AccountID = a.AccountID
                         WHERE a.DateOpened < ADD_MONTHS(SYSDATE, -240)
                         );

   ```

   ![image](StageTwo/Photos/update1.png)

   This query updates the contact numbers of customers who have accounts opened more than 20 years ago. It uses a subquery to retrieve CustomerIDs of customers with accounts opened before the specified date and updates their contact numbers.

   file: [here](StageTwo/update1.sql)

2. **Update Query 2:**

   Story: The bank wants to increase the positive interest rates for VIP customers who have maintained high balances and made significant transactions in the last 24 months. This update is intended to reward loyal customers and encourage them to continue their banking activities.

   sql explanation: The query updates the PositiveInterest attribute for VIP customers who have maintained high balances and made significant transactions in the last 24 months. It uses a subquery to retrieve AccountIDs of customers who meet the specified criteria and increments their PositiveInterest by 0.5.

   syntax explanation: The query uses the UPDATE statement to modify the PositiveInterest attribute for VIP customers based on a specified condition. It includes a subquery to retrieve AccountIDs of customers who have maintained high balances and made significant transactions in the last 24 months. The SET clause increments the PositiveInterest by 0.5 for those customers.

   ```sql
   UPDATE Vip
   SET PositiveInterest = PositiveInterest + 0.5
   WHERE AccountID IN (
                       SELECT a.AccountID
                       FROM Account a JOIN Transactions t ON a.AccountID = t.AccountID
                       WHERE a.Balance > 10000 AND t.TransactionDate BETWEEN ADD_MONTHS(SYSDATE, -24) AND SYSDATE
                       );
   ```

   ![image](StageTwo/Photos/update2.png)

   This query updates the PositiveInterest attribute for VIP customers who have maintained high balances and made significant transactions in the last 24 months. It uses a subquery to retrieve AccountIDs of customers who meet the specified criteria and increments their PositiveInterest by 0.5.

   file: [here](StageTwo/update2.sql)

## parameterized queries

1. **Query 1:**

   Story: The bank wants to identify VIP customers who have made a significant number of transactions above a certain amount within a given date range. This information can be used to offer special promotions or rewards to these valuable customers.

   ```sql
   SELECT v.AccountID, c.FirstName || ' ' || c.LastName AS CustomerName, v.PositiveInterest,
      (SELECT COUNT(*)
      FROM Transactions t
      WHERE t.AccountID = v.AccountID
      AND t.Amount > &<name = "min Transaction Amount" hint = "Specify the minimum transaction amount">
      AND t.TransactionDate BETWEEN TO_DATE('&<name="Start Date" type="date" list="SELECT TO_CHAR(TransactionDate, 'YYYY-MM-DD') FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate) WHERE ROWNUM <= (SELECT MAX(ROWNUM) FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate))" hint = "Select the start date for the date range">', 'YYYY-MM-DD') AND TO_DATE('&<name="End Date" type="date" list="SELECT TO_CHAR(TransactionDate, 'YYYY-MM-DD') FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate) WHERE ROWNUM <= (SELECT MAX(ROWNUM) FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate))"  hint = "Select the end date for the date range">', 'YYYY-MM-DD')) AS TransactionCount
      FROM Vip v
      JOIN Relationship r ON v.AccountID = r.AccountID
      JOIN Customer c ON r.CustomerID = c.CustomerID
      WHERE EXISTS (
                     SELECT 1
                     FROM Transactions t
                     WHERE t.AccountID = v.AccountID
                     AND t.Amount > &<name = "min Transaction Amount" hint = "Specify the minimum transaction amount">
                     AND t.TransactionDate BETWEEN TO_DATE('&<name="Start Date" type="date" list="SELECT TO_CHAR(TransactionDate, 'YYYY-MM-DD') FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate) WHERE ROWNUM <= (SELECT MAX(ROWNUM) FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate))" hint = "Select the start date for the date range">', 'YYYY-MM-DD') AND TO_DATE('&<name="End Date" type="date" list="SELECT TO_CHAR(TransactionDate, 'YYYY-MM-DD') FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate) WHERE ROWNUM <= (SELECT MAX(ROWNUM) FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate))"  hint = "Select the end date for the date range">', 'YYYY-MM-DD')
                     );
   ```

   ![image](StageTwo/Photos/Param1RunTime.png)
   ![image](StageTwo/Photos/Param1Output.png)

   This query retrieves the CustomerID, PositiveInterest, and a count of transactions (TransactionCount) for VIP customers who have made transactions above a certain amount (Minimum Transaction Amount) within a given date range (Start Date and End Date). The correlated subquery in the WHERE clause filters only those VIP customers who have at least one transaction meeting the criteria.

   file: [here](StageTwo/ParamsQueries.sql)

2. **Query 2:**

   _Story_: The bank wants to analyze the performance of its branches by identifying the number of active accounts and the total balance held in each branch for specific cities. This information can help the bank make strategic decisions about resource allocation and branch operations.

   ```sql
   SELECT /*+ LEADING(b) USE_NL(b a) */
      b.BranchName, b.BranchAddress,
      (SELECT /*+ PARALLEL(a, 4) */
      COUNT(*)
      FROM Account a
      WHERE a.BranchID = b.BranchID
         AND a.AccountStatus != 'closed') AS ActiveAccounts,
      (SELECT /*+ PARALLEL(a, 4) */
      SUM(a.Balance)
      FROM Account a
      WHERE a.BranchID = b.BranchID
         AND a.AccountStatus != 'closed') AS TotalBalance
   FROM Branch b
   WHERE b.BranchAddress IN (&<name="Cities" type="string" list="SELECT BranchAddress FROM Branch ORDER BY BranchAddress" multiselect="yes" hint="Select the cities">);
   ```

   ![image](StageTwo/Photos/Param2RunTime.png)
   ![image](StageTwo/Photos/Param2Output.png)

   This query retrieves the BranchName, BranchAddress, the count of active accounts (ActiveAccounts), and the total balance of active accounts (TotalBalance) for branches located in specific cities (Cities). The subqueries calculate the active account count and total balance for each branch. The user can select multiple cities from a list using the multiselect option.

   file: [here](StageTwo/ParamsQueries.sql)

3. **Query 3:**

   _Story_: The bank wants to identify blacklisted customers who have accounts with negative balances exceeding a certain threshold. This information can help the bank take appropriate actions, such as requesting payment, imposing additional fees, or potentially closing those accounts. The query retrieves the AccountID, NegetiveInterest, MinimumMinus, NegativeBalance (if it exists below the specified threshold), and the CustomerName for blacklisted customers who have accounts with negative balances below the specified threshold.

   ```sql
   SELECT c.CustomerID, c.FirstName, c.LastName,
      (SELECT /*+ PARALLEL(a, 4) */
      SUM(a.Balance)
      FROM Account a
      WHERE EXISTS (SELECT 1
                     FROM Relationship r
                     WHERE r.CustomerID = c.CustomerID
                        AND r.AccountID = a.AccountID)) AS CumulativeBalance,
      (SELECT /*+ PARALLEL(a, 4) */
      COUNT(*)
      FROM Account a
      WHERE EXISTS (SELECT 1
                     FROM Relationship r
                     WHERE r.CustomerID = c.CustomerID
                        AND r.AccountID = a.AccountID)) AS AccountCount
   FROM Customer c
   WHERE (
         SELECT /*+ PARALLEL(a, 4) */
         SUM(a.Balance)
         FROM Account a
         WHERE EXISTS (SELECT 1
                        FROM Relationship r
                        WHERE r.CustomerID = c.CustomerID
                           AND r.AccountID = a.AccountID)
         ) > &<name="Cumulative Balance Threshold" type="float" hint="Enter the cumulative balance threshold">;
   ```

   ![image](StageTwo/Photos/Param3RunTime.png)
   ![image](StageTwo/Photos/Param3Output.png)

   This query retrieves the CustomerID, NegetiveInterest, MinimumMinus, and the negative balance (NegativeBalance) for blacklisted customers who have an account with a balance less than the negative balance threshold (Negative Balance Threshold). The correlated subquery in the WHERE clause filters only those blacklisted customers who have at least one account meeting the negative balance criteria.

   file: [here](StageTwo/select3.sql)

4. **Query 4:**

   _Story_: The bank wants to identify customers whose cumulative balance across all their accounts exceeds a certain threshold. This information can be used for targeted marketing campaigns or to offer special services to high-net-worth customers.

   ```sql
   SELECT
      bl.AccountID,
      c.FirstName || ' ' || c.LastName AS CustomerName,
      bl.NegetiveInterest,
      bl.MinimumMinus,
      (
         SELECT /*+ PARALLEL(a, 4) */
         a.Balance
         FROM Account a
         WHERE a.AccountID = bl.AccountID
         AND a.Balance < -&<name="Negative Balance Threshold" type="float" hint="Enter the negative balance threshold">
      ) AS NegativeBalance
   FROM
      BlackList bl
   JOIN
      Relationship r ON bl.AccountID = r.AccountID
   JOIN
      Customer c ON r.CustomerID = c.CustomerID
   WHERE
      EXISTS (
         SELECT /*+ PARALLEL(a, 4) */
         1
         FROM Account a
         WHERE a.AccountID = bl.AccountID
         AND a.Balance < -&<name="Negative Balance Threshold" type="float" hint="Enter the negative balance threshold">
      );
   ```

   ![image](StageTwo/Photos/Param4RunTime.png)
   ![image](StageTwo/Photos/Param4Output.png)

   This query retrieves the CustomerID, FirstName, LastName, and the cumulative balance (CumulativeBalance) for customers whose cumulative balance across all their accounts exceeds the specified threshold (Cumulative Balance Threshold). The subquery calculates the cumulative balance by summing the balances of all accounts linked to the customer through the Relationship table. The WHERE clause filters only those customers whose cumulative balance exceeds the threshold.

   file: [here](StageTwo/ParamsQueries.sql)

## constraints

1. **NOT NULL Constraint:**

   > The NOT NULL constraint ensures that a column cannot contain NULL values. It enforces the presence of a value in the column, preventing it from being empty.

   we already have the `NOT NULL` constraint on all the atrributes in the tables that are required to have a value.

   ![image](StageTwo/Photos/Not_Null_Error.png)

> trying to insert a record with a null value in a column with a NOT NULL constraint will result in an error, for example:

```sql
 INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address, ContactNumber, Email)
 VALUES (1, 'John', 'Doe', '01-JAN-1990', '123 Main Street', NULL, '[email protected]');
```

    [image](StageTwo/Photos/Not_Null_Error.png)

2. **UNIQUE Constraint:**

   > The UNIQUE constraint ensures that all values in a column are unique and not duplicated. It enforces the uniqueness of values within the column, preventing duplicate entries.

   adding a UNIQUE constraint to the `Email` column in the `Customer` table.

   ```sql
   ALTER TABLE Customer
   ADD CONSTRAINT UniqueEmail UNIQUE (Email);
   ```

   > trying to insert a record with a duplicate value in a column with a UNIQUE constraint will result in an error, for example:

   ```sql
    INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address, ContactNumber, Email)
    VALUES (2, 'Jane', 'Doe', '01-JAN-1995', '456 Elm Street', 1234567890, '[email protected]');

    INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, Address, ContactNumber, Email)
    VALUES (3, 'Alice', 'Smith', '01-JAN-1985', '789 Oak Street', 9876543210, '[email protected]');
   ```

   ![image](StageTwo/Photos/Unique_Constraint.png)

3. **DEFAULT Constraint:**

   > The DEFAULT constraint specifies a default value for a column when no value is provided during insertion. It assigns a predefined value to the column if no other value is specified.

   adding a DEFAULT constraint to the `AccountStatus` column in the `Account` table to be set to some valid status if no value is provided(the statuses are 'soldier','elderly','regular','student','foreign' , 'minor' , and lastly 'closed' but an account can't be opened with this status).

   ```sql

   ALTER TABLE Account
   MODIFY AccountStatus VARCHAR2(20) DEFAULT 'regular';
   ```

   > trying to insert a record without providing a value for the `AccountStatus` column will result in the default value being assigned, for example:

   ```sql
    INSERT INTO Account (AccountID, Balance, DateOpened)
    VALUES (100000000, 1000, '01-JAN-2022');

    select *
    from Account
    where AccountID = 100000000;
   ```

   ![image](StageTwo/Photos/Default_Constraint.png)

4. **CHECK Constraint:**

   > The CHECK constraint defines a condition that must be satisfied for the data to be inserted or updated in the column. It allows the specification of a logical expression that restricts the values that can be stored in the column.

   adding a CHECK constraint to the `Amount` column in the `Transaction` table to ensure that the amount is greater than zero.

   ```sql
   ALTER TABLE Transactions
   ADD CONSTRAINT CheckAmount CHECK (Amount > 0);
   ```

   > trying to insert a record with a value that violates the CHECK constraint will result in an error, for example:

   ```sql
    INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount, TransactionDate)
    VALUES (1, 100000000, 'deposit', -100, '01-JAN-2022');
   ```

   ![image](StageTwo/Photos/Check_Constraint.png)

## commits and rollbacks Explanation

Commits and rollbacks are used to manage transactions in the database.
A commit is used to save the changes made in a transaction, while a rollback is used to undo the changes made in a transaction. If a commit is executed, the changes are permanently saved in the database. If a rollback is executed, the changes are undone, and the database is restored to its previous state.
