/*
Documentation for SQL Query

Purpose:
---------
To remove entries from the DirectDebit table associated with closed accounts. This operation helps maintain data integrity by removing invalid or irrelevant entries.

Explanation:
-------------
This query deletes entries from the DirectDebit table where the associated account has a status of 'closed'. Here’s how it works:

1. DELETE FROM Clause:
   - `DELETE FROM DirectDebit`: Specifies that rows will be deleted from the DirectDebit table.

2. WHERE Clause:
   - `AccountID IN (SELECT AccountID FROM Account WHERE AccountStatus = 'closed')`: Specifies the condition for deletion, where the AccountID of each row in the DirectDebit table is checked against the list of AccountIDs retrieved from the Account table where the AccountStatus is 'closed'.
     - `SELECT AccountID FROM Account WHERE AccountStatus = 'closed'`: Retrieves the AccountIDs of closed accounts from the Account table.
     - `AccountID IN (...)`: Checks if the AccountID of each row in the DirectDebit table is present in the list of AccountIDs of closed accounts.

By using this query, the database can maintain data integrity in the DirectDebit table by removing entries associated with closed accounts, ensuring that only relevant and valid data is retained.
*/

DELETE FROM 
    DirectDebit
WHERE 
    AccountID IN (
        SELECT 
            AccountID
        FROM 
            Account
        WHERE 
            AccountStatus = 'closed'
    );
