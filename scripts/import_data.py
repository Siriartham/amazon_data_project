import pandas as pd
import mysql.connector
import numpy as np

# Read CSV
df = pd.read_csv(
    r'../dataset/amazon_audio_video.csv',
    encoding='latin1',
    on_bad_lines='skip'
)

# Clean column names
df.columns = df.columns.str.strip().str.lower()

# Remove fully empty rows
df = df.dropna(how='all')

# Clean prices
df['price(dollar)'] = (
    df['price(dollar)']
    .astype(str)
    .str.replace('$', '', regex=False)
    .str.replace(',', '', regex=False)
)

df['real price(dollar)'] = (
    df['real price(dollar)']
    .astype(str)
    .str.replace('$', '', regex=False)
    .str.replace(',', '', regex=False)
)

# Convert to numeric
df['price(dollar)'] = pd.to_numeric(
    df['price(dollar)'],
    errors='coerce'
)

df['real price(dollar)'] = pd.to_numeric(
    df['real price(dollar)'],
    errors='coerce'
)

# Remove duplicates
df = df.drop_duplicates()

# Replace NaN with None
df = df.replace({np.nan: None})


# Connect MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_passward",
    database="amazon_cleaning"
)

cursor = conn.cursor()

# Create table
cursor.execute("""
CREATE TABLE IF NOT EXISTS raw_products (
    product_description TEXT,
    price FLOAT,
    reviews VARCHAR(50),
    real_price FLOAT,
    free_days TEXT,
    shipment TEXT,
    delivery_date TEXT
)
""")

# Insert data
for _, row in df.iterrows():

    sql = """
    INSERT INTO raw_products
    VALUES (%s,%s,%s,%s,%s,%s,%s)
    """

    values = tuple(
        None if pd.isna(value) else value
        for value in (
            row['product description'],
            row['price(dollar)'],
            row['number of  reviews'],
            row['real price(dollar)'],
            row['free days'],
            row['shipment'],
            row['delivery date']
        )
    )

    cursor.execute(sql, values)

# Save changes
conn.commit()

print("Data Imported Successfully")

# Verify row count
cursor.execute("SELECT COUNT(*) FROM raw_products")
count = cursor.fetchone()

print("Total Rows Imported:", count[0])

# Close connection
cursor.close()
conn.close()