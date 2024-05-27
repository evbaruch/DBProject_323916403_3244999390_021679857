# databases

### presented by: **Account Department**

- head of team: **Evyatar Baruch**
- head sientist: **Ephraim Levi**
- head of database: **Yehuda Pilant**

## Table of Contents

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
