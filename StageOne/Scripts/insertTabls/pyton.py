import os
import re

def remove_duplicate_sql_statements(file_path):
    # Read the SQL file
    with open(file_path, 'r') as file:
        lines = file.readlines()

    arr = [2000]
    for line in lines:
        for i in range(0, len(arr)):
            if arr[i] == line:
                print("Duplicate found: ", line)
                break

    # Write the unique lines back to the file
    with open(file_path, 'w') as file:
        file.writelines(unique_lines)

# Specify the path to your .sql file
file_path = 'StageOne\Scripts\insertTabls\insertTablsREL5copy.sql'

# Remove duplicate SQL statements
remove_duplicate_sql_statements(file_path)
