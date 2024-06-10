/*
Documentation for SQL Query

Purpose:
---------
To update the contact numbers of customers associated with accounts opened more than 240 months ago. This operation ensures that outdated contact information is updated to maintain accurate customer records.

Explanation:
-------------
This query updates the contact numbers of customers whose accounts were opened more than 240 months ago. Here�s how it works:

1. UPDATE Clause:
   - `UPDATE Customer`: Specifies that the Customer table will be updated.

2. SET Clause:
   - `ContactNumber = '0000000000'`: Sets the contact number of the selected customers to a default value of '0000000000'.

3. WHERE Clause:
   - `CustomerID IN (SELECT c.CustomerID ... )`: Specifies the condition for updating, where the CustomerID of each row in the Customer table is checked against the list of CustomerIDs retrieved from the subquery.
     - `SELECT c.CustomerID ...`: Retrieves the CustomerIDs of customers associated with accounts opened more than 240 months ago.
     - `JOIN ... WHERE a.DateOpened < ADD_MONTHS(SYSDATE,  240)`: Joins the Customer, Rel5, and Account tables to identify customers associated with accounts opened before the date 240 months ago.

By using this query, the database can ensure that the contact numbers of customers associated with long-standing accounts are updated, maintaining accurate and up-to-date customer records.
*/

UPDATE 
    Customer
SET 
    ContactNumber = '0000000000'
WHERE 
    CustomerID IN (
        SELECT 
            c.CustomerID
        FROM 
            Customer c
        JOIN 
            Rel5 r ON c.CustomerID = r.CustomerID
        JOIN 
            Account a ON r.AccountID = a.AccountID
        WHERE 
            a.DateOpened < ADD_MONTHS(SYSDATE, -240)
    );
