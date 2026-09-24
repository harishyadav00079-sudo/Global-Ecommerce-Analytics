import pandas as pd
from sqlalchemy import create_engine

file1 = r"C:\Users\HARISH\OneDrive\Desktop\Global_Ecom_Analytics\3_SQL\data\online_retail_cleaning-2009-2010.csv"

file2 = r"C:\Users\HARISH\OneDrive\Desktop\Global_Ecom_Analytics\3_SQL\data\online_retail_cleaning-2010-2011.csv"


df1 = pd.read_csv(file1, encoding="latin1", low_memory=False)
df2 = pd.read_csv(file2, encoding="latin1")


# Combine both years
df = pd.concat([df1, df2], ignore_index=True)


# Clean column names
df.columns = df.columns.str.replace(" ", "_")


print(df.head())
print("Total Records:", len(df))


engine = create_engine(
    "mysql+pymysql://root:harish%402005@localhost/global_ecommerce"
)


df.to_sql(
    "retail_data",
    con=engine,
    if_exists="replace",
    index=False
)


print("✅ Full Data Import Successful!")