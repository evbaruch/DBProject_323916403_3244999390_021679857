import random
from datetime import datetime, timedelta

# Function to generate a random date offset between 2000-01-01 and 2022-12-31
def random_date_offset():
    start_date = datetime(2000, 1, 1)
    end_date = datetime(2022, 12, 31)
    random_days = random.uniform(0, (end_date - start_date).days)
    return random_days

# Generate data according to specifications
def generate_account_data(record_count):
    account_id_start = 100000
    branch_id_start = 100

    account_data = {
        'ACCOUNTID': [account_id_start + i for i in range(record_count)],
        'BALANCE': [random.randint(-50000, 100000) for _ in range(record_count)],
        'DATEOPENED_OFFSET': [random_date_offset() for _ in range(record_count)],
        'ACCOUNTSTATUS': [random.choice(['regular', 'closed', 'minor', 'soldier', 'student', 'elderly', 'foreign']) for _ in range(record_count)],
        'BRANCHID': [branch_id_start + i % 900 for i in range(record_count)]  # Branch IDs cycle through 100 to 999
    }

    return account_data

# Function to generate SQL INSERT statements
def generate_sql_insert_statements(data, table_name):
    sql_statements = []
    for i in range(len(data['ACCOUNTID'])):
        sql_statements.append(
            f"INSERT INTO {table_name} (ACCOUNTID, BALANCE, DATEOPENED, ACCOUNTSTATUS, BRANCHID)\n"
            f"VALUES ({data['ACCOUNTID'][i]}, {data['BALANCE'][i]}, "
            f"(SELECT TO_DATE('2000-01-01', 'YYYY-MM-DD') + {data['DATEOPENED_OFFSET'][i]} FROM dual), "
            f"'{data['ACCOUNTSTATUS'][i]}', {data['BRANCHID'][i]});"
        )
    return sql_statements

# Generate 400 records
record_count = 400
account_data = generate_account_data(record_count)

# Generate SQL statements
table_name = 'ACCOUNT'
sql_statements = generate_sql_insert_statements(account_data, table_name)

# Write SQL statements to a file
with open('insertTablsACCOUNT.sql', 'w') as sql_file:
    sql_file.write('\n'.join(sql_statements))

print(f"Generated {record_count} records and saved to account_data.sql")
