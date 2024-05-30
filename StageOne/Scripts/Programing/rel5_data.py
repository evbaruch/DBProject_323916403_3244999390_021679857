import random

# Generate data according to specifications
def generate_rel5_data(record_count):
    customer_id_start = 1000000
    customer_id_end = 1000399
    account_id_start = 100000
    account_id_end = 100399

    rel5_data = {
        'CUSTOMERID': [random.randint(customer_id_start, customer_id_end) for _ in range(record_count)],
        'ACCOUNTID': [random.randint(account_id_start, account_id_end) for _ in range(record_count)]
    }

    return rel5_data

# Function to generate SQL INSERT statements
def generate_sql_insert_statements(data, table_name):
    sql_statements = []
    for i in range(len(data['CUSTOMERID'])):
        sql_statements.append(
            f"INSERT INTO {table_name} (CUSTOMERID, ACCOUNTID)\n"
            f"VALUES ({data['CUSTOMERID'][i]}, {data['ACCOUNTID'][i]});"
        )
    return sql_statements

# Generate 400 records
record_count = 400
rel5_data = generate_rel5_data(record_count)

# Generate SQL statements
table_name = 'REL5'
sql_statements = generate_sql_insert_statements(rel5_data, table_name)

# Write SQL statements to a file
with open('insertTablsREL5.sql', 'w') as sql_file:
    sql_file.write('\n'.join(sql_statements))

print(f"Generated {record_count} records and saved to rel5_data.sql")
