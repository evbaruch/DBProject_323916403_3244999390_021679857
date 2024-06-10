/*
Documentation for SQL Query

Purpose:
---------
To remove entries from the BlackList table where the negative interest rate is less than the 25th percentile of negative interest rates in the entire BlackList table. This operation helps in updating the blacklist by removing less significant or less severe entries.

Explanation:
-------------
This query deletes entries from the BlackList table where the negative interest rate is less than the 25th percentile of negative interest rates in the entire BlackList table. Here’s how it works:

1. DELETE FROM Clause:
   - `DELETE FROM BlackList`: Specifies that rows will be deleted from the BlackList table.

2. WHERE Clause:
   - `NEGETIVEINTEREST < (SELECT PERCENTILE_DISC(0.25) WITHIN GROUP (ORDER BY NEGETIVEINTEREST) FROM BlackList)`: Compares the NegativeInterest column of each row in the BlackList table with the 25th percentile negative interest rate calculated for the entire BlackList table.
     - `PERCENTILE_DISC(0.25) WITHIN GROUP (ORDER BY NEGETIVEINTEREST)`: Calculates the 25th percentile negative interest rate for the entire BlackList table.
     - This condition ensures that only entries with negative interest rates lower than the 25th percentile are selected for deletion.

By using this query, the financial institution can update the blacklist by removing entries with less significant negative interest rates, ensuring that the blacklist remains focused on more severe cases.
*/

DELETE FROM 
    BlackList
WHERE 
    NEGETIVEINTEREST < (
        SELECT 
            PERCENTILE_DISC(0.25) WITHIN GROUP (ORDER BY NEGETIVEINTEREST) -- Calculate the 25th percentile negative interest
        FROM 
            BlackList
    );
